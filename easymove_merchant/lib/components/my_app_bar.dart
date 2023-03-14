import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, required this.title, required this.width})
      : super(key: key);
  final String title;
  final double width;

  @override
  State<MyAppBar> createState() => MyAppBarState();

  @override
  Size get preferredSize => Size(width, 64);
}

class MyAppBarState extends State<MyAppBar> {
  TextStyle titleStyle = const TextStyle(fontSize: 28,);

  Size getTextSize(String text, TextStyle textStyle) {
    return (TextPainter(
            text: TextSpan(text: text, style: textStyle),
            maxLines: 1,
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            textDirection: TextDirection.ltr)
          ..layout())
        .size;
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(64),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 4, left: 20),
                child: Text(
                  widget.title,
                  style: titleStyle,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6FB7CE),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(111, 199, 206, 0.7),
                        offset: Offset(-2, 4),
                        spreadRadius: 2,
                        blurRadius: 5),
                  ],
                ),
                width: getTextSize(widget.title, titleStyle).width * 0.8,
                height: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
