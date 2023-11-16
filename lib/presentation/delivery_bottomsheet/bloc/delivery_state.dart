// ignore_for_file: must_be_immutable

part of 'delivery_bloc.dart';

/// Represents the state of Delivery in the application.
class DeliveryState extends Equatable {
  DeliveryState({
    this.otpController,
    this.deliveryModelObj,
  });

  TextEditingController? otpController;

  DeliveryModel? deliveryModelObj;

  @override
  List<Object?> get props => [
        otpController,
        deliveryModelObj,
      ];
  DeliveryState copyWith({
    TextEditingController? otpController,
    DeliveryModel? deliveryModelObj,
  }) {
    return DeliveryState(
      otpController: otpController ?? this.otpController,
      deliveryModelObj: deliveryModelObj ?? this.deliveryModelObj,
    );
  }
}
