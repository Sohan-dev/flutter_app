import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

//    throw UnimplementedError();
  return  Material(
      color: Colors.blue,
      child:  Center(
        child: Text(
          generateRandomNumber(),
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
            decoration: TextDecoration.none,
            fontFamily: 'RobotoSlab',
            fontWeight: FontWeight.w400
          ),
          textAlign: TextAlign.center,
        )
        ,)
  );

//  return Center(
//    child: Container(
//      alignment: Alignment.center,
//      color: Colors.deepPurple,
//      width: 200.0,
//      height: 100.0,
//      margin: EdgeInsets.all(25.0),
////      padding: ,
//    ),
//  );
  }
}

String generateRandomNumber(){
  var random = Random();
  int luckyNumber = random.nextInt(10);
  print(luckyNumber);
  return "The number is : $luckyNumber";
}