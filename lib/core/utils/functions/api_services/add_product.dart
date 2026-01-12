import 'package:ecommerce_app/core/utils/functions/api.dart';
import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';

class AddProduct {
  Future<ProdectModel> addProduct({
    required String title,
    required double price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      URL: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
    );
    return ProdectModel.fromJson(data);
  }
}
