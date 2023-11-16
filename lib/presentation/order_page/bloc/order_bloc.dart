import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:giovane_s_application4/presentation/order_page/models/order_model.dart';
part 'order_event.dart';
part 'order_state.dart';

/// A bloc that manages the state of a Order according to the event that is dispatched to it.
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(OrderState initialState) : super(initialState) {
    on<OrderInitialEvent>(_onInitialize);
  }

  _onInitialize(
    OrderInitialEvent event,
    Emitter<OrderState> emit,
  ) async {}
}
