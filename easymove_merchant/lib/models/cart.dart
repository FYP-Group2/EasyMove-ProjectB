import 'package:easymove_merchant/models/product.dart';

class Cart {
  static final Cart _instance = Cart._internal();
  List<Product> products = [];
  Map<String, int> productsAmount = {};

  Cart._internal();

  factory Cart(){
    return _instance;
  }

  void addProduct(Product product){
    bool hasProduct = false;
    for(Product p in products){
      if(p.name == product.name){
        hasProduct = true;
      }
    }
    if(!hasProduct) {
      products.add(product);
      productsAmount.addAll({product.name: 1});
    }else{
      if(productsAmount.containsKey(product.name)){
        productsAmount[product.name] = productsAmount[product.name]! + 1;
      }
    }
  }

  void removeProduct(Product product){
    if(productsAmount[product.name]! > 1){
      productsAmount[product.name] = productsAmount[product.name]! - 1;
    }else {
      productsAmount.remove(product.name);
      products.removeWhere((element) => element.name == product.name);
    }
  }

  bool removeProductByIndex(int index){
    bool needReload = false;
    if(productsAmount[products[index].name]! > 1){
      productsAmount[products[index].name] = productsAmount[products[index].name]! - 1;
    }else {
      productsAmount.remove(products[index].name);
      products.removeAt(index);
      needReload = true;
    }

    return needReload;
  }

  double getTotalPrice(){
    double totalPrice = 0;
    for (var p in products) {
      if(productsAmount[p.name] != null){
        totalPrice += productsAmount[p.name]! * p.price;
      }
    }

    return totalPrice;
  }

  void clear(){
    products.clear();
    productsAmount.clear();
  }

}
