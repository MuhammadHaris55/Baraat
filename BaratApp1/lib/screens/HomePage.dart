import 'package:barat/Models/location_model.dart';
import 'package:barat/screens/halls_screen.dart';
import 'package:barat/screens/loginPage.dart';
import 'package:barat/services/locationservices.dart';
import 'package:barat/utils/color.dart';
import 'package:barat/widgets/reusableBigText.dart';
import 'package:barat/widgets/reusableText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = GetStorage();
  LocationServices locationServices = LocationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocationServices();
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
          const ReusableBigText(
            text: "Welcome to Baraat App",
            fontSize: 25,
          ),
          const ReusableText(
            text: "Book your Hall or Lawn",
            fontSize: 20,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ReusableBigText(
                text: "Select Area",
                fontSize: 25,
              ),
              InkWell(
                  onTap: () {
                    print("logout");
                    box.erase();
                    Get.off(() => const LoginPage());
                  },
                  child: Icon(Icons.logout)),
            ],
          ),
          Expanded(
              child: FutureBuilder(
                  future: locationServices.fetchLocationArea(),
                  builder: (context, AsyncSnapshot<LocationModel?> snapshot) {
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
                            print("81 ${snapshot.data!.data![index].id}");
                            return InkWell(
                              onTap: () async {
                                // await locationServices.getHallApiById(
                                //     "${snapshot.data!.data![index].id}");
                                Get.to(() => HallsScreen(), arguments: [
                                  {"id": snapshot.data!.data![index].id},
                                  {
                                    "AreaName":
                                        snapshot.data!.data![index].areaName
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
                                            "${snapshot.data!.data![index].areaImage}"),
                                        fit: BoxFit.cover)),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    color: whiteColor,
                                    child: ReusableBigText(
                                      text:
                                          "${snapshot.data!.data![index].areaName}",
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
