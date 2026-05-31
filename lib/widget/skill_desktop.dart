import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/skill_item.dart';

class SkillDesktop extends StatelessWidget {
  const SkillDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 450),
  child: Wrap(
    spacing: 10,
    runSpacing: 10,
    children: platformItems.map((item) {
      return SizedBox(
        width: 220,
        child: Container(
          decoration: BoxDecoration(
            color: CustomColor.bgLight2,
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            leading: Image.asset(
              item["img"],
              width: 26,
            ),
            title: Text(
              item["title"],
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }).toList(),
  ),
),
        const SizedBox(width: 50),

        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  Chip(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    backgroundColor: CustomColor.bgLight2,
                    label: Text(skillItems[i]["title"]),
                    avatar: Image.asset(skillItems[i]["img"]),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
