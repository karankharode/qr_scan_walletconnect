// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart' as _i5;

import '../data/repositories/wallet_repository.dart' as _i4;
import '../router.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.Routes>(() => _i3.Routes());
  gh.lazySingleton<_i4.WalletRepository>(
      () => _i4.WalletRepository(get<_i5.Web3Wallet>()));
  return get;
}
