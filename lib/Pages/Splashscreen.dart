import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
 
class _SplashScreenState extends State<Splash> {
 
  /// NEW CODE.
  @override
  void initState() {
    super.initState();
 
    /// Initialize data, then navigator to Home screen.
    initData().then((value) {
      navigateToHomeScreen();
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
        child: Center(
          child: Container(
          width: 150,
          height: 150,
          child: Image.asset("assets/tick.png"),
        ),
      )
    );
  }
 
  /// NEW CODE.
  /// We can do long run task here.
  /// In this example, we just simply delay 3 seconds, nothing complicated.
  Future initData() async {
    await Future.delayed(Duration(seconds: 3));
  }
 
  /// NEW CODE.
  /// Navigate to Home screen.
  void navigateToHomeScreen() {
    /// Push home screen and replace (close/exit) splash screen.
    //Navigator.pushReplacementNamed(context, 'open');
    Navigator.pushReplacementNamed(context, 'home');
  }
}