import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/nav_items.dart';
import 'package:my_portfollio/constant/sns_link.dart';
import 'package:my_portfollio/utils/site_utils.dart';
import 'package:my_portfollio/widget/site_logo.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({
    super.key,
    required this.onNavItemTap,
    this.activeIndex = 0,
  });

  final Function(int) onNavItemTap;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: CustomColor.glassBorder)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SiteLogo(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded, color: CustomColor.whiteSecondary),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Navigation items
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemCount: navTitles.length,
                itemBuilder: (context, i) {
                  final bool isSelected = activeIndex == i;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? CustomColor.primaryTeal.withValues(alpha: 0.15)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected
                            ? CustomColor.primaryTeal.withValues(alpha: 0.4)
                            : Colors.transparent,
                      ),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      leading: Icon(
                        navIcon[i],
                        color: isSelected
                            ? CustomColor.primaryTeal
                            : CustomColor.whiteSecondary,
                      ),
                      title: Text(
                        navTitles[i],
                        style: TextStyle(
                          color: isSelected
                              ? CustomColor.primaryTeal
                              : CustomColor.whitePrimary,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        onNavItemTap(i);
                      },
                    ),
                  );
                },
              ),
            ),
            // Drawer Footer: Quick Social Links
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: CustomColor.glassBorder)),
              ),
              child: Column(
                children: [
                  const Text(
                    "Connect with me",
                    style: TextStyle(
                      color: CustomColor.hintDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _SocialIconButton(
                        icon: Icons.code,
                        url: SnsLinks.github,
                        tooltip: "GitHub",
                      ),
                      _SocialIconButton(
                        icon: Icons.work_outline,
                        url: SnsLinks.linkedin,
                        tooltip: "LinkedIn",
                      ),
                      _SocialIconButton(
                        icon: Icons.chat_bubble_outline,
                        url: SnsLinks.whatsapp,
                        tooltip: "WhatsApp",
                      ),
                      _SocialIconButton(
                        icon: Icons.send_outlined,
                        url: SnsLinks.telegram,
                        tooltip: "Telegram",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final String tooltip;

  const _SocialIconButton({
    required this.icon,
    required this.url,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: () => SiteUtils.openUrl(url),
      icon: Icon(icon, color: CustomColor.whiteSecondary, size: 20),
      style: IconButton.styleFrom(
        backgroundColor: CustomColor.bgLight1,
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}
