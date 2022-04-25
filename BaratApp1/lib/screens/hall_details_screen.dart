import 'package:barat/screens/booking_form.dart';
import 'package:barat/services/locationservices.dart';
import 'package:barat/widgets/reusable_detail_copy_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/color.dart';

class HallDetailScreen extends StatefulWidget {
  const HallDetailScreen({Key? key}) : super(key: key);

  @override
  _HallDetailScreenState createState() => _HallDetailScreenState();
}

class _HallDetailScreenState extends State<HallDetailScreen> {
  // List images = [
  //   'welcome-one.png',
  //   'welcome-two.png',
  //   'welcome-three.png',
  // ];
  LocationServices locationServices = LocationServices();
  List images = Get.arguments[0]['ListImage'];
  final userID = Get.arguments[1]['userId'];
  final ownerName = Get.arguments[2]['ownerName'];
  final ownerContact = Get.arguments[3]['ownerContact'];
  final ownerEmail = Get.arguments[4]['ownerEmail'];
  final hallAddress = Get.arguments[5]['hallAddress'];
  final hallCapacity = Get.arguments[6]['hallCapacity'];
  final pricePerHead = Get.arguments[7]['pricePerHead'];
  final cateringPerHead = Get.arguments[8]['cateringPerHead'];
  final hallOwnerId = Get.arguments[9]['hallOwnerId'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('31,${userID} $ownerName $ownerContact');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Container(
        height: 230,
        color: Colors.black,
        child: CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
            width: 900,
            // margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("${images[itemIndex]}"),
                    fit: BoxFit.contain)),
            child: Padding(
              padding: EdgeInsets.only(bottom: 25.0.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      children: List.generate(images.length, (indexDots) {
                    return Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 8,
                      width: itemIndex == indexDots ? 25 : 8,
                      decoration: BoxDecoration(
                        color: itemIndex == indexDots
                            ? Colors.blue
                            : Colors.blue.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  })),
                ],
              ),
            ),
          ),
          options: CarouselOptions(
            autoPlay: true,
            enableInfiniteScroll: false,
            // enlargeCenterPage: true,
            viewportFraction: 1.1,
            // aspectRatio: 2.0,
            initialPage: 0,
          ),
        ),
      ),
      SizedBox(height: 10.h),
      Expanded(
        child: SingleChildScrollView(
          child: Container(
            height: 550.h,
            child: Column(children: <Widget>[
              const Text(
                "DETAILS",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ReusableDetailsCopyText(
                text1: "Owner/Manger",
                text2: "$ownerName",

                // text2: "${snapshot.data!.data![0].ownerName}",
              ),
              ReusableDetailsCopyText(
                text1: "Contact",
                text2: "$ownerContact",

                // text2: "${snapshot.data!.data![0].ownerContact}",
              ),
              ReusableDetailsCopyText(
                text1: "Email",
                text2: "$ownerEmail",

                // text2: "${snapshot.data!.data![0].ownerEmail}",
              ),
              ReusableDetailsCopyText(
                text1: "Address",
                text2: "$hallAddress",

                // text2: "${snapshot.data!.data![0].hallAddress}",
              ),
              ReusableDetailsCopyText(
                text1: "Capacity per Hall",
                text2: "$hallCapacity",
                // text2: "${snapshot.data!.data![0].hallCapacity}",
              ),
              ReusableDetailsCopyText(
                text1: "Rate per head",
                text2: "$pricePerHead",
                // text2: "${snapshot.data!.data![0].pricePerHead}",
              ),
              ReusableDetailsCopyText(
                text1: "Catering Service per head",
                // text2: "${snapshot.data!.data![0].cateringPerHead}",
                text2: "$cateringPerHead",
              ),
              ReusableDetailsCopyText(
                text1: "Event planner services",
                text2: "Contact Owner/Manager",
              ),
              SizedBox(
                height: 50.h,
                width: 110.w,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => BookingForm(), arguments: [
                      {"userID": userID},
                      {"pricePerHead": pricePerHead},
                      {"cateringPerHead": cateringPerHead},
                      {"hallOwnerId": hallOwnerId},
                    ]);
                  },
                  child: Text(
                    "Book Now",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: whiteColor,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.blueGrey,
                    primary: secondaryColor,
                    elevation: 9,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      // <-- Radius
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    ])));
  }
}

//
// Expanded(
// child: FutureBuilder(
// future: locationServices.getHallApiById(userID),
// builder: (context, AsyncSnapshot<GetHallsByID?> snapshot) {
// if (!snapshot.hasData) {
// return SizedBox(
// child: CircularProgressIndicator(),
// );
// } else {
// return ListView.builder(
// // physics: NeverScrollableScrollPhysics(),
// shrinkWrap: true,
// itemCount: snapshot.data!.data!.length,
// itemBuilder: (BuildContext context, index) {
// return Container(
// height: 550.h,
// child: Column(children: <Widget>[
// const Text(
// "DETAILS",
// style: TextStyle(
// fontSize: 22, fontWeight: FontWeight.bold),
// ),
// ReusableDetailsCopyText(
// text1: "Owner/Manger",
// text2: "${snapshot.data!.data![index].ownerName}",
// ),
// ReusableDetailsCopyText(
// text1: "Contact",
// text2:
// "${snapshot.data!.data![index].ownerContact}",
// ),
// ReusableDetailsCopyText(
// text1: "Email",
// text2: "${snapshot.data!.data![index].ownerEmail}",
// ),
// ReusableDetailsCopyText(
// text1: "Address",
// text2: "${snapshot.data!.data![index].hallAddress}",
// ),
// ReusableDetailsCopyText(
// text1: "Capacity per Hall",
// text2:
// "${snapshot.data!.data![index].hallCapacity}",
// ),
// ReusableDetailsCopyText(
// text1: "Rate per head",
// text2:
// "${snapshot.data!.data![index].pricePerHead}",
// ),
// ReusableDetailsCopyText(
// text1: "Catering Service per head",
// text2:
// "${snapshot.data!.data![index].cateringPerHead}",
// ),
// ReusableDetailsCopyText(
// text1: "Event planner services",
// text2: "Contact Owner/Manager",
// ),
// SizedBox(
// height: 50.h,
// width: 110.w,
// child: ElevatedButton(
// onPressed: () {
// Get.to(() => BookingForm(), arguments: [
// {"userID": userID},
// {
// "pricePerHead":
// snapshot.data!.data![index].pricePerHead
// },
// {
// "cateringPerHead": snapshot
//     .data!.data![index].cateringPerHead
// },
// ]);
// },
// child: Text(
// "Book Now",
// style: TextStyle(
// fontSize: 17.sp,
// color: whiteColor,
// ),
// ),
// style: ElevatedButton.styleFrom(
// shadowColor: Colors.blueGrey,
// primary: secondaryColor,
// elevation: 9,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(12),
// // <-- Radius
// ),
// ),
// ),
// )
// ]),
// );
// });
// }
// }),
// )
