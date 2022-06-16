import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_kost/pages/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double _width = 0;
  double _height = 0;

  void _updateState() {
    setState(() {
      _width = 200;
      _height = 200;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 50), () => _updateState());
    Timer(Duration(seconds: 3),
          () => Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.lightGreenAccent, Colors.green]
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 900),
                    curve: Curves.bounceOut,
                    width: _width,
                    height: _height,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        "assets/images/logo-nobg.png",
                        height: 200.0,
                        width: 200.0,
                      ),
                    ),
                  ),
                  Text(
                    "Your Kost Data \nManagement App",
                    textAlign:TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontFamily: 'Poppins'
                    ),
                  ),
                ],
              ),
              CircularProgressIndicator()
            ]
          ),
        ),
      )
    );
  }
}
