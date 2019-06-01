import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './widget/build_buildings.dart';
import './widget/bottomsheet.dart';

class LargeScaleBuilding extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('building')
            .where("name", isEqualTo: "엔젤 해커톤 병원")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            final doc = snapshot.data.documents[0];
            return Stack(
              children: <Widget>[
                new Container(
                  child: Image.network(doc['LargeBuildingURL']),
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
                dimensionSelection("sky", Colors.white),
                SizedBox(
                  height: 10.0,
                ),
                dimensionSelection("3D", Colors.white30)
              ],
            ),
          ),
          BuildBuildings(docDetail: doc['detail'])
        ],
      ),
      bottomSheet: Bottomsheet(doc: doc)
    );
  }

  Widget dimensionSelection(String version, Color opacity) {
    return GestureDetector(
      onTap: () {},
      child: ClipOval(
          child: Container(
              color: opacity,
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
