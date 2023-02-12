import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../home/home.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:1 ), (){
     Navigator.pushReplacement(context,MaterialPageRoute(
       builder: (context)=> HomePage(),
     ));
   });
  }
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 206, 19, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit_note, color: Colors.black, size: 80,),
            Text("To-Do", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black54),)
          ],
        ),
      ),
    );
  }
}
