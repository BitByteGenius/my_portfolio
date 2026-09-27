import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/images.dart';
import 'package:my_portfollio/widget/blinking_dot.dart';

class MainDesktop extends StatelessWidget {
  final VoidCallback? onContactTap;
  final VoidCallback? onProjectsTap;

  const MainDesktop({
    super.key,
    this.onContactTap,
    this.onProjectsTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: const BoxConstraints(minHeight: 620),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.08,
        vertical: 40,
      ),
      child: Row(
        children: [
          // LEFT SIDE (TEXT & CTA)
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Available Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: CustomColor.primaryGreen.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: CustomColor.primaryGreen.withValues(alpha: 0.4),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      BlinkingDot(color: CustomColor.primaryGreen, size: 8),
                      SizedBox(width: 8),
                      Text(
                        "AVAILABLE FOR NEW OPPORTUNITIES",
                        style: TextStyle(
                          color: CustomColor.primaryGreen,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Greeting
                const Text(
                  "Hello, I'm",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.whiteSecondary,
                  ),
                ),
                const SizedBox(height: 6),
                // Dynamic Gradient Name
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      CustomColor.whitePrimary,
                      CustomColor.primaryTeal,
                      CustomColor.primaryGreen,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Text(
                    "Rahul Kumar Singh",
                    style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Sub-heading Role
                Row(
                  children: [
                    Container(
                      height: 2,
                      width: 28,
                      color: CustomColor.primaryTeal,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Senior Flutter & Full Stack Engineer",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.primaryTeal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Description
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 580),
                  child: const Text(
                    "Passionate software developer specializing in building beautiful, cross-platform mobile & web applications. Expert in Dart, Flutter, Clean Architecture, REST APIs, and scalable backend integrations.",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: CustomColor.whiteSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // CTA Action Buttons
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    ElevatedButton.icon(
                      onPressed: onContactTap,
                      icon: const Icon(Icons.mail_outline_rounded, size: 18),
                      label: const Text("Get In Touch"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColor.primaryTeal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 8,
                        shadowColor: CustomColor.primaryTeal.withValues(alpha: 0.4),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: onProjectsTap,
                      icon: const Icon(Icons.folder_special_outlined, size: 18),
                      label: const Text("View Projects"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: CustomColor.whitePrimary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26,
                          vertical: 18,
                        ),
                        side: BorderSide(
                          color: CustomColor.primaryTeal.withValues(alpha: 0.6),
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                // Quick Stat Badges
                Row(
                  children: const [
                    _StatBadge(label: "Experience", value: "1.5 Yrs"),
                    _StatDivider(),
                    _StatBadge(label: "Projects Built", value: "11+"),
                    _StatDivider(),
                    _StatBadge(label: "Students Mentored", value: "800+"),
                  ],
                ),
              ],
            ),
          ),
          // RIGHT SIDE (PROFILE IMAGE WITH GLOW)
          Expanded(
            flex: 5,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Ambient Background Glow
                  Container(
                    width: 320,
                    height: 320,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          CustomColor.primaryTeal.withValues(alpha: 0.3),
                          CustomColor.accentIndigo.withValues(alpha: 0.15),
                          Colors.transparent,
                        ],
                        stops: const [0.2, 0.6, 1.0],
                      ),
                    ),
                  ),
                  // Glowing Border Ring
                  Container(
                    width: 310,
                    height: 310,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: CustomColor.primaryTeal.withValues(alpha: 0.4),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColor.primaryTeal.withValues(alpha: 0.2),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  // Main Profile Image Avatar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(160),
                    child: Image.asset(
                      CustomImages.profileImage,
                      width: 290,
                      height: 290,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 290,
                        height: 290,
                        color: CustomColor.bgLight2,
                        child: const Icon(
                          Icons.person_rounded,
                          size: 100,
                          color: CustomColor.whiteSecondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final String label;
  final String value;

  const _StatBadge({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: CustomColor.primaryTeal,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: CustomColor.hintDark,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: CustomColor.glassBorder,
    );
  }
}