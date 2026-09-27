import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/skill_item.dart';

class SkillMoble extends StatelessWidget {
  const SkillMoble({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Core Specializations",
            style: TextStyle(
              color: CustomColor.primaryTeal,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Column(
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight2,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: CustomColor.glassBorder),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: CustomColor.scaffoldBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        platformItems[i]["img"]!,
                        width: 24,
                        height: 24,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.code, color: Colors.white, size: 20),
                      ),
                    ),
                    title: Text(
                      platformItems[i]["title"]!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "Technologies & Tools",
            style: TextStyle(
              color: CustomColor.primaryTeal,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.start,
            children: [
              for (int i = 0; i < skillItems.length; i++)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight2,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: CustomColor.glassBorder),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        skillItems[i]["img"]!,
                        width: 18,
                        height: 18,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.build, size: 14, color: Colors.white),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        skillItems[i]["title"]!,
                        style: const TextStyle(
                          color: CustomColor.whiteSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// Alias for backward compatibility
typedef SkillMobile = SkillMoble;
