import 'package:ecommerce_app/core/utils/functions/api.dart';

class AllCategoryServices {
  Future<List<dynamic>> getAllCategory() async {
    List<dynamic> jsondata = await Api().get(
      URL: 'https://fakestoreapi.com/producategories',
    );

    return jsondata;
  }
}
