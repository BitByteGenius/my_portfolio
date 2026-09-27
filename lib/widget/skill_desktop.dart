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
        // PLATFORMS & SERVICES (LEFT COLUMN)
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Core Specializations",
                style: TextStyle(
                  color: CustomColor.primaryTeal,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: platformItems.map((item) {
                  return SizedBox(
                    width: 400,
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomColor.bgLight2,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: CustomColor.glassBorder),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 6,
                        ),
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: CustomColor.scaffoldBg,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            item["img"]!,
                            width: 28,
                            height: 28,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.code, color: Colors.white),
                          ),
                        ),
                        title: Text(
                          item["title"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),

        const SizedBox(width: 50),

        // TECH STACK & TOOLS (RIGHT COLUMN)
        Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 550),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Technologies & Frameworks",
                  style: TextStyle(
                    color: CustomColor.primaryTeal,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: skillItems.map((skill) {
                    return _SkillChip(
                      title: skill["title"]!,
                      img: skill["img"]!,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String title;
  final String img;

  const _SkillChip({required this.title, required this.img});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isHovered
              ? CustomColor.primaryTeal.withValues(alpha: 0.2)
              : CustomColor.bgLight2,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isHovered ? CustomColor.primaryTeal : CustomColor.glassBorder,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: CustomColor.primaryTeal.withValues(alpha: 0.3),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              widget.img,
              width: 20,
              height: 20,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.build, size: 16, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Text(
              widget.title,
              style: TextStyle(
                color: isHovered ? Colors.white : CustomColor.whiteSecondary,
                fontWeight: isHovered ? FontWeight.bold : FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
