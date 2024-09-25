import 'package:flutter/material.dart';

Text appText(
    {required String title,
    double fontSize = 12,

    FontWeight fontWeight = FontWeight.w500,
    required Color? color,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    Color? decorationColor,
    TextOverflow? textOverflow}) {
  return Text(title,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          height: 1.2,
          fontFamily: 'Montserrat',
          overflow: textOverflow,
          decoration: textDecoration,
          decorationColor: decorationColor));
}
