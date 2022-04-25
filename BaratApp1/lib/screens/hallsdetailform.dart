import 'dart:async';
import 'dart:io';

import 'package:barat/Models/hall_owner_model.dart';
import 'package:barat/widgets/reusableBigText.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Models/location_model.dart';
import '../services/locationservices.dart';
import '../utils/color.dart';
import '../widgets/reusableTextField.dart';
import '../widgets/reusableTextIconButton.dart';
import 'admin.dart';

class HallsDetailForm extends StatefulWidget {
  const HallsDetailForm({Key? key}) : super(key: key);

  @override
  State<HallsDetailForm> createState() => _HallsDetailFormState();
}

class _HallsDetailFormState extends State<HallsDetailForm> {
  LocationServices locationServices = LocationServices();
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile> _selectedFiles = [];
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  List<String> arrimgsUrl = [];
  int uploadItem = 0;
  bool _upLoading = false;
  var img_url;

  String? AreaName;
  String? UserName;
  List<String>? AreaListArray = ['A', 'B', 'C', 'D'];

  final TextEditingController ownerName = TextEditingController();
  final TextEditingController hallName = TextEditingController();
  final TextEditingController ownerContact = TextEditingController();
  final TextEditingController ownerEmail = TextEditingController();
  final TextEditingController hallAddress = TextEditingController();
  final TextEditingController hallCapacity = TextEditingController();
  final TextEditingController pricePerHead = TextEditingController();
  final TextEditingController cateringPerHead = TextEditingController();
  bool isLoading = true;
  bool eventPlanner = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocationServices().fetchLocationArea();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ownerName.dispose();
    hallName.dispose();
    ownerContact.dispose();
    ownerEmail.dispose();
    hallAddress.dispose();
    hallCapacity.dispose();
    pricePerHead.dispose();
    cateringPerHead.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('49 ${locationServices.fetchLocationArea()}');

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          width: 500.w,
          color: primaryColor,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.all(50),
                  padding: EdgeInsets.only(top: 20.h),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReusableBigText(text: "Create Hall Details"),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      FutureBuilder(
                        future: locationServices.fetchLocationArea(),
                        builder:
                            (context, AsyncSnapshot<LocationModel?> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData &&
                              snapshot.data != null) {
                            return SizedBox(
                              width: 400.w,
                              child: Center(
                                child: DropdownButton<String?>(
                                  elevation: 20,
                                  value: AreaName,
                                  hint: Text(
                                    "Please Select the Location",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  items: snapshot.data!.data!.map((value) {
                                    return DropdownMenuItem(
                                      value: value.id,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 50.0),
                                        child: Text(
                                          "${value.areaName}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (_) {
                                    setState(() {
                                      AreaName = _!;
                                    });
                                    print('drop down id  ${_}');
                                  },
                                ),
                              ),
                            );
                          }

                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      FutureBuilder(
                        future: locationServices.getHallOwner(),
                        builder:
                            (context, AsyncSnapshot<HallOwnerModel?> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData &&
                              snapshot.data != null) {
                            return SizedBox(
                              width: 400.w,
                              child: Center(
                                child: DropdownButton<String?>(
                                  elevation: 20,
                                  value: UserName,
                                  hint: Text(
                                    "Please Select the User Name ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  items: snapshot.data!.data!.map((value) {
                                    return DropdownMenuItem(
                                      value: value.id,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 50.0),
                                        child: Text(
                                          "${value.userName}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (_) {
                                    setState(() {
                                      UserName = _!;
                                    });
                                    print('drop down id  ${_}');
                                  },
                                ),
                              ),
                            );
                          }

                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ReusableTextField(
                        controller: hallName,
                        hintText: 'Hall Name',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ReusableTextField(
                        controller: ownerName,
                        hintText: 'Owner Name',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ReusableTextField(
                        controller: ownerContact,
                        hintText: 'Owner Contact',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ReusableTextField(
                        controller: ownerEmail,
                        hintText: 'Owner Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ReusableTextField(
                        controller: hallAddress,
                        hintText: 'Hall Address',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ReusableTextField(
                        controller: hallCapacity,
                        hintText: 'Hall Capacity',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ReusableTextField(
                        controller: pricePerHead,
                        hintText: 'Price Per Head',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ReusableTextField(
                        controller: cateringPerHead,
                        hintText: 'Catering Per Head',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          CupertinoSwitch(
                            value: eventPlanner,
                            onChanged: (value) {
                              setState(() {
                                eventPlanner = value;
                              });
                            },
                          ),
                          const Text('Event Planner')
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                        height: height * 0.3,
                        child: _upLoading
                            ? showLoading()
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: OutlinedButton(
                                        onPressed: () {
                                          selectImage();
                                        },
                                        child: Text('Select Files')),
                                  ),
                                  Center(
                                    child: _selectedFiles.length == null
                                        ? Text("No Images Selected")
                                        : Text(
                                            'Image is Selected : ${_selectedFiles.length.toString()}'),
                                  ),
                                  Expanded(
                                    child: GridView.builder(
                                        itemCount: _selectedFiles.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Image.file(
                                                File(
                                                    _selectedFiles[index].path),
                                                fit: BoxFit.cover),
                                          );
                                        }),
                                  )
                                ],
                              ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_selectedFiles.isNotEmpty) {
                            await uploadFunction(_selectedFiles);
                            locationServices.postHallsByAdmin(
                              arrimgsUrl,
                              AreaName.toString(),
                              UserName.toString(),
                              ownerName.text.toString(),
                              hallName.text.toString(),
                              int.parse(ownerContact.text),
                              ownerEmail.text.toString(),
                              hallAddress.text.toString(),
                              int.parse(hallCapacity.text),
                              int.parse(pricePerHead.text),
                              int.parse(cateringPerHead.text),
                              eventPlanner,
                            );
                            Get.to(() => const AdminPage());
                          } else if (ownerName.toString().isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("PLEASE Type Area Name")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("PLEASE Select Image")));
                          }
                        },
                        child: const ReusableTextIconButton(
                          text: "Submit",
                        ),
                      ),
                      SizedBox(
                        height: height * 0.15,
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  //showLoading Login()
  Widget showLoading() {
    return Center(
      child: Column(
        children: [
          Text(
            "Uploading : " +
                uploadItem.toString() +
                "/" +
                _selectedFiles.length.toString(),
          ),
          SizedBox(height: 30),
          CircularProgressIndicator()
        ],
      ),
    );
  }
  //Finish showLoading Login()

  //upload ImageFile One by one
  Future<List> uploadFunction(List<XFile> _images) async {
    for (int i = 0; i < _images.length; i++) {
      var imageUrl = await uploadFile(_images[i]);
      arrimgsUrl.add(imageUrl.toString());
    }

    print("93 ${arrimgsUrl}");
    return arrimgsUrl;
  }
  //Finish upload ImageFile One by one

  //Upload Images in Firestore Storage
  Future<String> uploadFile(XFile _image) async {
    setState(() {
      _upLoading = true;
    });
    Reference reference =
        _firebaseStorage.ref().child("Area images").child(_image.name);
    await reference.putFile(File(_image.path)).whenComplete(() async {
      setState(() {
        uploadItem += 1;
        if (uploadItem == _selectedFiles.length) {
          _upLoading = false;
          uploadItem = 0;
        }
      });
    });
    // await reference.getDownloadURL();
    // print("111 ${await reference.getDownloadURL()}");
    // img_url = await reference.getDownloadURL();

    // print('function print ${img_url}');
    // return img_url;
    return await reference.getDownloadURL();
  }
  //Finish Upload Images in Firestore Storage

//Select Image From Gallery
  Future<void> selectImage() async {
    if (_selectedFiles != null) {
      _selectedFiles.clear();
    }

    try {
      final List<XFile>? imgs = await _imagePicker.pickMultiImage(
          imageQuality: 50, maxWidth: 400, maxHeight: 400);
      if (imgs!.isNotEmpty) {
        _selectedFiles.addAll(imgs);
      }
      print("List of Images : " + imgs.length.toString());
    } catch (e) {
      print("Something Wrong" + e.toString());
    }
    setState(() {});
  }
//Finish Select Image From Gallery

}
