import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/size.dart';
import 'package:my_portfollio/utils/project_utils.dart';
import 'package:my_portfollio/widget/project_card.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({super.key});

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  final ScrollController _projectScrollController = ScrollController();
  bool _canScrollLeft = false;
  bool _canScrollRight = true;
  int _activeCardIndex = 0;

  @override
  void initState() {
    super.initState();
    _projectScrollController.addListener(_checkScrollLimits);
  }

  @override
  void dispose() {
    _projectScrollController.removeListener(_checkScrollLimits);
    _projectScrollController.dispose();
    super.dispose();
  }

  void _checkScrollLimits() {
    if (!_projectScrollController.hasClients) return;
    final maxScroll = _projectScrollController.position.maxScrollExtent;
    final currentScroll = _projectScrollController.offset;

    // Estimate active index based on 330px step (310px width + 20px gap)
    final index = (currentScroll / 330).round().clamp(0, workProjectUtils.length - 1);

    setState(() {
      _canScrollLeft = currentScroll > 10;
      _canScrollRight = currentScroll < maxScroll - 10;
      _activeCardIndex = index;
    });
  }

  void _scrollLeft() {
    _projectScrollController.animateTo(
      (_projectScrollController.offset - 330 * 3).clamp(
        0.0,
        _projectScrollController.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOutCubic,
    );
  }

  void _scrollRight() {
    _projectScrollController.animateTo(
      (_projectScrollController.offset + 330 * 3).clamp(
        0.0,
        _projectScrollController.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth >= rDesktopwidth;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: isDesktop ? 48 : 36,
          ),
          color: CustomColor.bgLight1.withValues(alpha: 0.5),
          child: Column(
            children: [
              // SECTION HEADER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 28, height: 2, color: CustomColor.primaryTeal),
                    const SizedBox(width: 10),
                    const Text(
                      "Featured Projects",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(width: 28, height: 2, color: CustomColor.primaryTeal),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Text(
                  "Production-ready web & mobile applications built with Flutter (Showing 3 at a time • Scroll or swipe to view more)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CustomColor.hintDark,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // CONSTRAINED HORIZONTAL SCROLL WINDOW (SHOWS EXACTLY 3 CARDS ON DESKTOP)
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1020),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ScrollConfiguration(
                      behavior: const _HorizontalScrollBehavior(),
                      child: SingleChildScrollView(
                        controller: _projectScrollController,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            for (int i = 0; i < workProjectUtils.length; i++) ...[
                              ProjectCard(project: workProjectUtils[i]),
                              if (i != workProjectUtils.length - 1)
                                const SizedBox(width: 20),
                            ],
                          ],
                        ),
                      ),
                    ),

                    // LEFT NAV ARROW (DESKTOP)
                    if (isDesktop && _canScrollLeft)
                      Positioned(
                        left: 4,
                        child: _ScrollArrowButton(
                          icon: Icons.chevron_left_rounded,
                          onTap: _scrollLeft,
                        ),
                      ),

                    // RIGHT NAV ARROW (DESKTOP)
                    if (isDesktop && _canScrollRight)
                      Positioned(
                        right: 4,
                        child: _ScrollArrowButton(
                          icon: Icons.chevron_right_rounded,
                          onTap: _scrollRight,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // SCROLL INDICATOR DOTS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(workProjectUtils.length, (index) {
                  final bool isCurrent = (index == _activeCardIndex) ||
                      (index < _activeCardIndex + 3 && index >= _activeCardIndex);
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: isCurrent ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isCurrent
                          ? CustomColor.primaryTeal
                          : CustomColor.glassBorder,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Custom Scroll Behavior enabling Mouse Dragging on Web & Desktop
class _HorizontalScrollBehavior extends MaterialScrollBehavior {
  const _HorizontalScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
      };
}

class _ScrollArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ScrollArrowButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: CustomColor.bgLight2.withValues(alpha: 0.95),
            shape: BoxShape.circle,
            border: Border.all(color: CustomColor.primaryTeal.withValues(alpha: 0.5), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 12,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: CustomColor.primaryTeal,
            size: 24,
          ),
        ),
      ),
    );
  }
}
