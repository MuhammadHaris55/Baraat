import 'package:barat/services/locationservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Models/get_halls_by_i_d.dart';
import '../utils/color.dart';
import '../widgets/reusableBigText.dart';
import '../widgets/reusableText.dart';
import 'hall_details_screen.dart';

class HallsScreen extends StatefulWidget {
  const HallsScreen({Key? key}) : super(key: key);

  @override
  _HallsScreenState createState() => _HallsScreenState();
}

class _HallsScreenState extends State<HallsScreen> {
  String? hallName;
  LocationServices locationServices = LocationServices();

  var data = Get.arguments[0]['id'];
  var hallOwnerId = Get.arguments[0]['hallOwnerId'];
  String? areaName = Get.arguments[1]['AreaName'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('20 ${areaName.toString()}');
    print('21 ${data.toString()}');
    LocationServices();
    // locationServices.getHallApiById(data);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      width: width,
      color: background1Color,
      padding:
          EdgeInsets.symmetric(horizontal: width / 13, vertical: height / 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableBigText(
            text: areaName.toString(),
            fontSize: 25,
          ),
          const ReusableText(
            text: "Select Your Lawn Or Hall",
            fontSize: 20,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Expanded(
              child: FutureBuilder(
                  future: locationServices.getHallApiById(data),
                  builder: (context, AsyncSnapshot<GetHallsByID?> snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      return GridView.builder(
                          itemCount: snapshot.data!.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 160.h,
                                  mainAxisExtent: 230.w,
                                  crossAxisSpacing: 25.0.h,
                                  mainAxisSpacing: 10.0.w,
                                  childAspectRatio: 0.7),
                          itemBuilder: (context, index) {
                            // hallName = snapshot.data!.data[index].;
                            return InkWell(
                              onTap: () {
                                Get.to(() => const HallDetailScreen(),
                                    arguments: [
                                      {
                                        "ListImage":
                                            snapshot.data!.data![index].images
                                      },
                                      {"userId": data.toString()},
                                      {
                                        "ownerName": snapshot
                                            .data!.data![index].ownerName
                                      },
                                      {
                                        "ownerContact": snapshot
                                            .data!.data![index].ownerContact
                                      },
                                      {
                                        "ownerEmail": snapshot
                                            .data!.data![index].ownerEmail
                                      },
                                      {
                                        "hallAddress": snapshot
                                            .data!.data![index].hallAddress
                                      },
                                      {
                                        "hallCapacity": snapshot
                                            .data!.data![index].hallCapacity
                                      },
                                      {
                                        "pricePerHead": snapshot
                                            .data!.data![index].pricePerHead
                                      },
                                      {
                                        "cateringPerHead": snapshot
                                            .data!.data![index].cateringPerHead
                                      },
                                      {
                                        "hallOwnerId": snapshot
                                            .data!.data![index].hallOwnerId
                                      },
                                    ]);
                              },
                              child: Container(
                                padding: EdgeInsets.only(bottom: 15.h),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(30.r),
                                    color: Colors.red,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${snapshot.data!.data![index].images![0]}"),
                                        fit: BoxFit.cover)),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    color: whiteColor,
                                    child: ReusableBigText(
                                      text:
                                          "${snapshot.data!.data![index].hallName}",
                                      fontSize: 21,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
    ));
  }
}
