import 'package:flutter/material.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/constant/size.dart';
import 'package:my_portfollio/constant/sns_link.dart';
import 'package:my_portfollio/widget/Custom_text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          //Title
          Text(
            "Get in Touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 100, maxWidth: 700),
            child: LayoutBuilder(
              builder: (context, Constraints) {
                if (Constraints.maxWidth >= rDesktopwidth) {
                  return buildNameEmailFieldDesktop();
                }
                //else
                return buildNameEmailFieldMobile();
              },
            ),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: CustomTextField(hintText: "Your message", maxLines: 5),
          ),
          const SizedBox(height: 20),
          //=====Send Boutom=====
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(onPressed: () {}, child: Text("Submit")),
            ),
          ),
          const SizedBox(height: 30),
          //======SMS icon Links====
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: const Divider(),
          ),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.github]);
                },
                child: Image.asset("github.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.instagram]);
                },
                child: Image.asset("instagram.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.telegram]);
                },
                child: Image.asset("telegram.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.whatsapp]);
                },
                child: Image.asset("whatsapp.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.facebook]);
                },
                child: Image.asset("facebook.png", width: 28),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.linkedin]);
                },
                child: Image.asset("linkedin.png", width: 28),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        Flexible(child: CustomTextField(hintText: "Your name")),
        const SizedBox(width: 20),
        Flexible(child: CustomTextField(hintText: "Your email")),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        Flexible(child: CustomTextField(hintText: "Your name")),
        const SizedBox(height: 20),
        Flexible(child: CustomTextField(hintText: "Your email")),
      ],
    );
  }
}
