import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<ProdectModel> products;
  final bool isSearching;

  SearchLoaded({required this.products, this.isSearching = false});
}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}
