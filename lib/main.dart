import 'package:ecommerce_app/core/utils/functions/app_router.dart';
import 'package:ecommerce_app/features/authentication/data/repo/auth_repo_impl.dart';
import 'package:ecommerce_app/features/authentication/presentation/manager/auth_cubit/login_cubit_cubit.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/home/data/models/delivery_model/delivery_model.dart';
import 'package:ecommerce_app/features/home/data/models/order_status_model/orders_status_model.dart';
import 'package:ecommerce_app/features/home/data/models/payment_model/payment_detailes_model.dart';
import 'package:ecommerce_app/features/home/data/models/product_model/product_model.dart';
import 'package:ecommerce_app/features/home/presentation/manager/cubit/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manager/cubit/navigation_cubit_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ProdectModelAdapter());
  Hive.registerAdapter(RatingModelAdapter());
  Hive.registerAdapter(PaymentDetailesModelAdapter());
  Hive.registerAdapter(OrderModelAdapter());
  Hive.registerAdapter(DeliveryModelAdapter());
  await Hive.openBox<ProdectModel>('cartBox');

  await Hive.openBox<OrderModel>('ordersBox');

  runApp(ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationCubit()),
        BlocProvider(create: (_) => AuthCubit(repository: AuthRepoImpl())),
        BlocProvider(create: (_) => CartCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
