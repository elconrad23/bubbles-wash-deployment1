
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'logic/cart_provider.dart';
import 'screens/favorites.dart';
import 'screens/home.dart';
import 'screens/orders.dart';
import 'screens/settings.dart';
import 'widgets/app_bar.dart';
import 'package:get/get.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Future.delayed(const Duration(seconds: 3));
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const BarBozWashApp());
  FirebaseAuth.instance;
}

class BarBozWashApp extends StatefulWidget {
  const BarBozWashApp({super.key});

  @override
  State<BarBozWashApp> createState() => _BarBozWashState();
}

class _BarBozWashState extends State<BarBozWashApp> {
  int currentPageIndex = 0;
  // ignore: non_constant_identifier_names
  Color HexaColor(String strcolor, {int opacity = 15}){ //opacity is optional value
    strcolor = strcolor.replaceAll("#", "#0718C4"); //replace "#" with empty value
    String stropacity = opacity.toRadixString(16); //convert integer opacity to Hex String
    // ignore: prefer_interpolation_to_compose_strings
    return Color(int.parse(stropacity + stropacity + strcolor.substring(1), radix: 16));
    //here color format is 0xFFDDDDDD, where FF is opacity, and DDDDDD is Hex Color
  }
  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Orders(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(
        builder: (context) {
          return GetMaterialApp(
            home: Scaffold(
              appBar: CustomAppBar(
                title: "Bubbles Wash",
                backgroundColor: HexaColor("#"),
                leading: const Image(image: AssetImage('/icon/logo-color.png')),
                actions: [
                  IconButton(icon: const Icon(Icons.menu,),
                    onPressed: () => {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Messages(),),),},),
                ],),
              body: Center(
                child: _widgetOptions.elementAt(currentPageIndex,)
                ) ,
                bottomNavigationBar: NavigationBar(
                  onDestinationSelected: (int index) {
                    setState(() {
                      currentPageIndex = index;
                    });
                },
                indicatorColor: Colors.amber[800],
                selectedIndex: currentPageIndex,
                destinations: const <Widget>[

                  NavigationDestination(
                    key: Key("Home()"),
                    selectedIcon: Icon(Icons.home),
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    key: Key("Orders()"),
                    icon: Icon(Icons.analytics),
                    selectedIcon: Icon(Icons.analytics) ,
                    label: 'Orders',
                  ),
                  
                  NavigationDestination(
                    key: Key("Settings()"),
                    selectedIcon: Icon(Icons.settings),
                    icon: Icon(Icons.settings_outlined),
                    label: 'Settings',
                  ),
                ],
              ),
            ),
          );}
        ),);
  }
}
