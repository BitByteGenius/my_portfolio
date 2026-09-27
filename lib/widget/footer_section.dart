import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/sns_link.dart';
import 'package:my_portfollio/utils/site_utils.dart';
import 'package:my_portfollio/widget/site_logo.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.scaffoldBg,
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
      width: double.infinity,
      child: Column(
        children: [
          const Divider(color: CustomColor.glassBorder, height: 1),
          const SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              final bool isMobile = constraints.maxWidth < 650;

              if (isMobile) {
                return Column(
                  children: [
                    const SiteLogo(),
                    const SizedBox(height: 16),
                    const Text(
                      "Bachelor of Computer Application (BCA)\nMaharaja College (2021-2024)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CustomColor.whiteSecondary,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () => SiteUtils.openUrl(SnsLinks.github),
                    //       icon: const Icon(Icons.code, color: CustomColor.whiteSecondary, size: 20),
                    //     ),
                    //     IconButton(
                    //       onPressed: () => SiteUtils.openUrl(SnsLinks.linkedin),
                    //       icon: const Icon(Icons.work_outline, color: CustomColor.whiteSecondary, size: 20),
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 16),
                    const Text(
                      "© 2026 Rahul Kumar Singh • Built with Flutter",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: CustomColor.hintDark,
                        fontSize: 12,
                      ),
                    ),
                  ],
                );
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SiteLogo(),
                      SizedBox(height: 8),
                      Text(
                        "Bachelor of Computer Application (BCA) • Maharaja College",
                        style: TextStyle(
                          color: CustomColor.whiteSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => SiteUtils.openUrl(SnsLinks.github),
                            child: const Text(
                              "GitHub",
                              style: TextStyle(color: CustomColor.primaryTeal, fontSize: 13),
                            ),
                          ),
                          const SizedBox(width: 16),
                          InkWell(
                            onTap: () => SiteUtils.openUrl(SnsLinks.linkedin),
                            child: const Text(
                              "LinkedIn",
                              style: TextStyle(color: CustomColor.primaryTeal, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "© 2026 Rahul Kumar Singh • Built with Flutter 3",
                        style: TextStyle(
                          color: CustomColor.hintDark,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}