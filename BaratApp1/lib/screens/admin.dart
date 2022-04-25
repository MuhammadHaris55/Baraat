import 'package:barat/screens/HomePage.dart';
import 'package:barat/screens/areaForm.dart';
import 'package:barat/screens/create_hall_user.dart';
import 'package:barat/screens/hallsdetailform.dart';
import 'package:barat/widgets/loading_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/reusableTextIconButton.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      LoadingButton(
          onClick: () async {
            if (kDebugMode) {
              Get.to(() => const AdminAreaForm());
            }
          },
          color: Colors.red,
          childWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Create Area'),
            ],
          )),
      SizedBox(height: 10.h),
      LoadingButton(
          onClick: () async {
            if (kDebugMode) {
              Get.to(() => const HallsDetailForm());
            }
          },
          color: Colors.red,
          childWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Create Halls'),
            ],
          )),
      SizedBox(height: 10.h),
      LoadingButton(
          onClick: () async {
            if (kDebugMode) {
              Get.to(() => const HomePage());
            }
          },
          color: Colors.red,
          childWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Go To Home Page '),
            ],
          )),
      SizedBox(height: 10.h),
      InkWell(
        onTap: () {
          Get.to(() => const CreateHallUser());
        },
        child: const ReusableTextIconButton(
          text: 'Create Halls User',
        ),
      )
    ]));
  }
}
