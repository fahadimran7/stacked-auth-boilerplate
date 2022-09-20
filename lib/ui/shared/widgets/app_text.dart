import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles/app_colors.dart';
import 'package:stacked_architecture/ui/shared/styles/styles.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign alignment;

  const AppText.headingOne(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = heading1Style,
        alignment = align,
        super(key: key);

  const AppText.headingTwo(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = heading2Style,
        alignment = align,
        super(key: key);

  const AppText.headingThree(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = heading3Style,
        alignment = align,
        super(key: key);

  const AppText.headline(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = headlineStyle,
        alignment = align,
        super(key: key);

  const AppText.subheading(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = subheadingStyle,
        alignment = align,
        super(key: key);

  const AppText.caption(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = captionStyle,
        alignment = align,
        super(key: key);

  AppText.body(this.text,
      {Key? key, Color color = kcGreyColor, TextAlign align = TextAlign.start})
      : style = bodyStyle.copyWith(color: color),
        alignment = align,
        super(key: key);

  AppText.bodySmall(this.text,
      {Key? key,
      Color color = kcGreyColor,
      TextAlign align = TextAlign.start,
      FontWeight fontWeight = FontWeight.w400})
      : style = bodySmallStyle.copyWith(color: color, fontWeight: fontWeight),
        alignment = align,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: alignment,
    );
  }
}
