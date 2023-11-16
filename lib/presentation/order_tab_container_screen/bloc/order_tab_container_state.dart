// ignore_for_file: must_be_immutable

part of 'order_tab_container_bloc.dart';

/// Represents the state of OrderTabContainer in the application.
class OrderTabContainerState extends Equatable {
  OrderTabContainerState({this.orderTabContainerModelObj});

  OrderTabContainerModel? orderTabContainerModelObj;

  @override
  List<Object?> get props => [
        orderTabContainerModelObj,
      ];
  OrderTabContainerState copyWith(
      {OrderTabContainerModel? orderTabContainerModelObj}) {
    return OrderTabContainerState(
      orderTabContainerModelObj:
          orderTabContainerModelObj ?? this.orderTabContainerModelObj,
    );
  }
}
