import 'package:store_app/core/Api/dio.dart';

import '../helpers/network_info.dart';
import '../helpers/service_locator.dart';

abstract class BaseRepository {
  late NetworkInfo networkInfo;
  late AppDio appDio;

  BaseRepository() {
    networkInfo = getIt.get<NetworkInfo>();
    appDio = getIt.get<AppDio>();
  }
}
