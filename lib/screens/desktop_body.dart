import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_webjoao/widgets/desktop_widgets/aboutme_desktop_widget.dart';
import 'package:flutter_webjoao/widgets/desktop_widgets/appbar_text_widget.dart';
import 'package:flutter_webjoao/widgets/desktop_widgets/start__desktop_widget.dart';
import 'package:flutter_webjoao/widgets/desktop_widgets/footer_desktop_widget.dart';
import 'dart:js' as js;

class DesktopBody extends StatefulWidget {
  const DesktopBody({super.key});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  final ScrollController _scrollController = ScrollController();
  final key1 = GlobalKey();
  final key2 = GlobalKey();
  final key3 = GlobalKey();
  double pixels = 0.0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        pixels = _scrollController.position.pixels;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
        title: InkWell(
          onTap: () {
            js.context.callMethod(
                'open', ['https://www.instagram.com/joaovtrsilvaa/']);
          },
          child: const Text(
            '@joaovtrsilvaa',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          AppBarTextWidget(
            maxBarWidth: 60,
            text: 'Start',
            onPressed: () {
              buttonScroll(key1);
            },
            active: (pixels / screenHeight <= 0.85),
          ),
          AppBarTextWidget(
            maxBarWidth: 100,
            text: 'About Me ',
            onPressed: () {
              buttonScroll(key2);
            },
            active:
                (pixels / screenHeight < 1.3 && pixels / screenHeight > 0.85),
          ),
          AppBarTextWidget(
            maxBarWidth: 85,
            text: 'Contact',
            onPressed: () {
              buttonScroll(key3);
            },
            active: (pixels / screenHeight >= 1.3),
          ),
          SizedBox(
            width: screenWidth * 0.14,
          )
        ],
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            StartWidget(
              key: key1,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              onArrowPressed: () {
                buttonScroll(key2);
              },
              pixels: pixels,
            ),
            AboutMeWidget(
              key: key2,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              pixels: pixels,
            ),
            FooterWidget(
              key: key3,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              pixels: pixels,
            ),
          ],
        ),
      ),
    );
  }
}

void buttonScroll(GlobalKey key) {
  Scrollable.ensureVisible(
    alignment: 1,
    key.currentContext!,
    duration: const Duration(seconds: 1),
  );
}
