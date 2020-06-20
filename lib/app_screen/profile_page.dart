import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Profilepage();
}

class _Profilepage extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    int _currentIndex = 0;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              title: Text('Camera'),
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user),
              title: Text('Profile'),
              backgroundColor: Colors.blue
          )
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
//              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 200,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/profile_background.jpg'),
                            fit: BoxFit.fill)),
//                    margin: EdgeInsets.only(top: 10.0),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.0, left: 10.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://scontent.fccu5-1.fna.fbcdn.net/v/t1.0-9/92676300_1455177277976198_6097525075395739648_o.jpg?_nc_cat=101&_nc_sid=e3f864&_nc_ohc=1u8D7WF_HyIAX-TPISc&_nc_ht=scontent.fccu5-1.fna&oh=e91674e01c02e9d5cfdf829751b4cb72&oe=5F07D2B8"),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20.0),
                    child: Text(
                      'Shubhankar Koner',
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
