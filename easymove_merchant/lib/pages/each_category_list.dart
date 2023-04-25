import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:easymove_merchant/pages/product_details.dart';
import 'package:easymove_merchant/pages/product_listing.dart';
import 'package:easymove_merchant/components/count_cart.dart';
import 'package:easymove_merchant/models/category.dart';

// void main() {
//   runApp(const categoryList());
// }
//
// class categoryList extends StatelessWidget {
//   const categoryList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyCategoryList(),
//     );
//   }
// }

class MyCategoryList extends StatefulWidget {
  final Category category;

  const MyCategoryList({super.key, required this.category});

  @override
  State<MyCategoryList> createState() => _MyCategoryList();
}

class _MyCategoryList extends State<MyCategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.category.name,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: (() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const productPage()));
          }),
        ),
      ),
      body: GridView.builder(
        itemCount: widget.category.allProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.15),
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProductDetails(
                      product:
                          widget.category.allProducts[index]),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 320,
                    //margin: EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      child: Container(
                        height: 200,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 3,
                                color: Color.fromRGBO(
                                    210, 210, 210, 1.0))
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          //color: Color.fromRGBO(208, 229, 236, 0.941).
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 1.2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: const Color.fromRGBO(
                                          184, 183, 183, 0.635)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.memory(
                                      base64Decode(widget
                                          .category
                                          .allProducts[index]
                                          .imageSource),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 65,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 10, 25, 15),
                                child: Text(
                                  widget.category.allProducts[index].name,
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                            //   child: Text(
                            //     widget.category.subCategories[0].products[index]
                            //         .type,
                            //     style: const TextStyle(
                            //       fontSize: 13.0,
                            //     ),
                            //     maxLines: 1,
                            //     overflow: TextOverflow.ellipsis,
                            //   ),
                            // ),
                            const SizedBox(height: 8.0),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: Text(
                                "RM ${(widget.category.allProducts[index].price).toStringAsFixed(2)}",
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    height: 40,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color:
                                          Color.fromRGBO(176, 154, 115, 0.841),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: CartCount(
                                        product: widget.category
                                            .allProducts[index]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  /*Image.asset(
                    'assets/images/${products[index].image}',
                    fit: BoxFit.cover,
                  ),*/
                  /*Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          products[index].title,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '\$${products[index].price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),*/
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
