import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';

class AppDialog {
  static void showProjectDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        final width = MediaQuery.of(context).size.width;

        // 🔥 Responsive width
        double dialogWidth;
        if (width > 900) {
          dialogWidth = 500; // desktop
        } else if (width > 600) {
          dialogWidth = 400; // tablet
        } else {
          dialogWidth = width * 0.9; // mobile
        }

        return AlertDialog(
          backgroundColor: CustomColor.bgLight2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

          title: Text(
            title,
            style: const TextStyle(
              color: CustomColor.whitePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),

          content: SizedBox(
            width: dialogWidth,
            child: SingleChildScrollView(
              child: Text(
                content,
                style: const TextStyle(
                  color: CustomColor.whiteSecondary,
                ),
              ),
            ),
          ),

          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}