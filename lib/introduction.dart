import 'package:appsmarthome/signupin/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final pagecontroller =PageController(
    initialPage: 0,
  );
  bool OnLastPage=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: pagecontroller,
              onPageChanged:(index) {
                setState(() {
                  OnLastPage=(index==2);
                });
                
              },
              children: [
                Pages(color1: Color.fromARGB(255, 255, 255, 255), img1: "assets/smart2.png", title1: "        Application pour maison \n        intelligente complète", intro1: "            Cette application offre une solution complète pour \n            les utilisateurs souhaitant contrôler leur maison \n            intelligente avec simplicité et sécurité."),
                Pages(color1: Color.fromARGB(255, 255, 255, 255), img1: "assets/1avec tel.png", title1: "      Fonctionnalités pratiques", intro1: "    Elle permet de gérer l'éclairage, de contrôler la \n    température et l'humidité, d'ouvrir et fermer les \n    portes (automatiques ou manuelles) à l'aide d'un \n    appareil mobile, de surveiller les fuites de gaz et \n    d'alerter en cas de danger."),
                Pages(color1: Color.fromARGB(255, 255, 255, 255), img1: "assets/2avec tel.png", title1: "Contrôle facile et \nsécurisé", intro1: "                     Grâce à toutes ces fonctionnalités, cette \n                     application mobile offre un moyen facile et \n                     sécurisé de contrôler une maison intelligente,\n                     offrant ainsi aux utilisateurs une expérience \n                     de contrôle de maison plus pratique, plus sûre et \n                     plus agréable."),
              ],
            ),
            Container(
              alignment: Alignment(0,0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround ,
                children: [
                  GestureDetector(
                    onTap: () {
                      pagecontroller.jumpToPage(2);
                    },
                    child: Text("Skip",
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(250, 250, 250, 250),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),),
                  ),
                  SmoothPageIndicator(
                    controller: pagecontroller, 
                    count: 3,
                    effect: JumpingDotEffect(
                      verticalOffset: 0.8,
                      jumpScale: 1.8,
                      offset: 23,
                      dotColor: Color.fromARGB(255, 255, 255, 255),
                      activeDotColor: Color.fromARGB(255, 231, 111, 111),
                      
                      
                    ),
                    
                    ),
                   OnLastPage?
                   GestureDetector(
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>loginScreen()));
                    },
                    child: Text("Done",
                    style: GoogleFonts.kanit(
                      color: Color.fromARGB(250, 250, 250, 250),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                                    ) ),
                    )
                    :
                   GestureDetector(
                    onTap: (){
                      pagecontroller.nextPage(
                        duration:Duration(milliseconds: 500 ),
                         curve:Curves.easeIn);
                    },
                     child: Text("Next",
                     style: GoogleFonts.kanit(
                      color: Color.fromARGB(250, 250, 250, 250),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                                     ),),
                   ) ,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class Pages extends StatelessWidget {
  const Pages({super.key, required this.color1, required this.img1, required this.title1, required this.intro1});
  final Color color1;
  final String img1;
  final String title1;
  final String intro1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255,255)
            )
            ), 
              
          Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80),
                          topLeft: Radius.circular(80)
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                            Color.fromARGB(255, 1, 0, 71),
                            Color.fromARGB(255, 0, 109, 160),
                          ]
                        ),
                         boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 0, 109, 180),
                            blurRadius: 10,
                            offset: Offset(2, -2),
                          )
                         ]
                      ),
                   
           ),
          Container(
             child: Column(
               children: [
                 SizedBox(height: 50,),
                 Image.asset(img1,height: 500,width: double.infinity,),
                 SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.only(right: 120),
                   child: Text(title1,
                   style: GoogleFonts.kanit(
                    color: Color.fromARGB(255, 250, 250, 250),
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                   ),),
                   
                 ),
                 SizedBox(height: 30,),
                 Padding(
                   padding: const EdgeInsets.only(right:120),
                   child: Text(intro1,
                   style: TextStyle(
                    color: Color.fromARGB(255, 250, 250, 250), 
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                   ),),
                 )
                  ],
                ),
              ),
            
          
        ],
      ),
    );
  }
}