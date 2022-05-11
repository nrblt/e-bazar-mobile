import 'package:flutter/material.dart';
import 'constants.dart';
class Product {
  final String id,image, title, description;
  final int price, size;
  final Color color;
  Product(
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  );
}

// List<Product> products = [
//   Product(
//       6,
//       "./assets/images3/proddd.png",
//       "Office Code",
//       234,
//       dummyText,
//       12,
//       kFirstColor),
//   Product(
//       1,
//       "./assets/images3/proddd.png",
//       "Office Code",
//       234,
//       dummyText,
//       12,
//       kFirstColor),
//   Product(
//       2,
//       "./assets/images3/proddd.png",
//       "Office Code",
//       234,
//       dummyText,
//       12,
//       kFirstColor),
//   Product(
//       3,
//       "./assets/images3/proddd.png",
//       "Office Code",
//       234,
//       dummyText,
//       12,
//       kFirstColor),
//   Product(
//       4,
//       "./assets/images3/proddd.png",
//       "Office Code",
//       234,
//       dummyText,
//       12,
//       kFirstColor),
//   Product(
//       5,
//       "./assets/images3/proddd.png",
//       "Office Code",
//       234,
//       dummyText,
//       12,
//       kFirstColor),
//
// ];
//
// String dummyText =
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
