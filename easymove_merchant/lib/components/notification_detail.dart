import 'package:flutter/material.dart';
import 'package:easymove_merchant/models/notification_data.dart';

class NotificationDetail extends StatelessWidget {
  const NotificationDetail({super.key, required this.notificationData});

  final NotificationData notificationData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
            size: 35,
          ),
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(16.0),
            child: Container(
              height: 4.0,
              decoration: const BoxDecoration(
                color: Color(0xFF6FB7CE),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(111, 199, 206, 0.7),
                      offset: Offset(0, 4),
                      spreadRadius: 2,
                      blurRadius: 5),
                ],
              ),
            ),
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              notificationData.title,
              style: const TextStyle(color: Colors.black, fontSize: 25.0),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          margin:
              const EdgeInsets.only(left: 40, top: 40, right: 40, bottom: 0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  notificationData.date,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                notificationData.message,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ));
  }
}
