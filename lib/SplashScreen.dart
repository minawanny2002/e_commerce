import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/WelcomeScreen.dart';
import 'package:e_commerce/NavBar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashScreen createState() => SplashScreen();
}

class SplashScreen extends State<Splash> {
  void initState() {
    super.initState();
    navigatehome();
  }

  Widget start() {
    if (FirebaseAuth.instance.currentUser != null) {
      return NavBar();
    } else {
      return WelcomeScreen();
    }
  }

  navigatehome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => start()));
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
            child: Container(
      alignment: Alignment.center,
      width: screenwidth,
      height: screenheight,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xffB81736),
        Color(0xff281537),
      ])),
      child: Text(
        "E-Commerce",
        style: TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
      ),
    )));
  }
}
