import 'package:flutter/material.dart';
import 'favorites.dart';
import 'make_order.dart';
import 'tips.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Text("Home"),
            const Image(image: AssetImage("/images/laundry_pic.jpg")),
            IconButton(
              onPressed: () {
                Navigator.push( context,
                  MaterialPageRoute( builder: (context) => const MakeOrder()
              ),); },
              icon: const Icon(
                Icons.add_business ,
              ),
              tooltip: 'Start',
              iconSize: 72,
              color: Colors.black,
            ),
          IconButton(
              icon: const Icon(Icons.account_balance),
              tooltip: 'Account balance',
              onPressed: () => {
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => const Tips(),),
          ),},),
          IconButton(
              icon: const Icon(Icons.message),
              tooltip: 'Messages',
              onPressed: () => {
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => const Messages()),
                  ),
                },
            ),],),
    );
  }
}
