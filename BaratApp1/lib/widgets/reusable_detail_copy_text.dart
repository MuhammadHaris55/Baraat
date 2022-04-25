import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableDetailsCopyText extends StatelessWidget {
  String text1;
  String text2;
  ReusableDetailsCopyText({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      // height: 800,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 40.h,
            width: 120.w,
            child: Text(
              text1,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
          ),
          Container(
            width: 200.w,
            height: 40.h,
            child: SelectableText(
              text2,
              textAlign: TextAlign.end,
              minLines: 2,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
