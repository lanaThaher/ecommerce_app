import 'package:hive/hive.dart';

part 'delivery_model.g.dart';

@HiveType(typeId: 4)
class DeliveryModel extends HiveObject {
  @HiveField(0)
  final String address;

  @HiveField(1)
  final String street;

  @HiveField(2)
  final int building;

  DeliveryModel({
    required this.address,
    required this.street,
    required this.building,
  });
}
