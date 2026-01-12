import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';
import 'package:hive/hive.dart';

class Order {
  void addToCart(ProdectModel product) {
    var box = Hive.box<ProdectModel>('cartBox');

    ProdectModel? existing;
    try {
      existing = box.values.firstWhere((item) => item.id == product.id);
    } catch (e) {
      existing = null;
    }

    if (existing != null) {
      existing.quantity += 1;
      existing.save();
    } else {
      product.quantity = 1;
      box.add(product);
    }
  }
}
