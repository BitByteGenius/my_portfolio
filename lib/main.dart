import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfollio/constant/colors.dart';
import 'package:my_portfollio/screen/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData.dark();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rahul Kumar Singh | Senior Flutter Engineer',
      theme: baseTheme.copyWith(
        scaffoldBackgroundColor: CustomColor.scaffoldBg,
        colorScheme: const ColorScheme.dark(
          primary: CustomColor.primaryTeal,
          secondary: CustomColor.primaryGreen,
          surface: CustomColor.bgLight1,
        ),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(baseTheme.textTheme),
        dividerColor: CustomColor.glassBorder,
      ),
      home: const HomePage(),
    );
  }
}
