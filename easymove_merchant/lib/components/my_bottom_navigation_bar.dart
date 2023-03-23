import 'package:flutter/material.dart';
import 'package:easymove_merchant/pages/product_listing.dart';
import 'package:easymove_merchant/pages/cart_page.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar(
      {Key? key, required this.index, required this.fillCorner})
      : super(key: key);
  final int index;
  final bool fillCorner;

  @override
  State<MyBottomNavigationBar> createState() => MyBottomNavigationBarState();
}

class MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: widget.fillCorner ? const Color(0xFFE6EFF3) : Colors.white,
        ),
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(180, 180, 180, 1.0),
                    spreadRadius: 0,
                    blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: const Color.fromRGBO(235, 235, 235, 1.0),
                currentIndex: widget.index,
                selectedItemColor: const Color(0xFFD87D40),
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  switch (index) {
                    case 0:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const productPage()));
                      break;
                    case 1:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartPage()));
                      break;
                    case 2:
                      break;
                  }
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu,
                      size: 40,
                    ),
                    label: 'Menu',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 40,
                    ),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 40,
                    ),
                    label: 'Account',
                  ),
                ],
              ),
            )));
  }
}
