import 'bloc/onboarding_bloc.dart';
import 'models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:giovane_s_application4/core/app_export.dart';
import 'package:giovane_s_application4/widgets/custom_elevated_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
        create: (context) => OnboardingBloc(
            OnboardingState(onboardingModelObj: OnboardingModel()))
          ..add(OnboardingInitialEvent()),
        child: OnboardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  height: 768.v,
                  width: double.maxFinite,
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgImage3,
                        height: 492.v,
                        width: 375.h,
                        alignment: Alignment.topCenter),
                    _buildTwo(context)
                  ]))));
    });
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 43.v),
            decoration: AppDecoration.gradientBlackToBlack,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 7.v),
                  Container(
                      width: 281.h,
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Text("msg_coffee_so_good".tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.displaySmall)),
                  SizedBox(height: 10.v),
                  Container(
                      width: 250.h,
                      margin: EdgeInsets.symmetric(horizontal: 32.h),
                      child: Text("msg_the_best_grain".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMediumGray50001
                              .copyWith(height: 1.54))),
                  SizedBox(height: 20.v),
                  CustomElevatedButton(
                      text: "lbl_get_started".tr,
                      buttonStyle: CustomButtonStyles.fillPrimary)
                ])));
  }
}
