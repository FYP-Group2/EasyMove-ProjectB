import 'package:flutter/cupertino.dart';
import 'package:easymove_merchant/services/my_api_service.dart';
import 'package:flutter/material.dart';

class TripTable extends StatefulWidget {
  const TripTable({super.key});

  @override
  State<TripTable> createState() => TripTableState();
}

class TripTableState extends State<TripTable> {
  final tableRows = <TableRow>[];

  Future<dynamic> getTripStatement() async {
    final data = await MyApiService.getTrip();
    List<int> tripDistance = [];
    List<int> topupTrip = [];
    List<int> tripBalance = [];

    TextStyle thStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    tableRows.add(
      TableRow(children: [
        Center(child: Text("Trip", style: thStyle)),
        Center(
            child: Text(
          "Topup",
          style: thStyle,
        )),
        Center(
            child: Text(
          "Balance",
          style: thStyle,
        )),
      ]),
    );

    for (var record in data["trip"]) {
      int distance = record["trip_distance"];
      int topup = record["topup_trip"];
      int balance = record["trip_balance"];

      if (tripDistance.contains(distance)) {
        int index = tripDistance.indexWhere((element) => element == distance);
        topupTrip[index] += topup;
        tripBalance[index] += balance;
      } else {
        tripDistance.add(distance);
        topupTrip.add(topup);
        tripBalance.add(balance);
      }
    }

    for (int i = 0; i < tripDistance.length; i++) {
      tableRows.add(
        TableRow(children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Center(child: Text("${tripDistance[i]}KM"))),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Center(child: Text("${topupTrip[i]}"))),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Center(child: Text("${tripBalance[i]}"))),
        ]),
      );
    }

    return await MyApiService.getTrip();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: const Color(0xFFF2A93B), width: 3.0),
          color: const Color(0xFFFDF1D0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 10, left: 25),
                child: Text(
                  "Your Trip Packages",
                  style: TextStyle(
                      color: Color(0xFFF0A83B),
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 10, right: 25),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFE7AC52),
                ),
                width: double.infinity,
                height: 2,
              ),
            ),
            FutureBuilder(
                future: getTripStatement(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Table(
                        children: tableRows,
                      ),
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 40),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
