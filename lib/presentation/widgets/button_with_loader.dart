import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qr_scan/presentation/utils/core_import.dart';

class ButtonWithLoader extends StatelessWidget {
  ButtonWithLoader(
      {Key? key,
      required this.onTap,
      this.isLoading = false,
      required this.title,
      this.textFont,
      this.buttonColor})
      : super(key: key);

  final Function onTap;
  final bool isLoading;
  final String title;
  TextStyle? textFont = AppFont.boldColorWhite.copyWith(fontSize: 16);
  Color? buttonColor = AppColors.colorPrimary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Dimens.margin15,
      ),
      child: MaterialButton(
        onPressed: isLoading
            ? () {}
            : () {
                onTap();
              },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.margin9),
        ),
        color: buttonColor ?? AppColors.colorPrimary,
        height: Dimens.margin55,
        minWidth: double.infinity,
        elevation: 0,
        child: isLoading
            ? const Center(child: SpinKitThreeBounce(color: AppColors.colorWhite, size: 18))
            : Text(
                title,
                style: textFont ?? AppFont.boldColorWhite.copyWith(fontSize: 16),
              ),
      ),
    );
  }
}
