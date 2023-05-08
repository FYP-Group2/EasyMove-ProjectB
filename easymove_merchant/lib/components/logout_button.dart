import 'package:easymove_merchant/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 25),
        child: ElevatedButton(
          onPressed: () async {
            await SharedPreferences.getInstance().then((pref) async {
              await pref.clear().then((value) {
                if (value == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyApp()));
                }
              });
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFB09A73),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
          ),
          child: const Text(
            "Logout",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
