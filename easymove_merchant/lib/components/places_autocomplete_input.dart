import 'package:flutter/material.dart';
import 'package:easymove_merchant/services/google_places_service.dart';
import 'package:easymove_merchant/models/suggestion.dart';

class PlacesAutocompleteInput extends StatefulWidget {
  PlacesAutocompleteInput(
      {super.key,required this.sessionToken});

  final String sessionToken;
  String selected = "";
  Suggestion selectedSuggestion = Suggestion("null", "null");

  @override
  State<PlacesAutocompleteInput> createState() =>
      PlacesAutocompleteInputState();
}

class PlacesAutocompleteInputState extends State<PlacesAutocompleteInput> {
  late PlaceApiProvider apiProvider;
  final String apiKey = "AIzaSyC7kd8gzxzXNDVlNENHD7jWZskJjAFSs-E";
  List<String> suggestion = [];

  @override
  void initState() {
    super.initState();
    apiProvider = PlaceApiProvider(widget.sessionToken);
  }

  Future<List<String>> getPredictions(String input) async {
    List<Suggestion> result = await apiProvider.fetchSuggestions(input, "en");
    List<String> suggestions = [];
    for(var r in result){
      suggestions.add(r.description);
    }
    return suggestions;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: ((context, setState) {
      return Padding(
        padding: const EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 25),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: InputDecorator(
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10, bottom: 20, right: 10),
            ),
            child: Autocomplete(
              optionsBuilder: (TextEditingValue textEditingValue) {
                return getPredictions(textEditingValue.text);
              },
              onSelected: (value) async{
                widget.selected = value;
              },
            ),
          ),
        ),
      );
    }));
  }
}
