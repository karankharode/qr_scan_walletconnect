import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/bloc/pairing/pairing_bloc.dart';
import 'package:qr_scan/presentation/utils/core_import.dart';
import 'package:qr_scan/presentation/utils/themes.dart';
import 'package:qr_scan/presentation/widgets/custom_container.dart';
import 'package:qr_scan/presentation/widgets/offer_info_list_widget.dart';

class InfoTabBar extends StatefulWidget {
  const InfoTabBar({Key? key, required this.state}) : super(key: key);

  final PairingState state;

  @override
  State<InfoTabBar> createState() => _InfoTabBarState();
}

class _InfoTabBarState extends State<InfoTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Column(
        children: [
          

          Container(
            decoration: BoxDecoration(
              color: AppColors.colorGrey5,
              borderRadius: BorderRadius.circular(35),
            ),
            width: 160,
            height: 40,
            padding: const EdgeInsets.all(4.0),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  35.0,
                ),
                color: Colors.white,
              ),
              labelPadding: EdgeInsets.zero,
              labelStyle: AppFont.boldColorBlack1.copyWith(fontSize: 12),
              labelColor: Colors.black,
              indicatorColor: AppColors.colorBlack,
              // labelColor: AppColors.colorPrimary,
              unselectedLabelColor: AppColors.colorGrey9,
              tabs: const [
                Tab(text: "Pairing Info"),
                Tab(text: "URI Info"),
              ],
            ),
          ),
          height20,
          SizedBox(
            height: 200,
            child: TabBarView(controller: _tabController, children:  [
              OfferInfoWidgetList(
                 
                  detailsList: {
                    "Topic": widget.state.pairingInfo?.topic??"",
                    "Relay-protocol": widget.state.pairingInfo?.relay.protocol.toString()??"",
                    "Expiry": widget.state.pairingInfo?.expiry.toString()??"",
                    
                  }),
              OfferInfoWidgetList(detailsList: {
                "Topic": widget.state.scannedData?.scannedTopic ?? "",
                "Relay-protocol": widget.state.scannedData?.scannedRelayProtocol ?? "",

              }),
            ]),
          ),


        ],
      ),
    );
  }
}
