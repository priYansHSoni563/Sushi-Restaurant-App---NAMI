import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? ontap;
  const MyButton({
    super.key,
    required this.text,
    required this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(109, 140, 94, 91),
          borderRadius: BorderRadius.circular(40)
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // text
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
      
            const SizedBox(width: 10),
      
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
