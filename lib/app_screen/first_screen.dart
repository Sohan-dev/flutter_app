import 'dart:math';

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
          style: TextStyle(color: Colors.white,fontSize: 40.0),
          textAlign: TextAlign.center,
        )
        ,)
  );
  }
}

String generateRandomNumber(){
  var random = Random();
  int luckyNumber = random.nextInt(10);
  print(luckyNumber);
  return "The number is $luckyNumber";
}