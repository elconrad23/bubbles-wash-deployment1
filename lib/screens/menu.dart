import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import 'about_us.dart';
import 'tips.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Menu',
        backgroundColor: Colors.lightGreenAccent,
        leading: Image(image: AssetImage('/icon/logo.png')),
        actions: [
          Text("."),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children:[
          Column(
            children:[
              const SizedBox(
                height: 3.3,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextButton(
                  onPressed: () => {
                    Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => const Tips()),
                    ),
                  },
                  child: const Text('Find Information') ,),
              ),

              Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextButton(
                  onPressed: () => {
                    Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUs()),
                    ),
                  },
                  child: const Text('About Us') ,),
              ),

              const Padding(
                padding: EdgeInsets.all(9.0),
                child: Text('Contact Us: +256703862204 bubbleswashug@gmail.com'),
                ),
            ],
          ),
        ],
    ),);
  }
}