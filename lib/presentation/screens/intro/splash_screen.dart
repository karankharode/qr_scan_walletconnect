import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/utils/core_import.dart';
import 'package:qr_scan/presentation/widgets/stagger_animated_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    gotoNextScreen();
  }

  

  gotoNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 300));
    Navigator.of(context)
        .pushReplacementNamed(Routes.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: StaggerAnimatedWidget(animation: "Scale", children: [
          Center(
            child: AvatarGlow(
              endRadius: 100,
              curve: Curves.decelerate,
              glowColor: Colors.blue[50]!,
              child: const Image(
                color: Colors.white,
                image: AssetImage(
                  AppImages.icSplashLogo,
                ),
                height: 90,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
