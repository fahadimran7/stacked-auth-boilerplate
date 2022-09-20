import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/create_account/create_account_viewmodel.dart';
import 'package:stacked_architecture/ui/dumb_widgets/authentication_layout.dart';
import 'package:stacked_architecture/ui/shared/styles/ui_helpers.dart';
import 'create_account_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'fullName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class CreateAccountView extends StatelessWidget with $CreateAccountView {
  CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      onDispose: (model) => disposeForm(),
      viewModelBuilder: () => CreateAccountViewModel(),
      builder: (context, model, child) => Scaffold(
        body: AuthenticationLayout(
          title: 'Create Account',
          subtitle: 'Enter your name, email address and password for sign up.',
          mainButtonTitle: 'CONTINUE',
          showTermsText: true,
          isModelBusy: model.isBusy,
          validationMessage: model.validationMessage,
          onMainButtonTapped: model.saveData,
          onBackPressed: model.navigateBack,
          form: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  controller: fullNameController,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  controller: emailController,
                ),
                verticalSpaceSmall,
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  controller: passwordController,
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
