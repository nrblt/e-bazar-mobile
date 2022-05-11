import 'package:e_bazar_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'product_model.dart';
import 'item_card.dart';
import 'drawer.dart';
import 'map_page.dart';

class ItemPage extends StatelessWidget {
  // const ItemPage({Key? key}) : super(key: key);
  late Product product;
  var _username;
  var _password;

  ItemPage(this.product, this._username, this._password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondColor,
        appBar: AppBar(
          title: Text("E-Bazar"),
        ),
        drawer: CustomDrawer(_username, _password),
        body: SingleChildScrollView(
    child:
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Image.asset(
                  product.image,
                  width: double.infinity,
                  height: 300,
                ),
              ),
              Container(
                  child: Text(
                product.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: kBigTextSize),
              )),
              Container(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPaddin),
                  child: Text(
                    product.description,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: kDefaultTextSize),
                  )),
              Container(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPaddin),
                  child: Text(
                    '\$${product.price}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: kBigTextSize),
                  )),
              GestureDetector(
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MapPage(product.title, product.id, _username, _password)),
                        (Route<dynamic> route) => false,
                  );
                },
                child: Container(
                  child:Text("Where it is located",style: TextStyle(fontSize: kDefaultTextSize),textAlign: TextAlign.center,),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: kFirstColor),
                )
              ),
              Row(

                children: <Widget>[
                  Expanded(
                    flex: 2, // 20%
                    child: Container(color: Colors.red),
                  ),
                  Expanded(
                    flex: 6,

                    child:GestureDetector(

                      onTap: () {
                        print("Tapped");
                      },
                      child: Container(
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: kFirstColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            "Add to cart!",
                            style: TextStyle(fontSize: kBigTextSize),
                            textAlign: TextAlign.center,

                          )))),
                  Expanded(
                    flex: 2, // 20%
                    child: Container(color: Colors.blue),
                  )
                ],
              ),
            ])));
  }
}
