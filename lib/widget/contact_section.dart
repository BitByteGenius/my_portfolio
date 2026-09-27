import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/size.dart';
import 'package:my_portfollio/constant/sns_link.dart';
import 'package:my_portfollio/controller/contact_section_controller.dart';
import 'package:my_portfollio/utils/site_utils.dart';
import 'package:my_portfollio/widget/custom_text_field.dart';

class ContactSection extends StatelessWidget {
  ContactSection({super.key});

  final controller = Get.put(ContactSectionController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      color: CustomColor.scaffoldBg,
      child: Column(
        children: [
          // SECTION HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 30, height: 2, color: CustomColor.primaryTeal),
              const SizedBox(width: 12),
              const Text(
                "Get In Touch",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: CustomColor.whitePrimary,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(width: 12),
              Container(width: 30, height: 2, color: CustomColor.primaryTeal),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Have a project in mind or want to collaborate? Feel free to reach out!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CustomColor.hintDark,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 40),

          // FORM CONTAINER
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: CustomColor.bgLight1,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: CustomColor.glassBorder, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Name & Email Layout
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth >= rMobileWidth) {
                        return Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: "Your Name",
                                controller: controller.nameController,
                                prefixIcon: Icons.person_outline_rounded,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: CustomTextField(
                                hintText: "Your Email",
                                controller: controller.emailController,
                                prefixIcon: Icons.email_outlined,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            CustomTextField(
                              hintText: "Your Name",
                              controller: controller.nameController,
                              prefixIcon: Icons.person_outline_rounded,
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              hintText: "Your Email",
                              controller: controller.emailController,
                              prefixIcon: Icons.email_outlined,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // Message Field
                  CustomTextField(
                    hintText: "Write your message here...",
                    controller: controller.messageController,
                    maxLines: 5,
                    prefixIcon: Icons.chat_bubble_outline_rounded,
                  ),
                  const SizedBox(height: 24),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : () => controller.submitForm(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColor.primaryTeal,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor:
                              CustomColor.primaryTeal.withValues(alpha: 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                          shadowColor: CustomColor.primaryTeal.withValues(alpha: 0.4),
                        ),
                        child: controller.isLoading.value
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: Colors.white,
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.send_rounded, size: 18),
                                  SizedBox(width: 10),
                                  Text(
                                    "Send Message",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),

          // SOCIAL MEDIA CONNECT BADGES
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: const Divider(color: CustomColor.glassBorder, height: 1),
          ),
          const SizedBox(height: 24),

          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _SocialBadge(
                imagePath: "assets/sns/github.png",
                label: "GitHub",
                onTap: () => SiteUtils.openUrl(SnsLinks.github),
              ),
              _SocialBadge(
                imagePath: "assets/sns/linkedin.png",
                label: "LinkedIn",
                onTap: () => SiteUtils.openUrl(SnsLinks.linkedin),
              ),
              _SocialBadge(
                imagePath: "assets/sns/whatsapp.png",
                label: "WhatsApp",
                onTap: () => SiteUtils.openUrl(SnsLinks.whatsapp),
              ),
              _SocialBadge(
                imagePath: "assets/sns/telegram.png",
                label: "Telegram",
                onTap: () => SiteUtils.openUrl(SnsLinks.telegram),
              ),
              _SocialBadge(
                imagePath: "assets/sns/instagram.png",
                label: "Instagram",
                onTap: () => SiteUtils.openUrl(SnsLinks.instagram),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialBadge extends StatefulWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const _SocialBadge({
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  State<_SocialBadge> createState() => _SocialBadgeState();
}

class _SocialBadgeState extends State<_SocialBadge> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isHovered
                  ? CustomColor.primaryTeal.withValues(alpha: 0.2)
                  : CustomColor.bgLight1,
              borderRadius: BorderRadius.circular(16),
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
                  widget.imagePath,
                  width: 22,
                  height: 22,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.link, size: 20, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.label,
                  style: TextStyle(
                    color: isHovered
                        ? CustomColor.whitePrimary
                        : CustomColor.whiteSecondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
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
