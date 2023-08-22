part of 'pairing_bloc.dart';

abstract class PairingEvent extends Equatable {}

class WalletInitialised extends PairingEvent {
  @override
  List<Object?> get props => [];
}

class QRScanned extends PairingEvent {
  final String scannedUriString;

  QRScanned({
    required this.scannedUriString,
  });
  @override
  List<Object?> get props => [
        scannedUriString,
      ];
}

class QRPasted extends PairingEvent {
  final String scannedUriString;

  QRPasted({
    required this.scannedUriString,
  });
  @override
  List<Object?> get props => [
        scannedUriString,
      ];
}

class URIPaired extends PairingEvent {

  URIPaired();
  @override
  List<Object?> get props => [
      ];
}
