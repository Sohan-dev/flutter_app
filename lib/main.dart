import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './app_screen/first_screen.dart';
import './app_screen/home_page.dart';
import './app_screen/login_page.dart';

void main() =>                  // Fat arrow function...
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  LoginPage()
  )

  );

// Declare class for Ui development
//class MyFlutter extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {

//    return
//      MaterialApp(
//        debugShowCheckedModeBanner: false,
//        title: "My Flutter App",
//        home: Scaffold(
//          appBar: AppBar(
//            title: Text(
//              "My First Flutter Application",
//                  style: TextStyle(
//                decoration: TextDecoration.none,
//                    fontFamily: 'RobotoSlab',
//                    fontWeight: FontWeight.w500
//            ),
//          ),
//          ),
//          body: FirstScreen()
//        ),
//      );
////    throw UnimplementedError();
//  }
//
//}