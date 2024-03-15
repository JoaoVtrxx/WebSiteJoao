import 'package:flutter/material.dart';

class AboutMeMobileWidget extends StatelessWidget {
  const AboutMeMobileWidget({
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                child: Text(
                  'Hi, I’m João Vitor. Nice to meet you! ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (screenHeight < 840)
                        ? (screenWidth < 500)
                            ? screenWidth * 0.04
                            : screenWidth * 0.055
                        : (screenWidth < 500)
                            ? screenWidth * 0.055
                            : 30,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: (screenHeight > 1050) ? 40 : screenHeight * 0.03,
                ),
                child: Text(
                  "Student at the Universidade Federal de Santa Maria with a passion for programming and a special interest in the Flutter framework. My goal is to use my skills to create innovative and efficient solutions. I am always ready to learn and take on new challenges in the field of technology.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: (screenHeight < 840)
                          ? (screenWidth < 500)
                              ? screenWidth * 0.04
                              : screenWidth * 0.05
                          : (screenWidth < 500)
                              ? screenWidth * 0.05
                              : 28,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
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
