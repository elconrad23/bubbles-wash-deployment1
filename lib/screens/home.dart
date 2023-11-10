import 'package:flutter/material.dart';
import 'favorites.dart';
import 'make_order.dart';

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
          const Text("Magical Care"),
            const Image(image: AssetImage("/images/laundry_pic.jpg")),
            OutlinedButton (
              onPressed: () {
                Navigator.push( context,
                  MaterialPageRoute( builder: (context) => const MakeOrder()
              ),); },
              child: const Row(
            children: [
              Text("Wash"),
              Icon(Icons.add_business,),
        ],),),
          OutlinedButton (
              onPressed: () => {
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => const Messages()),
                  ),
                },
            child: const Row(
            children: [
              Text("Contact us"),
              Icon(Icons.message,
            ),],),),],),
    );
  }
}
