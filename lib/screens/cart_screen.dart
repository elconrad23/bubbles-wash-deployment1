import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:badges/badges.dart' as badges;
// import '../logic/cart_provider.dart';
import '../logic/controller.dart';
import '../widgets/app_bar.dart';
// import '../models/cart_model.dart';
// import '../models/sqflite.dart';
import 'confirm_order.dart';

class CartScreen extends StatelessWidget  {
  const CartScreen({super.key});
    @override
    Widget build(BuildContext context) {
      Controller cart = Get.put(Controller());
      return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: CustomAppBar(
        title: '',
      actions: const [],
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {  },),
        backgroundColor: Colors.red, ),
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Column(
        children:
        [
        ElevatedButton(
          child: const Text("Go to Other"),
          onPressed: () => Get.to(Other())),
        FloatingActionButton(
            onPressed: cart.increment,
            child: const Icon(Icons.add), ),
          ElevatedButton(
          child: const Text("Continue to Payment"),
          onPressed: () => Get.to(PaymentScreen()))]
      ));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  Other({super.key});
  final Controller cart = Get.find();

  @override
  Widget build(context){
    
     // Access the updated count variable
    return Scaffold(body: Center(child: Text("${cart.count}")));
  }
}

  class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;
  const PlusMinusButtons(
      {Key? key,
      required this.addQuantity,
      required this.deleteQuantity,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
        Text(text),
        IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
      ],
    );
  }
  }

  class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}