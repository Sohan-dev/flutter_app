import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(

    MaterialApp(
      title: "My Flutter App",
      home: Scaffold(
        appBar: AppBar(title: Text("My First Flutter Application"),),
        body: Material(
          color: Colors.blue,
          child:  Center(
            child: Text(
              "Hello Shubhankar",
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.white,fontSize: 40.0),
              textAlign: TextAlign.center,
            )
            ,)
        ),
      ),
    )
  );
}