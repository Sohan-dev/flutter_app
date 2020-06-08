import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import './first_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var image = Image.network(
  "https://scontent.fccu5-1.fna.fbcdn.net/v/t31.0-8/22499072_823079017852697_3861854583865290888_o.jpg?_nc_cat=106&_nc_sid=19026a&_nc_ohc=vbdmpzhIL3oAX-Ilcbt&_nc_ht=scontent.fccu5-1.fna&oh=4f00e2c371ad02357f1d198d23a8b3f8&oe=5F03653D",
  fit: BoxFit.fitHeight,
);

class _HomePageState extends State<HomePage> {
  String mainProfile =
      "https://scontent.fccu5-1.fna.fbcdn.net/v/t1.0-9/95823208_1473512936142632_3143683501077823488_o.jpg?_nc_cat=102&_nc_sid=730e14&_nc_ohc=S5QcMSnc9mYAX96EC7A&_nc_ht=scontent.fccu5-1.fna&oh=36d3fbb731b90e44707753204585ba17&oe=5F0418BA";
  String otherProfile =
      "https://scontent.fccu5-1.fna.fbcdn.net/v/t1.0-9/p843x403/101862584_1683493721806347_2513031918399016840_o.jpg?_nc_cat=105&_nc_sid=8bfeb9&_nc_ohc=Cloo_XsusdEAX-5xSne&_nc_ht=scontent.fccu5-1.fna&_nc_tp=6&oh=a731b1db4e1bd2a9a871a0ef7b16a0c1&oe=5F027656";

  void switchUser(string) {
    print(string);

    if (string == "second") {
      Toast.show("This is second user", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }

    String backupString = mainProfile;
    this.setState(() {
      mainProfile = otherProfile;
      otherProfile = backupString;
    });
  }

  // Navigate to new Screen
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Shubhankar Koner"),
                accountEmail: Text("skonar.asn@outlok.com"),
                currentAccountPicture: GestureDetector(
                  onTap: () => Toast.show("This is current user", context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(mainProfile),
                  ),
                ),
                otherAccountsPictures: <Widget>[
                  GestureDetector(
                    onTap: () => switchUser("second"),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(otherProfile),
                    ),
                  ),
                ],
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://media.istockphoto.com/photos/colorful-oil-painting-on-canvas-texture-picture-id941893050?k=6&m=941893050&s=612x612&w=0&h=fRo7MsXpwIjXqTstumSGnp_bmp-naINMQz9xvMSFMZ4="))),
              ),
              ListTile(
                title: Text("First Page"),
                trailing: Icon(Icons.pages),
                onTap: () => _navigateToNextScreen(context) ,
              ),
              Divider(),
              ListTile(
                title: Text("Second Page"),
                trailing: Icon(Icons.print),
                onTap: () => print("In second page"),
              ),
              Divider(),
              ListTile(
                title: Text("Third Page"),
                trailing: Icon(Icons.account_balance),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("My First Flutter Application"),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: image,
        )

//      Center(
//        child: Text(
//          "This is home page",
//          style: TextStyle(
//              fontSize: 40.0,
//              fontWeight: FontWeight.w300,
//              fontFamily: 'RobotoSlab'),
//        ),
//      ),
        );
  }
}
