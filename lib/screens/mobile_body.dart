import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'package:flutter_webjoao/widgets/mobile_widgets/aboutme_mobile_widget.dart';
import 'package:flutter_webjoao/widgets/mobile_widgets/appbar_text_mobile_widget.dart';
import 'package:flutter_webjoao/widgets/mobile_widgets/footer_mobile_widget.dart';
import 'package:flutter_webjoao/widgets/mobile_widgets/start__mobile_widget.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
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
      drawer: Drawer(
        width: screenWidth * 0.7,
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBarTextMobileWidget(
                text: 'Start',
                onPressed: () {
                  buttonScroll(key1);
                  Navigator.pop(context);
                },
              ),
              AppBarTextMobileWidget(
                text: 'About me ',
                onPressed: () {
                  buttonScroll(key2);
                  Navigator.pop(context);
                },
              ),
              AppBarTextMobileWidget(
                text: 'Contact',
                onPressed: () {
                  buttonScroll(key3);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: (screenWidth < 420) ? screenWidth * 0.035 : 22,
        ),
        centerTitle: true,
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
            StartMobileWidget(
              key: key1,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              onArrowPressed: () {
                buttonScroll(key2);
              },
              pixels: pixels,
            ),
            AboutMeMobileWidget(
              key: key2,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              pixels: pixels,
            ),
            FooterMobileWidget(
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
