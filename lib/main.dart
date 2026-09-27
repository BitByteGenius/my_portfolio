import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rahul Kumar Singh | Senior Flutter Engineer',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: CustomColor.scaffoldBg,
        colorScheme: const ColorScheme.dark(
          primary: CustomColor.primaryTeal,
          secondary: CustomColor.primaryGreen,
          surface: CustomColor.bgLight1,
        ),
        dividerColor: CustomColor.glassBorder,
      ),
      home: const HomePage(),
    );
  }
}
