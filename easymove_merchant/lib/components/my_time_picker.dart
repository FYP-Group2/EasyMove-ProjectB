import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyTimePicker extends StatefulWidget{
  const MyTimePicker({super.key, required this.textEditingController});
  final TextEditingController textEditingController;

  @override
  State<MyTimePicker> createState() => MyTimePickerState();
}

class MyTimePickerState extends State<MyTimePicker>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 25),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextFormField(
          focusNode: FocusNode(canRequestFocus: false),
          controller: widget.textEditingController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 10),
          ),
          readOnly: true,
          onTap: () async {
            await showTimePicker(
              initialTime: TimeOfDay.now(),
              context: context,
            ).then((t){
              if(t != null ){
                DateTime d = DateTime.now();
                String time = DateFormat("HH:mm").format(DateTime(d.year, d.month, d.day, t.hour, t.minute));

                setState(() {
                  widget.textEditingController.text = time;
                });
              }
            });
          },
        ),
      ),
    );
  }

}