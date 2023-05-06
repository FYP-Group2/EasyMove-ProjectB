import 'package:easymove_merchant/models/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:easymove_merchant/pages/product_details.dart';
import 'package:easymove_merchant/components/count_cart.dart';
import 'package:easymove_merchant/pages/each_category_list.dart';
import 'package:easymove_merchant/components/my_bottom_navigation_bar.dart';
import 'package:easymove_merchant/models/product.dart';
import 'package:easymove_merchant/models/category.dart';
import 'package:easymove_merchant/services/my_api_service.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() {
  runApp(const productPage());
}

class productPage extends StatelessWidget {
  const productPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _ProductListState(),
    );
  }
}

class _ProductListState extends StatelessWidget {
  Future<List<Category>> fetchProducts() async {
    List<Category> categoryList = [];
    List<SubCategory> subCategoryList = [];
    List<Product> productList = [];
    try {
      List<dynamic> mainCat = await MyApiService.getMaincat();
      List<dynamic> subCat = await MyApiService.getSubcat();
      List<dynamic> product = await MyApiService.getProducts();

      for (var p in product) {
        productList.add(Product(
            subcatId: int.parse(p["subcat_id"]),
            name: p["product_name"],
            imageSource: p["photo1"],
            // type: "Ala Carte",
            price: double.parse(p["price"])));
      }

      for (var s in subCat) {
        List<Product> subcatProduct = [];
        for (var p in productList) {
          if (p.subcatId == int.parse(s["subcat_id"])) {
            subcatProduct.add(p);
          }
        }

        subCategoryList.add(SubCategory(
            id: int.parse(s["subcat_id"]),
            maincatId: int.parse(s["maincat_id"]),
            name: s["subcat_name"],
            products: subcatProduct));
      }

      for (var m in mainCat) {
        List<SubCategory> maincatSubcat = [];
        List<Product> maincatProduct = [];
        for (var s in subCategoryList) {
          if (s.maincatId == int.parse(m["maincat_id"])) {
            maincatSubcat.add(s);
            maincatProduct.addAll(s.products);
          }
        }

        categoryList.add(Category(
            id: int.parse(m["maincat_id"]),
            name: m["maincat_name"],
            subCategories: maincatSubcat,
            allProducts: maincatProduct));

      }
    } catch (e) {
      print(e);
    }

    return categoryList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ClipRRect(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(10), bottom: Radius.circular(10)),
        child: Drawer(
          backgroundColor: Color.fromRGBO(173, 215, 230, 0.937),
          child: SafeArea(
            child: Column(
              children: [
                ExpansionTile(
                  title: Text(
                    'Food'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  childrenPadding: EdgeInsets.only(left: 60),
                  children: [
                    ListTile(
                      title: Text(
                        "Goreng".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 204, 124, 3),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //to food section
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Machine manufacturers'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  childrenPadding: EdgeInsets.only(left: 60),
                  children: [
                    ListTile(
                      title: Text(
                        "Money".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 204, 124, 3),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //to food section
                      },
                    )
                  ],
                ),
                ListTile(
                  title: Text(
                    'Lawn and graden tractors'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    'industrial machinery'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  childrenPadding: EdgeInsets.only(left: 60),
                  children: [
                    ListTile(
                      title: Text(
                        "industrial machine manufactures".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 204, 124, 3),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //to food section
                      },
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'Agricultural machinery'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  childrenPadding: EdgeInsets.only(left: 60),
                  children: [
                    ListTile(
                      title: Text(
                        "Combine harvesters".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 204, 124, 3),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //to food section
                      },
                    ),
                    ListTile(
                      title: Text(
                        "agricultural aircraft".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 204, 124, 3),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //to food section
                      },
                    ),
                    ListTile(
                      title: Text(
                        "agricultural machinery manufacturers".toUpperCase(),
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 204, 124, 3),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        //to food section
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(bottom: 4, left: 20),
                    child: Text(
                      "Menu",
                      style: TextStyle(fontSize: 28),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 30),
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
                    width: 50,
                    height: 5,
                  ),
                ),
              ],
            ),
          ),
          Builder(
            builder: ((context) => Padding(
                padding: const EdgeInsets.only(top: 40),
                child: IconButton(
                  icon: const Icon(Icons.menu_book),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ))),
          ),
        ]),
      ),
      body: FutureBuilder(
          future: fetchProducts(),
          builder: (context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.hasData) {
              List<Category> data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length + 1,
                itemBuilder: ((context, index) {
                  if (index == data.length) {
                    return const SizedBox(
                      height: 30,
                    );
                  }
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Row(children: [
                            Text(
                              data[index].name,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_right_alt),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MyCategoryList(category: data[index]),
                                  ),
                                );
                              },
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 320.0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  data[index].allProducts.length +
                                      (data[index]
                                                  .allProducts
                                                  .length >=
                                              3
                                          ? 1
                                          : 0),
                              itemBuilder: (context, index2) {
                                if (index2 ==
                                    data[index]
                                        .allProducts
                                        .length) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyCategoryList(
                                              category: data[index]),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        height: 200,
                                        width: 180,
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                spreadRadius: 1,
                                                blurRadius: 3,
                                                color: Color.fromRGBO(
                                                    210, 210, 210, 1.0))
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'View More...',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return Container(
                                  width: 180.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MyProductDetails(
                                                  product: data[index]
                                                      .allProducts[index2]),
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
                                              color: Color.fromRGBO(
                                                  200, 200, 200, 1.0))
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        //color: Color.fromRGBO(208, 229, 236, 0.941).
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 1.2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 20, 20, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    color: const Color.fromRGBO(
                                                        184, 183, 183, 0.635)),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.memory(
                                                    base64Decode(data[index]
                                                        .allProducts[index2]
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
                                                  const EdgeInsets.fromLTRB(
                                                      25, 10, 25, 15),
                                              child: Text(
                                                data[index]
                                                    .allProducts[index2]
                                                    .name,
                                                style: const TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          // ----- Widget showing type of product (e.g. Ala Carte)
                                          // Padding(
                                          //   padding: const EdgeInsets.fromLTRB(
                                          //       25, 0, 25, 0),
                                          //   child: Text(
                                          //     data[index]
                                          //         .subCategories[0]
                                          //         .products[index2]
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
                                            padding: const EdgeInsets.fromLTRB(
                                                25, 0, 25, 0),
                                            child: Text(
                                              "RM ${(data[index].allProducts[index2].price).toStringAsFixed(2)}",
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 10, 0),
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Container(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  height: 40,
                                                  width: double.infinity,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        176, 154, 115, 0.841),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                  ),
                                                  child: CartCount(
                                                    product: data[index]
                                                        .allProducts[index2],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  );
                }),
              );
            } else {
              return const Center(
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF6FB7CE)),
                      )));
            }
          }),
      bottomNavigationBar: const MyBottomNavigationBar(
        index: 1,
        fillCorner: false,
      ),
    );
  }
}
