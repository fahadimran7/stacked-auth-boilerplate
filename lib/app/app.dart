import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/api/firestore_api.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_architecture/ui/create_account/create_account_view.dart';
import 'package:stacked_architecture/ui/login/login_view.dart';
import 'package:stacked_architecture/ui/second/second_view.dart';
import 'package:stacked_architecture/ui/startup/startup_view.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  CupertinoRoute(page: StartupView, initial: true),
  CupertinoRoute(page: SecondView),
  CupertinoRoute(page: LoginView),
  CupertinoRoute(page: CreateAccountView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: UserService),
  LazySingleton(classType: FirestoreApi),
  Singleton(classType: FirebaseAuthenticationService),
], logger: StackedLogger())
class AppSetup {}
