part of 'pairing_bloc.dart';

class PairingState extends BaseBlocState {
  @override
  final BlocStatusEnum? status;
  final PairingInfo? pairingInfo;
  final bool? pairingInProgress;
  final String? errorMessage;
  final ScannedData? scannedData;

  const PairingState({
    this.status,
    this.pairingInfo,
    this.pairingInProgress,
    this.errorMessage,
    this.scannedData
  }) : super(status);

  PairingState initial() => const PairingState(status: BlocStatusEnum.initial);

  PairingState copyWith({
    final BlocStatusEnum? status,
    final PairingInfo? pairingInfo,
    final bool? pairingInProgress,
    final String? errorMessage,
    final ScannedData? scannedData,
  }) =>
      PairingState(
        status: status ?? this.status,
        pairingInfo: pairingInfo ?? this.pairingInfo,
        pairingInProgress: pairingInProgress ?? this.pairingInProgress,
        errorMessage: errorMessage ?? this.errorMessage,
        scannedData: scannedData ?? this.scannedData,
      );

  @override
  List<Object?> get props => [
        status,
        pairingInfo,
        pairingInProgress,
        errorMessage,
        scannedData
      ];
}
