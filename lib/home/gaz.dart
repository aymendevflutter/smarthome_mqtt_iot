import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant.dart';
import '../truemqtt/MQTTClientWrapper.dart';
import '../mqttstatic/mqttconected.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import '../truemqtt/MQTTClientWrapper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Gas extends StatefulWidget {
  @override
  State<Gas> createState() => _GasState();
}

class _GasState extends State<Gas> {
  bool b = false;
  @override
  void dispose() {
    b = true;
    super.dispose();
  }

  void initState() {
    b = false;
    super.initState();
    try {
      MQTTManager.client!.subscribe("maison/capteurs/gaz", MqttQos.atLeastOnce);

      MQTTManager.client!.updates
          ?.listen((List<MqttReceivedMessage<MqttMessage>> messages) {
        messages.forEach((MqttReceivedMessage<MqttMessage> message) {
          final MqttPublishMessage receivedMessage =
              message.payload as MqttPublishMessage;
          final String payload = MqttPublishPayload.bytesToStringAsString(
              receivedMessage.payload.message);

          if (message.topic == "maison/capteurs/gaz" && !b) {
            setState(() {
              Gazz = payload;
            });
          }
        });
      });
    } catch (e) {
      print(e);
    }
  }

  String Gazz = "No Gaz";
  bool light1Value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/gazz.png"), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xffe4b098).withOpacity(0.3),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
            height: double.infinity,
            width: 250,
            child: ClipRRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(0, 0, 0, 0).withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      height: double.infinity,
                      width: double.infinity,
                    ))),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: 200,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffe4b098).withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                        topLeft: Radius.circular(80),
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80)),
                  ),
                  padding: EdgeInsets.all(100.0),
                  height: 200,
                  width: 250,
                  child: Center(
                      child: Text(
                    Gazz,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  )),
                ),
                Text(
                  "Etat De GaZ",
                  style: GoogleFonts.kanit(
                    color: Color(0xffe4b098),
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
