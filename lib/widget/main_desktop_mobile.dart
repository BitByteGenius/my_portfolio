import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/images.dart';
import 'package:my_portfollio/widget/blinking_dot.dart';

class MainDesktopMobile extends StatelessWidget {
  final VoidCallback? onContactTap;
  final VoidCallback? onProjectsTap;

  const MainDesktopMobile({
    super.key,
    this.onContactTap,
    this.onProjectsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CENTER PROFILE IMAGE WITH GLOW
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 210,
                  height: 210,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        CustomColor.primaryTeal.withValues(alpha: 0.35),
                        CustomColor.accentIndigo.withValues(alpha: 0.15),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: CustomColor.primaryTeal.withValues(alpha: 0.5),
                      width: 2,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    CustomImages.profileImage,
                    width: 185,
                    height: 185,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 185,
                      height: 185,
                      color: CustomColor.bgLight2,
                      child: const Icon(
                        Icons.person_rounded,
                        size: 60,
                        color: CustomColor.whiteSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // AVAILABLE BADGE
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: CustomColor.primaryGreen.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: CustomColor.primaryGreen.withValues(alpha: 0.4),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                BlinkingDot(color: CustomColor.primaryGreen, size: 8),
                SizedBox(width: 8),
                Text(
                  "AVAILABLE FOR OPPORTUNITIES",
                  style: TextStyle(
                    color: CustomColor.primaryGreen,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // GREETING & NAME
          const Text(
            "Hello, I'm",
            style: TextStyle(
              fontSize: 16,
              color: CustomColor.whiteSecondary,
            ),
          ),
          const SizedBox(height: 4),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                CustomColor.whitePrimary,
                CustomColor.primaryTeal,
                CustomColor.primaryGreen,
              ],
            ).createShader(bounds),
            child: const Text(
              "Rahul Kumar Singh",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.5,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // ROLE
          const Text(
            "Senior Flutter & Full Stack Engineer",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: CustomColor.primaryTeal,
            ),
          ),
          const SizedBox(height: 14),

          // BIO
          const Text(
            "Passionate software developer specializing in building clean, scalable, cross-platform applications with Flutter, Dart, REST APIs, and modern architectures.",
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: CustomColor.whiteSecondary,
            ),
          ),
          const SizedBox(height: 24),

          // BUTTONS
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onContactTap,
                  icon: const Icon(Icons.mail_outline_rounded, size: 16),
                  label: const Text(
                    "Get In Touch",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.primaryTeal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onProjectsTap,
                  icon: const Icon(Icons.folder_outlined, size: 16),
                  label: const Text(
                    "Projects",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: CustomColor.whitePrimary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(
                      color: CustomColor.primaryTeal.withValues(alpha: 0.6),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // STATS ROW
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CustomColor.bgLight1.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: CustomColor.glassBorder),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _MobileStat(value: "1.5 Yrs", label: "Experience"),
                _MobileStat(value: "15+", label: "Projects"),
                _MobileStat(value: "800+", label: "Mentored"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileStat extends StatelessWidget {
  final String value;
  final String label;

  const _MobileStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: CustomColor.primaryTeal,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: CustomColor.hintDark,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
