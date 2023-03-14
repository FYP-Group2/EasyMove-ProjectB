import 'package:flutter/material.dart';
import 'package:easymove_merchant/components/my_bottom_navigation_bar.dart';
import 'package:easymove_merchant/components/my_app_bar.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => MenuState();
}

class MenuState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Menu",
        width: MediaQuery.of(context).size.width,
      ),
      body: const Padding(
          padding: EdgeInsets.only(top: 20), child: Text("Menu Page")),
      bottomNavigationBar: const MyBottomNavigationBar(
        index: 0,
      ),
    );
  }
}
