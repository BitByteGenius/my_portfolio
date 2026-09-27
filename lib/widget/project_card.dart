import 'package:flutter/material.dart';
import 'package:my_portfollio/common%20widget/dialog.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/utils/project_utils.dart';
import 'package:my_portfollio/utils/site_utils.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectUtils project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: 310,
        height: 330,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: CustomColor.bgLight1,
          border: Border.all(
            color: isHovered ? CustomColor.primaryTeal : CustomColor.glassBorder,
            width: isHovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? CustomColor.primaryTeal.withValues(alpha: 0.25)
                  : Colors.black.withValues(alpha: 0.2),
              blurRadius: isHovered ? 16 : 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE HEADER WITH OVERLAY & ZOOM
            Stack(
              children: [
                SizedBox(
                  height: 140,
                  width: double.infinity,
                  child: Image.asset(
                    widget.project.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: CustomColor.bgLight2,
                      child: const Center(
                        child: Icon(Icons.dashboard_rounded, size: 40, color: CustomColor.hintDark),
                      ),
                    ),
                  ),
                ),
                // Gradient overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          CustomColor.bgLight1.withValues(alpha: 0.95),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // CONTENT BODY
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      widget.project.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Subtitle
                    Text(
                      widget.project.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.35,
                        color: CustomColor.whiteSecondary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Read More Link
                    InkWell(
                      onTap: () {
                        AppDialog.showProjectDialog(
                          context: context,
                          title: widget.project.title,
                          content: widget.project.subtitle,
                          techStack: widget.project.techStack,
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            "Read Details",
                            style: TextStyle(
                              fontSize: 11,
                              color: CustomColor.primaryTeal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 3),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 12,
                            color: CustomColor.primaryTeal,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    // Tech Stack Chips
                    if (widget.project.techStack.isNotEmpty)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: widget.project.techStack.map((tech) {
                            return Container(
                              margin: const EdgeInsets.only(right: 6),
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                              decoration: BoxDecoration(
                                color: CustomColor.bgLight2,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                tech,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: CustomColor.whiteSecondary,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // FOOTER BAR (Platform Links)
            Container(
              color: CustomColor.bgLight2,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                children: [
                  const Text(
                    "Links:",
                    style: TextStyle(
                      color: CustomColor.hintDark,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  if (widget.project.githubLink != null && widget.project.githubLink!.isNotEmpty)
                    _LinkIcon(
                      icon: Icons.code_rounded,
                      tooltip: "GitHub Repository",
                      onTap: () => SiteUtils.openUrl(widget.project.githubLink!),
                    ),
                  if (widget.project.androidLink != null && widget.project.androidLink!.isNotEmpty)
                    _LinkIcon(
                      icon: Icons.android_rounded,
                      tooltip: "Android Version",
                      onTap: () => SiteUtils.openUrl(widget.project.androidLink!),
                    ),
                  if (widget.project.iosLink != null && widget.project.iosLink!.isNotEmpty)
                    _LinkIcon(
                      icon: Icons.apple_rounded,
                      tooltip: "iOS Version",
                      onTap: () => SiteUtils.openUrl(widget.project.iosLink!),
                    ),
                  if (widget.project.webLink != null && widget.project.webLink!.isNotEmpty)
                    _LinkIcon(
                      icon: Icons.language_rounded,
                      tooltip: "Live Web App",
                      onTap: () => SiteUtils.openUrl(widget.project.webLink!),
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

class _LinkIcon extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _LinkIcon({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: CustomColor.scaffoldBg,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              icon,
              size: 15,
              color: CustomColor.primaryTeal,
            ),
          ),
        ),
      ),
    );
  }
}
