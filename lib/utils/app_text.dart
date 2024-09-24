import 'package:flutter/material.dart';

Text appText(
    {required String title,
    double fontSize = 12,
    int maxLine = 4,
    FontWeight fontWeight = FontWeight.w500,
    required Color? color,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    Color? decorationColor,
    required BuildContext context,
    TextOverflow? textOverflow}) {
  return Text(title,
      textAlign: textAlign,
      maxLines: maxLine,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          height: 1.2,
          fontFamily: 'Montserrat',
          overflow: textOverflow,
          decoration: textDecoration,
          decorationColor: decorationColor));
}
