import 'package:appsmarthome/forgetpassword.dart';
import 'package:appsmarthome/home/temp.dart';
import 'package:appsmarthome/signupin/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import '../provider/ath.dart';
import '../provider/ath.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

var _keys = GlobalKey<FormState>();
TextEditingController Nom = TextEditingController();
TextEditingController emailC = TextEditingController();
TextEditingController passwordC = TextEditingController();
TextEditingController phone = TextEditingController();

class logupScreen extends StatefulWidget {
  static String RootName = "Logup_screen";
  @override
  State<logupScreen> createState() => _logupScreenState();
}

class _logupScreenState extends State<logupScreen> {
  static String NameRoot = "log_up";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, String> _authData = {
    "email": "fff",
    "password": "",
    "name": "",
    "phone": ""
  };
  void toast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<void> _Submit() async {
    if (!_keys.currentState!.validate()) {
      return;
    }
    _keys.currentState!.save();

    try {
      _auth.signOut();
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: _authData["email"]!,
        password: _authData["password"]!,
      );
      // Sign up successful, user is now signed in

      if (userCredential != null) {
        toast("sing up succefull");
        // Navigator.pushReplacement(
        //  context,
        //  MaterialPageRoute(builder: (context) => loginScreen()),
        // );
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toast("The password provided is too weak.");

        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        toast('The account already exists for that email.');

        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      print(e.toString());
    }

    //  await Provider.of<Ath>(context, listen: false).signup(_authData["email"]!,
    //     _authData["password"]!, _authData["name"]!, _authData["phone"]!);
  }

  bool isEmailCorrect = false;
  bool isPasswordCorrect = false;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
              Color(0xFF292E91),
              Color(0xFF4CA9DF),
            ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              Image.asset(
                "assets/images/homenoir.png",
                height: 90,
                width: 90,
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                  key: _keys,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          height: 60,
                          child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: Nom,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Name cannot be empty");
                                }

                                return null;
                              },
                              onSaved: (Value) {
                                _authData["name"] = Value.toString();
                              },
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: SizedBox(
                                    width: 70,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.black),
                                labelText: "Full Name",
                                hintText: "Full Name",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                                focusedBorder: OutlineInputBorder(
                                    //  borderSide: BorderSide(
                                    //     color: isEmailCorrect == false
                                    //        ? Color.fromARGB(255, 199, 12, 12)
                                    //        : Colors.green),
                                    // borderRadius: BorderRadius.circular(18)),
                                    //  border: OutlineInputBorder(
                                    //     borderSide: BorderSide(
                                    //       color: Colors.black,
                                    //      width: 1,
                                    //    ),
                                    borderRadius: BorderRadius.circular(13)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 199, 12, 12),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 199, 12, 12),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          height: 60,
                          child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  isEmailCorrect = RegExp(
                                          r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')
                                      .hasMatch(value);
                                });
                              },
                              style: TextStyle(color: Colors.white),
                              controller: emailC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Mail cannot be empty");
                                }
                                if (!RegExp(
                                        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')
                                    .hasMatch(value)) {
                                  return "Please enter valid mail";
                                }
                                ;
                                return null;
                              },
                              onSaved: (Value) {
                                _authData["email"] = Value.toString();
                              },
                              decoration: InputDecoration(
                                suffixIcon: isEmailCorrect == false
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.transparent,
                                      )
                                    : Icon(
                                        Icons.done,
                                        color: Colors.green,
                                      ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: SizedBox(
                                    width: 70,
                                    child: Icon(
                                      Icons.email,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.black),
                                labelText: "Email",
                                hintText: "username@gmail.com",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: isEmailCorrect == false
                                            ? Color.fromARGB(255, 199, 12, 12)
                                            : Colors.green),
                                    borderRadius: BorderRadius.circular(18)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 199, 12, 12),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 199, 12, 12),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          height: 60,
                          child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  isPasswordCorrect =
                                      RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value);
                                });
                              },
                              obscureText: !isVisible,
                              style: TextStyle(color: Colors.white),
                              controller: passwordC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Password cannot be empty");
                                }
                                if (!RegExp(r'^[a-zA-Z0-9]+$')
                                    .hasMatch(value)) {
                                  return "Please enter valid password";
                                }
                                ;
                                return null;
                              },
                              onSaved: (Value) {
                                _authData["password"] = Value.toString();
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    icon: isVisible
                                        ? Icon(Icons.visibility,
                                            color: Colors.black)
                                        : Icon(Icons.visibility_off,
                                            color: Colors.black)),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: SizedBox(
                                    width: 70,
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.black),
                                labelText: "Password",
                                hintText: "Password",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: isPasswordCorrect == false
                                            ? Color.fromARGB(255, 199, 12, 12)
                                            : Colors.green),
                                    borderRadius: BorderRadius.circular(18)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 199, 12, 12),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 199, 12, 12),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          height: 60,
                          child: TextFormField(
                              onChanged: (value) {},
                              style: TextStyle(color: Colors.white),
                              controller: phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("phone cannot be empty");
                                }

                                return null;
                              },
                              onSaved: (Value) {
                                _authData["phone"] = Value.toString();
                              },
                              decoration: InputDecoration(
                                suffixIcon: isEmailCorrect == false
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.transparent,
                                      )
                                    : Icon(
                                        Icons.done,
                                        color: Colors.green,
                                      ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: SizedBox(
                                    width: 70,
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Colors.black),
                                hintStyle: TextStyle(color: Colors.black),
                                labelText: "Phone",
                                hintText: "Phone",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                                //   focusedBorder: OutlineInputBorder(
                                //      borderSide: BorderSide(
                                //          color: isEmailCorrect == false
                                //              ? Color.fromARGB(255, 199, 12, 12)
                                //             : Colors.green),
                                //     borderRadius: BorderRadius.circular(18)),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(
                                //      color: Colors.black,
                                //      width: 1,
                                //    ),
                                //    borderRadius: BorderRadius.circular(13)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 199, 12, 12),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 199, 12, 12),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(13)),
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 170),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => forget()));
                    },
                    child: Text(
                      "Forget Password?",
                      style: GoogleFonts.kanit(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  height: 54,
                  width: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(0, 0, 0, 0),
                            blurRadius: 20,
                            offset: Offset(2, 2))
                      ]),
                  child: CupertinoButton(
                    child: Text("signup"),
                    onPressed: () {
                      // if (.currentState!.validate()) {
                      //  Navigator.push(context,
                      //       MaterialPageRoute(builder: (context) => forget()));
                      // }
                      _Submit();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100, top: 80),
                    child: Text(
                      "Dont have account!",
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 80),
                    child: TextButton(
                        onPressed: () {
                          
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Signin",
                          style: GoogleFonts.kanit(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
