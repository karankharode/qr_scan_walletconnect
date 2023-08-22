import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/utils/core_import.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.decoration,
  }) : super(key: key);
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration ??
          BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorWhite,
            boxShadow: [
              BoxShadow(
                color: AppColors.colorBlack.withOpacity(0.03),
                spreadRadius: 0,
                blurRadius: 13,
                offset: const Offset(5, 7), // changes position of shadow
              ),
            ],
          ),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
      margin:
          margin ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      child: child,
    );
  }
}
