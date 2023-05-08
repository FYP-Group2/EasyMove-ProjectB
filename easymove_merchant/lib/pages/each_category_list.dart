import 'package:easymove_merchant/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:easymove_merchant/pages/product_listing.dart';
import 'package:easymove_merchant/models/category.dart';

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
      body: SingleChildScrollView(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.category.subCategories.length,
              itemBuilder: (context, index) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                        child: Text(
                          widget.category.subCategories[index].name,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget
                            .category.subCategories[index].products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 320,
                          mainAxisSpacing: 20,
                        ),
                        itemBuilder: (BuildContext context, int index2) {
                          return ProductCard(
                              product: widget.category.subCategories[index]
                                  .products[index2]);
                        },
                      ),
                      const SizedBox(width: double.infinity, height: 20,)
                    ]);
              })),
    );
  }
}
