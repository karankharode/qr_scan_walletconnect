import 'package:equatable/equatable.dart';

enum BlocStatusEnum { initial, loading, success, failure }

abstract class BaseBlocState extends Equatable {
  final BlocStatusEnum? status;

  const BaseBlocState(this.status);

  bool get isInitial => status == BlocStatusEnum.initial;
  bool get isLoading => status == BlocStatusEnum.loading;
  bool get isSuccess => status == BlocStatusEnum.success;
  bool get isFailure => status == BlocStatusEnum.failure;
}
