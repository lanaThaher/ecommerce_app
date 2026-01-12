import 'package:ecommerce_app/features/authentication/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/register_view.dart';
import 'package:ecommerce_app/features/home/data/models/check_out_model.dart';
import 'package:ecommerce_app/features/home/data/models/delivery_model/delivery_model.dart';
import 'package:ecommerce_app/features/home/data/models/order_status_model/orders_status_model.dart';
import 'package:ecommerce_app/features/home/data/models/payment_model/payment_detailes_model.dart';
import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';
import 'package:ecommerce_app/features/home/presentation/views/bill_info.dart';
import 'package:ecommerce_app/features/home/presentation/views/cart_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/home_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/main_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/order_detailes.dart';
import 'package:ecommerce_app/features/home/presentation/views/orders_status_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/profilr_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/delivery_info.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/pay_ment_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/item_detailes_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/product_builder.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeScreen';
  static const kProfileView = '/profileScreen';
  static const kpaymentView = '/paymentView';
  static const kMainView = '/mainView';
  static const kItemDetailsView = '/itemDetailsView';
  static const kCartView = '/cartView';
  static const kBillInfo = '/billInfoView';
  static const kOrdersStatus = '/orderStatusView';
  static const kOrderDetailes = '/orderDetailes';

  static final router = GoRouter(
    initialLocation: kMainView,
    routes: [
      GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
      GoRoute(path: kRegisterView, builder: (context, state) => RegisterView()),
      GoRoute(path: kHomeView, builder: (context, state) => HomeScreen()),

      GoRoute(path: kMainView, builder: (context, state) => MainView()),
      GoRoute(path: kpaymentView, builder: (context, state) => PayMentView()),

      GoRoute(path: kProfileView, builder: (context, state) => ProfileScreen()),
      GoRoute(
        path: kItemDetailsView,
        builder: (context, state) {
          final product = state.extra as ProdectModel;
          return ItemDetailesView(prodectModel: product);
        },
      ),
      GoRoute(
        path: kCartView,
        builder: (context, state) {
          // final product = state.extra as ProdectModel;
          return CartView();
        },
      ),
      GoRoute(
        path: kBillInfo,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final paymentDetailesModel = extra['payment'] as PaymentDetailesModel;
          final deliveryModel = extra['delivery'] as DeliveryModel;

          return BillInfoView(
            paymentDetailesModel: paymentDetailesModel,
            deliveryModel: deliveryModel,
          );
        },
      ),

      GoRoute(
        path: kOrdersStatus,
        builder: (context, state) {
          return OrdersStatusView();
        },
      ),

      GoRoute(
        path: kOrderDetailes,
        builder: (context, state) {
          final ordersStatusModel = state.extra as OrderModel;
          return OrderDetailes(orderModel: ordersStatusModel);
        },
      ),
    ],
  );
}
