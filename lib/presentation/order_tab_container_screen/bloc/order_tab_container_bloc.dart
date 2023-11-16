import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:giovane_s_application4/presentation/order_tab_container_screen/models/order_tab_container_model.dart';
part 'order_tab_container_event.dart';
part 'order_tab_container_state.dart';

/// A bloc that manages the state of a OrderTabContainer according to the event that is dispatched to it.
class OrderTabContainerBloc
    extends Bloc<OrderTabContainerEvent, OrderTabContainerState> {
  OrderTabContainerBloc(OrderTabContainerState initialState)
      : super(initialState) {
    on<OrderTabContainerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    OrderTabContainerInitialEvent event,
    Emitter<OrderTabContainerState> emit,
  ) async {}
}
