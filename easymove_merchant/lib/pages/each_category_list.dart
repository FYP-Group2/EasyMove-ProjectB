import 'package:flutter/material.dart';
import 'package:easymove_merchant/pages/product_details.dart';
import 'package:easymove_merchant/pages/small_count_cart.dart';
import 'package:easymove_merchant/pages/product_listing.dart';

class Product {
  String title;
  String image;
  String type;
  double price;

  Product(
      {required this.title,
      required this.image,
      required this.type,
      required this.price});
}

class Category {
  String name;
  List<Product> products;

  Category({required this.name, required this.products});
}

List<Category> categories = [
  Category(
    name: 'Goreng',
    products: [
      Product(
          title: 'Nasi Goreng Kampung',
          image: 'assets/images/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          title: 'Nasi Goreng Kampung',
          image: 'assets/images/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          title: 'Nasi Goreng Kampung',
          image: 'assets/images/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          title: 'Nasi Goreng Kampung',
          image: 'assets/images/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          title: 'Nasi Goreng Kampung',
          image: 'assets/images/Nasi_Goreng_Kampung.jpg',
          type: 'Ala Carte',
          price: 15.90),
    ],
  ),
  Category(
    name: 'Western',
    products: [
      Product(
          title: 'Big Mac',
          image: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          title: 'Big Mac',
          image: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          title: 'Big Mac',
          image: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          title: 'Big Mac',
          image: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          title: 'Big Mac',
          image: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
    ],
  ),
  Category(
    name: 'Fast Food',
    products: [
      Product(
          title: 'Big Mac',
          image: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          title: 'Big Mac',
          image: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          title: 'Big Mac',
          image: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          title: 'Big Mac',
          image: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
      Product(
          title: 'Big Mac',
          image: 'assets/images/burger.png',
          type: 'Ala Carte',
          price: 15.90),
    ],
  ),
];

void main() {
  runApp(const categoryList());
}

class categoryList extends StatelessWidget {
  const categoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyCategoryList(),
    );
  }
}

class MyCategoryList extends StatefulWidget {
  const MyCategoryList({super.key});

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
          categories[1].name,
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
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
        itemCount: categories[1].products.length,
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
                  builder: (context) => MyProductDetails(),
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
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 3, color: Colors.black)
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
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color:
                                          Color.fromRGBO(184, 183, 183, 0.635)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      categories[1].products[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 65,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 10, 25, 15),
                                child: Text(
                                  categories[1].products[index].title,
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: Text(
                                categories[1].products[index].type,
                                style: TextStyle(
                                  fontSize: 13.0,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Padding(
                              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: Text(
                                "RM " +
                                    (categories[1].products[index].price)
                                        .toStringAsFixed(2),
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    height: 40,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          Color.fromRGBO(176, 154, 115, 0.841),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: SmallCartCount(),
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
