import 'package:flutter/material.dart';
import 'package:flutter_webjoao/screens/desktop_body.dart';
import 'package:flutter_webjoao/screens/mobile_body.dart';
import 'package:flutter_webjoao/screens/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loaded = false;

  void loading() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    loading();
    return Scaffold(
        body: (!loaded)
            ? const Center(child: CircularProgressIndicator())
            : const ResponsiveLayout(
                mobileBody: MobileBody(), desktopBody: DesktopBody()));
  }
}
