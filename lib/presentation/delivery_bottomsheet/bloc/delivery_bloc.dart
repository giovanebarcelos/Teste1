import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:giovane_s_application4/presentation/delivery_bottomsheet/models/delivery_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'delivery_event.dart';
part 'delivery_state.dart';

/// A bloc that manages the state of a Delivery according to the event that is dispatched to it.
class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState>
    with CodeAutoFill {
  DeliveryBloc(DeliveryState initialState) : super(initialState) {
    on<DeliveryInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<DeliveryState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  _onInitialize(
    DeliveryInitialEvent event,
    Emitter<DeliveryState> emit,
  ) async {
    emit(state.copyWith(
      otpController: TextEditingController(),
    ));
    listenForCode();
  }
}
