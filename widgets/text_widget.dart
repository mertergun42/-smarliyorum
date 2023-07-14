// ignore_for_file: deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:ismarliyorum/utils/constants.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;

  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDecoration? decoration;

  const TextWidget({
    Key? key,
    required this.text,
    this.color = Constants.mainTextColor,
    this.fontFamily = 'FontRegular',
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.textOverflow,
    this.decoration,
  })  : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}
