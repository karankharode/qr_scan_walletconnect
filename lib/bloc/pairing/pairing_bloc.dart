import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_scan/data/locals/scanned_uri.dart';
import 'package:qr_scan/data/repositories/wallet_repository.dart';
import 'package:qr_scan/bloc/base_state.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';

part 'pairing_event.dart';
part 'pairing_state.dart';

class PairingBloc extends Bloc<PairingEvent, PairingState> {
  final WalletRepository _walletRepository;

  PairingBloc(this._walletRepository) : super(const PairingState().initial()) {
    on<WalletInitialised>(_onWalletInitialised);
    on<QRPasted>(_onQRPasted);
    on<QRScanned>(_onQRScanned);
    on<URIPaired>(_onURIPaired);
  }

  Future<void> _onWalletInitialised(WalletInitialised event, Emitter<PairingState> emit) async {
    emit(state.initial());
  }

  Future<void> _onQRPasted(QRPasted event, Emitter<PairingState> emit) async {
    String scannedString = event.scannedUriString;

    // check if uri string is not empty
    if (scannedString != "") {
      // parse the uri string
      ScannedData scannedData = ScannedData.fromUri(scannedString);

      emit(state.copyWith(scannedData: scannedData));
    } else {
      emit(state.copyWith(errorMessage: "Invalid Data!"));
      emit(state.copyWith(errorMessage: ""));
    }
  }

  Future<void> _onQRScanned(QRScanned event, Emitter<PairingState> emit) async {
    String scannedString = event.scannedUriString;
    // check if uri string is not empty
    if (scannedString != "") {
      // parse the uri string
      ScannedData scannedData = ScannedData.fromUri(scannedString);

      emit(state.copyWith(scannedData: scannedData));
      add(URIPaired());
    } else {
      // TODO: throw error message
      emit(state.copyWith(errorMessage: "Invalid Data!"));
      emit(state.copyWith(errorMessage: ""));
    }
  }

  Future<void> _onURIPaired(URIPaired event, Emitter<PairingState> emit) async {
    emit(state.copyWith(pairingInProgress: true));
    try {
      // create pairing
      PairingInfo pairingInfo = await _walletRepository.walletconnectPair(state.scannedData?.scannedUriString??"");
      emit(state.copyWith(pairingInfo: pairingInfo, pairingInProgress: false));
    } catch (e) {
      // TODO: throw error message
      add(WalletInitialised());
      emit(state.copyWith(
        errorMessage: "Something went wrong!",
      ));
      emit(state.copyWith(errorMessage: ""));
    }
  }
}
