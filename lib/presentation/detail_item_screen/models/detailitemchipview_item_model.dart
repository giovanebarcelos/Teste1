// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [detailitemchipview_item_widget] screen.
class DetailitemchipviewItemModel extends Equatable {
  DetailitemchipviewItemModel({
    this.s,
    this.isSelected,
  }) {
    s = s ?? "S";
    isSelected = isSelected ?? false;
  }

  String? s;

  bool? isSelected;

  DetailitemchipviewItemModel copyWith({
    String? s,
    bool? isSelected,
  }) {
    return DetailitemchipviewItemModel(
      s: s ?? this.s,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [s, isSelected];
}
