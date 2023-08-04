import 'package:appsmarthome/home/onpendoor.dart';
import 'package:appsmarthome/home/temp.dart';
import 'package:appsmarthome/home/lightHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';
import 'home/gaz.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
    List<Widget> screens = [
    HomePage(),
    LightHome(),
    OpenDoor(),
    Gas()
  ];

  

   int selectedScreen = 0;

  late PageController _pageController;
  
  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: selectedScreen);

    
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                  body: SizedBox.expand(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() => selectedScreen = index);
                      },
                      children: screens,
                    ),
                  ),
                  bottomNavigationBar: BottomNavyBar(
                    itemCornerRadius: 9,
                    backgroundColor: secondaryColor,
                    selectedIndex: selectedScreen,
                    onItemSelected: (index) {
                      setState(() {
                        selectedScreen = index;
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      });
                    },
                    items: <BottomNavyBarItem>[
                      BottomNavyBarItem(
                        title: const Text('Temp'),
                        icon: const FaIcon(FontAwesomeIcons.temperatureHigh),
                        activeColor: Colors.white,
                        inactiveColor: primaryColor,
                      ),
                      BottomNavyBarItem(
                        title: const Text('light'),
                        icon: const FaIcon(FontAwesomeIcons.lightbulb),
                        activeColor: Color.fromARGB(255, 44, 41, 41),
                        inactiveColor: primaryColor,
                      ),
                      BottomNavyBarItem(
                        title: const Text('door'),
                        icon:
                            const FaIcon(FontAwesomeIcons.doorOpen),
                        activeColor: Colors.white,
                        inactiveColor: primaryColor,
                      ),
                       BottomNavyBarItem(
                        title: const Text('Gaz'),
                        icon:
                            const FaIcon(FontAwesomeIcons.warning),
                        activeColor: Colors.white,
                        inactiveColor: primaryColor,
                      ),
                    
                    ],
                  ),
                );
    
     //PageView(
        //controller: _pageController,
       // children: const [HomePage(), LightHome(), ],
     // );
  }
}