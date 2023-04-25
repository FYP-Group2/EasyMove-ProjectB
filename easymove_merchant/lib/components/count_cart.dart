import 'package:flutter/material.dart';
import 'package:easymove_merchant/models/cart.dart';
import 'package:easymove_merchant/models/product.dart';

class CartCount extends StatefulWidget {
  const CartCount({super.key, required this.product});

  final Product product;

  @override
  State<CartCount> createState() => _CartCountState();
}

class _CartCountState extends State<CartCount> {
  int _counter = 0;
  bool add_amount = false;
  Cart myCart = Cart();

  @override
  void initState() {
    super.initState();
    if (myCart.productsAmount.containsKey(widget.product.name)) {
      _counter = myCart.productsAmount[widget.product.name]!;
    }
  }

  void _increaseCounter() {
    setState(() {
      myCart.addProduct(widget.product);
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      myCart.removeProduct(widget.product);
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return add_amount
        ? SizedBox(
            height: double.infinity,
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: TextButton(
                    onPressed: _decreaseCounter,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    color: Colors.white,
                    height: double.infinity,
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
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: TextButton(
                    onPressed: _increaseCounter,
                    child: const SizedBox(
                      height: double.infinity,
                      child: Padding(
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
        : SizedBox(
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
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
  }
}
