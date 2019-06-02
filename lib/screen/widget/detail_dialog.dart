import 'package:flutter/material.dart';
import '../detail.dart';

class DetailDialog extends StatelessWidget {
  final doc;
  DetailDialog({Key key, this.doc});
  @override
  Widget build(BuildContext context) {
    // print(doc.toString());
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("층 선택"),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      content: Container(
        height: MediaQuery.of(context).size.height*0.65,
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                Image.network(doc['detailURL']),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    coloredBox(
                        30.0, 255, 77, 77, 0.3, 'assets/images/icon_4.png'),
                    coloredBox(
                        40.0, 255, 77, 77, 0.3, 'assets/images/icon_4.png'),
                    coloredBox(
                        25.0, 32, 215, 182, 0.25, 'assets/images/icon_0.png'),
                    coloredBox(
                        55.0, 249, 172, 56, 0.25, 'assets/images/icon_1.png'),
                  ],
                ),
              ],
            ),
            mainPart(context)
          ],
        ),
      ),
    );
  }

  Widget coloredBox(height, r, g, b, o, image) {
    return Container(
      margin: const EdgeInsets.only(top: 3.0),
      child: SizedBox(
        height: height,
        width: 240,
        child: RaisedButton(
          color: Color.fromRGBO(r, g, b, o),
          child: Image.asset(
            image,
            height: 20.36,
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget mainPart(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                doc['name'],
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 15.0,
                width: 2.0,
                margin: const EdgeInsets.only(left: 20.0),
                color: Colors.grey,
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                doc['left'].toString(),
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              Text(
                " 비콘",
                style: TextStyle(color: Colors.red, fontSize: 10.0),
              )
            ],
          ),
          floorLeft(doc['floor'][3],context, 3),
          floorLeft(doc['floor'][2],context, 2),
          floorLeft(doc['floor'][1],context, 1),
          floorLeft(doc['floor'][0],context, 0),
        ],
      ),
    );
  }

  Widget floorLeft(var floorInfo, BuildContext context, int index) {
    Color color = floorInfo['floorLeft'] > 3
        ? (Colors.red)
        : (floorInfo['floorLeft'] > 0
            ? (Color.fromRGBO(249, 172, 56, 1))
            : (Colors.green));

    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0.0),
          leading: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Center(
                child: Text(
                  floorInfo['level'].toString() + "층",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
              title: Text(floorInfo['placeName'], style: TextStyle(fontSize: 13.0),maxLines: 2,),
              trailing: Container(
                width: 10.0,
                height: 10.0,
                decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              ),
              onTap: (){
                if(floorInfo['floorURL']!=""){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Detail(doc: doc['floor'][index], name: doc['name'], index:index)));
                }
              },
        ));
  }
}
