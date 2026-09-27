import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';

class AppDialog {
  static void showProjectDialog({
    required BuildContext context,
    required String title,
    required String content,
    List<String> techStack = const [],
  }) {
    showDialog(
      context: context,
      builder: (context) {
        final width = MediaQuery.of(context).size.width;

        double dialogWidth;
        if (width > 900) {
          dialogWidth = 560;
        } else if (width > 600) {
          dialogWidth = 460;
        } else {
          dialogWidth = width * 0.88;
        }

        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Container(
            width: dialogWidth,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: CustomColor.bgLight1,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: CustomColor.primaryTeal.withValues(alpha: 0.3), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 20,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: CustomColor.whitePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: CustomColor.whiteSecondary),
                      splashRadius: 20,
                    ),
                  ],
                ),
                const Divider(color: CustomColor.glassBorder, height: 24),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 350),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          content,
                          style: const TextStyle(
                            color: CustomColor.whiteSecondary,
                            fontSize: 15,
                            height: 1.6,
                          ),
                        ),
                        if (techStack.isNotEmpty) ...[
                          const SizedBox(height: 20),
                          const Text(
                            "Technologies & Tools",
                            style: TextStyle(
                              color: CustomColor.primaryTeal,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: techStack
                                .map((tech) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: CustomColor.bgLight2,
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                            color: CustomColor.primaryTeal.withValues(alpha: 0.4)),
                                      ),
                                      child: Text(
                                        tech,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: CustomColor.primaryTeal,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Close",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}