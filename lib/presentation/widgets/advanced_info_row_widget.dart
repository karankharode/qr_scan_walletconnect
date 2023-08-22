
import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/utils/core_import.dart';

class AdvancedInfoDataRowWidget extends StatelessWidget {
  const AdvancedInfoDataRowWidget(
    this.title,
    this.value, {
    Key? key,
  }) : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.margin20, vertical: Dimens.margin10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 3,
                child: Row(children: [
                  Expanded(
                      child: Text(title, style: AppFont.semiBoldcolorGrey9_12)),
                Container(
                          height: 20,
                        ),
                ])),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 5,
                child: 
                  RichText(
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.ltr,
                      text: TextSpan(children: [
                        TextSpan(text: value, style: AppFont.semiBoldColorBlack2_12),
                       
                      ])),
            ),
          ],
        ),
      );
    });
  }
}
