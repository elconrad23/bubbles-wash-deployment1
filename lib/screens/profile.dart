import 'package:flutter/material.dart';
import 'package:bubbles_wash_app/widgets/app_bar.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'edit_info.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

final User? user = Auth().currentUser;

Future<void> signOut() async {
await Auth().signOut();
}

Widget userUid(){
  return Text(user?.email ?? 'User email');
}

Widget userName(){
  return const Text('Username');
}

Widget _signOutButton(){
  return ElevatedButton(onPressed: signOut,
  child: const Text('SignOut'),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Profile',
        leading: Image(image: AssetImage('/icon/logo.png')),
        backgroundColor: Colors.black54,
        actions: [
          
        ],),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          userUid(),
          userName(),
          InkWell(
            child: const Row(
              children: [
                Icon(Icons.person ),
                Text("Edit personal info"),
              ],
            ),
            onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditInfo()),
            ),
          ),
          _signOutButton(),
        ]),
      ),
    );
  }
}