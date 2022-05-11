import 'package:flutter/material.dart';
import 'constants.dart';
import 'drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class CartPage extends StatelessWidget {
  // const CartPage({Key? key}) : super(key: key);
  var _username;
  var _password;

  CartPage(_username, _password);

  @override
  Widget build(BuildContext context) {
    Widget CustomDialog() {
      return Dialog(
        elevation: 0,

        backgroundColor: kSecondColor,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(

          height: 150,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed: () {
                launch('https://www.paypal.com/kz/home');
              },
                  child: Text("Use PayPal"),
                style: ElevatedButton.styleFrom( primary:kFirstColor),
              ),
              ElevatedButton(onPressed: () {
                launch('https://www.mastercard.us/en-us.html');
              },
                  child: Text("Use Card"),
                style: ElevatedButton.styleFrom( primary:kFirstColor),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"))
            ],
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: kSecondColor,
        appBar: AppBar(
          title: Text("E-Bazar"),
        ),
        drawer: CustomDrawer(_username, _password),
        body: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // mainAxisSpacing: 15,
              children: <Widget>[
                for (var item in products)
                  Column(children: <Widget>[
                    SizedBox(height: 10),
                    Container(
                      // mainAxisSpacing: 15,
                      decoration: BoxDecoration(
                        color: kFirstColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: Image.asset(
                              './assets/'+item.image, height: 100, width: 100),
                        ),
                        Expanded(
                          child: Text(item.title),
                        ),
                        Expanded(child: Text('\$${item.price}')),
                        Expanded(
                            child: RaisedButton(
                              color: kSecondColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CustomDialog();
                                    });
                              },
                              child: Text("Buy"),
                            )),
                      ]),
                    ),
                  ]),
              ],
            )));
  }
}

class CartItem {
  final String image, title;
  final int price;
  final Color color;

  CartItem(this.image,
      this.title,
      this.price,
      this.color,);
}

List<CartItem> products = [
  CartItem("/images/product-2.jpg", "sample product", 0, kFirstColor),

];
