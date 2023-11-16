import 'bloc/delivery_bloc.dart';
import 'models/delivery_model.dart';
import 'package:flutter/material.dart';
import 'package:giovane_s_application4/core/app_export.dart';
import 'package:giovane_s_application4/widgets/custom_icon_button.dart';
import 'package:giovane_s_application4/widgets/custom_pin_code_text_field.dart';

// ignore_for_file: must_be_immutable
class DeliveryBottomsheet extends StatelessWidget {
  const DeliveryBottomsheet({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<DeliveryBloc>(
      create: (context) => DeliveryBloc(DeliveryState(
        deliveryModelObj: DeliveryModel(),
      ))
        ..add(DeliveryInitialEvent()),
      child: DeliveryBottomsheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.fillOnErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5.v,
            width: 44.h,
            decoration: BoxDecoration(
              color: appTheme.gray200,
              borderRadius: BorderRadius.circular(
                2.h,
              ),
            ),
          ),
          SizedBox(height: 14.v),
          Text(
            "lbl_10_minutes_left".tr,
            style: CustomTextStyles.titleMediumBluegray90002,
          ),
          SizedBox(height: 7.v),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "lbl_delivery_to".tr,
                  style: CustomTextStyles.bodySmallOnError_1,
                ),
                TextSpan(
                  text: "lbl_jl_kpg_sutoyo".tr,
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 18.v),
          BlocSelector<DeliveryBloc, DeliveryState, TextEditingController?>(
            selector: (state) => state.otpController,
            builder: (context, otpController) {
              return CustomPinCodeTextField(
                context: context,
                controller: otpController,
                onChanged: (value) {
                  otpController?.text = value;
                },
              );
            },
          ),
          SizedBox(height: 11.v),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 11.v,
            ),
            decoration: AppDecoration.outlineGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder16,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.v),
                  child: CustomIconButton(
                    height: 62.adaptSize,
                    width: 62.adaptSize,
                    padding: EdgeInsets.all(15.h),
                    decoration: IconButtonStyleHelper.outlineGrayTL12,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgIconBike,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 1.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "msg_delivered_your_order".tr,
                        style: CustomTextStyles.titleSmallBluegray90002,
                      ),
                      SizedBox(height: 7.v),
                      SizedBox(
                        width: 190.h,
                        child: Text(
                          "msg_we_deliver_your".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodySmallOnError.copyWith(
                            height: 1.54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage,
                height: 54.adaptSize,
                width: 54.adaptSize,
                radius: BorderRadius.circular(
                  14.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.h,
                  top: 6.v,
                  bottom: 6.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "lbl_johan_hawn".tr,
                      style: CustomTextStyles.titleSmallBluegray90002,
                    ),
                    SizedBox(height: 7.v),
                    Text(
                      "msg_personal_courier".tr,
                      style: CustomTextStyles.bodySmallOnError,
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomIconButton(
                height: 54.adaptSize,
                width: 54.adaptSize,
                padding: EdgeInsets.all(15.h),
                decoration: IconButtonStyleHelper.outlineGrayTL14,
                child: CustomImageView(
                  imagePath: ImageConstant.imgGroup3157,
                ),
              ),
            ],
          ),
          SizedBox(height: 40.v),
        ],
      ),
    );
  }
}
