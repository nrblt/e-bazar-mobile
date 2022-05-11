import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'home_page.dart';
// import 'package:dio/src/response.dart';
// import 'package:http/http.dart';


class HttpService {
  static final _client = http.Client();
  static var _apiUrl = 'http://localhost:5000/api/';

  Future<List<dynamic>>  getProducts() async {
      Response response = await get(Uri.parse(_apiUrl + 'products'));

      if (response.statusCode == 200) {
        // print("HEHEHEHHEHEHEH");
        var jsonFile = jsonDecode(response.body);
        print(jsonFile);
        List<dynamic> datas = jsonFile;
        return datas;
      }
      throw 42;
    }

    static login(login, password,context)async{
      Map data = {
        'email': login,
        'password': password,
      };
      String body = json.encode(data);

      Response response = await post(Uri.parse(_apiUrl + 'users/signin'),body:body,headers: {"Content-Type": "application/json"});

      // if(response.statusCode==200){

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage(login, password)),
              (Route<dynamic> route) => false,
        );
      // }
      // else{
      //   showDialog<String>(
      //     context: context,
      //     builder: (BuildContext context) => AlertDialog(
      //       title: const Text('Error'),
      //       content: const Text('Maybe you wrote wrong login or password'),
      //       actions: <Widget>[
      //         TextButton(
      //           onPressed: () => Navigator.pop(context, 'OK'),
      //           child: const Text('OK'),
      //         ),
      //       ],
      //     ),
      //   );
      // }

      // print(response.body);
    }
}

