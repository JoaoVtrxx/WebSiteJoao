import 'package:flutter/material.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.pixels,
  });

  final double screenHeight;
  final double screenWidth;
  final double pixels;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (screenHeight < 763) ? 693 : screenHeight - 70,
      child: Stack(
        children: [
          Column(
            children: [
              AnimatedOpacity(
                curve: Curves.easeInExpo,
                duration: const Duration(milliseconds: 600),
                opacity: (pixels >= 350) ? 1 : 0,
                child: AnimatedPadding(
                  curve: Curves.bounceInOut,
                  duration: const Duration(milliseconds: 500),
                  padding: EdgeInsets.only(top: (pixels >= 350) ? 30 : 0),
                  child: Container(
                    color: Colors.white,
                    width: screenWidth,
                    height: 200,
                    child: const Image(
                      image: AssetImage('assets/computador_icons.png'),
                    ),
                  ),
                ),
              ),
              AnimatedPadding(
                curve: Curves.easeInOutBack,
                duration: const Duration(milliseconds: 900),
                padding:
                    EdgeInsets.only(left: (pixels >= 350) ? 0 : screenWidth),
                child: Container(
                  color: const Color.fromARGB(255, 50, 31, 156),
                  width: screenWidth,
                  height: (screenHeight < 763) ? 400 : screenHeight - 350,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.1,
                  ),
                  child: Text(
                    'Hi, I’m João Vitor. Nice to meet you! ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: (screenWidth < 1200) ? 33 : 35,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.04, left: 8, right: 8),
                  child: Text(
                    "Student at the Universidade Federal de Santa Maria with a passion for programming and a special interest in the Flutter framework. My goal is to use my skills to create innovative and efficient solutions. I am always ready to learn and take on new challenges in the field of technology.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: (screenWidth < 1200) ? 23 : 25,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: (pixels >= 500) ? 200 : 0),
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOutBack,
              builder: (BuildContext context, double size, Widget? child) {
                return AnimatedPadding(
                  duration: const Duration(milliseconds: 800),
                  padding: EdgeInsets.only(bottom: (pixels > 500) ? 0 : 40),
                  child: Image.network(
                    "https://fonts.gstatic.com/s/e/notoemoji/latest/1f609/512.gif",
                    alignment: Alignment.bottomCenter,
                    height: size,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
