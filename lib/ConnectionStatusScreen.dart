import 'package:appsmarthome/home/temp.dart';
import 'package:appsmarthome/signupin/login.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import 'mainhome.dart';
import 'mqttstatic/mqttconected.dart';

class ConnectionStatusScreen extends StatefulWidget {
  @override
  State<ConnectionStatusScreen> createState() => _ConnectionStatusScreenState();
}

class _ConnectionStatusScreenState extends State<ConnectionStatusScreen> {
  late final MqttClient? client;
  bool b = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    starMqtt();
  }
  // ignore: use_key_in_widget_constructors

  // ConnectionStatusScreen();
  Future<void> starMqtt() async {
    //await MQTTManager.initialize();
    client = await MQTTManager.client;
    if (client != null) {
      setState(() {
        b = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !b? Center(
        child: MainHome(),
      ) :
       FutureBuilder(
        future: client?.connect(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Connection Error'),
            );
          } else if (client?.connectionStatus?.state !=
              MqttConnectionState.connected) {
            return Center(
              child: loginScreen(),
            );
          } else {
            return Center(
              child: MainHome(),
            );
          }
        },
      ),
    );
  }
}
