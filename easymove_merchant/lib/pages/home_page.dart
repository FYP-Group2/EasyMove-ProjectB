import 'package:easymove_merchant/components/logout_button.dart';
import 'package:easymove_merchant/components/merchant_detail.dart';
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
  final tableRows = <TableRow>[];

  Future<List<dynamic>> getOrder() async {
    tableRows.clear();
    List<dynamic> data = await MyApiService.getOrder(merchant.id);

    TextStyle thStyle = const TextStyle(
        fontSize: 22, color: Color(0xFFB09A73), fontWeight: FontWeight.w500);
    tableRows.add(
      TableRow(children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          child: Text(
            "Order",
            style: thStyle,
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            "Customer",
            style: thStyle,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          child: Text(
            "Status",
            style: thStyle,
            textAlign: TextAlign.start,
          ),
        ),
      ]),
    );

    for (var d in data) {
      tableRows.add(
        TableRow(children: [
          Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                "${d["sid"]}",
                textAlign: TextAlign.start,
              )),
          Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                  child: Text(
                "${d["customer_name"]}",
                textAlign: TextAlign.center,
              ))),
          Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                "${d["status"]}",
                textAlign: TextAlign.start,
              )),
        ]),
      );
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: "Home",
          width: MediaQuery.of(context).size.width,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                MerchantDetail(
                    screenWidth: MediaQuery.of(context).size.width,
                    screenHeight: MediaQuery.of(context).size.height),
                const LogoutButton(),
                const SizedBox(
                  width: double.infinity,
                  height: 40,
                ),
                FutureBuilder(
                    future: getOrder(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Table(
                            children: tableRows,
                            border: const TableBorder(
                                horizontalInside: BorderSide(
                                    width: 1,
                                    color: Colors.grey,
                                    style: BorderStyle.solid)),
                            columnWidths: const {
                              0: FlexColumnWidth(1),
                              1: FlexColumnWidth(2),
                              2: FlexColumnWidth(1),
                            },
                          ),
                        );
                      }
                      return const CircularProgressIndicator();
                    }),
                const SizedBox(
                  width: double.infinity,
                  height: 50,
                ),
              ]),
        ),
        bottomNavigationBar: const MyBottomNavigationBar(
          index: 0,
          fillCorner: false,
        ));
  }
}
