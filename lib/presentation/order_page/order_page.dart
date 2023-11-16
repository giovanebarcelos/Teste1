import 'bloc/order_bloc.dart';
import 'models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:giovane_s_application4/core/app_export.dart';
import 'package:giovane_s_application4/widgets/custom_elevated_button.dart';
import 'package:giovane_s_application4/widgets/custom_icon_button.dart';
import 'package:giovane_s_application4/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class OrderPage extends StatefulWidget {
  const OrderPage({Key? key})
      : super(
          key: key,
        );

  @override
  OrderPageState createState() => OrderPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<OrderBloc>(
      create: (context) => OrderBloc(OrderState(
        orderModelObj: OrderModel(),
      ))
        ..add(OrderInitialEvent()),
      child: OrderPage(),
    );
  }
}

class OrderPageState extends State<OrderPage>
    with AutomaticKeepAliveClientMixin<OrderPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              decoration: AppDecoration.fillOnErrorContainer,
              child: Column(
                children: [
                  SizedBox(height: 24.v),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.h),
                          child: Text(
                            "msg_delivery_address".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.h),
                          child: Text(
                            "lbl_jl_kpg_sutoyo".tr,
                            style: CustomTextStyles.titleSmallBluegray90002,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.h),
                          child: Text(
                            "msg_kpg_sutoyo_no".tr,
                            style: CustomTextStyles.bodySmallOnError,
                          ),
                        ),
                      ),
                      SizedBox(height: 14.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.h),
                          child: Row(
                            children: [
                              _buildEditAddressButton(context),
                              _buildAddNoteButton(context),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.v),
                      Divider(
                        indent: 30.h,
                        endIndent: 30.h,
                      ),
                      SizedBox(height: 19.v),
                      _buildFrameRow(context),
                      SizedBox(height: 20.v),
                      Divider(
                        color: appTheme.gray10001,
                      ),
                      SizedBox(height: 19.v),
                      _buildDiscountAppliedRow(context),
                      SizedBox(height: 20.v),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.h),
                          child: Text(
                            "lbl_payment_summary".tr,
                            style: CustomTextStyles.titleMediumPrimaryContainer,
                          ),
                        ),
                      ),
                      SizedBox(height: 14.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.h),
                        child: _buildTotalPayment(
                          context,
                          totalPayment: "lbl_price".tr,
                          price: "lbl_4_53".tr,
                        ),
                      ),
                      SizedBox(height: 16.v),
                      _buildDeliveryFeeRow(context),
                      SizedBox(height: 14.v),
                      Divider(
                        indent: 30.h,
                        endIndent: 30.h,
                      ),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.h),
                        child: _buildTotalPayment(
                          context,
                          totalPayment: "lbl_total_payment".tr,
                          price: "lbl_5_53".tr,
                        ),
                      ),
                      _buildCashColumn(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildEditAddressButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 120.h,
      text: "lbl_edit_address".tr,
      leftIcon: Container(
        margin: EdgeInsets.only(right: 4.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgIconEdit,
          height: 14.adaptSize,
          width: 14.adaptSize,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAddNoteButton(BuildContext context) {
    return CustomOutlinedButton(
      width: 101.h,
      text: "lbl_add_note".tr,
      margin: EdgeInsets.only(left: 8.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 4.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgIconNote,
          height: 14.adaptSize,
          width: 14.adaptSize,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle170654x54,
            height: 54.adaptSize,
            width: 54.adaptSize,
            radius: BorderRadius.circular(
              12.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 7.v,
              bottom: 7.v,
            ),
            child: Column(
              children: [
                Text(
                  "lbl_cappucino".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 2.v),
                Text(
                  "lbl_with_chocolate".tr,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 13.v),
            child: CustomIconButton(
              height: 28.adaptSize,
              width: 28.adaptSize,
              padding: EdgeInsets.all(6.h),
              decoration: IconButtonStyleHelper.outlineGray,
              child: CustomImageView(
                imagePath: ImageConstant.imgFrame33,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              top: 17.v,
              bottom: 18.v,
            ),
            child: Text(
              "lbl_1".tr,
              style: CustomTextStyles.titleSmallBluegray90001,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              top: 13.v,
              bottom: 13.v,
            ),
            child: CustomIconButton(
              height: 28.adaptSize,
              width: 28.adaptSize,
              padding: EdgeInsets.all(6.h),
              decoration: IconButtonStyleHelper.outlineGray,
              child: CustomImageView(
                imagePath: ImageConstant.imgFrame32,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDiscountIsApplied(BuildContext context) {
    return CustomElevatedButton(
      height: 24.v,
      width: 184.h,
      text: "msg_1_discount_is_applied".tr,
      leftIcon: Container(
        margin: EdgeInsets.only(right: 12.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgIconlyBoldDiscount,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillOnErrorContainer,
      buttonTextStyle: theme.textTheme.titleSmall!,
    );
  }

  /// Section Widget
  Widget _buildDiscountAppliedRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 29.h),
      padding: EdgeInsets.all(15.h),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDiscountIsApplied(context),
          CustomImageView(
            imagePath: ImageConstant.imgIconlyLightArrowBlueGray90001,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDeliveryFeeRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "lbl_delivery_fee".tr,
            style: theme.textTheme.bodyMedium,
          ),
          Spacer(),
          Text(
            "lbl_2_0".tr,
            style: theme.textTheme.bodyMedium!.copyWith(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Text(
              "lbl_1_0".tr,
              style: theme.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCashButton(BuildContext context) {
    return CustomElevatedButton(
      height: 24.v,
      width: 51.h,
      text: "lbl_cash".tr,
      buttonStyle: CustomButtonStyles.fillPrimaryTL12,
      buttonTextStyle: CustomTextStyles.bodySmallOnErrorContainer,
    );
  }

  /// Section Widget
  Widget _buildOrderButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_order".tr,
      buttonStyle: CustomButtonStyles.fillPrimary,
    );
  }

  /// Section Widget
  Widget _buildCashColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 29.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.outlineGrayF.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgVuesaxLinearMoneys,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
                Container(
                  width: 112.h,
                  margin: EdgeInsets.only(left: 12.h),
                  decoration: AppDecoration.fillGray100.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder12,
                  ),
                  child: Row(
                    children: [
                      _buildCashButton(context),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.h,
                          top: 3.v,
                          bottom: 4.v,
                        ),
                        child: Text(
                          "lbl_5_53".tr,
                          style: CustomTextStyles.bodySmallBluegray90001,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgIconDots,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.v),
          _buildOrderButton(context),
          SizedBox(height: 27.v),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildTotalPayment(
    BuildContext context, {
    required String totalPayment,
    required String price,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(
            totalPayment,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.primaryContainer,
            ),
          ),
        ),
        Text(
          price,
          style: theme.textTheme.titleSmall!.copyWith(
            color: theme.colorScheme.primaryContainer,
          ),
        ),
      ],
    );
  }
}
