import 'package:flutter/material.dart';
import 'package:easymove_merchant/components/my_bottom_navigation_bar.dart';
import 'package:easymove_merchant/components/my_app_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => CartState();
}

class CartState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Cart", width: MediaQuery.of(context).size.width,),
      body: const Padding(
          padding: EdgeInsets.only(top: 20), child: Text("Cart Page")),
      bottomNavigationBar: const MyBottomNavigationBar(index: 1,),
    );
  }
}
