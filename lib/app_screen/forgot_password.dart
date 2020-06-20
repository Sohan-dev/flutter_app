import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Animation/FadeAnimation.dart';
import 'package:http/http.dart' as http;
import './home_page.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ForgotPassword(),
));

class ForgotPassword extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();

  TextEditingController emailController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/background.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 160,
                      child: FadeAnimation(
                          1.2,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/light-1.png'))),
                          )),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/light-2.png'))),
                          )),
                    ),
                    Positioned(
                      right: 40,
                      width: 40,
                      height: 200,
                      child: FadeAnimation(
                          2.6,
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/clock.png'))),
                          )),
                    ),
                    Positioned(
                      child: FadeAnimation(
                          1.6,
                          Center(
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Anton',
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, 2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                      BorderSide(color: Colors.grey[100]))),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    border: (InputBorder.none),
                                    hintText: "Email or Phone number",
                                    hintStyle:
                                    TextStyle(color: Colors.grey[400])),
                                // ignore: missing_return
                                validator: (String value){
                                  if(value.isEmpty){
                                    return "Please enter you registered email..";
                                  }else{
                                    var email = value;
                                    print(email);
                                  }
                                },
                              ),
                            ),
                          ],
                        )),
                    SizedBox(height: 30),
                    InkWell(
                        onTap: () => {
                          if (_formKey.currentState.validate())
                            {
                              Navigator.of(context).pop(),
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage()))
                            }else{
//                            signIn(emailController,passwordController)
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, 2)
                              ])),
                          child: Center(
                            child: Text(
                              "Send",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
