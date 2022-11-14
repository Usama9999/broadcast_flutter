import 'package:broadcast_app/app_theme.dart';
import 'package:broadcast_app/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(
    const OverlaySupport(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Broacasting',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.data(),
      home: const NavBar(),
    );
  }
}
