// ignore_for_file: must_be_immutable

part of 'home_tab_container_bloc.dart';

/// Represents the state of HomeTabContainer in the application.
class HomeTabContainerState extends Equatable {
  HomeTabContainerState({
    this.searchController,
    this.selectedDropDownValue,
    this.homeTabContainerModelObj,
  });

  TextEditingController? searchController;

  SelectionPopupModel? selectedDropDownValue;

  HomeTabContainerModel? homeTabContainerModelObj;

  @override
  List<Object?> get props => [
        searchController,
        selectedDropDownValue,
        homeTabContainerModelObj,
      ];
  HomeTabContainerState copyWith({
    TextEditingController? searchController,
    SelectionPopupModel? selectedDropDownValue,
    HomeTabContainerModel? homeTabContainerModelObj,
  }) {
    return HomeTabContainerState(
      searchController: searchController ?? this.searchController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      homeTabContainerModelObj:
          homeTabContainerModelObj ?? this.homeTabContainerModelObj,
    );
  }
}
