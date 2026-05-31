/*import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/images.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
     final screenHeight = screenSize.height;


    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hi, \nI'm Rahul Kumar Singh \n A Flutter Developer",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text("Get in touch"),
                ),
              ),
            ],
          ),
          Image.asset(CustomImages.profileImage, width: screenWidth / 2),
           /*Expanded(
            flex: 3,
            child: Image.asset(
              CustomImages.profileImage,
              fit: BoxFit.contain,)),*/
        ],
      ),
    );
  }
}*/


import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/images.dart';
import 'package:my_portfollio/widget/blinking_dot.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      height: size.height * 0.85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          /// LEFT SIDE (TEXT)
          /*Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi,\nI'm Rahul Kumar Singh\n",
                  style: TextStyle(
                    fontSize: size.width * 0.025,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: CustomColor.whitePrimary,
                  ),
                ),
                Text(
                  "Full Stack Flutter Developer creating scalable solutions \n with a strong focus on clean and robust architecture",
                  style: TextStyle(
                    fontSize: size.width * 0.020,
                   // fontWeight: FontWeight.bold,
                    height: 1,
                    color: CustomColor.whitePrimary,
                  ),
                ),
                const SizedBox(height: 20),
                /*SizedBox(
                  width: 220,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("AVAILABLE FOR OPPORTUNITIES"),
                  ),
                ),*/

                SizedBox(
  width: 260,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    onPressed: () {},
    child: FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          BlinkingDot(),
          SizedBox(width: 10),
          Text("AVAILABLE FOR OPPORTUNITIES"),
        ],
      ),
    ),
  ),
),
              ],
            ),
          ),*/

          Expanded(
  flex: 2,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// 👋 Greeting
      Text(
        "Hi,",
        style: TextStyle(
          fontSize: size.width * 0.018,
          color: Colors.grey.shade400,
        ),
      ),

      /// 👨‍💻 Name (Highlighted)
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "I'm ",
              style: TextStyle(
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: "Rahul Kumar Singh",
              style: TextStyle(
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [Colors.teal, Colors.greenAccent],
                  ).createShader(Rect.fromLTWH(0, 0, 300, 70)),
              ),
            ),
          ],
        ),
      ),

      const SizedBox(height: 20),

      /// 💼 Description
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Text(
          "Full Stack Flutter Developer crafting scalable, high-performance apps with a strong focus on clean architecture and seamless user experience.",
          style: TextStyle(
            fontSize: size.width * 0.018,
            height: 1.6,
            color: Colors.grey.shade300,
          ),
        ),
      ),

      const SizedBox(height: 30),

      /// 🚀 CTA Button
      SizedBox(
        width: 280,
        child: FittedBox(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            onPressed: () {},
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.teal, Colors.green],
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Container(
                width: 300,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    BlinkingDot(),
                    SizedBox(width: 10),
                    Text(
                      "AVAILABLE FOR OPPORTUNITIES",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  ),
),

          /// RIGHT SIDE (IMAGE)
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                CustomImages.profileImage,
                height: size.height * 0.7,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}