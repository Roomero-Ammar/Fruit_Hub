import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()),
  );

  // // Alternatively you could write it if you don't like global variables
  //   GetIt.I.registerSingleton<AppModel>(AppModel());
}
