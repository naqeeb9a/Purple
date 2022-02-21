import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:purple/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Purple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                transitionType: SharedAxisTransitionType.scaled),
          },
        ),
      ),
      home: const HomePage(),
    );
  }
}
