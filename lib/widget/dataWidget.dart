import 'package:flutter/material.dart';

class DataWiget extends StatelessWidget {
  final Color color;
  final String text;
  
  final String data;

  const DataWiget(
      {required this.color, required this.text, required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: color.withOpacity(0.3)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 0.7,
                child: Container(
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(9),
                          // bottomRight: Radius.circular(9),
                          bottomLeft: Radius.circular(100))),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      data,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 37, 8, 8),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              
                 
              ],
            )
          ],
        ),
      ),
    );
  }
}
