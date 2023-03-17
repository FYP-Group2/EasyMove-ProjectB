import 'package:flutter/material.dart';
import 'package:easymove_merchant/components/my_bottom_navigation_bar.dart';
import 'package:easymove_merchant/components/my_app_bar.dart';
import 'package:easymove_merchant/models/product.dart';
import 'package:easymove_merchant/models/cart.dart';
import 'package:easymove_merchant/models/category.dart';
import 'package:easymove_merchant/pages/product_details.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:image/image.dart' as IMG;

List<Category> categories = [
  Category(
    name: 'Goreng',
    products: [
      Product(
          name: 'Nasi Goreng Kampung',
          imageSource: 'assets/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Nasi Goreng Kampung',
          imageSource: 'assets/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Nasi Goreng Kampung',
          imageSource: 'assets/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Nasi Goreng Kampung',
          imageSource: 'assets/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Nasi Goreng Kampung',
          imageSource: 'assets/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
    ],
  ),
  Category(
    name: 'Western',
    products: [
      Product(
          name: 'Big Mac',
          imageSource: 'assets/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/burger.png',
          type: 'Ala Carte',
          price: 15.90),
    ],
  ),
  Category(
    name: 'Fast Food',
    products: [
      Product(
          name: 'Big Mac',
          imageSource: 'assets/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/burger.png',
          type: 'Ala Carte',
          price: 15.90),
    ],
  ),
];

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => MenuState();
}

class MenuState extends State<MenuPage> {
  final int imageWidth = 80;
  final int imageHeight = 80;

  Cart myCart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Menu",
        width: MediaQuery.of(context).size.width,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: ((context, index) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Row(children: [
                      Text(
                        categories[index].name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Icon(Icons.arrow_right_alt)
                    ])),
                SizedBox(
                  height: 320.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories[index].products.length,
                      itemBuilder: (context, index2) {
                        return Container(
                          width: 180.0,
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyProductDetails(),
                                ),
                              );
                            },
                            child: Container(
                              height: 200,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(blurRadius: 3, color: Colors.black)
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                //color: Color.fromRGBO(208, 229, 236, 0.941).
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1.2,
                                    child: Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(20, 20, 20, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            color: Color.fromRGBO(
                                                184, 183, 183, 0.635)),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            categories[index]
                                                .products[index2]
                                                .imageSource,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 65,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 10, 25, 15),
                                      child: Text(
                                        categories[index]
                                            .products[index2]
                                            .name,
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                    child: Text(
                                      categories[index].products[index2].type,
                                      style: TextStyle(
                                        fontSize: 13.0,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                    child: Text(
                                      "RM " +
                                          (categories[index]
                                              .products[index2]
                                              .price)
                                              .toStringAsFixed(2),
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: TextButton(
                                      onPressed: () {
                                        myCart.addProduct(categories[index].products[index2]);
                                      },
                                      child: Container(
                                        height: 28,
                                        width: 150,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 1),
                                        decoration: const BoxDecoration(
                                          color: Color.fromRGBO(
                                              176, 154, 115, 0.855),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: const Text(
                                          'ADD TO CART',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(
        index: 0,
        fillCorner: false,
      ),
    );
  }
}
