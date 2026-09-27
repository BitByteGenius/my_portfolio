import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.hintText,
    this.prefixIcon,
  });

  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(
        color: CustomColor.whitePrimary,
        fontSize: 14,
      ),
      cursorColor: CustomColor.primaryTeal,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        filled: true,
        fillColor: CustomColor.bgLight2,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: CustomColor.hintDark, size: 20)
            : null,
        hintText: hintText,
        hintStyle: const TextStyle(color: CustomColor.hintDark, fontSize: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: CustomColor.glassBorder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: CustomColor.primaryTeal, width: 1.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: CustomColor.glassBorder, width: 1),
        ),
      ),
    );
  }
}
