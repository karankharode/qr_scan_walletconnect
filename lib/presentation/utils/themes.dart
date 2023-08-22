//import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_scan/presentation/utils/core_import.dart';

/// Sizedboxes
SizedBox width5 = const SizedBox(width: 5);
SizedBox height5 = const SizedBox(height: 5);

SizedBox width10 = const SizedBox(width: 10);
SizedBox width13 = const SizedBox(width: 13);
SizedBox height10 = const SizedBox(height: 10);
SizedBox height32 = const SizedBox(height: 32);

SizedBox width15 = const SizedBox(width: 15);
SizedBox height15 = const SizedBox(height: 15);

SizedBox width20 = const SizedBox(width: 20);
SizedBox height20 = const SizedBox(height: 20);

SizedBox width25 = const SizedBox(width: 25);
SizedBox height25 = const SizedBox(height: 25);

SizedBox width30 = const SizedBox(width: 30);
SizedBox width45 = const SizedBox(width: 45);
SizedBox height30 = const SizedBox(height: 30);
SizedBox height12 = const SizedBox(height: 12);
SizedBox height16 = const SizedBox(height: 16);
SizedBox height22 = const SizedBox(height: 22);
SizedBox height24 = const SizedBox(height: 24);
SizedBox height35 = const SizedBox(height: 35);
SizedBox height40 = const SizedBox(height: 40);
SizedBox height50 = const SizedBox(height: 50);
SizedBox height60 = const SizedBox(height: 60);
SizedBox height80 = const SizedBox(height: 80);
SizedBox height100 = const SizedBox(height: 100);

void vibrate([String? type]) async {
  bool canVibrate = await Vibrate.canVibrate;
  if (canVibrate) {
    //Vibrate.vibrate();

    FeedbackType type0;

    switch (type) {
      case "short":
        type0 = FeedbackType.heavy;
        break;

      case "long":
        type0 = FeedbackType.error;
        break;

      default:
        type0 = FeedbackType.warning;
        break;
    }

    Vibrate.feedback(type0);

    // final Iterable<Duration> pauses = [
    //   Duration(milliseconds: 100),
    //   Duration(milliseconds: 100),
    //   Duration(milliseconds: 100),
    // ];
    // Vibrate.vibrateWithPauses(pauses);
  }
}

messageSnackBar(
  BuildContext context,
  String messageType,
  String title, {
  bool shouldVibrate = false,
  String vibrateStyle = "",
}) async {
  if (shouldVibrate && !kIsWeb) vibrate(vibrateStyle);

  FToast fToast = FToast();
  fToast.init(context);

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: AppColors.colorBlack1,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(3),
          child: const Image(
            color: AppColors.colorPrimary,
            image: AssetImage(
              AppImages.icLogoBlue,
            ),
            height: 15,
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Text(
            title,
            style: AppFont.colorWhiteMedium_17,
            maxLines: null,
          ),
        ),
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 2),
  );
}
