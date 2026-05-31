import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/utils/exprience_utils.dart';
import 'package:my_portfollio/widget/exprience_card.dart';

class ExprienceSection extends StatelessWidget {
  const ExprienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight2,
      child: Column(
        children: [
          //Title
          Text(
            "Exprience",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
         
         /* ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: Row(
              children: [
                
                )
              ],
            ),
          ),*/

          ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 1200),
  child: LayoutBuilder(
    builder: (context, constraints) {
      double cardWidth;

      if (constraints.maxWidth > 1100) {
        cardWidth = 280; // Desktop
      } else if (constraints.maxWidth > 800) {
        cardWidth = 260; // Tablet
      } else {
        cardWidth = double.infinity; // Mobile (full width)
      }

     return Wrap(
      direction: Axis.vertical,
        spacing: 25,
        runSpacing: 25,
        children: [
          for (int i = 0; i < ExprienceSectionUtils.length; i++)
            SizedBox(
              width: cardWidth,
              child: ExprienceCard(
                exprience: ExprienceSectionUtils[i], // ✅ correct param
              ),
            ),
        ],
      );
    },
  ),
),
          const SizedBox(height: 20),

          //=====Send Boutom=====
        ],
      ),
    );
  }
}
