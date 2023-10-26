import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class EditInfo extends StatelessWidget {
  const EditInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Edit Personal Information',
        leading: Image(image: AssetImage('/icon/logo.png')),
        backgroundColor: Colors.lightGreenAccent,
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
                  onPressed: () =>{},
                  child: const Text('Submit') ,),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextButton(
                  onPressed: () {
                  },
                  child: const Text('Cancel'),
                ),
              ),
            ],
          ),
        ],
    ),);
  }
}