import 'package:flutter/material.dart';
import 'package:my_portfollio/common%20widget/dialog.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/utils/exprience_utils.dart';
import 'dart:js' as js;

class ExprienceCard extends StatelessWidget {
  final ExprienceUtils exprience;

  const ExprienceCard({super.key, required this.exprience});

  @override
  Widget build(BuildContext context) {
   // final size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
           width: double.infinity,
           padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CustomColor.bgLight2,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 Image
              Row(
                children: [
                  Padding(
                   padding: const EdgeInsets.all(12),
                    child: /*Container(
                        margin: const EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                            radius: constraints.maxWidth < 500 ? 25 : 30,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Image.asset(
                              exprience.logo,
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                      ),*/
                      Container(
  width: 60,
  height: 60,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10), // 🔹 slight rounded
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.3),
        blurRadius: 6,
      ),
    ],
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Image.asset(
      exprience.logo,
      fit: BoxFit.contain, // 🔥 IMPORTANT for logos
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.broken_image);
      },
    ),
  ),
),
                  ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exprience.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CustomColor.whitePrimary,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),
                          /// Role
                      if (exprience.role.isNotEmpty)
                        Text(
                          exprience.role,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.tealAccent,
                          ),
                        ),
                        ],
                        
                      ),
                    ),
                ],
              ),
          
              /// 🔹 Content
              Padding(
  padding: const EdgeInsets.all(12),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        exprience.subtitle,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: CustomColor.whitePrimary,
          fontSize: 14,
        ),
      ),

      const SizedBox(height: 4),
     if(exprience.subtitle.length>100)
      InkWell(
        onTap: () {
          AppDialog.showProjectDialog(
            context: context,
            title: exprience.title,
            content: exprience.subtitle,
          );
        },
        child: const Text(
          "Read more",
          style: TextStyle(
            fontSize: 11,
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  ),
),
          
              const SizedBox(height: 10),
          
              /// 🔻 Footer
              Container(
                decoration: const BoxDecoration(
                  color: CustomColor.bgLight1,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    const Text(
                      "Check Letter",
                      style: TextStyle(
                        color: CustomColor.yellowSecondary,
                        fontSize: 11,
                      ),
                    ),
                    const Spacer(),
          
                    if (exprience.checkletter != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: InkWell(
                            onTap: () {
                              js.context.callMethod("open", [
                              exprience.checkletter,
                            ]);
                            },
                            child: Image.asset(
                              "assets/check.png",
                              width: 19,
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}