import 'package:flutter/material.dart';
import 'package:flutter_webjoao/widgets/down_button_widget.dart';

class StartWidget extends StatefulWidget {
  const StartWidget({
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
  State<StartWidget> createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  bool loaded = false;
  late AssetImage perfil;

  void loading() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      loaded = true;
    });
  }

  @override
  void initState() {
    perfil = const AssetImage('assets/perfil.jpg');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(perfil, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    loading();
    return SizedBox(
      height: widget.screenHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedScale(
            curve: Curves.decelerate,
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
                backgroundImage: perfil,
                radius: (widget.screenWidth * 0.2),
              ),
            ),
          ),
          AnimatedPadding(
            curve: Curves.easeInOutBack,
            duration: const Duration(milliseconds: 2000),
            padding: EdgeInsets.only(
              top: (widget.pixels >= 350)
                  ? (widget.screenHeight * 0.4) - 10
                  : (loaded)
                      ? 0
                      : (widget.screenHeight * 0.4) - 10,
            ),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              opacity: (widget.pixels >= 350)
                  ? 0
                  : (loaded)
                      ? 1
                      : 0,
              child: SizedBox(
                width: widget.screenWidth * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      style: TextStyle(
                          fontSize: (widget.screenHeight < 496)
                              ? widget.screenHeight * 0.2
                              : widget.screenWidth * 0.06),
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
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Image(
                                image: const AssetImage('assets/ribble.png'),
                                alignment: Alignment.topCenter,
                                width: widget.screenWidth * 0.14),
                          )
                        : const SizedBox(
                            height: 10,
                          ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: widget.screenWidth * 0.3,
                          top: (widget.screenHeight < 485)
                              ? widget.screenHeight * 0.02
                              : 14),
                      child: Divider(
                        thickness: 1.5,
                        color: Colors.grey[300],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: (widget.screenHeight < 485)
                              ? widget.screenHeight * 0.02
                              : 20),
                      child: Text(
                        'I am an 18-year-old Brazilian student of computer science. This page is one of my creations with Flutter.',
                        style: TextStyle(
                          fontSize: (widget.screenHeight < 496)
                              ? widget.screenHeight * 0.036
                              : 18,
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
          )
        ],
      ),
    );
  }
}
