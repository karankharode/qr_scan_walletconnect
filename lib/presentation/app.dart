import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_scan/data/repositories/wallet_repository.dart';
import 'package:qr_scan/di/di.dart';
import 'package:qr_scan/bloc/pairing/pairing_bloc.dart';
import 'package:qr_scan/presentation/utils/core_import.dart';
import 'package:qr_scan/presentation/utils/navigator_key.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PairingBloc(
            getIt.get<WalletRepository>()
          )..add(WalletInitialised()),
        ),],
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          fontFamily: GoogleFonts.nunito().fontFamily,
        ),
        initialRoute: Routes.splashScreen,
        navigatorKey: NavigatorKey.navigatorKey,
        onGenerateRoute: getIt.get<Routes>().onGenerate,
      ),
    );
  }
}
