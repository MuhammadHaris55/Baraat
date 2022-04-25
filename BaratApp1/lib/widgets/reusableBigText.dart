import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableBigText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const ReusableBigText(
      {Key? key,
      required this.text,
      this.fontSize = 23,
      this.fontWeight = FontWeight.bold,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize.sp, fontWeight: fontWeight, color: color),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
