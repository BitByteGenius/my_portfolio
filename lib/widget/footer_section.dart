import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min, 
        children: [
          Text(
            "Made by Rahul Kumar Singh",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomColor.whiteSecondary,
              
            ),
          ),
          const SizedBox(width: 10), 
          Image.asset(
            "assets/i2.png", 
            width: 120, 
          ),
        ],
      ),
    );
  }
}