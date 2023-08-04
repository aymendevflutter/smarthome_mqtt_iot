
import '../truemqtt/MQTTClientWrapper.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_client/mqtt_client.dart';

class MQTTManager {
 // static MQTTClientWrapper? mqttClient;
 static  MqttClient? client;

  static Future<void> initialize() async {
   
    client = await connect();
    
  }
}
