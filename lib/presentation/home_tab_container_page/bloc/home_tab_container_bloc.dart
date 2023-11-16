import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:giovane_s_application4/presentation/home_tab_container_page/models/home_tab_container_model.dart';
part 'home_tab_container_event.dart';
part 'home_tab_container_state.dart';

/// A bloc that manages the state of a HomeTabContainer according to the event that is dispatched to it.
class HomeTabContainerBloc
    extends Bloc<HomeTabContainerEvent, HomeTabContainerState> {
  HomeTabContainerBloc(HomeTabContainerState initialState)
      : super(initialState) {
    on<HomeTabContainerInitialEvent>(_onInitialize);
    on<onSelected>(_onSelected);
  }

  _onSelected(
    onSelected event,
    Emitter<HomeTabContainerState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  _onInitialize(
    HomeTabContainerInitialEvent event,
    Emitter<HomeTabContainerState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
    emit(state.copyWith(
        homeTabContainerModelObj: state.homeTabContainerModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
    )));
  }
}
