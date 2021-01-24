import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 3),
    );

    animationController.repeat();
    Future.delayed(Duration(seconds: 3), () {
      animationController.dispose();
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff050D10),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Uclass',
              style: TextStyle(
                  fontFamily: 'Gotham',
                  fontSize: 40,
                  fontWeight: FontWeight.w100,
                  color: Colors.white)),
          Container(
            alignment: Alignment.center,
            child: new AnimatedBuilder(
              animation: animationController,
              child: new Image.asset(
                'assets/loading.png',
                scale: 2,
              ),
              builder: (BuildContext context, Widget _widget) {
                return new Transform.rotate(
                  angle: animationController.value * 6.3,
                  child: _widget,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
