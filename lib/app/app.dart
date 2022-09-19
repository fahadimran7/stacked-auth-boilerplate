import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/create_account/create_account_view.dart';
import 'package:stacked_architecture/ui/login/login_view.dart';
import 'package:stacked_architecture/ui/second/second_view.dart';
import 'package:stacked_architecture/ui/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  CupertinoRoute(page: StartupView),
  CupertinoRoute(page: SecondView),
  CupertinoRoute(page: LoginView, initial: true),
  CupertinoRoute(page: CreateAccountView),
], dependencies: [
  LazySingleton(classType: NavigationService)
])
class AppSetup {}
