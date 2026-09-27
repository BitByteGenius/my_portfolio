import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/size.dart';
import 'package:my_portfollio/widget/contact_section.dart';
import 'package:my_portfollio/widget/drawer_mobile.dart';
import 'package:my_portfollio/widget/exprience_section.dart';
import 'package:my_portfollio/widget/footer_section.dart';
import 'package:my_portfollio/widget/header_dasktop.dart';
import 'package:my_portfollio/widget/header_mobil.dart';
import 'package:my_portfollio/widget/main_desktop.dart';
import 'package:my_portfollio/widget/main_desktop_mobile.dart';
import 'package:my_portfollio/widget/project_section.dart';
import 'package:my_portfollio/widget/skill_desktop.dart';
import 'package:my_portfollio/widget/skill_moble.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());

  int activeSectionIndex = 0;
  bool showBackToTop = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Show or hide back to top button
    if (scrollController.offset > 400 && !showBackToTop) {
      setState(() => showBackToTop = true);
    } else if (scrollController.offset <= 400 && showBackToTop) {
      setState(() => showBackToTop = false);
    }

    // Determine current active section index
    for (int i = navbarKeys.length - 1; i >= 0; i--) {
      final key = navbarKeys[i];
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          if (position.dy <= 180) {
            if (activeSectionIndex != i) {
              setState(() => activeSectionIndex = i);
            }
            break;
          }
        }
      }
    }
  }

  void scrollToSection(int navIndex) {
    if (navIndex >= navbarKeys.length) return;

    final key = navbarKeys[navIndex];
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
        alignment: 0.05,
      );
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= rDesktopwidth;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: isDesktop
              ? null
              : DrawerMobile(
                  activeIndex: activeSectionIndex,
                  onNavItemTap: (int navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    scrollToSection(navIndex);
                  },
                ),
          floatingActionButton: showBackToTop
              ? FloatingActionButton.small(
                  onPressed: scrollToTop,
                  backgroundColor: CustomColor.primaryTeal,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.arrow_upward_rounded),
                )
              : null,
          body: Stack(
            children: [
              // MAIN SCROLLABLE CONTENT
              SingleChildScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Sticky Header Compensation Padding
                    const SizedBox(height: 70),

                    // SECTION 0: HOME / HERO
                    SizedBox(key: navbarKeys[0]),
                    if (isDesktop)
                      MainDesktop(
                        onContactTap: () => scrollToSection(4),
                        onProjectsTap: () => scrollToSection(3),
                      )
                    else
                      MainDesktopMobile(
                        onContactTap: () => scrollToSection(4),
                        onProjectsTap: () => scrollToSection(3),
                      ),

                    // SECTION 1: EXPERIENCE
                    ExperienceSection(key: navbarKeys[1]),

                    // SECTION 2: SKILLS
                    Container(
                      key: navbarKeys[2],
                      width: screenWidth,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: isDesktop ? 48 : 36,
                      ),
                      color: CustomColor.bgLight1.withValues(alpha: 0.4),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 28,
                                height: 2,
                                color: CustomColor.primaryTeal,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "What I Bring To The Table",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  color: CustomColor.whitePrimary,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 28,
                                height: 2,
                                color: CustomColor.primaryTeal,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "My technical toolbox, platforms & preferred developer stack",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustomColor.hintDark,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 32),
                          if (constraints.maxWidth >= rmedDesktopwidth)
                            const SkillDesktop()
                          else
                            const SkillMoble(),
                        ],
                      ),
                    ),

                    // SECTION 3: PROJECTS
                    ProjectSection(key: navbarKeys[3]),

                    // SECTION 4: CONTACT
                    ContactSection(key: navbarKeys[4]),

                    // FOOTER
                    const FooterSection(),
                  ],
                ),
              ),

              // FIXED FLOATING HEADER (GLASSMORPHISM NAVBAR)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: isDesktop
                    ? HeaderDesktop(
                        activeIndex: activeSectionIndex,
                        onNavMenuTap: (int navIndex) {
                          scrollToSection(navIndex);
                        },
                      )
                    : HeaderMobile(
                        onLogoTap: () => scrollToSection(0),
                        onMenuTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
