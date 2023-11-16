import '../../../core/app_export.dart';

/// This class is used in the [cappucino_item_widget] screen.
class CappucinoItemModel {
  CappucinoItemModel({
    this.cappucino,
    this.name,
    this.description,
    this.price,
    this.id,
  }) {
    cappucino = cappucino ?? ImageConstant.imgRectangle1706;
    name = name ?? "Cappucino";
    description = description ?? "with Chocolate";
    price = price ?? " 4.53";
    id = id ?? "";
  }

  String? cappucino;

  String? name;

  String? description;

  String? price;

  String? id;
}
