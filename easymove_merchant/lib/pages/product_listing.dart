import 'package:easymove_merchant/models/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:easymove_merchant/components/product_card.dart';
import 'package:easymove_merchant/pages/each_category_list.dart';
import 'package:easymove_merchant/components/my_bottom_navigation_bar.dart';
import 'package:easymove_merchant/models/product.dart';
import 'package:easymove_merchant/models/category.dart';
import 'package:easymove_merchant/services/my_api_service.dart';

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
            subcatId: int.parse(p["subcat_id"].toString()),
            name: p["product_name"],
            imageSource: p["photo1"],
            // type: "Ala Carte",
            price: double.parse(p["price"].toString())));
      }

      for (var s in subCat) {
        List<Product> subcatProduct = [];
        for (var p in productList) {
          if (p.subcatId == int.parse(s["subcat_id"].toString())) {
            subcatProduct.add(p);
          }
        }

        subCategoryList.add(SubCategory(
            id: int.parse(s["subcat_id"].toString()),
            maincatId: int.parse(s["maincat_id"].toString()),
            name: s["subcat_name"],
            products: subcatProduct));
      }

      for (var m in mainCat) {
        List<SubCategory> maincatSubcat = [];
        List<Product> maincatProduct = [];
        for (var s in subCategoryList) {
          if (s.maincatId == int.parse(m["maincat_id"].toString())) {
            maincatSubcat.add(s);
            maincatProduct.addAll(s.products);
          }
        }

        categoryList.add(Category(
            id: int.parse(m["maincat_id"].toString()),
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
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10), bottom: Radius.circular(10)),
        child: Drawer(
          backgroundColor: const Color(0xFFDECDAF),
          child: SafeArea(
            child: Column(
              children: [
                FutureBuilder(
                    future: fetchProducts(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        final categoryList = snapshot.data!;
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: categoryList.length,
                            itemBuilder: ((context, index) {
                              return ExpansionTile(
                                title: Text(
                                  categoryList[index].name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Color.fromRGBO(50, 50, 50, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                childrenPadding:
                                    const EdgeInsets.only(left: 40),
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: categoryList[index]
                                          .subCategories
                                          .length,
                                      itemBuilder: (context, index2) {
                                        return ListTile(
                                          title: Text(
                                            categoryList[index]
                                                .subCategories[index2]
                                                .name,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Color.fromRGBO(100, 100, 100, 1),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MyCategoryList(
                                                        category: categoryList[
                                                            index]),
                                              ),
                                            );
                                          },
                                        );
                                      }),
                                ],
                              );
                            }));
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    })),
              ],
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                              itemCount: data[index].allProducts.length +
                                  (data[index].allProducts.length >= 3 ? 1 : 0),
                              itemBuilder: (context, index2) {
                                if (index2 == data[index].allProducts.length) {
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
                                                spreadRadius: 1.5,
                                                blurRadius: 5,
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
                                return ProductCard(
                                  product: data[index].allProducts[index2],
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
