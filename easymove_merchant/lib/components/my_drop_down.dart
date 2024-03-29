import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  List<dynamic> myList;
  String selected = "";
  MyDropDown({super.key, required this.myList, required this.selected});

  @override
  State<MyDropDown> createState() => MyDropDownState();
}

class MyDropDownState extends State<MyDropDown> {

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
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            focusNode: FocusNode(canRequestFocus: false),
            value: widget.selected.isNotEmpty? widget.selected : null,
            items: widget.myList
                .map(
                  (region) => DropdownMenuItem<String>(
                    value: region,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(region)),
                  ),
                )
                .toList(),
            isExpanded: true,
            onChanged: (value) {
              setState(() {
                widget.selected = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
