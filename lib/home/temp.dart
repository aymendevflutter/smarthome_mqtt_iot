import 'package:appsmarthome/constant.dart';
import 'package:appsmarthome/widget/temp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:provider/provider.dart';
import '../provider/ath.dart';
import '../side_menu.dart';
import '../truemqtt/MQTTClientWrapper.dart';
import '../mqttstatic/mqttconected.dart';
import '../widget/temperature.dart';
import '../widget/buttonlight.dart';
import '../mqttstatic/mqttconected.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool b = false;

  void initState() {
    super.initState();
    b = false;
    setState(() {});
    try {
      MQTTManager.client!
          .subscribe("maison/capteurs/temperature", MqttQos.atLeastOnce);
      MQTTManager.client!
          .subscribe("maison/capteurs/humidite", MqttQos.atLeastOnce);

      MQTTManager.client!.updates
          ?.listen((List<MqttReceivedMessage<MqttMessage>> messages) {
        messages.forEach((MqttReceivedMessage<MqttMessage> message) {
          final MqttPublishMessage receivedMessage =
              message.payload as MqttPublishMessage;
          final String payload = MqttPublishPayload.bytesToStringAsString(
              receivedMessage.payload.message);

          if (message.topic == "maison/capteurs/temperature" && !b) {
            setState(() {
              temperature = payload;
            });
          }
          if (message.topic == "maison/capteurs/humidite" && !b) {
            setState(() {
              humidite = payload;
            });
          }
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    //   mqttconected.mqttClientWrapper.disconnect();
    b = true;
    super.dispose();
  }

  void publishBoolValue(String topic, bool value) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(value.toString());

    MQTTManager.client
        ?.publishMessage(topic, MqttQos.atLeastOnce, builder.payload!);
  }

  String temperature = '25C';
  String humidite = "60%";
  bool light1Value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/chambre3.png"),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              child: Temp(temperature),
                              //temperature),
                              height: 150,
                              width: 150,
                            ),
                            Text(
                              "temPerature C°",
                              style: GoogleFonts.kanit(
                                color: Color.fromARGB(255, 9, 73, 102),
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              child: Temp(humidite),
                              //temperature),
                              height: 150,
                              width: 150,
                            ),
                            Text(
                              "huMidite %",
                              style: GoogleFonts.kanit(
                                color: Color.fromARGB(255, 9, 73, 102),
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Container(
                      child: Column(
                    children: [
                      //bouton
                      Transform.scale(
                        scale: 2,
                        //  transformHitTests: true,

                        child: Switch(
                            // thumb color (round icon)
                            activeColor: Color(0xffe4b098),
                            activeTrackColor: Color(0xffe4b098),
                            inactiveThumbColor: Color.fromARGB(255, 9, 73, 102),
                            inactiveTrackColor:
                                Color.fromARGB(255, 252, 250, 250),
                            splashRadius: 50.0,
                            value: light1Value,
                            onChanged: (value) {
                              setState(() {
                                light1Value = value;
                              });

                              publishBoolValue('fan', value);
                            }),
                      ),
                      Text(
                        "Open fan",
                        style: GoogleFonts.kanit(
                          color: Color.fromARGB(255, 9, 73, 102),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(40),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () async {
                    // authController.signOut();
                    Provider.of<Ath>(context, listen: false).signOut();
                  },
                  child: const FaIcon(
                    size: 50,
                    FontAwesomeIcons.rightFromBracket,
                    color: Color.fromARGB(255, 9, 73, 102),
                  ),
                ),
              ),
            ),
          ],
        ),
        //   drawer: SideMenu(),
      ),
    );
  }
}
