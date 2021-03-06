import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Animation/FadeAnimation.dart';
import 'package:http/http.dart' as http;
import './home_page.dart';
import './forgot_password.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ));

class LoginPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();

  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController = TextEditingController();

//  void signIn(email,password){
//    print(email.text);
//    print(password.text);
//  }

  void signIn(email, pass) async {
    String url = 'http://192.168.1.103:5000/login';
    http.post(url, headers: {
      'Accept': 'application/json',
    }, body: {
      "email": email,
      "password": pass
    }).then((response) {
      print(response.statusCode);
      print(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
//      appBar: AppBar(
//        title: Text("Login"),
//      ),
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
                      height: 200,
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
                              "Login",
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
                                offset: Offset(0, 10)
                            )
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
                                    return "Please enter email ot phone number";
                                  }else{
                                    var email = value;
                                    print(email);
                                  }
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: (InputBorder.none),
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                                // ignore: missing_return
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Please enter password";
                                  }else{
                                    print(value);
                                  }
                                },
                              ),
                            )
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
                                signIn(emailController,passwordController)
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
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 70,
                    ),
                    InkWell(
                      onTap: () => {
                        Navigator.of(context).pop(),
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgotPassword()))
                      },
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                            color: Color.fromRGBO(143, 148, 251, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    )
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
