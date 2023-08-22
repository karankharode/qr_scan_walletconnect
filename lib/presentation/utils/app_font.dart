import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_scan/presentation/utils/core_import.dart';

/// Used by [AppFont] of app and web
class AppFont {
  static final regular =
      GoogleFonts.nunito(fontWeight: FontWeight.w400, color: AppColors.colorBlack);
  static final regularNotBlack = GoogleFonts.nunito();
  static final bold = GoogleFonts.nunito(fontWeight: FontWeight.w700, color: AppColors.colorBlack);
  static final semiBold =
      GoogleFonts.nunito(fontWeight: FontWeight.w600, color: AppColors.colorBlack);
  static final mediumBold =
      GoogleFonts.nunito(fontWeight: FontWeight.w500, color: AppColors.colorBlack);

  TextStyle mediumTextStyle = GoogleFonts.nunito(fontSize: 17, letterSpacing: 0.5);

  ///-------REGULAR-------------

  ///colorWhite
  static final colorWhite = regular.copyWith(color: AppColors.colorWhite);
  static final colorWhite_13 = colorWhite.copyWith(fontSize: Dimens.textSize13);
  static final colorWhite_14 = colorWhite.copyWith(fontSize: Dimens.textSize14);
  static final colorWhite_16 = colorWhite.copyWith(fontSize: Dimens.textSize16);
  static final colorWhite_18 = colorWhite.copyWith(fontSize: Dimens.textSize18);

  ///colorGrey
  static final colorGrey = regular.copyWith(color: AppColors.colorGrey);
  static final colorGrey_14 = colorGrey.copyWith(fontSize: Dimens.textSize14);
  static final colorGrey_16 = colorGrey.copyWith(fontSize: Dimens.textSize16);

  ///colorBlack1
  static final colorBlack = regular.copyWith(color: AppColors.colorBlack);
  static final colorBlack1_16 = regular.copyWith(color: AppColors.colorBlack1, fontSize: 16);
  static final colorBlack_12 = colorBlack.copyWith(fontSize: Dimens.textSize12);
  static final colorBlack_16 = colorBlack.copyWith(fontSize: Dimens.textSize16);

  ///boldColorWhite
  static final boldColorWhite = bold.copyWith(color: AppColors.colorWhite);

  ///bold
  static final boldColorBlack1 = bold.copyWith(color: AppColors.colorBlack1);

  static final colorWhiteMedium_17 =
      colorWhite.copyWith(fontSize: Dimens.textSize17, letterSpacing: 0.5);

  static final colorGrey9 = regular.copyWith(color: AppColors.colorGrey9);

  ///semiBoldColorBlack2
  static final semiBoldColorBlack2 = semiBold.copyWith(color: AppColors.colorBlack2);
  static final semiBoldColorBlack2_12 =
      semiBoldColorBlack2.copyWith(fontSize: Dimens.textSize12, fontWeight: FontWeight.w500);

  static final colorGrey9_14 = colorGrey9.copyWith(fontSize: Dimens.textSize14);
  static final semiBoldcolorGrey9_12 =
      colorGrey9.copyWith(fontSize: Dimens.textSize12, fontWeight: FontWeight.w600);
  static final colorGrey9_12 = colorGrey9.copyWith(fontSize: Dimens.textSize12);
}
