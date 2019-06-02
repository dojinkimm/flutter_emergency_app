import 'package:flutter/material.dart';
import './large_scale_building.dart';

class Home extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 150.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Container(
              margin: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 9,
                    child: TextField(
                      controller: _controller,
                      decoration: new InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      autocorrect: false,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => LargeScaleBuilding(word: _controller.value)))),
                  )
                ],
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
