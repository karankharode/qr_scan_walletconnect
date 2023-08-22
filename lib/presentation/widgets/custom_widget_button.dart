import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/utils/app_colors.dart';


class CustomWidgetButton extends StatelessWidget {
  const CustomWidgetButton({
    required this.onPressed,
    this.height,
    this.width,
    required this.borderRadius,
    required this.backgroundColor,
    this.borderColor,
    this.gradient,
    this.splashColor,
    this.child,
  });

  /// The [height] can be use of button height
  final double? height;

  /// The [borderRadius] can be use of button borderRadius
  final double borderRadius;

  final Gradient? gradient;

  /// The [width] can be use of button width
  final double? width;

  /// The [backgroundColor] [borderColor] can be use of button backgroundColor and borderColor
  final Color backgroundColor;
  final Color? borderColor;
  final Color? splashColor;

  /// The [onPressed] can be use of button onPress
  final Function onPressed;
  final Widget? child;

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: gradient ??
              LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  backgroundColor,
                  backgroundColor,
                ],
              ),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor ?? Colors.transparent)),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        splashColor: AppColors.colorWaterBlue,
        onTap: () {
          onPressed();
        },
        child: SizedBox(height: height, width: width, child: child),
      ),
    );
  }
}
