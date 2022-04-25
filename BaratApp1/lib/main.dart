import 'package:barat/screens/hallsdetailform.dart';
import 'package:barat/utils/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Stripe.publishableKey =
      'pk_test_51JcaT0LtlAjb95NaxcGQoOIyNA6uVyozoNYErdxkxZW55zUFTudT70R41lHRUbCVC4pGveeSwg6wkQwrbinVDSbL00neGfIMQx';

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    print(box.read('responseLogin'));
    box.listenKey('responseSignUp', (value) {
      print('new key is $value');
    });
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Barat',
        theme: ThemeData(primarySwatch: deepOrange),
        // home: const AdminAreaForm(),
        // home: const AdminPage(),
        // home: box.read('responseSignUp') == null
        //     ? box.read('responseLogin') == null
        //         ? const LoginPage()
        //         : const HomePage()
        //     : const HomePage()

        home: const HallsDetailForm(),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => const SplashScreen(),
        //   '/Home-Page': (context) => const HomePage()
        // },
      ),
    );
  }
}
