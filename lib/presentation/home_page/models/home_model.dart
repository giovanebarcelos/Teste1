// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'cappucino_item_model.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel extends Equatable {
  HomeModel({this.cappucinoItemList = const []}) {}

  List<CappucinoItemModel> cappucinoItemList;

  HomeModel copyWith({List<CappucinoItemModel>? cappucinoItemList}) {
    return HomeModel(
      cappucinoItemList: cappucinoItemList ?? this.cappucinoItemList,
    );
  }

  @override
  List<Object?> get props => [cappucinoItemList];
}
