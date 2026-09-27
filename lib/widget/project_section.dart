import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/utils/project_utils.dart';
import 'package:my_portfollio/widget/project_card.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      color: CustomColor.bgLight1.withValues(alpha: 0.5),
      child: Column(
        children: [
          // SECTION HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 30, height: 2, color: CustomColor.primaryTeal),
              const SizedBox(width: 12),
              const Text(
                "Featured Projects",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
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
            "Production-ready web & mobile applications built with Flutter",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CustomColor.hintDark,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 40),

          // PROJECT CARDS GRID
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < workProjectUtils.length; i++)
                  ProjectCard(project: workProjectUtils[i]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
