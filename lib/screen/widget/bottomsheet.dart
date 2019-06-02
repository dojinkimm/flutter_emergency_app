import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bottomsheet extends StatelessWidget {
  final doc;
  Bottomsheet({Key key, this.doc});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return bottomSheet(doc, context);
      },
    );
  }

  Widget bottomSheet(DocumentSnapshot doc, BuildContext context) {
    return Container(
      height: 270.0,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          header(doc),
          Divider(
            height: 20.0,
            color: Colors.grey,
          ),
          body(doc, "인원 현황", "직원 수", "환자 수", doc['workerNum'].toString(),
              doc['patientNum'].toString(), context, true),
          body(doc, "구조 현황", "파악된 인원", "미파악 인원", doc['identified'].toString(),
              doc['unidentified'].toString(), context, false)
        ],
      ),
    );
  }

  Widget header(DocumentSnapshot doc) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(left: 30.0),
              child: Text(
                doc['name'],
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )),
          Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Text(
                doc['category'],
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )),
          Container(
              margin: const EdgeInsets.only(left: 90.0),
              child: Text(
                doc['beacon'].toString(),
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              )),
          Container(
              child: Text(
            " 비콘",
            style: TextStyle(
                fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.red),
          ))
        ],
      ),
    );
  }

  Widget body(DocumentSnapshot doc, String mainTitle, String sub1, String sub2,
      String sub1_2, String sub2_2, BuildContext context, bool first) {
         Color green = (Color.fromRGBO(32, 215, 182,1.0));
    TextStyle _textStyle = TextStyle(color: green);
    return Container(
        margin: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Text(
                mainTitle,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
            first ? Container() : linearProgressBar(context, doc['identified'], doc['totalNum']),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Row(
                children: <Widget>[
                  Text(sub1),
                  SizedBox(width: 50.0),
                  Container(
                    height: 10.0,
                    width: 2.0,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 50.0),
                  Text(sub1_2 + ' 명', style: _textStyle)
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text(sub2),
                  SizedBox(width: 50.0),
                  Container(
                    height: 10.0,
                    width: 2.0,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 50.0),
                  Text(sub2_2 + ' 명', style: _textStyle)
                ],
              ),
            ),
          ],
        ));
  }

  Widget linearProgressBar(BuildContext context, int identified, int totalNum) {
  double percent = double.parse((identified/totalNum).toStringAsFixed(2));
   Color green = (Color.fromRGBO(32, 215, 182,1.0));

    return Stack(
      children: <Widget>[
        Container(
          alignment: FractionalOffset(1.0, 1.0),
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.03,
          child: RaisedButton(
              color: Colors.grey[200],
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text("")),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          width: MediaQuery.of(context).size.width * 0.9*percent,
          height: MediaQuery.of(context).size.height * 0.03,
          child: RaisedButton(
              color: green,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Text((percent*100).toStringAsFixed(0)+"%",style: TextStyle(color: Colors.white),)),
        )
      ],
    );
  }
}
