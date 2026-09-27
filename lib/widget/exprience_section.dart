import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/size.dart';
import 'package:my_portfollio/utils/exprience_utils.dart';
import 'package:my_portfollio/widget/exprience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth >= rDesktopwidth;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: isDesktop ? 48 : 36,
            horizontal: 20,
          ),
          color: CustomColor.scaffoldBg,
          child: Column(
            children: [
              // SECTION HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 28, height: 2, color: CustomColor.primaryTeal),
                  const SizedBox(width: 10),
                  const Text(
                    "Work Experience",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: CustomColor.whitePrimary,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(width: 28, height: 2, color: CustomColor.primaryTeal),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "My professional software development trajectory & key roles",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CustomColor.hintDark,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 28),

              // CARDS CONTAINER
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 950),
                child: Column(
                  children: [
                    for (int i = 0; i < experienceList.length; i++) ...[
                      ExperienceCard(exprience: experienceList[i]),
                      if (i != experienceList.length - 1) const SizedBox(height: 16),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Alias for backward compatibility
typedef ExprienceSection = ExperienceSection;
