import 'dart:convert';

import 'package:barat/screens/confirm_order_screen.dart';
import 'package:barat/services/locationservices.dart';
import 'package:barat/widgets/reusableBigText.dart';
import 'package:barat/widgets/reusableTextIconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/color.dart';

class PriceScreen extends StatefulWidget {
  PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  Map<String, dynamic>? paymentIntentData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalPriceMethod();
    print(selectedPrice);
  }

  final userID = Get.arguments[0]['userID'];

  final date = Get.arguments[1]['date'];

  final time = Get.arguments[2]['time'];

  final noOfGuests = Get.arguments[3]['noOfGuests'];

  final isEventPlanner = Get.arguments[4]['isEventPlanner'];

  final isCartService = Get.arguments[5]['isCartService'];

  final selectedPrice = Get.arguments[6]['selectedPrice'];
  final hallOwnerId = Get.arguments[7]['hallOwnerId'];

  LocationServices locationServices = LocationServices();

  var finalTotalPrice;

  @override
  Widget build(BuildContext context) {
    // print(
    // "${userID} ${date}${time}${noOfGuests}${isEventPlanner}${isCartService}${totalPrice}");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.adaptive.arrow_back_outlined),
        ),
        title: Text("Hall Name"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Container(
              height: 250.h,
              width: 230.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: secondaryColor.withOpacity(0.5)),
              child: Center(
                  child: ReusableBigText(text: finalTotalPrice!.toString())),
            ),
            SizedBox(height: 20.h),

            InkWell(
              onTap: () async {
                await MakePayment();

                // isPaymentLoading
                //     ? Center(
                //         child: CircularProgressIndicator(),
                //       )
                //     : await locationServices.postbookHallsByUser(
                //         userID,
                //         date!,
                //         time!,
                //         noOfGuests,
                //         isEventPlanner,
                //         isCartService,
                //         finalTotalPrice);
              },
              child: ReusableTextIconButton(
                text: "Proceed to Pay",
                margin: 15,
                color: Colors.greenAccent.withOpacity(0.5),
              ),
            ),
            // InkWell(
            //   onTap: () async {
            //     await MakePayment();
            //     // await locationServices.postbookHallsByUser(userID, date!, time!,
            //     //     noOfGuests, isEventPlanner, isCartService, finalTotalPrice);
            //   },
            //   child: ReusableTextIconButton(
            //     text: "stripe",
            //     margin: 15,
            //     color: Colors.greenAccent.withOpacity(0.5),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

//
  void totalPriceMethod() {
    finalTotalPrice = noOfGuests * selectedPrice;
  }

  Future<void> MakePayment() async {
    try {
      // paymentIntentData = await createPaymentIntent('20', "USD");
      paymentIntentData =
          await createPaymentIntent(finalTotalPrice!.toString(), "USD");
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              applePay: true,
              googlePay: true,
              merchantDisplayName: 'Asif',
              merchantCountryCode: 'US'));

      displayPaymentSheet();
    } catch (e) {
      print(e.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet(
          parameters: PresentPaymentSheetParameters(
              clientSecret: paymentIntentData!['client_secret'],
              confirmPayment: true));
      setState(() {
        paymentIntentData = null;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Paid Succesfully')));
      await locationServices.postbookHallsByUser(
          userID,
          date!,
          time!,
          noOfGuests,
          isEventPlanner,
          isCartService,
          finalTotalPrice,
          hallOwnerId);
      Get.off(() => const ConfirmOrderScreen());
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text("Cancelled "),
              ));
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic>? body = {
        'amount': calculatePayment(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51JcaT0LtlAjb95Nap4b7WGa2AemGJTdQKBnQDWN6dKoQ8hrXceBDxCoa99FoOxh0QmrnzcffUAiTB11xRGoCbMYT00SR1knM9a',
            'Content-Type': 'application/x-www-form-urlencoded'
          });

      return jsonDecode(response.body.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  calculatePayment(String amount) {
    final price = int.parse(amount) * 100;
    return price.toString();
  }
}
