import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: name,
      theme: ThemeData.dark(),
      darkTheme: Theme.of(context).copyWith(
        platform: TargetPlatform.android,
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
        canvasColor: backgroundColor,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      // builder: (context, child) =>widget tree.
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.resize(450, name: TABLET),
          const ResponsiveBreakpoint.resize(450, name: DESKTOP),
        ],
      ),
      home: const HomePage(),
    );
  }
}
