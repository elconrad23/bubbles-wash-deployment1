import 'package:flutter/material.dart';
import 'favorites.dart';
import 'make_order.dart';
import 'tips.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text("Your Orders"),
            const Image(image: AssetImage("/images/done_laundry.jpg")),
            IconButton(
              onPressed: () {
                Navigator.push( context,
                  MaterialPageRoute( builder: (context) => const MakeOrder()),
                );
              },
              icon: const Icon(
                Icons.play_arrow,
              ),
              tooltip: 'Start',
              iconSize: 72,
              color: Colors.white70,
            ),

            Card(
              child: IconButton(
                icon: const Icon(Icons.tips_and_updates),
                onPressed: () => {
                    Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => const Tips(),),
            ),},),),
            Card(
              child: IconButton(
                icon: const Icon(Icons.tips_and_updates),
                onPressed: () => {
                    Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => const Messages()),
                    ),
                  },
              ),),
          ],
        ),
    );
  }
}
