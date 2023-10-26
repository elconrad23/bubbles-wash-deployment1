import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/cart_model.dart';
import '../models/item_model.dart';
import '../models/sqflite.dart';
// import '../models/cart.dart';
import '../logic/controller.dart';

class MakeOrder extends StatefulWidget {
  const MakeOrder({super.key});
  @override
  State<MakeOrder> createState() => _MakeOrderState();
}

class _MakeOrderState extends State<MakeOrder> {
  late DBHelper dbHelper = DBHelper();

  List<Item> products = [
    Item(
      name: 'Shirt', unit: 'piece', price: 2000, image: '/images/shirt.jpg'),
    Item(
      name: 'Short',
      unit: 'piece',
      price: 1500,
      image: '/images/shorts.jpg'),
    Item(
      name: 'Pants',
      unit: 'piece',
      price: 2500,
      image: '/images/pants.jpg'),
    Item(
      name: 'Skirt',
      unit: 'piece',
      price: 1800,
      image: '/images/skirt.jpg'),
    Item(
      name: 'Dress',
      unit: 'piece',
      price: 3000,
      image: '/images/dress.jpg'),
    
    Item(
      name: 'Coat',
      unit: 'piece',
      price: 4500,
      image: '/images/coat.jpg'),
    Item(name: 'Jumper', unit: 'Pc', price: 2800, image: '/images/jumper.jpg'),
    Item(
      name: 'Carpet',
      unit: 'piece',
      price: 12000,
      image: '/images/carpet.jpg'),
    Item(
      name: 'Duvet',
      unit: 'piece',
      price: 10000,
      image: '/images/duvet.jpg'),
	Item(
	name: 'Automotive', unit: 'wash', price: 2400, image: '/images/car.jpg'
	),
  ];

@override
  Widget build(BuildContext context) {
    final Controller cart = Get.put(Controller());
    void saveData(int index) {
    dbHelper
        .insert(
      Cart(
        id: index,
        productId: index.toString(),
        productName: products[index].name,
        initialPrice: products[index].price,
        productPrice: products[index].price,
        quantity: ValueNotifier(1),
        unitTag: products[index].unit,
        image: products[index].image,
      ),
    )
        .then((value) {
      cart.addTotalPrice(products[index].price.toDouble());
      cart.addAmount();
      showSnackBar();
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.blueGrey.shade200,
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image(
                  height: 80,
                  width: 80,
                  image: AssetImage(products[index].image.toString()),
                ),
                SizedBox(
                  width: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        text: TextSpan(
                            text: 'Name: ',
                            style: TextStyle(
                              color: Colors.blueGrey.shade800,
                              fontSize: 16.0),
                            children: [
                              TextSpan(
                                text:
                                  '${products[index].name.toString()}\n',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            ]),
                      ),
                      RichText(
                        maxLines: 1,
                        text: TextSpan(
                            text: 'Unit: ',
                            style: TextStyle(
                                color: Colors.blueGrey.shade800,
                                fontSize: 16.0),
                            children: [
                              TextSpan(
                                text: '${products[index].unit.toString()}\n',
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            ]),
                      ),
                      RichText(
                        maxLines: 1,
                        text: TextSpan(
                          text: 'Price: ' r"UGX",
                          style: TextStyle(
                            color: Colors.blueGrey.shade800,
                            fontSize: 16.0),
                            children: [
                              TextSpan(
                                text: '${products[index].price.toString()}\n',
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            ]),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade900),
                  onPressed: () {
                    saveData(index);
                  },
                  child: const Text('Add to Cart')),
              ],
            ),
          ),
        );
    });}
    
  showSnackBar() {
    return const SnackBar(
      content: Text("Added To Cart")
    );
  }
}
