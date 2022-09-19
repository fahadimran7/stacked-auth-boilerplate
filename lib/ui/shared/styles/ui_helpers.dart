import 'package:flutter/material.dart';

// Horizontal space
const Widget horizontalSpaceTiny = SizedBox(
  width: 5.0,
);
const Widget horizontalSpaceSmall = SizedBox(
  width: 10.0,
);
const Widget horizontalSpaceRegular = SizedBox(
  width: 18.0,
);
const Widget horizontalSpaceMedium = SizedBox(
  width: 25.0,
);
const Widget horizontalSpaceLarge = SizedBox(
  width: 50.0,
);
const Widget horizontalSpaceExtraLarge = SizedBox(
  width: 80.0,
);

// Vertical space
const Widget verticalSpaceTiny = SizedBox(
  height: 5.0,
);
const Widget verticalSpaceSmall = SizedBox(
  height: 10.0,
);
const Widget verticalSpaceRegular = SizedBox(
  height: 18.0,
);
const Widget verticalSpaceMedium = SizedBox(
  height: 25.0,
);
const Widget verticalSpaceLarge = SizedBox(
  height: 50.0,
);
const Widget verticalSpaceExtraLarge = SizedBox(
  height: 80.0,
);

// Screen size helpers
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;
double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;
