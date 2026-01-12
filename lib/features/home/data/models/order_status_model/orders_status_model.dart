import 'package:ecommerce_app/features/home/data/models/delivery_model/delivery_model.dart';
import 'package:ecommerce_app/features/home/data/models/payment_model/payment_detailes_model.dart';
import 'package:hive/hive.dart';
import '../product_model/product_model.dart';

part 'orders_status_model.g.dart';

@HiveType(typeId: 2)
class OrderModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final PaymentDetailesModel payments;
  @HiveField(2)
  String status;

  @HiveField(3)
  String date;

  @HiveField(4)
  List<ProdectModel> items;

  @HiveField(5)
  final DeliveryModel delivery;

  OrderModel({
    required this.id,
    required this.payments,
    this.date = '20 Aug 2025',
    this.status = 'Preparing',
    this.items = const [],
    required this.delivery,
  });
}
