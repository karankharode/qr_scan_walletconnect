import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_scan/data/locals/scanned_uri.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';

const mockUri =
    "wc:15c0c3d75a3a47d58bc198161a150a08c64bc7b442f5dc700379c5ea2b762792@2?relay-protocol=irn&symKey=61cad7567663a45f188c0ee7fe99b7e8e8d8cccab095d776ea107dc7626451fb";

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => SharedPreferences.setMockInitialValues({}));

  group("PairingBloc", () {
    String scannedString = mockUri;
    ScannedData scannedData = ScannedData.fromUri(mockUri);
    setUp(() {
      scannedString = mockUri;
      scannedData = ScannedData.fromUri(scannedString);
    });

    test("Pairing test", () async {
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
      Uri uri = Uri.parse(mockUri);

      PairingInfo pairingInfo = await web3Wallet.pair(uri: uri);

      debugPrint("pairingInfo.relay.protocol: ${pairingInfo.relay.protocol}");
      debugPrint("scannedData.scannedRelayProtocol: ${scannedData.scannedRelayProtocol}\n");

      debugPrint("pairingInfo.topic: ${pairingInfo.topic}");
      debugPrint("scannedData.scannedTopic: ${scannedData.scannedTopic}");

      expect(pairingInfo.relay.protocol, scannedData.scannedRelayProtocol);
      expect(pairingInfo.topic, scannedData.scannedTopic);
    });
  });
}
