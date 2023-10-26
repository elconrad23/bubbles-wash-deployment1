import 'package:flutter/material.dart';

class Tips extends StatelessWidget {
  const Tips({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      
      child: Column(children: [
        Text("Tips to come"),
        Text("How to wash different colors"),
        Text("How to wash in orderly manner"),
      ],)
      
    );
  }
}