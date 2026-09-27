import 'package:flutter/material.dart';
import 'package:my_portfollio/common%20widget/dialog.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/utils/exprience_utils.dart';
import 'package:my_portfollio/utils/site_utils.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceUtils exprience;

  const ExperienceCard({super.key, required this.exprience});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColor.bgLight1,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: CustomColor.glassBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CARD HEADER (Logo, Title & Role)
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Company Logo Box
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        exprience.logo,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.business_rounded, color: CustomColor.bgLight2, size: 28),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Title & Role
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exprience.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (exprience.role.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: CustomColor.primaryTeal.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: CustomColor.primaryTeal.withValues(alpha: 0.3)),
                          ),
                          child: Text(
                            exprience.role,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: CustomColor.primaryTeal,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // SUBTITLE / DESCRIPTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exprience.subtitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: CustomColor.whiteSecondary,
                  ),
                ),
                if (exprience.subtitle.length > 100) ...[
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      AppDialog.showProjectDialog(
                        context: context,
                        title: exprience.title,
                        content: exprience.subtitle,
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Read More",
                          style: TextStyle(
                            fontSize: 12,
                            color: CustomColor.primaryTeal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 14,
                          color: CustomColor.primaryTeal,
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),

          // FOOTER / VERIFICATION LETTER ACTION
          if (exprience.checkletter != null && exprience.checkletter!.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: const BoxDecoration(
                color: CustomColor.bgLight2,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.verified_outlined, size: 16, color: CustomColor.yellowSecondary),
                  const SizedBox(width: 8),
                  const Text(
                    "Letter of Recommendation / Certificate",
                    style: TextStyle(
                      color: CustomColor.yellowSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => SiteUtils.openUrl(exprience.checkletter!),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: CustomColor.yellowSecondary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "View Letter",
                        style: TextStyle(
                          color: CustomColor.yellowSecondary,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// Alias for backward compatibility
typedef ExprienceCard = ExperienceCard;