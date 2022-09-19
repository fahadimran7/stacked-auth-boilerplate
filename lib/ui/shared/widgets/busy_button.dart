import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles/styles.dart';

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
      child: Text(
        mainButtonTitle,
        style: const TextStyle(
          fontSize: kfsBodyTextSmall,
          color: kcWhiteColor,
        ),
      ),
    );
  }
}
