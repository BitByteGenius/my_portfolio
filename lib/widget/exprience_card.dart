import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/utils/exprience_utils.dart';
import 'dart:js' as js;

class ExprienceCard extends StatelessWidget {
  final ExprienceUtils exprience;

  const ExprienceCard({super.key, required this.exprience});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: const BoxConstraints(
            minHeight: 320,
            maxWidth: 350,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CustomColor.bgLight2,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 Image
             Center(
  child: Padding(
    padding: const EdgeInsets.only(top: 15),
    child: CircleAvatar(
      radius: size.width < 600 ? 40 : 50,
      backgroundColor: Colors.white,
      child: ClipOval(
        child: Image.asset(
          exprience.logo,
          width: size.width < 600 ? 70 : 90,
          height: size.width < 600 ? 70 : 90,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.broken_image, size: 30);
          },
        ),
      ),
    ),
  ),
),

              /// 🔹 Content
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Text(
                      exprience.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// Role
                    if (exprience.role.isNotEmpty)
                      Text(
                        exprience.role,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.tealAccent,
                        ),
                      ),

                    const SizedBox(height: 10),

                    /// Subtitle
                    Text(
                      exprience.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: CustomColor.whiteSecondary,
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

                    if (exprience.checkletter != null &&
                        exprience.checkletter!.isNotEmpty)
                      InkWell(
                        onTap: () {
                          js.context.callMethod("open", [
                            exprience.checkletter,
                          ]);
                        },
                        child: const Icon(
                          Icons.open_in_new,
                          size: 18,
                          color: Colors.white,
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