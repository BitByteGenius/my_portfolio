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

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();

  final List<GlobalKey> navbarKeys = List.generate(6, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    //final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: constraints.maxWidth >= rDesktopwidth
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    scaffoldKey.currentState?.closeDrawer();
                    scrollToSection(navIndex);
                  },
                ),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              //========Main=========
              children: [
                SizedBox(key: navbarKeys.first),
                if (constraints.maxWidth >= rDesktopwidth)
                  HeaderDasktop(
                    onNavMenuTap: (int navIndex) {
                     scrollToSection(navIndex);
                    },
                  )
                else
                  HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),

                if (constraints.maxWidth >= rDesktopwidth)
                  const MainDesktop()
                else
                  const MainDesktopMobile(),


                  //========Exprience=========
                ExprienceSection(key: navbarKeys[1]),
                const SizedBox(height: 30),

                //========Skill=========
                Container(
                  key: navbarKeys[2],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.bgLight1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //====tittle====
                      const Text(
                        "What can i do",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: CustomColor.whitePrimary,
                        ),
                      ),

                      const SizedBox(height: 50),

                      //=====Skills + plateform  =============
                      if (constraints.maxWidth >= rmedDesktopwidth)
                        const SkillDesktop()
                      else
                        const SkillMoble(),
                    ],
                  ),
                ),

                //========Projects=========
                ProjectSection(key: navbarKeys[3]),
                const SizedBox(height: 30),

                //========Contact us===============
                ContactSection(key: navbarKeys[4]),
                const SizedBox(height: 30),

                //===========Footer========
                const FooterSection(),
              ],
            ),
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
  if (navIndex >= navbarKeys.length) return;

  final key = navbarKeys[navIndex];

  if (key.currentContext != null) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
}
