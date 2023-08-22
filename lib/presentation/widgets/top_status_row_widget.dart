
import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/utils/core_import.dart';
import 'package:qr_scan/presentation/widgets/custom_container.dart';
import 'package:qr_scan/presentation/widgets/details_row_widget.dart';

class TopStatusRowWidget extends StatelessWidget {
  const TopStatusRowWidget(
      {Key? key,
      required this.status,})
      : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    final statusText = status;
    return CustomContainer(
      padding: const EdgeInsets.symmetric(
          vertical: Dimens.margin15, horizontal: Dimens.margin0),
      child: Column(
        children: [
          DetailsRowWidget(
            title: "Status",
            value: statusText,
            titleStyle: AppFont.colorGrey9_14.copyWith(
                color: AppColors.colorBlack3, fontWeight: FontWeight.w600),
            valueStyle: AppFont.colorGrey9_14
                .copyWith(
                  color: status=="Paired"?AppColors.colorTypeBadgeGreen:AppColors.colorGrey9,
                  fontWeight: FontWeight.w600),
          ),
        
        ],
      ),
    );
  }
}
