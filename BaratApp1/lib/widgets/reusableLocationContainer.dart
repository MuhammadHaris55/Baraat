import 'package:barat/utils/color.dart';
import 'package:barat/widgets/reusableBigText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableLocationContainer extends StatelessWidget {
  final String image;
  final String text;
  const ReusableLocationContainer(
      {Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.35,
      height: height * 0.37,
      padding: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(30.r),
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: whiteColor,
          child: ReusableBigText(
            text: text,
            fontSize: 21,
          ),
        ),
      ),
    );
  }
}
