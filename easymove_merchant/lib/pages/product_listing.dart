import 'package:flutter/material.dart';
import 'package:easymove_merchant/pages/product_details.dart';
import 'package:easymove_merchant/components/count_cart.dart';
import 'package:easymove_merchant/components/count_cart.dart';
import 'package:easymove_merchant/pages/each_category_list.dart';
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
          imageSource: 'assets/images/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Nasi Goreng Kampung',
          imageSource: 'assets/images/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Nasi Goreng Kampung',
          imageSource: 'assets/images/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Nasi Goreng Kampung',
          imageSource: 'assets/images/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Nasi Goreng Kampung',
          imageSource: 'assets/images/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
    ],
  ),
  Category(
    name: 'Western',
    products: [
      Product(
          name: 'Big Mac',
          imageSource: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
    ],
  ),
  Category(
    name: 'Fast Food',
    products: [
      Product(
          name: 'Big Mac',
          imageSource: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          name: 'Big Mac',
          imageSource: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
    ],
  ),
];

void main() {
  runApp(const productPage());
}

class productPage extends StatelessWidget {
  const productPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _ProductListState(),
    );
  }
}

class _ProductListState extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ClipRRect(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(10), bottom: Radius.circular(10)),
        child: Drawer(
          backgroundColor: Color.fromRGBO(173, 215, 230, 0.937),
          child: SafeArea(
            child: Column(
              children: [
                ExpansionTile(
                  title: Text(
                    'Food'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  childrenPadding: EdgeInsets.only(left: 60),
                  children: [
                    ListTile(
                      title: Text(
                        "Goreng".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 204, 124, 3),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //to food section
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Machine manufacturers'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  childrenPadding: EdgeInsets.only(left: 60),
                  children: [
                    ListTile(
                      title: Text(
                        "Money".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 204, 124, 3),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //to food section
                      },
                    )
                  ],
                ),
                ListTile(
                  title: Text(
                    'Lawn and graden tractors'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    'industrial machinery'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  childrenPadding: EdgeInsets.only(left: 60),
                  children: [
                    ListTile(
                      title: Text(
                        "industrial machine manufactures".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 204, 124, 3),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //to food section
                      },
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Agricultural machinery'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  childrenPadding: EdgeInsets.only(left: 60),
                  children: [
                    ListTile(
                      title: Text(
                        "Combine harvesters".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 204, 124, 3),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //to food section
                      },
                    ),
                    ListTile(
                      title: Text(
                        "agricultural aircraft".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 204, 124, 3),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //to food section
                      },
                    ),
                    ListTile(
                      title: Text(
                        "agricultural machinery manufacturers".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 204, 124, 3),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //to food section
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(bottom: 4, left: 20),
                    child: Text(
                      "Menu",
                      style: TextStyle(fontSize: 28),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 30),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF6FB7CE),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(111, 199, 206, 0.7),
                            offset: Offset(-2, 4),
                            spreadRadius: 2,
                            blurRadius: 5),
                      ],
                    ),
                    width: 50,
                    height: 5,
                  ),
                ),
              ],
            ),
          ),
          Builder(
            builder: ((context) => Padding(
                padding: const EdgeInsets.only(top: 40),
                child: IconButton(
                  icon: const Icon(Icons.menu_book),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ))),
          ),
        ]),
      ),
      // AppBar(
      //   iconTheme: IconThemeData(color: Colors.black),
      //   actions: [
      //     Builder(
      //       builder: (context) => IconButton(
      //         icon: Icon(Icons.menu_book),
      //         onPressed: () => Scaffold.of(context).openEndDrawer(),
      //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //       ),
      //     ),
      //   ],
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: const Padding(
      //     padding: EdgeInsets.only(top: 20, bottom: 20),
      //     child: Text(
      //       'Menu',
      //       style: TextStyle(
      //         fontSize: 30,
      //         color: Colors.transparent,
      //         decoration: TextDecoration.underline,
      //         decorationThickness: 3.00,
      //         decorationColor: Colors.lightBlue,
      //         shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
      //       ), //set the text color and give underline to the text
      //     ),
      //   ),
      // ),
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
                    IconButton(
                      icon: const Icon(Icons.arrow_right_alt),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => categoryList(),
                          ),
                        );
                      },
                    ),
                  ]),
                ),
                SizedBox(
                  height: 320.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories[index].products.length +
                          (categories[index].products.length >= 3 ? 1 : 0),
                      itemBuilder: (context, index2) {
                        if (index2 == categories[index].products.length) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => categoryList(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Container(
                                height: 200,
                                width: 180,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3, color: Colors.black)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    'View More...',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
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
                                        categories[index].products[index2].name,
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
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Container(
                                          alignment: Alignment.bottomCenter,
                                          height: 40,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                176, 154, 115, 0.841),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: CartCount(
                                            product: categories[index]
                                                .products[index2],
                                          ),
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
