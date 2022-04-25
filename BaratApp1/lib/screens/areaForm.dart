import 'dart:io';

import 'package:barat/widgets/reusableBigText.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../services/locationservices.dart';
import '../utils/color.dart';
import '../widgets/reusableTextField.dart';
import '../widgets/reusableTextIconButton.dart';
import 'admin.dart';

class AdminAreaForm extends StatefulWidget {
  const AdminAreaForm({Key? key}) : super(key: key);

  @override
  State<AdminAreaForm> createState() => _AdminAreaFormState();
}

class _AdminAreaFormState extends State<AdminAreaForm> {
  LocationServices locationServices = LocationServices();
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile> _selectedFiles = [];
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  List<String> arrimgsUrl = [];
  int uploadItem = 0;
  bool _upLoading = false;
  var img_url;

  final TextEditingController areaName = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    areaName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 500,
            color: primaryColor,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Container(
                  margin: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text('data')
                      ReusableBigText(text: "Admin"),
                      SizedBox(
                        height: height * 0.01,
                      ),

                      ReusableTextField(
                        controller: areaName,
                        hintText: 'Area Name',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Expanded(
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
                            await uploadFile(_selectedFiles.first);
                            locationServices.postLocationByAdmin(
                                img_url, areaName.text.toString());
                            Get.to(() => const AdminPage());
                          } else if (areaName.toString().isNotEmpty) {
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
  void uploadFunction(List<XFile> _images) async {
    for (int i = 0; i < _images.length; i++) {
      var imageUrl = await uploadFile(_images[i]);
      arrimgsUrl.add(imageUrl.toString());
    }
    print("93 ${arrimgsUrl}");
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
    img_url = await reference.getDownloadURL();

    print('function print ${img_url}');
    return img_url;
    // return await reference.getDownloadURL();/
  }
  //Finish Upload Images in Firestore Storage

//Select Image From Gallery
  Future<void> selectImage() async {
    if (_selectedFiles != null) {
      _selectedFiles.clear();
    }

    try {
      final List<XFile>? imgs =
          await _imagePicker.pickMultiImage(maxWidth: 400, maxHeight: 400);
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
