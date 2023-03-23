import 'package:flutter/material.dart';

class DeliveryDetailsInput extends StatefulWidget{
  const DeliveryDetailsInput({super.key, required this.textEditingController});
  final TextEditingController textEditingController;

  @override
  State<DeliveryDetailsInput> createState() => DeliveryDetailsInputState();
}

class DeliveryDetailsInputState extends State<DeliveryDetailsInput>{
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
          controller: widget.textEditingController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 10),
          ),
        ),
      ),
    );
  }

}