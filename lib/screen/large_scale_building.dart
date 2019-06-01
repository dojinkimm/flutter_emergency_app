import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './widget/build_buildings.dart';
import './widget/bottomsheet.dart';

class LargeScaleBuilding extends StatefulWidget {
  @override
  _LargeScaleBuildingState createState() => _LargeScaleBuildingState();
}

class _LargeScaleBuildingState extends State<LargeScaleBuilding> {
  final TextEditingController _controller = new TextEditingController();
  bool skyView;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    skyView=true;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('building')
            .where("name", isEqualTo: "엔젤 해커톤 병원")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data==null) {
            return Container();
          } else {
            final doc = snapshot.data.documents[0];
            return Stack(
              children: <Widget>[
                new Container(
                  child: skyView?Image.network(doc['LargeBuildingURL']):Image.network(doc['3DView']),
                  width: double.infinity,
                ),
                buildingPage(doc, context)
              ],
            );
          }
        });
  }

  Widget buildingPage(DocumentSnapshot doc, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: new TextField(
            controller: _controller,
            decoration: new InputDecoration(
              suffixIcon: Icon(Icons.search),
              fillColor: Colors.white70,
              filled: true,
            ),
            autocorrect: false,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: <Widget>[IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 60.0, right: 10.0),
            child: Column(
              children: <Widget>[
                dimensionSelection("sky"),
                SizedBox(
                  height: 10.0,
                ),
                dimensionSelection("3D")
              ],
            ),
          ),
          BuildBuildings(docDetail: doc['detail'], skyView: skyView)
        ],
      ),
      bottomSheet: Bottomsheet(doc: doc)
    );
  }

  Widget dimensionSelection(String version) {
    return GestureDetector(
      onTap: () {
        setState(() {
          skyView=!skyView;
        });
      },
      child: ClipOval(
          child: Container(
              color: ((skyView)&&(version=="sky"))?Colors.white:((!skyView)&&(version=="3D"))?Colors.white:Colors.white30,
              width: 40.0,
              height: 40.0,
              child: Center(
                  child: Text(
                version,
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              )))),
    );
  }
}
