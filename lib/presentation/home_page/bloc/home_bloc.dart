import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/cappucino_item_model.dart';
import 'package:giovane_s_application4/presentation/home_page/models/home_model.dart';
part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
        homeModelObj: state.homeModelObj?.copyWith(
      cappucinoItemList: fillCappucinoItemList(),
    )));
  }

  List<CappucinoItemModel> fillCappucinoItemList() {
    return [
      CappucinoItemModel(
          cappucino: ImageConstant.imgRectangle1706,
          name: "Cappucino",
          description: "with Chocolate",
          price: " 4.53"),
      CappucinoItemModel(
          cappucino: ImageConstant.imgRectangle1707,
          name: "Cappucino",
          description: "with Oat Milk",
          price: " 3.90"),
      CappucinoItemModel(
          cappucino: ImageConstant.imgRectangle1706132x141,
          name: "Cappucino",
          description: "with Chocolate",
          price: " 4.53"),
      CappucinoItemModel(
          cappucino: ImageConstant.imgRectangle1707132x142,
          name: "Cappucino",
          description: "with Oat Milk",
          price: " 3.90")
    ];
  }
}
