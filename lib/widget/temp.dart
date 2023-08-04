import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constant.dart';
import 'dataWidget.dart';

class Temp extends StatelessWidget {
  String data;
  
  
  Temp( this.data,);

  @override
  Widget build(BuildContext context) {
    return DataWiget(
      color: secondaryColor,
      text: data,
      
      data: data,
    );
    ;
  }
}
