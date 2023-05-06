import 'package:easymove_merchant/components/my_app_bar.dart';
import 'package:easymove_merchant/components/my_bottom_navigation_bar.dart';
import 'package:easymove_merchant/components/delivery_details_input.dart';
import 'package:easymove_merchant/components/delivery_details_input_title.dart';
import 'package:easymove_merchant/components/my_drop_down.dart';
import 'package:easymove_merchant/components/trip_table.dart';
import 'package:easymove_merchant/components/places_autocomplete_input.dart';
import 'package:easymove_merchant/models/cart.dart';
import 'package:easymove_merchant/services/my_api_service.dart';
import 'package:easymove_merchant/services/google_places_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartCheckoutPage extends StatefulWidget {
  const CartCheckoutPage({super.key});

  @override
  State<CartCheckoutPage> createState() => CartCheckoutPageState();
}

class CartCheckoutPageState extends State<CartCheckoutPage> {
  final cNameController = TextEditingController();
  final phoneController = TextEditingController();
  final cPropertyController = TextEditingController();
  final collectController = TextEditingController();
  final deliveryController = TextEditingController();
  final msgController = TextEditingController();
  late MyDropDown zoneDropDown = MyDropDown(myList: const ["Select a zone"], selected: "Select a zone");
  late MyDropDown vehicleDropDown = MyDropDown(myList: const ["Select a vehicle"], selected: "Select a vehicle");
  late PlacesAutocompleteInput originAutocomplete;
  late PlacesAutocompleteInput destAutocomplete;
  Map<String, int> zoneMap = {};
  Map<String, int> vehicleMap = {};
  Cart myCart = Cart();
  String sessionToken = const Uuid().v4();
  late PlaceApiProvider googlePlaces;

  @override
  void initState() {
    super.initState();
    originAutocomplete = PlacesAutocompleteInput(sessionToken: sessionToken);
    destAutocomplete = PlacesAutocompleteInput(sessionToken: sessionToken);
    googlePlaces = PlaceApiProvider(sessionToken);
  }

  Future<List<dynamic>> getZones() async {
    List<dynamic> data = await MyApiService.getZones();
    List<dynamic> zone = [];
    zoneMap.clear();
    for (var z in data) {
      if(!zone.contains(z["zone"])) {
        zone.add(z["zone"]);
        zoneMap.addAll({z["zone"]: z["id"]});
      }
    }
    return zone;
  }

  Future<List<dynamic>> getVehicles() async {
    List<dynamic> data = await MyApiService.getVehicles();
    vehicleMap = data[0];
    return data[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Delivery Details",
        width: MediaQuery.of(context).size.width,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TripTable(),
            const DeliveryDetailsInputTitle(textTitle: "Customer Name"),
            DeliveryDetailsInput(textEditingController: cNameController),
            const DeliveryDetailsInputTitle(textTitle: "Phone"),
            DeliveryDetailsInput(textEditingController: phoneController),
            const DeliveryDetailsInputTitle(textTitle: "Origin"),
            PlacesAutocompleteInput(sessionToken: sessionToken),
            const DeliveryDetailsInputTitle(textTitle: "Destination"),
            PlacesAutocompleteInput(sessionToken: sessionToken),
            const DeliveryDetailsInputTitle(textTitle: "Customer Property No."),
            DeliveryDetailsInput(textEditingController: cPropertyController),
            const DeliveryDetailsInputTitle(textTitle: "Collection Time"),
            DeliveryDetailsInput(textEditingController: collectController),
            const DeliveryDetailsInputTitle(textTitle: "Delivery Time"),
            DeliveryDetailsInput(textEditingController: deliveryController),
            const DeliveryDetailsInputTitle(textTitle: "Zone"),
            FutureBuilder(
                future: getZones(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    List<dynamic> dataList = ["Select a zone"];
                    for (var d in snapshot.data!) {
                      if (!dataList.contains(d)) {
                        dataList.add(d);
                      }
                    }
                    zoneDropDown.myList = dataList;
                    return zoneDropDown;
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 5, left: 30, right: 30, bottom: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Text("Loading..."),
                      ),
                    );
                  }
                })),
            const DeliveryDetailsInputTitle(textTitle: "Vehicle Requirements"),
            FutureBuilder(
                future: getVehicles(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    List<dynamic> dataList = ["Select a vehicle"];
                    for (var d in snapshot.data!) {
                      if (!dataList.contains(d)) {
                        dataList.add(d);
                      }
                    }
                    vehicleDropDown.myList = dataList;
                    return vehicleDropDown;
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 5, left: 30, right: 30, bottom: 25),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Text("Loading..."),
                      ),
                    );
                  }
                })),
            const DeliveryDetailsInputTitle(textTitle: "Additional Message"),
            DeliveryDetailsInput(textEditingController: msgController),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE8EFF3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          "Your Order",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(200, 200, 200, 1.0),
                                    spreadRadius: 0,
                                    blurRadius: 10),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Product",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Subtotal",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    color: const Color.fromRGBO(
                                        225, 225, 225, 1.0),
                                    width: double.infinity,
                                    height: 1.5,
                                  ),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: myCart.products.length,
                                    itemBuilder: ((context, index) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${myCart.productsAmount[myCart.products[index].name]}x ${myCart.products[index].name}",
                                            maxLines: 2,
                                          ),
                                          Text(
                                            (myCart.productsAmount[myCart
                                                        .products[index]
                                                        .name]! *
                                                    myCart
                                                        .products[index].price)
                                                .toStringAsFixed(2),
                                          ),
                                        ],
                                      );
                                    })),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Container(
                                    color: const Color.fromRGBO(
                                        225, 225, 225, 1.0),
                                    width: double.infinity,
                                    height: 1.5,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Total",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "RM${myCart.getTotalPrice().toStringAsFixed(2)}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 15),
                child: Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton(
                          onPressed: () {
                            googlePlaces.getCoordinates(originAutocomplete.);
                            // MyApiService.placeOrder(
                            //     cNameController.text,
                            //     phoneController.text,
                            //     originAutocomplete.selected,
                            //     destAutocomplete.selected,
                            //     cPropertyController.text,
                            //     collectController.text,
                            //     deliveryController.text,
                            //     zoneMap[zoneDropDown.selected]!,
                            //     vehicleMap[vehicleDropDown.selected]!,
                            //     msgController.text,
                            //     "",
                            //     "");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB09A73),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                          ),
                          child: const Text(
                            "Place Order",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )))),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(
        index: 2,
        fillCorner: false,
      ),
    );
  }
}
