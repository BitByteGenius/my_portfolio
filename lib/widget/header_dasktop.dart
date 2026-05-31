import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/nav_items.dart';
import 'package:my_portfollio/widget/site_logo.dart';

class HeaderDasktop extends StatelessWidget {
  const HeaderDasktop({super.key, required this.onNavMenuTap});

  final Function(int) onNavMenuTap;

 /* @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, CustomColor.bgLight1],
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          SiteLogo(onTap: () {}),

          const Spacer(),

          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {
                  onNavMenuTap(i);
                },
                child: Text(
                  navTitles[i],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }*/
  @override
Widget build(BuildContext context) {
  return Container(
    height: 70,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.transparent,
          CustomColor.bgLight1.withOpacity(0.9),
        ],
      ),
      borderRadius: BorderRadius.circular(50),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8,
        ),
      ],
    ),
    child: Row(
      children: [
        /// 🔹 Logo
        SiteLogo(onTap: () {}),

        const Spacer(),

        /// 🔹 Nav Items
        for (int i = 0; i < navTitles.length; i++)
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () => onNavMenuTap(i),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                child: Text(
                  navTitles[i],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
}
