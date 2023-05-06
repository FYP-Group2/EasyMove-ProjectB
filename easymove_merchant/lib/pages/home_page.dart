import 'package:easymove_merchant/components/my_app_bar.dart';
import 'package:easymove_merchant/components/my_bottom_navigation_bar.dart';
import 'package:easymove_merchant/models/merchant.dart';
import 'package:easymove_merchant/services/my_api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Merchant merchant = Merchant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: "Home",
          width: MediaQuery.of(context).size.width,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Text(
                    "Home",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () async => await MyApiService.getOrder(merchant.id),
                    child: const Text("Get Order"))
              ]),
        ),
        bottomNavigationBar: const MyBottomNavigationBar(
          index: 0,
          fillCorner: false,
        ));
  }
}
