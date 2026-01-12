import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    _loadCart();
  }

  late Box<ProdectModel> _box;

  void _loadCart() async {
    _box = Hive.box<ProdectModel>('cartBox');
    emit(CartLoaded(cartItems: _box.values.toList()));
  }

  void addToCart(ProdectModel product) {
    final existing = _box.values.firstWhere(
      (item) => item.id == product.id,
      orElse: () => null as ProdectModel,
    );

    if (existing != null) {
      existing.quantity += 1;
      existing.save();
    } else {
      product.quantity = 1;
      _box.add(product);
    }
    emit(CartLoaded(cartItems: _box.values.toList()));
  }

  void removeFromCart(ProdectModel product) {
    product.delete();
    emit(CartLoaded(cartItems: _box.values.toList()));
  }

  void increaseQuantity(ProdectModel product) {
    product.quantity += 1;
    product.save();
    emit(CartLoaded(cartItems: _box.values.toList()));
  }

  void decreaseQuantity(ProdectModel product) {
    if (product.quantity > 1) {
      product.quantity -= 1;
      product.save();
    } else {
      product.delete();
    }
    emit(CartLoaded(cartItems: _box.values.toList()));
  }

  double get subtotal =>
      _box.values.fold(0, (sum, item) => sum + item.price * item.quantity);

  double get deliveryCost => subtotal > 0 ? 5.0 : 0.0;
  double get discount => subtotal * 0.1;
  double get total => subtotal + deliveryCost - discount;
}
