import 'package:ecommerce_app/core/utils/functions/api.dart';
import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';

class AllProdectServices {
  List<ProdectModel> allProducts = [];
  Future<List<ProdectModel>> getAllProduct() async {
    List<dynamic> Jsondata = await Api().get(
      URL: 'https://fakestoreapi.com/products',
    );
    for (var item in Jsondata) {
      allProducts.add(ProdectModel.fromJson(item));
    }
    return allProducts;
  }
}
