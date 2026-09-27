import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/utils/exprience_utils.dart';
import 'package:my_portfollio/widget/exprience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      color: CustomColor.scaffoldBg,
      child: Column(
        children: [
          // SECTION HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 30, height: 2, color: CustomColor.primaryTeal),
              const SizedBox(width: 12),
              const Text(
                "Work Experience",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: CustomColor.whitePrimary,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(width: 12),
              Container(width: 30, height: 2, color: CustomColor.primaryTeal),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "My professional software development trajectory & key roles",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CustomColor.hintDark,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 40),

          // CARDS CONTAINER
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              children: [
                for (int i = 0; i < experienceList.length; i++) ...[
                  ExperienceCard(exprience: experienceList[i]),
                  if (i != experienceList.length - 1) const SizedBox(height: 24),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Alias for backward compatibility
typedef ExprienceSection = ExperienceSection;
