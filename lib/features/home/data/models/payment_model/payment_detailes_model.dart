import 'package:hive/hive.dart';

part 'payment_detailes_model.g.dart';

@HiveType(typeId: 3)
class PaymentDetailesModel extends HiveObject {
  @HiveField(0)
  final double total;

  @HiveField(1)
  final double subTotal;

  @HiveField(2)
  final double deliveryCost;

  @HiveField(3)
  final double discount;

  PaymentDetailesModel({
    required this.discount,
    required this.total,
    required this.subTotal,
    required this.deliveryCost,
  });
}
