import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

// change between FadeInOutContainer and AnimatedContainerApp to see every thing in this folder
void main() => runApp(FadeInOutContainer());

class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animation 1'),
        ),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius
            ),
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: (){
            // change the on pressed animation change every time to
            // click once and change every 3 seconds which is more cooler

//            setState(() {
//              final random = Random();
//              _width = random.nextInt(300).toDouble();
//              _height = random.nextInt(300).toDouble();
//              _color = Color.fromRGBO(random.nextInt(256),random.nextInt(256),random.nextInt(256),1);
//              _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
              Timer.periodic(Duration(seconds: 3), (timer) {
                setState((){
                  final random = Random();
                  _width = random.nextInt(300).toDouble();
                  _height = random.nextInt(300).toDouble();
                  _color = Color.fromRGBO(random.nextInt(256),random.nextInt(256),random.nextInt(256),1);
                  _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
                });
              });
//            });
          },
        ),
      ),
    );
  }
}

class FadeInOutContainer extends StatefulWidget {
  @override
  _FadeInOutContainerState createState() => _FadeInOutContainerState();
}

class _FadeInOutContainerState extends State<FadeInOutContainer> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              _visible = !_visible;
            });
          },
          child: Icon(Icons.flip),
        ),
      ),
    );
  }
}

