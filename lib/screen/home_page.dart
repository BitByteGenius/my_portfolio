import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/size.dart';
import 'package:my_portfollio/widget/drawer_mobile.dart';
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
              : const DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            //========Main=========
            children: [
              if (constraints.maxWidth >= rDesktopwidth)
                const HeaderDasktop()
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

              //========Skill=========
              Container(
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //====tittle====
                    const Text(
                      "What can i do", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: CustomColor.whitePrimary
                      ),
                    ),

                    const SizedBox(height: 50),
                    //=====Skills + plateform  =============

                    if (constraints.maxWidth >= rmedDesktopwidth)
                   const SkillDesktop()
                    else
                   const SkillMoble(),
                  ]
                    
                )
              ),
              
              //========Projects=========
              ProjectSection(),
          ],
          
      ),
      
        );
      },
      
    );
  }
}

