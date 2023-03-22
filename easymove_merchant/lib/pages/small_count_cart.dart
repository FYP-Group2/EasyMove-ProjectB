import 'package:flutter/material.dart';

class SmallCartCount extends StatefulWidget {
  const SmallCartCount({super.key});

  @override
  State<SmallCartCount> createState() => _SmallCartCountState();
}

class _SmallCartCountState extends State<SmallCartCount> {
  int _counter = 0;
  bool _exist = false;

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
    return _exist
        ? Container(
            height: double.infinity,
            child: Row(
              children: [
                Flexible(
                  child: TextButton(
                    onPressed: _decreaseCounter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: Container(
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: double.infinity,
                  width: 50,
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
                Flexible(
                  child: TextButton(
                    onPressed: _increaseCounter,
                    child: Container(
                      height: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 0, right: 0),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
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
                  _exist = true;
                });
              },
              child: const Center(
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
  }
}
