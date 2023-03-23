import 'package:flutter/material.dart';

class MyCartCount extends StatefulWidget {
  const MyCartCount({super.key});

  @override
  State<MyCartCount> createState() => _MyCartCountState();
}

class _MyCartCountState extends State<MyCartCount> {
  int _counter = 0;
  bool add_amount = false;

  void _increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return add_amount
        ? Container(
            height: double.infinity,
            child: Row(
              children: [
                TextButton(
                  onPressed: _decreaseCounter,
                  child: Container(
                    width: 10,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 0, right: 0),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: double.infinity,
                  width: 220,
                  alignment: Alignment.center,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            '$_counter',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )),
                ),
                TextButton(
                  onPressed: _increaseCounter,
                  child: Container(
                    width: 10,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 0, right: 0),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            height: double.infinity,
            child: TextButton(
              onPressed: () {
                setState(() {
                  add_amount = true;
                });
              },
              child: const Center(
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
  }
}
