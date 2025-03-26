import 'package:flutter/material.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/pages/menu_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
            // Shop Name
            Text(
              "SUSHI MAN",
              style: TextStyle(
                fontFamily: 'DMSerifDisplay',
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            // Icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(
                "lib/images/gunkan.png",
              ),
            ),
            // Title
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style: TextStyle(
                fontFamily: 'DMSerifDisplay',
                color: Colors.white,
                fontSize: 44,
              ),
            ),
            // Subtitle
            Text(
              "Feel the taste of the most popular Japanese food from anywhere and anytime",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2,
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            // Get Started Button
            MyButton(
              text: "Get Started",
              ontap: () {
                // go to menu page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
