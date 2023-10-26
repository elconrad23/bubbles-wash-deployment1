
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:get/get.dart';
import '../logic/controller.dart';
import 'home.dart';

late Controller currencyController;
class PaymentScreen {
  final formKey = GlobalKey<FormState>();
  final Controller amountController = Get.put(Controller());
  final Controller userEmail = Get.put(Controller());
  final publicKeyController = TextEditingController();
  final encryptionKeyController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final String selectedCurrency =FlutterwaveCurrency.UGX ;

  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Obx(() => Text("Amount: ${amountController.count}")),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: publicKeyController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Public Key",
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: encryptionKeyController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Encryption Key",
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: phoneNumberController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Phone Number to call on",
                  ),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Phone Number is required",
                ),
              ),
              
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: ElevatedButton(
                  onPressed: () {
                    const name = "fullname.text";
                    final userPhone = phoneNumberController.text;
                    const userEmail = "example@gmail.com";
                    final amountPaid = amountController.count.toString();

                    if (formKey.currentState!.validate()) {
                    _makeFlutterwavePayment(context,name,userPhone,userEmail,amountPaid);
                    }
                  },
                  child: const Text(
                    "Make Payment",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  Future<void> showLoading(String message) {
    return showDialog(
      context: StatelessElement(const Text("Order received")),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50,
            child: Text(message),
          ),
        );
      },
    );
  }

  void _makeFlutterwavePayment(BuildContext context, String fullname, String phone, String email, String amount) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          //the first 10 fields below are required/mandatory
          context: context,
          fullName: fullname,
          phoneNumber: phone,
          email: email,
          amount: amount,
          //Use your Public and Encription Keys from your Flutterwave account on the dashboard
          encryptionKey: "Your Encription Key",
          publicKey: "Your Public Key",
          currency: selectedCurrency,
          txRef: DateTime.now().toIso8601String(),
          //Setting DebugMode below to true since will be using test mode.
          //You can set it to false when using production environment.
          isDebugMode: true,
          //configure the the type of payments that your business will accept
          acceptCardPayment: true,
          acceptUSSDPayment: true,
          acceptAccountPayment: false,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: false,
          acceptMpesaPayment: false,
          acceptRwandaMoneyPayment: false,
          acceptUgandaPayment: true,
          acceptZambiaPayment: false
          );
        final response = await flutterwave.initializeForUiPayments();
      if (response.status != "Transaction successful") {
        Get.to(const Home());
      } else {
          return showDialog(
            context: StatelessElement(const Text("Transaction Failed")),
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  width: double.infinity,
                  height: 50,
                  child: const Text("PLease reload and try again"),
                ),
              );
            },
          );
        }
      }catch (error) {
      print(error);
    }
  }
}