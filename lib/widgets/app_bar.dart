// ignore_for_file: non_constant_identifier_names
import 'package:badges/badges.dart' as badges ;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../logic/cart_provider.dart';
import '../logic/controller.dart';
import '../screens/cart_screen.dart';
import '../screens/menu.dart';
import '../screens/notifications.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title ;
  Color HexaColor(String strcolor, {int opacity = 15}) {
  if (strcolor.isEmpty) {
    // Handle empty string: return default color (fully opaque white)
    return Colors.white;
  }

  strcolor = strcolor.replaceAll("#", "#0718C4"); // Replace "#" with empty value
  String stropacity = opacity.toRadixString(16); // Convert integer opacity to Hex String
  String hexValue = stropacity + stropacity + strcolor.substring(1); // Concatenate strings
  return Color(int.parse(hexValue, radix: 16));
  // Color format is 0xFFDDDDDD, where FF is opacity, and DDDDDD is Hex Color
}

  const CustomAppBar({super.key, required this.title, required Color backgroundColor, required List actions, required leading  });
  @override
  Widget build(BuildContext context) {
    final Controller cart = Get.put(Controller());

    return AppBar(
      title: Obx(() => Text("Clicks: ${cart.count}")),
      backgroundColor: HexaColor("#"),
      leading:const Image(image: AssetImage('/icon/logo-color.png')),
      actions: [
        badges.Badge( badgeContent: Consumer<CartProvider>(
          builder: (context, value, child) {
            return Text(
              value.getCounter().toString(),
              style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            );
          },
        ),
        // position: const BadgePosition(start: 30, bottom: 30),
        child: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen()));
          },
          icon: const Icon(Icons.shopping_cart),
          ),
        ),
        IconButton(onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Notifications()),
          ),
        },icon: const Icon(Icons.notification_important_rounded)),
        IconButton(onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Menu()),
          ),
        }, icon: const Icon(Icons.menu)),
        const SizedBox(
          width: 20.0,
          height: 3.69,
        ),
      ],
    );
  }

@override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
