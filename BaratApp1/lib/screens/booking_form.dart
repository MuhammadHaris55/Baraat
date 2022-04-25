import 'package:barat/screens/price_screen.dart';
import 'package:barat/utils/color.dart';
import 'package:barat/widgets/reusableBigText.dart';
import 'package:barat/widgets/reusableText.dart';
import 'package:barat/widgets/reusableTextIconButton.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../services/locationservices.dart';

class BookingForm extends StatefulWidget {
  BookingForm({Key? key}) : super(key: key);

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final userID = Get.arguments[0]['userID'];
  final pricePerHead = Get.arguments[1]['pricePerHead'];
  final cateringPerHead = Get.arguments[2]['cateringPerHead'];
  final hallOwnerId = Get.arguments[3]['hallOwnerId'];
  final TextEditingController noOfGuests = TextEditingController();

  LocationServices locationServices = LocationServices();
  String? date;
  String? time;
  bool isCartService = false;
  bool isEventPlanner = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    noOfGuests.text = "";
    print("41 $userID");
    print("42 $pricePerHead");
    print("43 $cateringPerHead");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    noOfGuests.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 600.h,
            padding: EdgeInsets.only(top: 25.0.h, left: 10.0.w, right: 10.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: ReusableBigText(
                    text: "Booking Form",
                    fontSize: 40,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 10.h),
                DateTimePicker(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.black,
                          width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Time',
                  ),
                  type: DateTimePickerType.date,
                  //dateMask: 'yyyy/MM/dd',
                  // controller: _controller3,
                  //initialValue: _initialValue,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  onChanged: (val) => setState(() {
                    print(date);
                    date = val;
                  }),
                  validator: (val) {
                    setState(() => date = val ?? '');
                    return null;
                  },
                  onSaved: (val) => setState(() => date = val ?? ''),
                ),
                SizedBox(height: 10.h),
                DateTimePicker(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.black,
                          width: 2.0),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Time',
                  ),
                  type: DateTimePickerType.time,
                  //timePickerEntryModeInput: true,
                  //controller: _controller4,
                  initialValue: '', //_initialValue,
                  icon: Icon(Icons.access_time),
                  timeLabelText: "Time",
                  // use24HourFormat: false,
                  onChanged: (val) => setState(() {
                    print(time);
                    time = val;
                  }),
                  validator: (val) {
                    setState(() => time = val ?? '');
                    return null;
                  },
                  onSaved: (val) => setState(() => time = val ?? ''),
                ),
                SizedBox(height: 10.h),
                TextField(
                  controller: noOfGuests,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.black,
                          width: 2.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.white,
                          width: 2.0),
                    ),
                    labelText: 'No of Guests',
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableBigText(
                        text: 'Catering Service',
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isCartService = !isCartService;
                              });
                            },
                            child: Container(
                                height: 50.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      bottomLeft: Radius.circular(25)),
                                  color: isCartService == true
                                      ? boolColor
                                      : Colors.grey,
                                ),
                                child: const Center(child: Text('Yes'))),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isCartService = !isCartService;
                              });
                            },
                            child: Container(
                                height: 50.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomRight: Radius.circular(25)),
                                  color: isCartService == false
                                      ? boolColor
                                      : Colors.grey,
                                ),
                                child: const Center(child: Text('No'))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Center(
                  child: isCartService == true
                      ? const ReusableText(
                          text: "Catering Service is selected for 350 person",
                          fontSize: 12,
                        )
                      : Text(''),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableBigText(
                        text: 'Event Planner Service',
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isEventPlanner = !isEventPlanner;
                              });
                            },
                            child: Container(
                                height: 50.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      bottomLeft: Radius.circular(25)),
                                  color: isEventPlanner == true
                                      ? boolColor
                                      : Colors.grey,
                                ),
                                child: const Center(child: Text('Yes'))),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isEventPlanner = !isEventPlanner;
                              });
                            },
                            child: Container(
                                height: 50.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomRight: Radius.circular(25)),
                                  color: isEventPlanner == false
                                      ? boolColor
                                      : Colors.grey,
                                ),
                                child: const Center(child: Text('No'))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Center(
                  child: isEventPlanner == true
                      ? const ReusableText(
                          text: "Contact the owner/manager of the hall",
                          fontSize: 12,
                        )
                      : Text(''),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    Get.to(() => PriceScreen(), arguments: [
                      {"userID": userID},
                      {"date": date!},
                      {"time": time!},
                      {
                        "noOfGuests": int.parse(noOfGuests.text.toString()),
                      },
                      {"isEventPlanner": isEventPlanner},
                      {"isCartService": isCartService},
                      {
                        "selectedPrice":
                            isCartService ? cateringPerHead : pricePerHead
                      },
                      {"hallOwnerId": hallOwnerId},
                    ]);
                  },
                  child: const ReusableTextIconButton(
                    text: "Show Expenses",
                    margin: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//
// if (date.toString().isEmpty || time.toString().isEmpty) {
// } else if (date.toString().isEmpty) {
// Get.snackbar(date.toString(), "Please filled up date ");
// } else if (time.toString().isEmpty) {
// Get.snackbar(time.toString(), "Please filled up time ");
// } else if (noOfGuests.text == null) {
// Get.snackbar(
// noOfGuests.text, "Please filled up noOfGuests ");
// }
// }
