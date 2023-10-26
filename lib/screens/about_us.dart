import 'package:flutter/material.dart';
import 'package:bubbles_wash_app/widgets/app_bar.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  Widget mission() {
    return const Text(
      'Our Mission: To harness, equip, guide and prosper young talent for prosperity');
  }

  Widget vision() {
    return const Text(
      '\n Our Vision: Specialization for efficient and sustainable development');
  }

  Widget aboutUsSizedBox (){
    return const SizedBox (width: 1.3,
    height: 1.3,
    );
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "About Us",
        backgroundColor: Colors.purpleAccent,
        leading: Image(image: AssetImage('/icon/logo.png')),
        actions: [
          Text("..."),
        ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            mission(),
            aboutUsSizedBox(),
            vision(),
            aboutUsSizedBox(),
            const Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Image(image: AssetImage('/images/laundry_pic.png')),
            ],),

            const Card(
              child: Text('Bubbles Wash'),
            ),
            const Card(
              child: Text('Bubbles Wash is a one stop laundry shop.'),
            ),
            const Card(
              child: Text('Services'),
            ),
            const Card(
              child: Text('We strive to operate with utmost speed and care to deliver your clean laundry back in time.'),
            ),
          ],
        ),
      ),
    );
  }
}
