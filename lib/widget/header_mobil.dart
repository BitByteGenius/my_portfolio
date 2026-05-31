import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/widget/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  /*@override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, CustomColor.bgLight1],
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      child: Row(
        children: [
          SiteLogo(onTap: onLogoTap),
          const Spacer(),
          IconButton(onPressed: onMenuTap, icon: const Icon(Icons.menu)),
          const SizedBox(width: 15),
        ],
      ),
    );
  }*/
  @override
Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  return Container(
    height: 60,
    margin: EdgeInsets.symmetric(
      horizontal: width < 600 ? 15 : 25,
      vertical: 10,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 12),
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
        SiteLogo(onTap: onLogoTap),
        const Spacer(),

        /// 🔹 Styled Menu Button
        InkWell(
          onTap: onMenuTap,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: CustomColor.bgLight2,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ],
    ),
  );
}
}
