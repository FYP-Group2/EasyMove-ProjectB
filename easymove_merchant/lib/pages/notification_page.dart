import 'dart:convert';
import 'dart:async';
import 'package:easymove_merchant/components/my_bottom_navigation_bar.dart';
import 'package:easymove_merchant/models/merchant.dart';
import 'package:flutter/material.dart';
import 'package:easymove_merchant/services/my_api_service.dart';
import 'package:easymove_merchant/models/notification_data.dart';
import 'package:easymove_merchant/components/notification_detail.dart';
import 'package:easymove_merchant/components/my_app_bar.dart';

Merchant merchant = Merchant();
DateTime now = DateTime.now();
String year = DateTime(now.year).toString();
String month = DateTime(now.month).toString();

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  NotificationPageState createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  late Future<List<Map<String, dynamic>>>? futureNotification;
  bool cancelTimer = false;

  @override
  void initState() {
    super.initState();
    futureNotification = MyApiService.fetchNoti(merchant.id, year, month);
    setUpTimedFetch();
  }

  @override
  void dispose(){
    super.dispose();
    cancelTimer = true;
  }

  setUpTimedFetch() {
    Timer.periodic(const Duration(milliseconds: 5000), (timer) {
      if(cancelTimer){
        timer.cancel();
      }
      setState(() {
        futureNotification = MyApiService.fetchNoti(merchant.id, year, month);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: "Notification",
          width: MediaQuery.of(context).size.width,),
        body: NotificationList(),
        bottomNavigationBar: const MyBottomNavigationBar(index: 3, fillCorner: false,),);
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text('Notification'),
      backgroundColor: const Color.fromARGB(255, 255, 168, 0),
    );
  }

  Widget NotificationList() {
    return Center(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: futureNotification,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Map<String, dynamic>> data = snapshot.data;
            List<NotificationData> notificationData = data.map((e) =>
                NotificationData.fromJson(e)).toList();
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                    height: 70,
                    child: ListTile(
                        title: Container(
                          margin: const EdgeInsets.only(
                              left: 0, top: 15, right: 0, bottom: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                notificationData[index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                notificationData[index].date,
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              notificationData[index].message,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        leading: CircleAvatar(
                          backgroundColor
                              : (notificationData[index].title ==
                              "Account Approved") ? Colors.green.shade200
                              : (notificationData[index].title ==
                              "Account Rejected!" || notificationData[index]
                              .title == "Warning!") ? Colors.red.shade200
                              : (notificationData[index].title ==
                              "Season Reward") ? Colors.yellow.shade200
                              : (notificationData[index].title == "New Order")
                              ? Colors.blue.shade200
                              : Colors.black12, //default
                          child: Icon(Icons.notifications,
                            size: 25,
                            color
                                : (notificationData[index].title ==
                                "Account Approved") ? Colors.green.shade800
                                : (notificationData[index].title ==
                                "Account Rejected!" ||
                                notificationData[index].title == "Warning!")
                                ? Colors.red.shade800
                                : (notificationData[index].title ==
                                "Season Reward") ? Colors.yellow.shade800
                                : (notificationData[index].title == "New Order")
                                ? Colors.blue.shade800
                                : Colors.grey.shade700, //default
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NotificationDetail(
                                        notificationData: notificationData[index],)
                              )
                          );
                        }
                    )
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 1,
                );
              },
              itemCount: notificationData.length,
            );
          } else {
            return const Text("No Notification Data");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}