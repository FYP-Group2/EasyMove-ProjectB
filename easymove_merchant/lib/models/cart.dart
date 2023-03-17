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
    if(!products.contains(product)) {
      products.add(product);
      productsAmount.addAll({product.name: 1});
    }else{
      if(productsAmount.containsKey(product.name)){
        productsAmount[product.name] = productsAmount[product.name]! + 1;
      }
    }
  }


  bool removeProduct(int index){
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

  void clear(){
    products.clear();
    productsAmount.clear();
  }

}
