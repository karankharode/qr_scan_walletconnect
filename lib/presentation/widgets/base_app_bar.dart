import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/utils/app_font.dart';

/// The fill color to use for an app bar's [Material].
///
/// If null, then the [AppBarTheme.backgroundColor] is used. If that value is also
/// null, then [AppBar] uses the overall theme's [ColorScheme.primary] if the
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function? mLeftAction;
  final Color? backgroundColor;
  final Color? imageColor;
  final AppBar appBar;
  final List<Widget>? actions;
  final TextStyle? style;

  const BaseAppBar(
      {Key? key,
      required this.title,
      required this.appBar,
      this.imageColor,
      this.backgroundColor,
      this.style,
      this.actions,
      this.mLeftAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.black,
      centerTitle: true,
      title: Text(
        title,
        style: style ?? AppFont.colorWhite_18,
        textAlign: TextAlign.center,
      ),
      elevation: 0,
      actions: actions ?? [],
      //actions: widgets,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
