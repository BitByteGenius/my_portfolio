import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/size.dart';
import 'package:my_portfollio/utils/project_utils.dart';
import 'package:my_portfollio/widget/project_card.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

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
          color: CustomColor.bgLight1.withValues(alpha: 0.5),
          child: Column(
            children: [
              // SECTION HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 28, height: 2, color: CustomColor.primaryTeal),
                  const SizedBox(width: 10),
                  const Text(
                    "Featured Projects",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
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
                "Production-ready web & mobile applications built with Flutter",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CustomColor.hintDark,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 28),

              // PROJECT CARDS GRID
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1080),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
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
      },
    );
  }
}
