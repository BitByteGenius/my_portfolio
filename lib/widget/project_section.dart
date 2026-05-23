import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/utils/project_utils.dart';
import 'package:my_portfollio/widget/project_card.dart';

class ProjectSection extends StatelessWidget {
   ProjectSection({super.key, });

  //final double screenWidth;
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      width: screenWidth,
      child: Column(
        children: [
          //----Work Project title---
          const Text(
            "Work Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          //------Work Project Card-----
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < workProjectUtils.length; i++)
                  ProjectCard(project: workProjectUtils[i]),
              ],
            ),
          ),
          const SizedBox(height: 50),

          //----Hobby Project title---
          const Text(
            "Hobby Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          //------Hobby Project Card-----
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < hobbyProjectUtils.length; i++)
                  ProjectCard(project: hobbyProjectUtils[i]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
