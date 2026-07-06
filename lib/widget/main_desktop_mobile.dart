import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/images.dart';
import 'package:my_portfollio/widget/blinking_dot.dart';

/*class MainDesktopMobile extends StatelessWidget {
  const MainDesktopMobile({super.key});

  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: screenHeight,
      constraints: const BoxConstraints(minHeight: 560.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  CustomColor.scaffoldBg.withOpacity(0.6),
                  CustomColor.scaffoldBg.withOpacity(0.6),
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(CustomImages.profileImage, width: screenWidth),
          ),
          const SizedBox(height: 30),
          //=========intro  =================
          const Text(
            "Hi, \nI'm Rahul Kumar Singh \n A Flutter Developer",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.5,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 180,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                
              },
              child: const Text("Get in touch"),
            ),
          ),
        ],
      ),
    );
  }
}*/


class MainDesktopMobile extends StatelessWidget {
  const MainDesktopMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.03,
        ),
        constraints: const BoxConstraints(minHeight: 560),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    CustomColor.scaffoldBg.withValues(alpha: 0.6),
                    CustomColor.scaffoldBg.withValues(alpha: 0.6),
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Image.asset(
                CustomImages.profileImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            /// TEXT
           /* Text(
              "Hi, \nI'm Rahul Kumar Singh \n A Flutter Developer",
              style: TextStyle(
                fontSize: size.width * 0.05, // responsive
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: CustomColor.whitePrimary,
              ),
            ),

            const SizedBox(height: 15),

            /// BUTTON
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
),*/

Text(
  "Hi,",
  style: TextStyle(
    fontSize: size.width * 0.05,
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
          fontSize: size.width * 0.04,
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
      fontSize: size.width * 0.03,
      height: 1.6,
      color: Colors.grey.shade300,
    ),
  ),
),

const SizedBox(height: 30),

/// 🚀 CTA Button
SizedBox(
  width: 250,
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
              Flexible(
                child: Text(
                  "AVAILABLE FOR OPPORTUNITIES",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
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
    );
  }
}
