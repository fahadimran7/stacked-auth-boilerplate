import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.router.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class SecondViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  Future<void> logoutUser() async {
    await resetLocator();
    await runBusyFuture(_firebaseAuthenticationService.logout());
    _navigationService.replaceWith(Routes.startupView);
  }

  resetLocator() async {
    await locator.reset(dispose: true);
    setupLocator();
  }
}
