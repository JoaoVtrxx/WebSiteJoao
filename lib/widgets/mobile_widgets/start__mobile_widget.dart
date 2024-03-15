import 'package:flutter/material.dart';
import 'package:flutter_webjoao/widgets/down_button_widget.dart';

class StartMobileWidget extends StatefulWidget {
  const StartMobileWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.onArrowPressed,
    required this.pixels,
  });

  final double screenHeight;
  final double screenWidth;
  final Function() onArrowPressed;
  final double pixels;

  @override
  State<StartMobileWidget> createState() => _StartMobileWidgetState();
}

class _StartMobileWidgetState extends State<StartMobileWidget> {
  bool loaded = false;

  void loading() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    loading();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80, bottom: 20),
          child: AnimatedScale(
            curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 800),
            scale: (widget.pixels >= 350)
                ? 0
                : (loaded)
                    ? 1
                    : 0,
            child: AnimatedOpacity(
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 800),
              opacity: (widget.pixels >= 350)
                  ? 0
                  : (loaded)
                      ? 1
                      : 0,
              child: CircleAvatar(
                backgroundImage: const AssetImage('assets/perfil.jpg'),
                radius: (widget.screenWidth * 0.40),
              ),
            ),
          ),
        ),
        SizedBox(
          width: widget.screenWidth,
          child: AnimatedPadding(
            curve: Curves.easeInOutBack,
            duration: const Duration(milliseconds: 2000),
            padding: EdgeInsets.only(
              top: (widget.pixels >= 350)
                  ? (widget.screenHeight * 0.1)
                  : (loaded)
                      ? 0
                      : (widget.screenHeight * 0.1),
            ),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1500),
              opacity: (widget.pixels >= 350)
                  ? 0
                  : (loaded)
                      ? 1
                      : 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      style: TextStyle(
                          fontSize: (widget.screenHeight < 496)
                              ? widget.screenHeight * 0.2
                              : widget.screenWidth * 0.15),
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Hello, I am ',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                height: (widget.screenHeight < 485)
                                    ? widget.screenHeight * 0.002
                                    : 1.3),
                          ),
                          TextSpan(
                            text: 'João Vitor.',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                height: (widget.screenHeight < 485)
                                    ? widget.screenHeight * 0.0015
                                    : 0.8),
                          ),
                        ],
                      ),
                    ),
                    (widget.screenHeight > 495)
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8, left: 5),
                            child: Image(
                                image: const AssetImage('assets/ribble.png'),
                                alignment: Alignment.topCenter,
                                width: widget.screenWidth * 0.35),
                          )
                        : const SizedBox(
                            height: 10,
                          ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: widget.screenWidth * 0.1, top: 20),
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.grey[300],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        right: widget.screenWidth * 0.1,
                      ),
                      child: const Text(
                        'I am an 18-year-old Brazilian student of computer science. This page is one of my creations with Flutter.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    DownButtonWidget(
                        screenHeight: widget.screenHeight,
                        onPressed: widget.onArrowPressed),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
