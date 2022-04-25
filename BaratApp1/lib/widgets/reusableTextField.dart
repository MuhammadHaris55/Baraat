import 'package:barat/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscure;
  final String hintText;

  const ReusableTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.keyboardType,
      this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: borderColor),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          hintText: hintText,
          fillColor: primaryColor,
          hintStyle: const TextStyle(
              fontSize: 16, color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CustomTextEditing extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;

  const CustomTextEditing(
      {Key? key, required this.hintText, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          fillColor: const Color(
            0xffF5F5F5,
          ),
          hintText: hintText,
          hintStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }
}
