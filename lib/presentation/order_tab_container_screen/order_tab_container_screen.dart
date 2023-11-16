import 'bloc/order_tab_container_bloc.dart';
import 'models/order_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:giovane_s_application4/core/app_export.dart';
import 'package:giovane_s_application4/presentation/order_page/order_page.dart';
import 'package:giovane_s_application4/widgets/app_bar/appbar_leading_image.dart';
import 'package:giovane_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:giovane_s_application4/widgets/app_bar/custom_app_bar.dart';

class OrderTabContainerScreen extends StatefulWidget {
  const OrderTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OrderTabContainerScreenState createState() => OrderTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return BlocProvider<OrderTabContainerBloc>(
      create: (context) => OrderTabContainerBloc(OrderTabContainerState(
        orderTabContainerModelObj: OrderTabContainerModel(),
      ))
        ..add(OrderTabContainerInitialEvent()),
      child: OrderTabContainerScreen(),
    );
  }
}

class OrderTabContainerScreenState extends State<OrderTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<OrderTabContainerBloc, OrderTabContainerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 8.v),
                  _buildTabview(context),
                  SizedBox(
                    height: 655.v,
                    child: TabBarView(
                      controller: tabviewController,
                      children: [
                        OrderPage.builder(context),
                        OrderPage.builder(context),
                      ],
                    ),
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
        text: "lbl_order".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 48.v,
      width: 315.h,
      decoration: BoxDecoration(
        color: appTheme.gray10002,
        borderRadius: BorderRadius.circular(
          14.h,
        ),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: theme.colorScheme.primaryContainer,
        labelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelColor: theme.colorScheme.onErrorContainer,
        unselectedLabelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w600,
        ),
        indicatorPadding: EdgeInsets.all(
          4.0.h,
        ),
        indicator: BoxDecoration(
          color: appTheme.gray10002,
          borderRadius: BorderRadius.circular(
            20.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl_deliver".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_pick_up".tr,
            ),
          ),
        ],
      ),
    );
  }
}
