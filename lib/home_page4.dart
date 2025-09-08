import 'package:flutter/material.dart';

class HomePage4 extends StatefulWidget {
  const HomePage4({super.key});

  @override
  State<HomePage4> createState() => _HomePage4State();
}

const defaultWidth = 100.0;

class _HomePage4State extends State<HomePage4> {

  var _isZoomed = false;
  var _buttonTitle = 'Zoom In';
  var _width = defaultWidth;
  var _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("My App"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 370),
                width: _width,
                curve: _curve,
                child: Image.asset(
                  'assets/images/1.png',
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isZoomed=!_isZoomed;
                _buttonTitle = _isZoomed ? 'Zoom Out' : 'Zoom In';
                if (_isZoomed) {
                  _width = MediaQuery.of(context).size.width;
                } else {
                  _width = defaultWidth;
                }
                _curve = _isZoomed ? Curves.bounceInOut : Curves.bounceOut;
              });
            },
            child: Text(_buttonTitle),
          ),
        ],
      ),
    );
  }
}
