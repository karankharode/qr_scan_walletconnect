import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/widgets/advanced_info_row_widget.dart';

class OfferInfoWidgetList extends StatelessWidget {
  const OfferInfoWidgetList({
    Key? key,
    required this.detailsList,
  }) : super(key: key);
  final Map detailsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...detailsList.entries.map(
          (e) => AdvancedInfoDataRowWidget( e.key,  e.value),
        ),
      ],
    );
  }
}
