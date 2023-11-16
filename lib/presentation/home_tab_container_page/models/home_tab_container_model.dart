// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:giovane_s_application4/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [home_tab_container_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeTabContainerModel extends Equatable {
  HomeTabContainerModel({this.dropdownItemList = const []}) {}

  List<SelectionPopupModel> dropdownItemList;

  HomeTabContainerModel copyWith(
      {List<SelectionPopupModel>? dropdownItemList}) {
    return HomeTabContainerModel(
      dropdownItemList: dropdownItemList ?? this.dropdownItemList,
    );
  }

  @override
  List<Object?> get props => [dropdownItemList];
}
