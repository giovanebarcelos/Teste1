import 'bloc/home_tab_container_bloc.dart';
import 'models/home_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:giovane_s_application4/core/app_export.dart';
import 'package:giovane_s_application4/presentation/home_page/home_page.dart';
import 'package:giovane_s_application4/widgets/app_bar/appbar_subtitle.dart';
import 'package:giovane_s_application4/widgets/app_bar/appbar_title_dropdown.dart';
import 'package:giovane_s_application4/widgets/app_bar/appbar_trailing_image.dart';
import 'package:giovane_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:giovane_s_application4/widgets/custom_elevated_button.dart';
import 'package:giovane_s_application4/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class HomeTabContainerPage extends StatefulWidget {
  const HomeTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  HomeTabContainerPageState createState() => HomeTabContainerPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<HomeTabContainerBloc>(
      create: (context) => HomeTabContainerBloc(HomeTabContainerState(
        homeTabContainerModelObj: HomeTabContainerModel(),
      ))
        ..add(HomeTabContainerInitialEvent()),
      child: HomeTabContainerPage(),
    );
  }
}

class HomeTabContainerPageState extends State<HomeTabContainerPage>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              _buildFrameSeventeen(context),
              SizedBox(height: 24.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTabview(context),
                      _buildTabBarView(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameSeventeen(BuildContext context) {
    return SizedBox(
      height: 300.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.v),
              decoration: AppDecoration.gradientOnPrimaryToBlueGray,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomAppBar(
                    height: 44.v,
                    title: Padding(
                      padding: EdgeInsets.only(left: 30.h),
                      child: Column(
                        children: [
                          AppbarSubtitle(
                            text: "lbl_location".tr,
                            margin: EdgeInsets.only(right: 108.h),
                          ),
                          SizedBox(height: 4.v),
                          BlocSelector<HomeTabContainerBloc,
                              HomeTabContainerState, HomeTabContainerModel?>(
                            selector: (state) => state.homeTabContainerModelObj,
                            builder: (context, homeTabContainerModelObj) {
                              return AppbarTitleDropdown(
                                hintText: "msg_bilzen_tanjungbalai".tr,
                                items: homeTabContainerModelObj
                                        ?.dropdownItemList ??
                                    [],
                                onTap: (value) {
                                  context
                                      .read<Bloc>()
                                      .add(onSelected(value: value));
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      AppbarTrailingImage(
                        imagePath: ImageConstant.imgGroup3147,
                        margin: EdgeInsets.symmetric(horizontal: 30.h),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.h),
                    child: BlocSelector<HomeTabContainerBloc,
                        HomeTabContainerState, TextEditingController?>(
                      selector: (state) => state.searchController,
                      builder: (context, searchController) {
                        return CustomSearchView(
                          controller: searchController,
                          hintText: "lbl_search_coffee".tr,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 84.v),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: appTheme.gray20001,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Container(
                height: 140.v,
                width: 315.h,
                decoration: AppDecoration.fillGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgImage8,
                      height: 140.v,
                      width: 315.h,
                      radius: BorderRadius.circular(
                        16.h,
                      ),
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 23.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomElevatedButton(
                              height: 26.v,
                              width: 60.h,
                              text: "lbl_promo".tr,
                              buttonStyle: CustomButtonStyles.fillRed,
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallOnErrorContainer,
                            ),
                            SizedBox(height: 7.v),
                            SizedBox(
                              height: 80.v,
                              width: 200.h,
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      height: 27.v,
                                      width: 200.h,
                                      margin: EdgeInsets.only(top: 15.v),
                                      decoration: BoxDecoration(
                                        color: theme
                                            .colorScheme.onSecondaryContainer,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      height: 23.v,
                                      width: 149.h,
                                      margin: EdgeInsets.only(bottom: 2.v),
                                      decoration: BoxDecoration(
                                        color: theme
                                            .colorScheme.onSecondaryContainer,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: 192.h,
                                      child: Text(
                                        "msg_buy_one_get_one".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.headlineLarge,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return SizedBox(
      height: 38.v,
      width: 345.h,
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        labelColor: theme.colorScheme.onErrorContainer,
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: theme.colorScheme.errorContainer,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w400,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            12.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl_cappuccino".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_machiato".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_latte".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_americano".tr,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabBarView(BuildContext context) {
    return SizedBox(
      height: 307.v,
      child: TabBarView(
        controller: tabviewController,
        children: [
          HomePage.builder(context),
          HomePage.builder(context),
          HomePage.builder(context),
          HomePage.builder(context),
        ],
      ),
    );
  }
}
