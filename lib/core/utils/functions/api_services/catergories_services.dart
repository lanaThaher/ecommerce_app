import 'package:ecommerce_app/core/utils/functions/api.dart';
import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';

class CatergoriesServices {
  List<ProdectModel> allProducts = [];
  Future<List<ProdectModel>> getCategorey({
    required String categoryName,
  }) async {
    List<dynamic> jsondata = await Api().get(
      URL: 'https://fakestoreapi.com/products/category/$categoryName',
    );

    for (var item in jsondata) {
      allProducts.add(ProdectModel.fromJson(item));
    }
    return allProducts;
  }
}
