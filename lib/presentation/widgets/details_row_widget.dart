import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/utils/core_import.dart';
import 'package:qr_scan/presentation/utils/themes.dart';

class DetailsRowWidget extends StatelessWidget {
  DetailsRowWidget({
    Key? key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
  }) : super(key: key);

  final String title;
  final String value;
  TextStyle? titleStyle;
  TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.margin20, vertical: Dimens.margin10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: titleStyle ??
                  AppFont.colorGrey9_12
                      .copyWith(fontWeight: FontWeight.w600)),
          Row(
            children: [
              Text(value ?? "",
                  style: valueStyle ?? AppFont.semiBoldColorBlack2_12),
              if (title == 'URI')
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Image.asset(
                    AppImages.icCopyGrey,
                    height: 15,
                    width: 15,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
