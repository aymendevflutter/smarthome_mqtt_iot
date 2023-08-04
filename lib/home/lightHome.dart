
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';


import '../mqttstatic/mqttconected.dart';
import '../widget/buttonlight.dart';
import '../widget/lightonof.dart';


import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_client/mqtt_client.dart';


class LightHome extends StatefulWidget {
  const LightHome({super.key});

  @override
  State<LightHome> createState() => _LightHomeState();
}

class _LightHomeState extends State<LightHome> {
  void publishBoolValue(String topic, bool value) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(value.toString());

    MQTTManager.client?.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
              (image:AssetImage("assets/images/lampe5.png"),
               fit: BoxFit.cover),
                     ),
            
         child:Stack(
          
          children: [
             
             Container(
              padding: EdgeInsets.only(top:550),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Transform.scale(
                  scale: 2,
                  //  transformHitTests: true,

                  child: Switch(
                      // thumb color (round icon)
                      activeColor: Color(0xffe4b098),
                      activeTrackColor: Color(0xffe4b098),
                      inactiveThumbColor: Color.fromARGB(255, 9, 73, 102),
                      inactiveTrackColor: Color.fromARGB(255, 255, 253, 253),
                      splashRadius: 50.0,
                      value: light2Value,
                      onChanged: (value) {
                        setState(() {
                          light2Value = value;
                        });
                      
                            publishBoolValue("maison/controle/lampes1", value);
                      }),
                ),
                    Text("RoOm1",style: GoogleFonts.kanit(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                    ),)
                      ],

                    ),

                  ),
                SizedBox(width: 50,),
                Container(
                    child: Column(
                      children: [
                        Transform.scale(
                  scale: 2,
                  //  transformHitTests: true,

                  child: Switch(
                      // thumb color (round icon)
                      activeColor: Color(0xffe4b098),
                      activeTrackColor: Color(0xffe4b098),
                      inactiveThumbColor: Color.fromARGB(255, 9, 73, 102),
                      inactiveTrackColor: Color.fromARGB(255, 253, 253, 253),
                      splashRadius: 50.0,
                      value: light1Value,
                      onChanged: (value) {
                        setState(() {
                          light1Value = value;
                        });
                      
                            publishBoolValue("maison/controle/lampes2", value);
                      }),
                ),
                    Text("RoOm2",style: GoogleFonts.kanit(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                    ),)
                      ],

                    ),

                )
                ],
              ),
             )
          ],
         )    
             
             ,),
     // drawer: SideMenu(),
    );
  }
}

