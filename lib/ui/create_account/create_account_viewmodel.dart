import 'package:stacked_architecture/ui/base/authentication_viewmodel.dart';
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';

class CreateAccountViewModel extends AuthenticationViewModel {
  CreateAccountViewModel({required super.successRoute});

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() {
    throw UnimplementedError();
  }
}
