import 'package:flutter/material.dart';
import 'package:sushi_app/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? ontap;
  const FoodTile({
    super.key,
    required this.food,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image
            Image.asset(
              food.imagePath,
              height: 140,
            ),

            // Text
            Text(
              food.name,
              style: const TextStyle(fontFamily: 'SourceSerif4', fontSize: 20),
            ),

            // Price + Rating
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // price
                  Text(
                    "Rs ${food.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),

                  // rating
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        food.rating,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
