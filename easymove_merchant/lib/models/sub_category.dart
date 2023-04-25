import 'package:easymove_merchant/models/product.dart';

class SubCategory{
  int id;
  int maincatId;
  String name;
  List<Product> products;

  SubCategory({required this.id, required this.maincatId, required this.name, required this.products});
}