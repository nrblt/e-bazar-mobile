import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'home_page.dart';
import 'welcome_page.dart';

class CustomDrawer extends StatelessWidget {
  var _username;
  var _password;

  CustomDrawer(_username, _password);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home Page"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage(_username, _password)),
                    (Route<dynamic> route) => false,
              );            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart_rounded ),
            title: Text("Cart"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => CartPage(_username,_password)),
                    (Route<dynamic> route) => false,
              );
            },
          ),
          Divider(color: Colors.black),
          ListTile(
            leading:Icon(Icons.logout),
            title: Text("Log out"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
                    (Route<dynamic> route) => false,
              );            },
          ),
        ],
      ),
    );
  }
}
