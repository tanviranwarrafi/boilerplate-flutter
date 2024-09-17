import 'package:app/helpers/dimension_helper.dart';
import 'package:app/helpers/file_helper.dart';
import 'package:app/helpers/filter_helper.dart';
import 'package:app/interfaces/api_interceptor.dart';
import 'package:app/interfaces/http_module.dart';
import 'package:app/libraries/app_updater.dart';
import 'package:app/libraries/file_compressor.dart';
import 'package:app/libraries/flush_popup.dart';
import 'package:app/libraries/formatters.dart';
import 'package:app/libraries/image_croppers.dart';
import 'package:app/libraries/image_pickers.dart';
import 'package:app/libraries/launchers.dart';
import 'package:app/libraries/local_storage.dart';
import 'package:app/libraries/toasts_popups.dart';
import 'package:app/repositories/auth_repo.dart';
import 'package:app/services/auth_service.dart';
import 'package:app/services/image_service.dart';
import 'package:app/services/routes.dart';
import 'package:app/services/storage_service.dart';
import 'package:app/services/validators.dart';
import 'package:app/utils/reg_exps.dart';
import 'package:app/utils/transitions.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Helpers
  sl.registerLazySingleton<DimensionHelper>(DimensionHelper.new);
  sl.registerLazySingleton<FileHelper>(FileHelper.new);
  sl.registerLazySingleton<FilterHelper>(FilterHelper.new);

  /// Interceptors
  sl.registerLazySingleton<ApiInterceptor>(HttpModule.new);
  sl.registerLazySingleton<HttpModule>(HttpModule.new);

  /// Libraries
  sl.registerLazySingleton<AppUpdater>(AppUpdater.new);
  sl.registerLazySingleton<FileCompressor>(FileCompressor.new);
  sl.registerLazySingleton<FlushPopup>(FlushPopup.new);
  sl.registerLazySingleton<Formatters>(Formatters.new);
  sl.registerLazySingleton<ImageCroppers>(ImageCroppers.new);
  sl.registerLazySingleton<ImagePickers>(ImagePickers.new);
  sl.registerLazySingleton<Launchers>(Launchers.new);
  sl.registerLazySingleton<LocalStorage>(LocalStorage.new);
  sl.registerLazySingleton<ToastPopup>(ToastPopup.new);

  /// Repositories
  sl.registerLazySingleton<AuthRepository>(AuthRepository.new);

  /// Services
  // Always Active Services
  sl.registerFactory(Routes.new);
  // Lazy Services
  sl.registerLazySingleton<AuthService>(AuthService.new);
  sl.registerLazySingleton<ImageService>(ImageService.new);
  sl.registerLazySingleton<StorageService>(StorageService.new);
  sl.registerLazySingleton<Validators>(Validators.new);

  /// Utils
  sl.registerLazySingleton<RegExps>(RegExps.new);
  sl.registerLazySingleton<Transitions>(Transitions.new);
}
