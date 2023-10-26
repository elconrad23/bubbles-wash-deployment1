import 'package:flutter/material.dart';
import 'package:bubbles_wash_app/screens/widget_tree.dart';
import 'about_us.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                      builder: (context) => const WidgetTree()),
                    ),
                  },
                  child: const Text('My Account') ,),
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

              Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextButton(
                  onPressed: () {  },
                  child: const Text('Contact Us'),
                ),
              ),
            ],
          ),
        ],
    );
  }
}