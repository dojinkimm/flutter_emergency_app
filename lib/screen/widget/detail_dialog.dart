import 'package:flutter/material.dart';

class DetailDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      title: Text("층 선택"),
      content: Column(
        children: <Widget>[
          // SizedBox(height: 1.0,),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Image.asset('assets/images/detail.png'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  coloredBox(20.0, 255, 77, 77, 0.3, 'assets/images/icon_4.png'),
                  coloredBox(20.0, 255, 77, 77, 0.3, 'assets/images/icon_4.png'),
                  coloredBox(20.0, 32, 215, 182, 0.25, 'assets/images/icon_0.png'),
                  coloredBox(20.0, 249, 172, 56, 0.25, 'assets/images/icon_1.png'),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget coloredBox(height, r, g, b, o, image) {
    return SizedBox(
      height: height,
      width: 240,
      child: RaisedButton(
        color: Color.fromRGBO(r, g, b, o),
        child: Image.asset(image, height: 20.36,),
        onPressed:(){},
      ),
    );
  }
}