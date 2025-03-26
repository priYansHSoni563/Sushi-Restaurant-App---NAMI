import 'package:flutter/material.dart';
import 'package:sushi_app/theme/colors.dart';

class RedeemPage extends StatefulWidget {
  const RedeemPage({super.key});

  @override
  State<RedeemPage> createState() => _RedeemPageState();
}

class _RedeemPageState extends State<RedeemPage> {
  // TextEditingController to get the redeem code input from the user
  final TextEditingController _redeemCodeController = TextEditingController();

  // Function to handle redeem logic
  void _redeemCode() {
    final code = _redeemCodeController.text;
    if (code.isNotEmpty) {
      // Here you can add your redeem code validation
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: primaryColor,
            title: const Text(
              "Redeem Successful",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            content: Text(
              "Code: $code has been redeemed!",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              TextButton(
                child: const Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();

                  clear();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: primaryColor,
            title: const Text(
              "Error",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            content: const Text(
              "Please enter a redeem code.",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              TextButton(
                child: const Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  clear();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void clear() {
    _redeemCodeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "Redeem",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
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
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                    SizedBox(height: 10),
                    Text(
                      "Code - ERST-Gkjbe-Jiebf",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),
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
          // Content of the redeem page
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Enter Redeem Code',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  // Redeem code input field
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _redeemCodeController,
                    decoration: InputDecoration(
                      hintText: 'Enter code',
                      filled: true,
                      // ignore: deprecated_member_use
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 4.0,
        shadowColor: Colors.black,
        shape: const CircularNotchedRectangle(),
        child: // Redeem button
            ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            backgroundColor: primaryColor,
          ),
          onPressed: _redeemCode,
          child: const Text(
            'Redeem',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
