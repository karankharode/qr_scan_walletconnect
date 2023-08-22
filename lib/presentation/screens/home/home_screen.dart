import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scan/bloc/pairing/pairing_bloc.dart';
import 'package:qr_scan/presentation/utils/core_import.dart';
import 'package:qr_scan/presentation/utils/themes.dart';
import 'package:qr_scan/presentation/widgets/base_app_bar.dart';
import 'package:qr_scan/presentation/widgets/button_with_loader.dart';
import 'package:qr_scan/presentation/widgets/custom_container.dart';
import 'package:qr_scan/presentation/widgets/custom_widget_button.dart';
import 'package:qr_scan/presentation/widgets/info_tabbar.dart';
import 'package:qr_scan/presentation/widgets/stagger_animated_expanded_list.dart';
import 'package:qr_scan/presentation/widgets/stagger_animated_widget.dart';
import 'package:qr_scan/presentation/widgets/top_status_row_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PairingBloc _pairingBloc;

  @override
  void initState() {
    super.initState();
    _pairingBloc = context.read<PairingBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBack2,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: BlocConsumer<PairingBloc, PairingState>(
          listener: (context, state) {
            if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
              messageSnackBar(context, "error", state.errorMessage!, shouldVibrate: true);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                StaggerAnimatedWidget(children: [
                  BaseAppBar(
                    backgroundColor: Colors.white,
                    appBar: AppBar(),
                    title: "QR Scan",
                    style: AppFont.colorBlack1_16,
                    mLeftAction: () {},
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.colorGrey1,
                  ),
                ]),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: StaggerAnimatedExpandedList(
                      children: [
                        TopStatusRowWidget(
                            status: state.pairingInfo != null ? "Paired" : "Not Paired"),
                        CustomContainer(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 15),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.colorGrey7,
                                        borderRadius: BorderRadius.circular(9)),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.colorWaterBlue17,
                                              borderRadius: BorderRadius.circular(9)),
                                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                          child: Center(
                                            child: Image.asset(
                                              AppImages.icLogoBlue,
                                              height: 35,
                                              width: 35,
                                            ),
                                          ),
                                        ),
                                        // const Spacer(),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 14.0, horizontal: 12),
                                            child: Center(
                                              child: Text(
                                                state.scannedData?.scannedUriString ??
                                                    "Scan or Paste URI",
                                                // overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppFont.semiBold.copyWith(fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // const Spacer(),
                                        InkWell(
                                          onTap: () async {
                                            if (state.scannedData?.scannedUriString == null) {
                                              ClipboardData? clipboardData =
                                                  await Clipboard.getData(Clipboard.kTextPlain);
                                              if (((clipboardData?.text ?? "") != "")) {
                                                _pairingBloc.add(QRPasted(
                                                    scannedUriString: clipboardData?.text ?? ""));
                                                messageSnackBar(
                                                    context, 'success', 'Copied to Clipboard',
                                                    shouldVibrate: true, vibrateStyle: "short");
                                              }
                                            } else {
                                              Clipboard.setData(ClipboardData(
                                                  text: state.scannedData?.scannedUriString ?? ""));

                                              messageSnackBar(
                                                  context, 'success', 'Copied to Clipboard',
                                                  shouldVibrate: true, vibrateStyle: "short");
                                            }
                                          },
                                          child: state.scannedData?.scannedUriString == null
                                              ? const Icon(Icons.paste, size: 16)
                                              : Image.asset(
                                                  AppImages.icCopyGrey,
                                                  height: 16,
                                                  width: 16,
                                                ),
                                        ),
                                        width13
                                      ],
                                    ),
                                  ),
                                ),
                                if (state.scannedData?.scannedUriString != null)
                                  ButtonWithLoader(
                                    isLoading: state.pairingInProgress ?? false,
                                    onTap: () {
                                      if (state.pairingInfo != null) {
                                        _pairingBloc.add(WalletInitialised());
                                      } else {
                                        _pairingBloc.add(URIPaired());
                                      }
                                    },
                                    title: state.pairingInfo != null ? "Reset" : "Pair",
                                  ),
                              ],
                            ),
                          ),
                        ),
                        state.scannedData?.scannedUriString != null
                            ? InfoTabBar(
                              state: state,
                            )
                            : Container(),
                        height100
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomWidgetButton(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.35,
        borderRadius: 100,
        onPressed: () async {
          await Navigator.of(context).pushNamed(Routes.scan);
        },
        backgroundColor: AppColors.colorPrimary,
        child: Container(
          padding: const EdgeInsets.only(left: Dimens.margin24, right: Dimens.margin16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Scan QR',
                style: AppFont.colorWhite_14,
              ),
              width5,
              Image.asset(
                AppImages.icScanner,
                height: Dimens.margin20,
                width: Dimens.margin20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
