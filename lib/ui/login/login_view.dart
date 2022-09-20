import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/dumb_widgets/authentication_layout.dart';
import 'package:stacked_architecture/ui/login/login_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/styles/ui_helpers.dart';
import 'package:stacked_architecture/ui/shared/widgets/input_field.dart';
import 'login_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      onDispose: (model) => disposeForm(),
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: AuthenticationLayout(
          title: 'Welcome Back',
          subtitle: 'Enter your email address and password to sign in.',
          mainButtonTitle: 'SIGN IN',
          showTermsText: false,
          validationMessage: model.validationMessage,
          onCreateAccountTapped: model.navigateToCreateAccount,
          onMainButtonTapped: model.saveData,
          isModelBusy: model.isBusy,
          onSignInWithGoogle: model.useGoogleAuthentication,
          form: Form(
            child: Column(
              children: [
                InputField(
                  controller: emailController,
                  label: 'Email',
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  isPassword: false,
                ),
                verticalSpaceRegular,
                InputField(
                  controller: passwordController,
                  label: 'Password',
                  hint: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
