import '../home_page/widgets/cappucino_item_widget.dart';
import 'bloc/home_bloc.dart';
import 'models/cappucino_item_model.dart';
import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:giovane_s_application4/core/app_export.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  HomePageState createState() => HomePageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(
        homeModelObj: HomeModel(),
      ))
        ..add(HomeInitialEvent()),
      child: HomePage(),
    );
  }
}

class HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              SizedBox(height: 24.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: BlocSelector<HomeBloc, HomeState, HomeModel?>(
                  selector: (state) => state.homeModelObj,
                  builder: (context, homeModelObj) {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 240.v,
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.h,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: homeModelObj?.cappucinoItemList.length ?? 0,
                      itemBuilder: (context, index) {
                        CappucinoItemModel model =
                            homeModelObj?.cappucinoItemList[index] ??
                                CappucinoItemModel();
                        return CappucinoItemWidget(
                          model,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
