import '../models/detailitemchipview_item_model.dart';
import 'package:flutter/material.dart';
import 'package:giovane_s_application4/core/app_export.dart';

// ignore: must_be_immutable
class DetailitemchipviewItemWidget extends StatelessWidget {
  DetailitemchipviewItemWidget(
    this.detailitemchipviewItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  DetailitemchipviewItemModel detailitemchipviewItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 12.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        detailitemchipviewItemModelObj.s!,
        style: TextStyle(
          color: (detailitemchipviewItemModelObj.isSelected ?? false)
              ? theme.colorScheme.primary
              : appTheme.blueGray90001,
          fontSize: 14.fSize,
          fontFamily: 'Sora',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: (detailitemchipviewItemModelObj.isSelected ?? false),
      backgroundColor: theme.colorScheme.onErrorContainer,
      selectedColor: appTheme.red50,
      shape: (detailitemchipviewItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide(
                color: theme.colorScheme.primary,
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(
                12.h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide(
                color: appTheme.gray30001,
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(
                12.h,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}
