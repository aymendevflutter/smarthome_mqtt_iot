import 'dart:developer';

import 'package:appsmarthome/signupin/login.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'home/temp.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import './provider/ath.dart';
import 'signupin/login.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late String fullName = '';
  late String country = '';
  late String phone = '';
  late String id = '';

  @override
  void initState() {
    super.initState();
    // Retrieve the user's profile data from Firestore
    //  final user = FirebaseAuth.instance.currentUser;
    //// FirebaseFirestore.instance
    //    .collection('Users')
    //    .doc(user!.uid)
    //   .get()
    //  .then((DocumentSnapshot documentSnapshot) {
    //if (documentSnapshot.exists) {
    // setState(() {
    //   fullName = documentSnapshot.get('Full_Name');
    //   country = documentSnapshot.get('Country');
    //   phone = documentSnapshot.get('Phone');
    //  id = user.uid;
    //  });
    // } else {
    //   print('Document does not exist on the database');
    //    }
    //  }).catchError((error) {
    //   print('Error getting document: $error');
    //  });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: secondaryColor,
        //Color.fromARGB(255, 60, 111, 173),
        child: ListView(children: [
          DrawerHeader(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 250, 250, 249)),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          DrawerListTile(
            title: "Home",
            icon: Icons.home,
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            onPressed: () {},
          ),
          DrawerListTile(
            title: "Profile",
            icon: Icons.person,
            press: () {},
            onPressed: () {},
          ),
          ExpansionTile(
            leading: Icon(
              Icons.settings,
              color: Color.fromRGBO(13, 26, 17, 1),
            ),
            title: Text(
              "Settings",
              style: const TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 250, 250, 249)),
            ),
            children: [
              DrawerListTile(
                title: "Change Password",
                icon: Icons.password,
                press: () {},
                onPressed: () {},
              ),
              DrawerListTile(
                title: "Delete Account",
                icon: Icons.account_balance,
                press: () {},
                onPressed: () {},
              ),
              DrawerListTile(
                title: "Edit",
                icon: Icons.account_box,
                press: () {},
                onPressed: () {},
              ),
            ],
          ),
          DrawerListTile(
            title: "About us",
            icon: Icons.info,
            press: () {},
            onPressed: () {},
          ),
          DrawerListTile(
            title: "Log out",
            icon: Icons.logout,
            press: () {
              Provider.of<Ath>(context, listen: false).signOut();
             // Navigator.push(
             //     context, MaterialPageRoute(builder: (context) => loginScreen()));
            },
            onPressed: () {},
          ),
        ]));
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
    required Null Function() onPressed,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: Color.fromRGBO(13, 26, 17, 1),
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 25, color: Color.fromARGB(255, 250, 250, 249)),
      ),
    );
  }
}
