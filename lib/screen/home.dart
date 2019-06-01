import 'package:flutter/material.dart';
import './large_scale_building.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: RaisedButton(
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>LargeScaleBuilding())),
          child: Text("PRESS"),
        ),
        )
      ),
    );
  }
}
