import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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