// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../logic/controller.dart';

late Controller currencyController;
class PaymentScreen {
  final formKey = GlobalKey<FormState>();
  final Controller amountController = Get.put(Controller());
  final Controller userEmail = Get.put(Controller());
  final publicKeyController = TextEditingController();
  final encryptionKeyController = TextEditingController();
  final phoneNumberController = TextEditingController();

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
          //the first 10 fields below are required/mandatory
      }catch (error) {
      error;
    }
  }
}