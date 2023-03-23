import 'package:flutter/material.dart';
import 'package:easymove_merchant/components/my_bottom_navigation_bar.dart';
import 'package:easymove_merchant/components/my_app_bar.dart';
import 'package:easymove_merchant/models/cart.dart';
import 'package:easymove_merchant/models/product.dart';
import 'package:easymove_merchant/pages/cart_checkout_page.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => CartState();
}

class CartState extends State<CartPage> {
  final int imageWidth = 80;
  final int imageHeight = 80;

  Cart myCart = Cart();

  void reload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Cart",
        width: MediaQuery.of(context).size.width,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: myCart.products.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Displaying image (first column)
                    Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SizedBox(
                            width: imageWidth.toDouble(),
                            height: imageHeight.toDouble(),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              child: Image.asset(
                                myCart.products[index].imageSource,
                                fit: BoxFit.fill,
                              ),
                              // child: Image.memory(
                              //   base64Decode(myCart.products[index].imageSource),
                              //   width: imageWidth.toDouble(),
                              //   height: imageHeight.toDouble(),
                              // ),
                            ))),
                    // Displaying name, unit price, and quantity (second column)
                    SizedBox(
                      height: imageHeight.toDouble() * 0.9,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              myCart.products[index].name,
                              style: const TextStyle(fontSize: 18),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "RM${myCart.products[index].price.toStringAsFixed(2)}"
                            "/${myCart.productsAmount[myCart.products[index].name]}",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // Displaying total price of a product, add/decrease button (third column)
                    // StatefulBuilder(builder: ((context, setState) {
                    //   return
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "RM${(myCart.products[index].price * myCart.productsAmount[myCart.products[index].name]!).toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      bool needReload =
                                          myCart.removeProductByIndex(index);
                                      if (needReload) {
                                        reload();
                                      }
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Color(0xFFB09A73),
                                  )),
                              Text(
                                  "${myCart.productsAmount[myCart.products[index].name]}"),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      myCart.addProduct(myCart.products[index]);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add_circle_outlined,
                                    color: Color(0xFFB09A73),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // })),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                );
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE6EFF3),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(180, 180, 180, 1.0),
                  spreadRadius: 0,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 40, top: 20),
                    child: Text(
                      "Total Price",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 40, top: 20),
                      child: Text(
                        "RM${myCart.getTotalPrice().toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 15),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CartCheckoutPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB09A73),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                        ),
                        child: const Text(
                          "CHECKOUT",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ))),
            ]),
          )
        ],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(
        index: 1,
        fillCorner: true,
      ),
    );
  }
}
