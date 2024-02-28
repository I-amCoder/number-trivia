import 'package:flutter/material.dart';

Text customText(
    {String? text,
    bool heading = false,
    double size = 30,
    bool center = false,
    bool truncate = true,
    Color color = Colors.black}) {
  TextStyle numberStyle = TextStyle(
      color: heading ? Colors.deepOrange : color,
      fontWeight: heading ? FontWeight.bold : FontWeight.w400,
      fontSize: size);

  return Text(
    text.toString(),
    style: numberStyle,
    softWrap: true,
    maxLines: 5,
    textAlign: center ? TextAlign.center : TextAlign.start,
    overflow: truncate ? TextOverflow.fade : TextOverflow.visible,
  );
}
