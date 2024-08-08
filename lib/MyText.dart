import 'package:flutter/material.dart';
Widget MyText({
final String? title,
final double? size,
final Color? color,
final FontWeight? weight,
})
{
  return Text(title!,
  style: TextStyle(
    fontWeight: weight,
    color: color,
    fontSize: size,
  ),);
}