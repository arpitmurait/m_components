import 'package:flutter/material.dart';
import 'package:mcomponents/mcomponents.dart';

class MText extends StatelessWidget {
  const MText(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.italic,
    this.height,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final bool? italic;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 18,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: MWidgetConfig().fontFamily ?? fontFamily,
        fontStyle: italic == true ? FontStyle.italic : null,
        height: height,
      ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
