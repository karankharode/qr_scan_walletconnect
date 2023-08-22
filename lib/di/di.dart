import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';
import 'package:qr_scan/di/di.config.dart';
import 'package:path_provider/path_provider.dart' as path;

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  Directory appDocDir = await path.getApplicationDocumentsDirectory();
  await appDocDir.create(recursive: true);

  String projectId = "f08681ad9e0aa66500014b6d5c921cbb";

  final Web3Wallet web3Wallet = await Web3Wallet.createInstance(
    projectId: projectId,
    metadata: const PairingMetadata(
      name: 'QR Scan',
      description: 'Flutter WalletConnect QR Scan',
      url: 'https://walletconnect.com/',
      icons: ['https://walletconnect.com/walletconnect-logo.png'],
    ),
  );
  getIt.registerSingleton<Web3Wallet>(web3Wallet);
  // getIt.registerLazySingleton<WalletRepository>(() => WalletRepository(getIt.get<Web3Wallet>()));
  $initGetIt(getIt);
}
