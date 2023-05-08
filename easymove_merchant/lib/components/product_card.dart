import 'package:easymove_merchant/models/product.dart';
import 'package:flutter/material.dart';
import 'package:easymove_merchant/pages/product_details.dart';
import 'package:easymove_merchant/components/count_cart.dart';
import 'dart:convert';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  State<ProductCard> createState() => ProductCardState();
}

class ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyProductDetails(product: widget.product),
            ),
          );
        },
        child: Container(
          height: 200,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  spreadRadius: 1.5,
                  blurRadius: 5,
                  color: Color.fromRGBO(200, 200, 200, 1.0))
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color.fromRGBO(184, 183, 183, 0.635)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.memory(
                        base64Decode(widget.product.imageSource),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: SizedBox(
                height: 65,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Text(
                  "RM ${widget.product.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 40,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(176, 154, 115, 0.841),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: CartCount(
                      product: widget.product,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
