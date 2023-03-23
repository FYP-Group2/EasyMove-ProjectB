import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryDetailsInputTitle extends StatefulWidget {
  const DeliveryDetailsInputTitle({super.key, required this.textTitle});

  final String textTitle;

  @override
  State<DeliveryDetailsInputTitle> createState() =>
      DeliveryDetailsInputTitleState();
}

class DeliveryDetailsInputTitleState extends State<DeliveryDetailsInputTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Text(
        widget.textTitle,
        style: const TextStyle(
          fontSize: 18,
        ),
        maxLines: 1,
      ),
    );
  }
}
