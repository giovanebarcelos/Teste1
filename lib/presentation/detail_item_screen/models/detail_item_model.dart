// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'detailitemchipview_item_model.dart';

/// This class defines the variables used in the [detail_item_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DetailItemModel extends Equatable {
  DetailItemModel({this.detailitemchipviewItemList = const []}) {}

  List<DetailitemchipviewItemModel> detailitemchipviewItemList;

  DetailItemModel copyWith(
      {List<DetailitemchipviewItemModel>? detailitemchipviewItemList}) {
    return DetailItemModel(
      detailitemchipviewItemList:
          detailitemchipviewItemList ?? this.detailitemchipviewItemList,
    );
  }

  @override
  List<Object?> get props => [detailitemchipviewItemList];
}
