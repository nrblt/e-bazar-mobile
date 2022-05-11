import 'package:e_bazar_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'product_model.dart';
import 'item_card.dart';
import 'drawer.dart';
import 'item_page.dart';
import 'api.dart';
// class  extends StatefulWidget {
//   const ({Key? key}) : super(key: key);
//
//   @override
//   _State createState() => _State();
// }
//
// class _State extends State<> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  var _username;
  var _password;
  late Future<List<dynamic>> produc;
  List<dynamic> products = [];

  HomePage(_username, _password);


  @override
  _HomePage createState() => _HomePage(_username,_password);

}

class _HomePage extends State<HomePage> {
var _username;
var _password;
late Future<List<dynamic>> produc;
List<dynamic> products=[];
_HomePage(_username, _password);

void lala(Future<List<dynamic>> prr) async {
  products = await prr;
  setState(() {});
}
@override
void initState() {

  print("Init");

  HttpService httpService = new HttpService();
  produc = httpService.getProducts();
  lala(produc);
  // print(products);

    super.initState();
}
@override
Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondColor,
        appBar: AppBar(
          title: Text("E-Bazar"),
        ),
        drawer: CustomDrawer(_username, _password),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                        product:Product(products[index]['_id'],"./assets"+products[index]['image'],products[index]['name'],products[index]['price'],products[index]['description'],12,kFirstColor) ,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ItemPage(Product(products[index]['_id'],"./assets"+products[index]['image'],products[index]['name'],products[index]['price'],products[index]['description'],12,kFirstColor) ,_username,_password)),
                          );
                        }
                        )
                ),
              ),
            ),
          ],
        ));
  }
}
