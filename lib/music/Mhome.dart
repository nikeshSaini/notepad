import 'package:flutter/material.dart';
import 'dart:math' as math;

class MusicHomePage extends StatefulWidget {
  const MusicHomePage({Key? key}) : super(key: key);

  @override
  State<MusicHomePage> createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade200,
            ]
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 48),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("Summer High" ,style: TextStyle(fontSize: 38, color: Colors.white, fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text("AP Dhillon" ,style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w400,),),
                ),
                SizedBox(height: 24,),
                Center(
                  child: Container(
                    height: 280,
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage('assets/images/gigi-3.jpg'),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                Center(child: Text("Strip that Down" ,style: TextStyle(fontSize: 32, color: Colors.white70, fontWeight: FontWeight.bold),)),
                SizedBox(height: 18,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft:Radius.circular(30)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: Icon(Icons.play_arrow, size: 45,color: Colors.blue,),
                            ),
                            SizedBox(width: 20,),
                            Icon(Icons.play_circle,size: 62,color: Colors.blue.shade800,),
                            SizedBox(width: 20,),
                            Icon(Icons.play_arrow,size: 45,color: Colors.blue,),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
