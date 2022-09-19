import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles/styles.dart';
import 'package:stacked_architecture/ui/shared/styles/ui_helpers.dart';
import 'package:stacked_architecture/ui/shared/widgets/busy_button.dart';

class AuthenticationLayout extends StatelessWidget {
  const AuthenticationLayout(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.mainButtonTitle,
      required this.form,
      this.onCreateAccountTapped,
      required this.showTermsText})
      : super(key: key);
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final bool showTermsText;
  final Widget form;
  final void Function()? onCreateAccountTapped;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: kpBodyPaddingHorizontal),
      children: [
        verticalSpaceExtraLarge,
        Text(
          title,
          style: const TextStyle(
            fontSize: kfsH1Title,
            fontWeight: FontWeight.w400,
          ),
        ),
        verticalSpaceSmall,
        Row(
          children: [
            SizedBox(
              width: screenWidthPercentage(context, percentage: 0.85),
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontSize: kfsBodyTextRegular,
                  color: kcGreyColor,
                ),
              ),
            ),
          ],
        ),
        verticalSpaceRegular,
        form,
        verticalSpaceMedium,
        BusyButton(mainButtonTitle: mainButtonTitle),
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
      children: const [
        Text(
          'Don\'t have account?',
          style: TextStyle(
            fontSize: kfsBodyTextSmall,
            color: kcGreyColor,
          ),
        ),
        horizontalSpaceTiny,
        Text(
          'Create new account',
          style: TextStyle(
            fontSize: kfsBodyTextSmall,
            color: primaryBlack,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    ),
  );
}

_buildTermsText(BuildContext context) {
  return Center(
    child: SizedBox(
      width: screenWidthPercentage(context, percentage: 0.85),
      child: const Text(
        'By Signing up you agree to our Terms Conditions & Privacy Policy.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kcGreyColor,
          fontSize: kfsBodyTextRegular,
        ),
      ),
    ),
  );
}
