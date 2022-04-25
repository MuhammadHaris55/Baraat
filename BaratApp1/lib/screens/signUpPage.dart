import 'package:barat/screens/loginPage.dart';
import 'package:barat/services/credentialservices.dart';
import 'package:barat/utils/color.dart';
import 'package:barat/widgets/reusableBigText.dart';
import 'package:barat/widgets/reusableTextField.dart';
import 'package:barat/widgets/reusableTextIconButton.dart';
import 'package:barat/widgets/reusablealreadytext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final CredentialServices credentialServices = CredentialServices();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  int userRoll = 1;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _username.dispose();
    _fullname.dispose();
    _phone.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("32   $userRoll");
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
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
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: ReusableBigText(
                          text: 'Sign Up',
                        ),
                      ),
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
                        controller: _fullname,
                        hintText: 'Full Name',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ReusableTextField(
                        controller: _phone,
                        hintText: 'Phone: +9233546586',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ReusableTextField(
                        controller: _email,
                        hintText: 'E-mail',
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      ReusableTextField(
                        controller: _password,
                        hintText: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        obscure: true,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () async {
                          credentialServices.signUpPost(
                              _username.text,
                              _fullname.text,
                              _email.text,
                              _phone.text,
                              _password.text,
                              userRoll);
                        },
                        child: const ReusableTextIconButton(
                          text: "SignUp",
                        ),
                      ),
                      ReusableAlreadyText(
                        text: "Login",
                        onClick: () => Get.off(() => const LoginPage()),
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
