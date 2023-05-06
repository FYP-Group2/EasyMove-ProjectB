import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class PlacesInput extends StatefulWidget {
  const PlacesInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<PlacesInput> createState() => PlacesInputState();
}

class PlacesInputState extends State<PlacesInput> {
  final String apiKey = "AIzaSyC7kd8gzxzXNDVlNENHD7jWZskJjAFSs-E";

  void getPredictions() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        radius: 10000000,
        types: [],
        strictbounds: false,
        apiKey: apiKey,
        mode: Mode.overlay,
        language: "en",
        onError: (response) {
          print("Error occured-----$response");
        });
    p?.description == null ? print("description null") : print(p?.description);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 25),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextFormField(
          focusNode: FocusNode(canRequestFocus: false),
          controller: widget.controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 10),
          ),
          onTap: getPredictions,
        ),
      ),
    );
  }
}
