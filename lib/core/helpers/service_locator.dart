import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/core/Api/dio.dart';
import 'package:store_app/features/home/data/datasources/products_data_source.dart';
import 'package:store_app/features/home/data/repositories/products_imply_repo.dart';
import 'package:store_app/features/home/domain/repositories/products_contract_repo.dart';
import 'package:store_app/features/home/domain/usecases/products_use_case.dart';
import '../utilies/app_preferences.dart';
import 'network_info.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    /// Initialize AppDio
    AppDio dio = AppDio();
    dio.init();
    getIt.registerLazySingleton<AppDio>(() => dio);

    /// Register PackageInfo
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    getIt.registerLazySingleton<PackageInfo>(() => packageInfo);

    /// Register SharedPreferences
    final sharedPrefs = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

    /// Register AppPreferences
    getIt.registerLazySingleton<AppPreferences>(
      () => AppPreferences(sharedPrefs),
    );

    /// Network info
    getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

    /// Network Connection checker
    getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker(),
    );

    /// Register InternetConnectionChecker or others here as needed
    getIt.registerLazySingleton<ProductsContractRepo>(
      () => ProductsImplRepo(dataSource: getIt.get<ProductsDataSource>()),
    );
    getIt.registerLazySingleton<ProductsUseCase>(
      () => ProductsUseCase(contractRepo: getIt.get<ProductsContractRepo>()),
    );
    getIt.registerLazySingleton<ProductsDataSource>(() => ProductsDataSource());
  }
}
