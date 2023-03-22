import 'package:flutter/material.dart';
import 'package:easymove_merchant/pages/product_listing.dart';
import 'package:easymove_merchant/pages/count_cart.dart';

void main() {
  runApp(const ProductDetails());
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Details',
      home: const MyProductDetails(),
    );
  }
}

class MyProductDetails extends StatefulWidget {
  const MyProductDetails({super.key});

  @override
  State<MyProductDetails> createState() => _MyProductDetails();
}

class _MyProductDetails extends State<MyProductDetails> {
  bool isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 136, 0),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: (() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const productPage()));
          }),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigate to the cart page
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                height: 250.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Nasi_Goreng_Kampung.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Row(children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    'Big Mac',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.pink,
                    ),
                    onPressed: _toggleFavorite,
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 100.0,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 50),
                child: Text(
                  'Description',
                  style: TextStyle(fontSize: 16.0),
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text(
                'RM 15.90',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(176, 154, 115, 0.841),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    // child: Padding(
                    //padding: EdgeInsets.only(top: 10, bottom: 10),
                    child:
                        MyCartCount(), /*Text(
                        'ADD TO CART',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),*/
                  ),
                ),
              ),
            ),
            //),
          ],
        ),
      ),
    );
  }
}
