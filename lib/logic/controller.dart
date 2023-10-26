import 'package:get/get.dart';

class Controller extends GetxController{
  var count = 0.obs;
  void name () => name.obs;
  increment() => count++;
  var amountController = 0.obs;
  addAmount()=> amountController++;
  void addTotalPrice(double double) {}
}