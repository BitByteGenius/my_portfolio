import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, 
  //required this.getInputBorder, 
   this.controller, 
   this.maxLines = 1,
   this.hintText,});

  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;

  //final OutlineInputBorder getInputBorder;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: CustomColor.scaffoldBg),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: CustomColor.whiteSecondary,
        focusedBorder: getInputBorder,
        enabledBorder: getInputBorder,
        border: getInputBorder,
        hintText: hintText,
        hintStyle: TextStyle(color: CustomColor.hintDark),
      ),
    );
  }
   OutlineInputBorder get getInputBorder{
    return OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide.none,
    );
  }
}
