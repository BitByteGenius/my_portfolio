import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.bgLight2,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          bool isTablet = constraints.maxWidth < 900;

          return isMobile
              // 📱 Mobile Layout (Column)
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "© 2026 • Built with Flutter",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whiteSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Bachelor of Computer Application ~ Maharaja college (2021-2024)",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: CustomColor.whiteSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )

              // 💻 Tablet + Desktop Layout (Row)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "© 2026 • Built with Flutter",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whiteSecondary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Bachelor of Computer Application ~ Maharaja college (2021-2024)",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: CustomColor.whiteSecondary,
                          fontSize: isTablet ? 12 : 14,
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}