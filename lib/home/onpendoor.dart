

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import '../truemqtt/MQTTClientWrapper.dart';
import '../mqttstatic/mqttconected.dart';
import 'package:mqtt_client/mqtt_client.dart';





class OpenDoor extends StatefulWidget {
  const OpenDoor({super.key});

  @override
  State<OpenDoor> createState() => _OpenDoorState();
}

class _OpenDoorState extends State<OpenDoor> {


  void initState() {
    // TODO: implement initState
    super.initState();

  }
  
 

  void publishBoolValue(String topic, bool value) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(value.toString());

    MQTTManager.client?.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }

  @override
  void dispose() {
    // mqttconected.mqttClientWrapper.disconnect();
    super.dispose();
  }

  bool light1Value = false;
  bool light2Value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
    body:Container(
       height: double.infinity,
       width: double.infinity,
       decoration: BoxDecoration(
        image: DecorationImage
        (image:AssetImage("assets/images/porte.png"),
        fit: BoxFit.cover),
       ), 
       child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         
            SizedBox(height: 550,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
      
                Column(children: [
                   Transform.scale(
                  scale: 2,
              

                  child: Switch(
                    
                      activeColor: Color(0xffe4b098),
                      activeTrackColor: Color(0xffe4b098),
                      inactiveThumbColor: Color.fromARGB(255, 0, 0, 0),
                      inactiveTrackColor: Color.fromARGB(192, 240, 237, 237),
                      splashRadius: 50.0,
                      value: light1Value,
                      onChanged: (value) {
                        setState(() {
                          light1Value = value;
                        });
                      
                            publishBoolValue("maison/controle/portail", value);
                      }),
                ),
                Text("Open The Door",style: GoogleFonts.kanit(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),)

                ],)
               
              ],
            ),
            SizedBox(
              height: 100,
            ),
            ]
        ),
      ),
     // drawer: SideMenu(),
    ));
  }
}

