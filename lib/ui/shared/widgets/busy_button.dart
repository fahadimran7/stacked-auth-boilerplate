import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles/app_colors.dart';
import 'package:stacked_architecture/ui/shared/widgets/app_text.dart';

class BusyButton extends StatelessWidget {
  const BusyButton(
      {Key? key,
      required this.mainButtonTitle,
      this.onPressed,
      required this.busy})
      : super(key: key);
  final String mainButtonTitle;
  final bool busy;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: busy
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(kcWhiteColor),
              ),
            )
          : AppText.bodySmall(
              mainButtonTitle,
              color: kcWhiteColor,
              fontWeight: FontWeight.w500,
            ),
    );
  }
}
