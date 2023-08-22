import 'package:injectable/injectable.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';

@LazySingleton()
class WalletRepository {
  final Web3Wallet _web3Wallet;
  static const String projectId = "f08681ad9e0aa66500014b6d5c921cbb";

  WalletRepository(this._web3Wallet);

  Future<PairingInfo> walletconnectPair(String uriString) async {
    Uri uri = Uri.parse(uriString);
    try{

    PairingInfo pairingInfo = await _web3Wallet.pair(uri: uri);
    return pairingInfo;
    }catch(e){
      rethrow;
    }
  }
}
