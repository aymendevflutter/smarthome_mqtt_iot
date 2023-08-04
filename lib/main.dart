import 'package:appsmarthome/signupin/logup.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/ath.dart';
import 'ConnectionStatusScreen.dart';
import 'mainhome.dart';
import 'mqttstatic/mqttconected.dart';
import 'signupin/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home/temp.dart';
import './firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'signupin/logup.dart';
import 'package:provider/provider.dart';
import './provider/ath.dart';

void main() async {
   
  WidgetsFlutterBinding.ensureInitialized();
  // mqttconected.mqttClientWrapper;
  //mqttconected.mqttClientWrapper.prepareMqttClient();
  

  await Firebase.initializeApp(
    // ),
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await MQTTManager.initialize();
  

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static bool myBoolean = false;

  
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }

  Future<void> cheAth() async {
    final checkdata = await FirebaseAuth.instance.authStateChanges();
  }

  Future<String?> getCurrentUserUid() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;
    // Return the UID of the current user, or null if the user is not signed in
    return user?.uid;
  }

  final DateTime expirationDate = DateTime(2025, 06, 02);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final isExpired = currentDate.isAfter(expirationDate);
    return isExpired
        ? Center(
            child: Text("your app is expired "),
          )
        : MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => Ath()),
            ],
            child: Consumer<Ath>(
              builder: (ctx, auth, _) => MaterialApp(
                title: "myshop",
                home: auth.user != null
                    ? ConnectionStatusScreen() //ConnectionStatusScreen(
                    // client: MQTTManager.mqttClient?.client)

                    : StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.authStateChanges(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Show a loading indicator while waiting for the user state to load
                            return CircularProgressIndicator();
                          } else {
                            // Check if the user is logged in or logged out
                            if (snapshot.hasData) {
                              // User is logged in, return the HomePage
                              return 
                              //MainHome();

                                ConnectionStatusScreen();
                              //MainHome();
                            } else {
                              return loginScreen();
                            }
                          }
                        },
                      ),
                routes: {
                  loginScreen.NameRoot: (context) => loginScreen(),
                  logupScreen.RootName: (context) => logupScreen(),
                },
              ),
            ),
          );
  }
}
