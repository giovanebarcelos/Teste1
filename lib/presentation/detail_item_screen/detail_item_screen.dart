import '../detail_item_screen/widgets/detailitemchipview_item_widget.dart';
import 'bloc/detail_item_bloc.dart';
import 'models/detail_item_model.dart';
import 'models/detailitemchipview_item_model.dart';
import 'package:flutter/material.dart';
import 'package:giovane_s_application4/core/app_export.dart';
import 'package:giovane_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:giovane_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:giovane_s_application4/widgets/app_bar/appbar_trailing_image.dart';
import 'package:giovane_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:giovane_s_application4/widgets/custom_elevated_button.dart';
import 'package:giovane_s_application4/widgets/custom_icon_button.dart';
import 'package:readmore/readmore.dart';

class DetailItemScreen extends StatelessWidget {
  const DetailItemScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<DetailItemBloc>(
      create: (context) => DetailItemBloc(DetailItemState(
        detailItemModelObj: DetailItemModel(),
      ))
        ..add(DetailItemInitialEvent()),
      child: DetailItemScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 8.v,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle1706,
                height: 226.v,
                width: 315.h,
                radius: BorderRadius.circular(
                  16.h,
                ),
              ),
              SizedBox(height: 20.v),
              _buildDetailItemRow(context),
              SizedBox(height: 17.v),
              Divider(),
              SizedBox(height: 19.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "lbl_description".tr,
                  style: CustomTextStyles.titleMediumPrimaryContainer,
                ),
              ),
              SizedBox(height: 12.v),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 305.h,
                  child: ReadMoreText(
                    "msg_a_cappuccino_is".tr,
                    trimLines: 3,
                    colorClickableText: theme.colorScheme.primary,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "lbl_read_more".tr,
                    moreStyle: CustomTextStyles.bodyMediumGray500.copyWith(
                      height: 1.64,
                    ),
                    lessStyle: CustomTextStyles.bodyMediumGray500.copyWith(
                      height: 1.64,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "lbl_size".tr,
                  style: CustomTextStyles.titleMediumPrimaryContainer,
                ),
              ),
              SizedBox(height: 12.v),
              _buildDetailItemChipView(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBuyNowRow(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 54.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgIconlyLightArrow,
        margin: EdgeInsets.only(
          left: 30.h,
          top: 16.v,
          bottom: 15.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_detail".tr,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIconlyLightHeart,
          margin: EdgeInsets.fromLTRB(30.h, 16.v, 30.h, 15.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildDetailItemRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "lbl_cappucino".tr,
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: 6.v),
            Text(
              "lbl_with_chocolate".tr,
              style: theme.textTheme.bodySmall,
            ),
            SizedBox(height: 13.v),
            Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgFurnituricon,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.only(
                    top: 1.v,
                    bottom: 2.v,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_4_82".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                        TextSpan(
                          text: "lbl_230".tr,
                          style: CustomTextStyles.bodySmallOnError_1,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(
            top: 39.v,
            bottom: 2.v,
          ),
          child: CustomIconButton(
            height: 44.adaptSize,
            width: 44.adaptSize,
            padding: EdgeInsets.all(10.h),
            decoration: IconButtonStyleHelper.fillOnPrimaryContainer,
            child: CustomImageView(
              imagePath: ImageConstant.imgIconBean,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 12.h,
            top: 39.v,
            bottom: 2.v,
          ),
          child: CustomIconButton(
            height: 44.adaptSize,
            width: 44.adaptSize,
            padding: EdgeInsets.all(10.h),
            decoration: IconButtonStyleHelper.fillOnPrimaryContainer,
            child: CustomImageView(
              imagePath: ImageConstant.imgIconMilk,
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildDetailItemChipView(BuildContext context) {
    return BlocSelector<DetailItemBloc, DetailItemState, DetailItemModel?>(
      selector: (state) => state.detailItemModelObj,
      builder: (context, detailItemModelObj) {
        return Wrap(
          runSpacing: 12.v,
          spacing: 12.h,
          children: List<Widget>.generate(
            detailItemModelObj?.detailitemchipviewItemList.length ?? 0,
            (index) {
              DetailitemchipviewItemModel model =
                  detailItemModelObj?.detailitemchipviewItemList[index] ??
                      DetailitemchipviewItemModel();

              return DetailitemchipviewItemWidget(
                model,
                onSelectedChipView: (value) {
                  context.read<DetailItemBloc>().add(
                      UpdateChipViewEvent(index: index, isSelected: value));
                },
              );
            },
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildBuyNowRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 30.h,
        right: 30.h,
        bottom: 43.v,
      ),
      decoration: AppDecoration.outlineGrayF.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 6.v),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_price".tr,
                  style: CustomTextStyles.bodyMediumGray500,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.v),
                  child: Text(
                    "lbl_4_53".tr,
                    style: CustomTextStyles.titleMediumPrimary,
                  ),
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            width: 217.h,
            text: "lbl_buy_now".tr,
            buttonStyle: CustomButtonStyles.fillPrimary,
          ),
        ],
      ),
    );
  }
}
