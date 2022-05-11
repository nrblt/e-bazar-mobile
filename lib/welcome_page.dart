import 'package:flutter/material.dart';
import 'registration_page.dart';
import 'login_page.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(child:Text("")),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    minWidth: 150,
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: (){
                      _pushPage(context, LoginPage());
                    },
                    child:Text("Login", style: TextStyle(fontSize: 20),),
                  ),
                  FlatButton(
                      minWidth: 150,
                      color:Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      onPressed: (){
                          // print("pressed reg");
                          _pushPage(context, RegistrationPage());
                      },
                      child: Text("Register",style: TextStyle(fontSize: 20),)
                  )
                ],
              ))

            ]
          ),
        )

    );
  }
}
