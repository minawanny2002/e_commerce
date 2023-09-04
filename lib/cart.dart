import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cartScreen extends StatefulWidget{
  const cartScreen({super.key});

  @override
  State<StatefulWidget> createState()=>cartScreenState();

}
class cartScreenState extends State<cartScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("cart"),
      ),
    );
  }

}