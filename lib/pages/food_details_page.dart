import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/theme/colors.dart';

import '../models/food.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // Change Color of Heart Icon
  bool _isFavorited = false;

  void _toggleFavorite() {
    HapticFeedback.mediumImpact();
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  // quantity
  int quantityCount = 0;

  // decrement quantity
  void decrementQuantity() {
    HapticFeedback.mediumImpact();
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  // increment quantity
  void incrementQuantity() {
    HapticFeedback.mediumImpact();
    setState(() {
      quantityCount++;
    });
  }

  addToCart() {
    HapticFeedback.mediumImpact();
    // only add to cart if there something in the cart
    if (quantityCount > 0) {
      // get access to shop
      final shop = context.read<Shop>();

      // add to  cart
      shop.addtocart(widget.food, quantityCount);

      // let the user know it was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          contentPadding: const EdgeInsets.all(15),
          backgroundColor: primaryColor,
          content: const Text(
            "Successfully added to cart",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            // okay button
            IconButton(
                onPressed: () {
                  // pop once to remove dialog box
                  Navigator.pop(context);

                  // pop again to go previous screen
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.done_rounded,
                  color: Colors.white,
                ))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                // cart button
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            // listview of food details
            Expanded(
              child: ListView(
                children: [
                  // Image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),

                  const SizedBox(width: 5),

                  // Rating
                  Row(
                    children: [
                      // Star Icon
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.yellow[800],
                      ),

                      // Rating Number
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  //  Food Name
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontFamily: 'SourceSerif4',
                      fontSize: 28,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.food.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),

            // price +  + add to cart button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: primaryColor,
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      // price + quantity
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // price
                          Text(
                            "Rs ${widget.food.price}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),

                          // quantity
                          Row(
                            children: [
                              // minus button
                              Container(
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: decrementQuantity,
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              // quantity count
                              SizedBox(
                                width: 40,
                                child: Center(
                                  child: Text(
                                    quantityCount.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              // plus button
                              Container(
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: incrementQuantity,
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // add to cart button
                      MyButton(
                        text: "Add To Cart",
                        ontap: addToCart,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
