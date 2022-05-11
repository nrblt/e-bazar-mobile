import 'package:flutter/material.dart';
import 'home_page.dart';
import 'constants.dart';
import 'api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username;
  late String password;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(children: <Widget>[
          Center(
              child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "Login",
                style: TextStyle(fontSize: 30),
              )),
              const SizedBox(
                height: 30,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: buildUsername()),
              const SizedBox(
                height: 15,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: buildPassword()),
              const SizedBox(
                height: 15,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 90),
                  child: buildSubmit()),
            ],
          )),
          Padding(
              padding: EdgeInsets.fromLTRB(5, 30, 0, 0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ))
        ]));
  }

  Widget buildUsername() => TextFormField(
        controller: _usernameController,
        style: TextStyle(color: Colors.red, fontSize: 20),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          fillColor: kFirstColor,
          filled: true,
          labelStyle: TextStyle(color: Colors.black),
          // borderRadius: BorderRadius(),
          labelText: "Username",
        ),
      );

  Widget buildPassword() => TextFormField(
        controller: _passwordController,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          labelText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          fillColor: kFirstColor,
          filled: true,

          labelStyle: TextStyle(color: Colors.black),

        ),
    keyboardType: TextInputType.visiblePassword,
    obscureText: true,
      );

  Widget buildSubmit() => RaisedButton(
        child: Text(
          "Login",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () async {

          username = _usernameController.text;
          password = _passwordController.text;
          await HttpService.login(username, password, context);

        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.teal,
      );
}
