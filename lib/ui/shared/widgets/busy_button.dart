import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles/app_colors.dart';
import 'package:stacked_architecture/ui/shared/widgets/app_text.dart';

class BusyButton extends StatelessWidget {
  const BusyButton({Key? key, required this.mainButtonTitle}) : super(key: key);
  final String mainButtonTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: AppText.bodySmall(
        mainButtonTitle,
        color: kcWhiteColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
