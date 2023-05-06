import 'dart:ui';

import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage(
      {super.key,
      required this.titleText,
      required this.displayText,
      required this.pageRoute});

  final String titleText;
  final String displayText;
  final Widget pageRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.green, width: 5),
              ),
              child: const Icon(
                Icons.done,
                size: 60,
                color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                titleText,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text(
                displayText,
                style: const TextStyle(
                  fontSize: 18,
                ),
                maxLines: 5,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => pageRoute));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 10)),
                child: const Text("Dismiss", style: TextStyle(fontSize: 20),))
          ],
        ),
      ),
    );
  }
}
