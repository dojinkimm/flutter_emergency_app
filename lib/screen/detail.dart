import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final doc;
  final name;
  final index;
  Detail({Key key, this.doc, this.name, this.index});

  @override
  Widget build(BuildContext context) {
    print(doc);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: RotatedBox(
                  quarterTurns: 5,
                  child: Image.network(doc['floorURL']),
                ),
              ),
              detectPeople()
            ],
          ),
          explanationHeader(),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "인원 현황",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          explanation("직원 수", 1),
          explanation("환자 수", 3)
        ],
      ),
    );
  }

  Widget detectPeople() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(120.0),
          child: circle(),
        ),
         Container(
          margin: const EdgeInsets.fromLTRB(300.0, 0.0, 0.0,0.0),
          child: circle(),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(100.0, 0.0, 0.0,0.0),
          child: circle(),
        ),
        Container(
          child: circle(),
        ),


    
      ],
    );
  }

  Widget circle() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Opacity(
          opacity: 0.15,
          child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          width: 70.0,
          height: 70.0,
        ),
        ),
        Opacity(
          opacity: 0.3,
          child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          width: 45.0,
          height: 45.0,
        ),
        ),
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
          width: 25.0,
          height: 25.0,
        )
      ],
    );
  }

  Widget explanationHeader() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    name + " ${(index + 1).toString()}층",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Text(
                    doc['placeName'],
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Text("${doc['floorLeft'].toString()} 명",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.red))
            ],
          ),
          Divider(
            height: 10.0,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget explanation(String title, int leftOver) {
    return Container(
      margin: const EdgeInsets.only(left: 5.0),
      height: 20.0,
      child: ListTile(
        leading: Row(
          children: <Widget>[
            Text(title),
            SizedBox(
              width: 20.0,
            ),
            Text(
              "${leftOver.toString()}명",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              "명단보기",
              style: TextStyle(color: Colors.grey, fontSize: 10.0),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
