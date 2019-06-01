import 'package:flutter/material.dart';

class BuildBuildings extends StatelessWidget {
  final docDetail;
  final skyView;
  BuildBuildings({Key key, this.docDetail, this.skyView});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: skyView
            ? Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      building(docDetail[0], 95.0, [13.0, 30.0, 0.0, 0.0]),
                      building(docDetail[1], 235.0, [7.0, 38.0, 0.0, 0.0]),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      building(docDetail[2], 270.0, [30.0, 106, 0.0, 0.0]),
                      building(docDetail[3], 80.0, [0.0, 65.0, 0.0, 0.0]),
                    ],
                  )
                ],
              )
            : building3D(docDetail));
  }

  Widget building(Map image, double width, List<double> arr) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(arr[0], arr[1], arr[2], arr[3]),
          child: Opacity(
            opacity: 0.5,
            child: Image.network(
              image['URL'],
              width: width,
            ),
          ),
        ),
        Center(
            child: statusSky(
                image['left'], image['name'], image['left'] == 0 ? 60.0 : 30.0))
      ],
    );
  }

  Widget statusSky(int number, String name, double margin) {
    Color color = number > 10
        ? (Colors.red)
        : (number > 0 ? (Colors.yellow) : (Colors.green));
    return Container(
      margin: EdgeInsets.only(top: margin),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(left: 20.0),
              height: 25.0,
              child: Align(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  color: color,
                  elevation: 5.0,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                  textColor: Colors.white,
                ),
              )),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3.0,
                    offset: Offset(0.5, 0.5),
                    spreadRadius: 0.3)
              ],
            ),
            width: 40.0,
            height: 40.0,
            child: Center(
                child: Text(
              number.toString(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }

  Widget building3D(List doc) {
    return Column(
      children: <Widget>[
       Container(
         margin: const EdgeInsets.fromLTRB(50.0, 50.0,0.0,0.0),
         child:  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[status3D(doc[2]['left'], doc[2]['name'], 10.0)],
        ),
       ),
        Container(
         margin: const EdgeInsets.fromLTRB(120.0, 50.0,0.0,0.0),
          child: Row(
            children: <Widget>[
              status3D(doc[1]['left'], doc[1]['name'], 10.0),
              SizedBox(width: 70.0),
              status3D(doc[0]['left'], doc[0]['name'], 10.0),
            ],
          ),
        )
      ],
    );
  }

  Widget status3D(int number, String name, double margin) {
    Color color = number > 10
        ? (Colors.red)
        : (number > 0 ? (Colors.yellow) : (Colors.green));
    return Container(
      margin: EdgeInsets.only(top: margin),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(left: 20.0),
              height: 25.0,
              child: Align(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  color: color,
                  elevation: 5.0,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                  textColor: Colors.white,
                ),
              )),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3.0,
                    offset: Offset(0.5, 0.5),
                    spreadRadius: 0.3)
              ],
            ),
            width: 40.0,
            height: 40.0,
            child: Center(
                child: Text(
              number.toString(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }
}
