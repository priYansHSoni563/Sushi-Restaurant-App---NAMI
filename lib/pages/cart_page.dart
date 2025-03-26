import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove from cart
  void removeFromCart(Food food, BuildContext context) {
    HapticFeedback.mediumImpact();
    // get  access to shop
    final shop = context.read<Shop>();

    // remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            "My Cart",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            // Customer cart
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get food from cart
                  final Food food = value.cart[index];

                  // get food image
                  final String foodImage = food.imagePath;

                  // get food name
                  final String foodName = food.name;

                  // get food price
                  final String foodPrice = food.price;

                  // return list
                  return Container(
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      leading: Image.asset(foodImage),
                      title: Text(
                        foodName,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Rs $foodPrice",
                        style: TextStyle(
                          color: Colors.grey[200],
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => removeFromCart(food, context),
                        icon: Icon(
                          Icons.delete_rounded,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Pay Button
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "Pay Now",
                ontap: () {
                  HapticFeedback.mediumImpact();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
