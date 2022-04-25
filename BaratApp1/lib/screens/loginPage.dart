import 'package:barat/screens/signUpPage.dart';
import 'package:barat/services/credentialservices.dart';
import 'package:barat/utils/color.dart';
import 'package:barat/widgets/reusableTextField.dart';
import 'package:barat/widgets/reusableTextIconButton.dart';
import 'package:barat/widgets/reusablealreadytext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final box = GetStorage();
  final CredentialServices credentialServices = CredentialServices();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  // final String username = "admin@gmail.com";
  // final int password = 12345;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _username.dispose();
    _password.dispose();
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
                      SizedBox(
                          width: height * 0.4,
                          child: const Image(
                              image: const AssetImage('images/logo1.png'))),
                      SizedBox(
                        height: height * 0.01,
                      ),

                      ReusableTextField(
                        controller: _username,
                        hintText: 'username',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ReusableTextField(
                        controller: _password,
                        hintText: 'password',
                        keyboardType: TextInputType.visiblePassword,
                        obscure: true,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          // if (_username.text.toString() ==
                          //         username.toString() &&
                          //     _password.text.toString() ==
                          //         password.toString()) {
                          //   Get.off(() => const AdminPage());
                          // } else {
                          //   credentialServices.loginPost(
                          //       _username.text.toString(),
                          //       _password.text.toString());
                          // }
                          credentialServices.loginPost(
                              _username.text.toString(),
                              _password.text.toString());
                        },
                        child: const ReusableTextIconButton(
                          text: "Login",
                        ),
                      ),
                      ReusableAlreadyText(
                        text: 'Signup',
                        onClick: () => Get.off(() => const SignUpPage()),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
