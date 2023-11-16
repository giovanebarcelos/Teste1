// ignore_for_file: must_be_immutable

part of 'detail_item_bloc.dart';

/// Represents the state of DetailItem in the application.
class DetailItemState extends Equatable {
  DetailItemState({this.detailItemModelObj});

  DetailItemModel? detailItemModelObj;

  @override
  List<Object?> get props => [
        detailItemModelObj,
      ];
  DetailItemState copyWith({DetailItemModel? detailItemModelObj}) {
    return DetailItemState(
      detailItemModelObj: detailItemModelObj ?? this.detailItemModelObj,
    );
  }
}
