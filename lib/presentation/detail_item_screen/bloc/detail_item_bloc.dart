import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/detailitemchipview_item_model.dart';
import 'package:giovane_s_application4/presentation/detail_item_screen/models/detail_item_model.dart';
part 'detail_item_event.dart';
part 'detail_item_state.dart';

/// A bloc that manages the state of a DetailItem according to the event that is dispatched to it.
class DetailItemBloc extends Bloc<DetailItemEvent, DetailItemState> {
  DetailItemBloc(DetailItemState initialState) : super(initialState) {
    on<DetailItemInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
  }

  _onInitialize(
    DetailItemInitialEvent event,
    Emitter<DetailItemState> emit,
  ) async {
    emit(state.copyWith(
        detailItemModelObj: state.detailItemModelObj?.copyWith(
      detailitemchipviewItemList: fillDetailitemchipviewItemList(),
    )));
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<DetailItemState> emit,
  ) {
    List<DetailitemchipviewItemModel> newList =
        List<DetailitemchipviewItemModel>.from(
            state.detailItemModelObj!.detailitemchipviewItemList);
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );
    emit(state.copyWith(
        detailItemModelObj: state.detailItemModelObj
            ?.copyWith(detailitemchipviewItemList: newList)));
  }

  List<DetailitemchipviewItemModel> fillDetailitemchipviewItemList() {
    return List.generate(3, (index) => DetailitemchipviewItemModel());
  }
}
