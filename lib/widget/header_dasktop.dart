import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/nav_items.dart';
import 'package:my_portfollio/widget/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
    this.activeIndex = 0,
  });

  final Function(int) onNavMenuTap;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: CustomColor.glassBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            color: CustomColor.scaffoldBg.withValues(alpha: 0.75),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                SiteLogo(onTap: () => onNavMenuTap(0)),
                const Spacer(),
                for (int i = 0; i < navTitles.length; i++) ...[
                  _NavButton(
                    title: navTitles[i],
                    isActive: activeIndex == i,
                    onTap: () => onNavMenuTap(i),
                  ),
                  const SizedBox(width: 8),
                ],
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () => onNavMenuTap(4), // Scroll to contact
                  icon: const Icon(Icons.send_rounded, size: 16),
                  label: const Text(
                    "Hire Me",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.primaryTeal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                    shadowColor: CustomColor.primaryTeal.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Alias for backward compatibility
typedef HeaderDasktop = HeaderDesktop;

class _NavButton extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _NavButton({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool highlighted = widget.isActive || isHovered;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: widget.isActive
                ? CustomColor.primaryTeal.withValues(alpha: 0.2)
                : isHovered
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.isActive
                  ? CustomColor.primaryTeal.withValues(alpha: 0.5)
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: highlighted ? FontWeight.w600 : FontWeight.w400,
              color: widget.isActive
                  ? CustomColor.primaryTeal
                  : highlighted
                      ? CustomColor.whitePrimary
                      : CustomColor.whiteSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
