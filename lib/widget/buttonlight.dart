import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ButtonLight extends StatefulWidget {
  

  @override
  State<ButtonLight> createState() => _ButtonLightState();
  
}

class _ButtonLightState extends State<ButtonLight> {
  var forAndroid =false;
  @override
  Widget build(BuildContext context) {
    
    return Transform.scale(
      scale: 2,
    //  transformHitTests: true,


      child: Switch(
          // thumb color (round icon)
          activeColor: Colors.amber,
          activeTrackColor: Colors.cyan,
          inactiveThumbColor: Colors.blueGrey.shade600,
          inactiveTrackColor: Colors.grey.shade400,
          splashRadius: 50.0,
          
          // boolean variable value
          value: forAndroid,
          // changes the state of the switch
          onChanged: (value) => setState(() => forAndroid = value)),
    );
  }
}
