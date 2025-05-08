import 'package:get_it/get_it.dart';
import 'package:haven/haven/features/auth/data/local/data_sources/auth_data_source.dart';

import '../core/services/firebase_service.dart';

final getIt = GetIt.instance;

void setupDIService() {
  // Register your classes here
  getIt.registerSingleton<AuthDataSource>(AuthDataSourceFirebase());
  getIt.registerSingleton(FirebaseService());
}
