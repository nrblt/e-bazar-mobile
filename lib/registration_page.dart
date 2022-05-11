import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late String username;
  late String password;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
            children: <Widget>[
              Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      const SizedBox(height: 20,),
                      Center(child: Text(
                        "Registration", style: TextStyle(fontSize: 30),)),
                      const SizedBox(height: 30,),
                      Padding(padding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: 15), child: buildUsername()),
                      const SizedBox(height: 15,),
                      Padding(padding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: 15), child: buildEmail()),
                      const SizedBox(height: 15,),
                      Padding(padding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: 15), child: buildPassword()),
                      const SizedBox(height: 15,),
                      Padding(padding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: 15),
                          child: buildPasswordConfirm()),
                      const SizedBox(height: 15,),
                      Padding(padding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: 90), child: buildSubmit()),

                    ],
                  )
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(5, 30, 0, 0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
              )
            ]
        )
    );
  }

  Widget buildUsername() =>
      TextFormField(
        controller: _usernameController,
        style: TextStyle(color: Colors.red, fontSize: 20),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          fillColor: Colors.amber,
          filled: true,
          labelStyle: TextStyle(color: Colors.black),
          // borderRadius: BorderRadius(),
          labelText: "Username",

        ),
      );

  Widget buildPassword() =>
      TextFormField(
        controller: _passwordController,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          labelText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          fillColor: Colors.amber,
          filled: true,
          labelStyle: TextStyle(color: Colors.black),
        ),
      );

  Widget buildPasswordConfirm() =>
      TextFormField(
        controller: _passwordConfirmController,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          fillColor: Colors.amber,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          labelStyle: TextStyle(color: Colors.black),
          labelText: "Confirm Password",
        ),
      );

  Widget buildEmail() =>
      TextFormField(
        controller: _emailController,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          filled: true,
          fillColor: Colors.amber,
          labelStyle: TextStyle(color: Colors.black),
          labelText: "Email",
        ),
      );

  Widget buildSubmit() =>
      RaisedButton(
          child: Text("Register", style: TextStyle(fontSize: 20),),
          onPressed: () {
            print("1");
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),

          ),
          color: Colors.teal,


      );


}
