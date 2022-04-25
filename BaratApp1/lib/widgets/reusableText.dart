import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final double fontSize;
  const ReusableText({Key? key, required this.text, this.fontSize = 23})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize.sp,
      ),
    );
  }
}
