import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles/app_colors.dart';
import 'package:stacked_architecture/ui/shared/styles/styles.dart';
import 'package:stacked_architecture/ui/shared/styles/ui_helpers.dart';
import 'package:stacked_architecture/ui/shared/widgets/app_text.dart';
import 'package:stacked_architecture/ui/shared/widgets/busy_button.dart';

class AuthenticationLayout extends StatelessWidget {
  const AuthenticationLayout(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.mainButtonTitle,
      required this.form,
      this.onCreateAccountTapped,
      required this.showTermsText,
      this.validationMessage,
      this.onMainButtonTapped,
      required this.isModelBusy})
      : super(key: key);
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final String? validationMessage;
  final bool showTermsText;
  final bool isModelBusy;
  final Widget form;
  final void Function()? onCreateAccountTapped;
  final void Function()? onMainButtonTapped;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: kpBodyPaddingHorizontal),
      children: [
        verticalSpaceLarge,
        verticalSpaceMedium,
        AppText.headingOne(title),
        verticalSpaceSmall,
        Row(
          children: [
            SizedBox(
              width: screenWidthPercentage(context, percentage: 0.85),
              child: AppText.body(subtitle),
            ),
          ],
        ),
        verticalSpaceRegular,
        form,
        verticalSpaceMedium,
        if (validationMessage != null)
          AppText.body(
            validationMessage!,
            color: Colors.red,
          ),
        if (validationMessage != null) verticalSpaceRegular,
        BusyButton(
            mainButtonTitle: mainButtonTitle,
            onPressed: onMainButtonTapped,
            busy: isModelBusy),
        if (onCreateAccountTapped != null) verticalSpaceRegular,
        if (onCreateAccountTapped != null)
          _buildCreateAccountRow(onCreateAccountTapped),
        if (showTermsText) verticalSpaceRegular,
        if (showTermsText) _buildTermsText(context)
      ],
    );
  }
}

_buildCreateAccountRow(void Function()? onCreateAccountTapped) {
  return GestureDetector(
    onTap: onCreateAccountTapped,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.bodySmall('Don\'t have account?'),
        horizontalSpaceTiny,
        AppText.bodySmall(
          'Create new account',
          color: primaryBlack,
        ),
      ],
    ),
  );
}

_buildTermsText(BuildContext context) {
  return Center(
    child: SizedBox(
      width: screenWidthPercentage(context, percentage: 0.85),
      child: AppText.body(
        'By Signing up you agree to our Terms Conditions & Privacy Policy.',
        align: TextAlign.center,
      ),
    ),
  );
}
