import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'dart:js' as js;

class FooterMobileWidget extends StatelessWidget {
  const FooterMobileWidget({
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          width: screenWidth,
          height: 200,
          color: Colors.white,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 2000),
            opacity: (pixels >= screenHeight * 0.95) ? 1 : 0,
            child: Text(
              'Let’s talk?',
              style: TextStyle(
                fontSize: screenWidth * 0.18,
                fontWeight: FontWeight.w600,
                height: 0.7,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: const Offset(0, -2),
                    blurRadius: 8,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 2000),
          opacity: (pixels >= screenHeight * 0.95) ? 1 : 0,
          child: Container(
            height: 200,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 4,
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(0, -2),
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(70),
                topRight: Radius.circular(70),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.038),
                          child: IconButton(
                            onPressed: () {
                              js.context.callMethod('open', [
                                'https://www.linkedin.com/in/jo%C3%A3o-vitor-da-silva-3750a325a/'
                              ]);
                            },
                            icon: const Icon(
                              FontAwesome5.linkedin_in,
                            ),
                            color: const Color.fromARGB(255, 58, 36, 182),
                            iconSize: 40,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.038),
                          child: IconButton(
                            onPressed: () {
                              js.context.callMethod(
                                  'open', ['https://github.com/JoaoVtrxx']);
                            },
                            icon: const Icon(
                              FontAwesome5.github,
                            ),
                            color: const Color.fromARGB(255, 58, 36, 182),
                            iconSize: 40,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.038),
                          child: IconButton(
                            onPressed: () {
                              js.context.callMethod(
                                  'open', ['mailto:jdapicio@gmail.com']);
                            },
                            icon: const Icon(
                              Icons.mail_outline,
                            ),
                            color: const Color.fromARGB(255, 58, 36, 182),
                            iconSize: 40,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.038),
                          child: IconButton(
                            onPressed: () {
                              js.context.callMethod('open',
                                  ['https://www.instagram.com/joaovtrsilvaa/']);
                            },
                            icon: const Icon(
                              FontAwesome5.instagram,
                            ),
                            color: const Color.fromARGB(255, 58, 36, 182),
                            iconSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'João V. Silva © 2024. All rights reserved.',
                      style: TextStyle(
                          color: Colors.grey[350],
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Made With ',
                        style: TextStyle(
                            color: Colors.grey[350],
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w500,
                            height: 1),
                      ),
                      Image(
                        image: const AssetImage('assets/flutter_icon.png'),
                        height: screenWidth * 0.04,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
