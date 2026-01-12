import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/functions/api_services/all_prodect_services.dart';
import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<ProdectModel> allProducts = [];

  Future<void> fetchAllProducts() async {
    emit(SearchLoading());
    try {
      allProducts = await AllProdectServices().getAllProduct();
      emit(SearchLoaded(products: allProducts));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }

  void onSearchChanged(String query) {
    if (query.isEmpty) {
      emit(SearchLoaded(products: allProducts));
    } else {
      final results = allProducts
          .where(
            (product) =>
                product.title.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();

      if (results.isNotEmpty) {
        emit(SearchLoaded(products: results));
      } else {
        emit(SearchLoaded(products: allProducts));
      }
    }
  }
}
