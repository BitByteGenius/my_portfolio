import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/utils/project_utils.dart';
import 'dart:js' as js;

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return 
          Container(
            clipBehavior: Clip.antiAlias,
            height: 300,
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColor.bgLight2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(project.image, 
                height: 140,
                width: 290,
                fit: BoxFit.cover),

                //======Title====
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
                  child: Text(
                    project.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                ),

                //====Sub Tittle===
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Text(
                    project.subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: CustomColor.whiteSecondary,
                    ),
                  ),
                ),
                const Spacer(),

                //---------Footer---------
                Container(
                  color: CustomColor.bgLight1,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "Avaliable On: ",
                        style:  const TextStyle(
                          color: CustomColor.yellowSecondary,
                          fontSize: 10,
                        ),
                      ),
                      const Spacer(),
                      if (project.androidLink != null)
                        InkWell(
                          onTap: () {
                            js.context.callMethod("open", [
                              project.androidLink,
                            ]);
                          },
                          child: Image.asset(
                            "assets/skills/android.png",
                            width: 19,
                          ),
                        ),
                      if (project.androidLink != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: InkWell(
                            onTap: () {
                              js.context.callMethod("open", [
                              project.iosLink,
                            ]);
                            },
                            child: Image.asset(
                              "assets/skills/ios.png",
                              width: 19,
                            ),
                          ),
                        ),
                      if (project.androidLink != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: InkWell(
                            onTap: () {
                              js.context.callMethod("open", [
                              project.webLink,
                            ]);
                            },
                            child: Image.asset(
                              "assets/skills/web.png",
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
  }
}
