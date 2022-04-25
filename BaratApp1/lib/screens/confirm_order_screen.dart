import 'package:barat/screens/HomePage.dart';
import 'package:barat/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/reusableText.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200.h,
                width: 180.w,
                decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Colors.greenAccent),
                  borderRadius: BorderRadius.circular(150),
                ),
                child: Center(
                    child: Icon(
                  Icons.check,
                  size: 170,
                  color: Colors.greenAccent,
                )),
              ),
              SizedBox(height: 80.h),
              Center(
                child: SizedBox(
                  width: 320.w,
                  child: ReusableText(
                      fontSize: 15,
                      text:
                          "Congratulations, The Hall has been succesfully Booked on date 2021-12-30,"
                          " Kindly Contact the hall to confirm your booking,Thank you for using the Baraat App"),
                ),
              ),
              SizedBox(height: 20.h),
              InkWell(
                  onTap: () {},
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => HomePage());
                    },
                    icon: Icon(
                      Icons.home,
                      size: 40,
                      color: secondaryColor,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
