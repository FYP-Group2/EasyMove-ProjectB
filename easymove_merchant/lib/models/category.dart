import 'package:easymove_merchant/models/product.dart';
import 'package:easymove_merchant/models/sub_category.dart';

class Category {
  int id;
  String name;
  List<SubCategory> subCategories;
  List<Product> allProducts;

  Category({required this.id, required this.name, required this.subCategories, required this.allProducts});
}