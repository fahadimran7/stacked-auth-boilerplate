import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/app/app.logger.dart';
import 'package:stacked_architecture/exceptions/firebase_api_exception.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final log = getLogger('AuthenticationViewModel');

  final navigationService = locator<NavigationService>();
  final userService = locator<UserService>();
  final _authenticationService = locator<FirebaseAuthenticationService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future saveData() async {
    log.i('value: $formValueMap');

    // Hide keyboard
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    try {
      final result = await runBusyFuture(
        runAuthentication(),
        throwException: true,
      );

      await _handleAuthenticationResponse(result);
    } on FirestoreApiException catch (e) {
      log.e(e.toString());
      setValidationMessage(e.toString());
    } catch (e) {
      log.e(e.toString());
      setValidationMessage('Authentication failure. Please try again.');
      notifyListeners();
    }
  }

  Future<void> useGoogleAuthentication() async {
    final result = await _authenticationService.signInWithGoogle();
    await _handleAuthenticationResponse(result);
  }

  Future<FirebaseAuthenticationResult> runAuthentication();

  Future<void> _handleAuthenticationResponse(
      FirebaseAuthenticationResult authResult) async {
    log.v('authResult has error: ${authResult.hasError}');

    if (!authResult.hasError && authResult.user != null) {
      final user = authResult.user;

      await userService.syncOrCreateUserAccount(
        user: User(id: user!.uid, email: user.email),
      );

      navigationService.replaceWith(successRoute);
    } else {
      if (authResult.hasError == false && authResult.user == null) {
        log.wtf(
          'We have no error but the user returned from firebase is null. This should not be happening.',
        );
      }

      log.w('Authentication failed: ${authResult.errorMessage}');

      setValidationMessage(authResult.errorMessage);
      notifyListeners();
    }
  }
}
