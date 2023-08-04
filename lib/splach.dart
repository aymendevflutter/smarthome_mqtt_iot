import 'dart:async';

import 'package:appsmarthome/introduction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4),()=>
    Navigator.pushReplacement(context,
     MaterialPageRoute(builder: (context)=>Introduction())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
              Color.fromARGB(255, 0, 109, 160),
              Color.fromARGB(255, 1, 0, 71),
              
          ])
      ),
    child:Center(
      child: Column(
        children: [
          SizedBox(height: 300,),
          Image.asset("assets/homenoir.png",height: 140,width: 140,),
          SizedBox(height: 20,),
          Text.rich(
            TextSpan(children: <TextSpan>[
              TextSpan(
                text: 'Smart',
                style: TextStyle(fontSize: 45,fontWeight: FontWeight.w900 ) 
              ),
              TextSpan(
                text: ' Home',
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400 )
              ) 
            ])
            )
        ],
        
      ),
    )  
      
      ),
    );
  }
}