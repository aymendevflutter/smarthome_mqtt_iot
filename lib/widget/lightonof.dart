import 'package:appsmarthome/widget/buttonlight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Light extends StatelessWidget {
  const Light({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        
       Container(height: 200,width: 200 ,
       child:  Image.asset("assets/images/light.png",
       fit: BoxFit.cover,),
       ) 
        ,
        ButtonLight(),


    ],);
  }
}