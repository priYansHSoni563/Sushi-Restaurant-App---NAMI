import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/components/food_tile.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/pages/cart_page.dart';
import 'package:sushi_app/pages/food_details_page.dart';
import 'package:sushi_app/pages/redeem_page.dart';
import 'package:sushi_app/theme/colors.dart';

class MenuPage extends StatefulWidget {
  // final void Function()? onTap;
  const MenuPage({
    super.key,
    // required this.onTap,/
  });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // navigate to food details page
  void navigateToFoodDetails(int index) {
    // get the shop and its item menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  // Change Color of Heart Icon
  bool _isFavorited = false;

  void _toggleFavorite() {
    HapticFeedback.mediumImpact();
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    // get the shop and its item menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "N A M I",
          style: TextStyle(
            fontFamily: 'DMSerifDisplay',
          ),
        ),
        leading: Icon(
          Icons.menu,
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                // cart button
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_sharp),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Promo Banner

          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Promo message
                    const Text(
                      "Get 32% Promo",
                      style: TextStyle(
                          fontFamily: 'SourceSerif4',
                          fontSize: 20,
                          color: Colors.white),
                    ),

                    const SizedBox(height: 20),

                    // redeem button
                    MyButton(
                      text: "Redeem ",
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RedeemPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                // image
                Image.asset(
                  'lib/images/Many_Shushi.png',
                  height: 100,
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // // Search Bar
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       focusedBorder: OutlineInputBorder(
          //         borderSide: const BorderSide(color: Colors.white),
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       enabledBorder: OutlineInputBorder(
          //           borderSide: const BorderSide(color: Colors.white),
          //           borderRadius: BorderRadius.circular(20)),
          //       hintText: "Search here..",
          //       icon: const Icon(Icons.search_rounded),
          //     ),
          //   ),
          // ),

          // Menu List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 28,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                ontap: () => navigateToFoodDetails(index),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Popular Item",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 28),
            ),
          ),
          SizedBox(height: 10),

          // Popular Food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset(
                      "lib/images/inari-maki.png",
                      height: 60,
                    ),
                    const SizedBox(height: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        const Text(
                          "Inari Sushi",
                          style: TextStyle(
                              fontFamily: 'SourceSerif4', fontSize: 18),
                        ),

                        const SizedBox(height: 10),

                        // price
                        Text(
                          "Rs 4000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                // Heart
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: _isFavorited
                        ? const Color.fromARGB(255, 255, 76, 106)
                        : Colors.grey,
                  ),
                  onPressed: _toggleFavorite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
