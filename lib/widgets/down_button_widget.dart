import 'package:flutter/material.dart';

class DownButtonWidget extends StatefulWidget {
  const DownButtonWidget({
    super.key,
    required this.screenHeight,
    required this.onPressed,
  });

  final double screenHeight;
  final Function() onPressed;

  @override
  State<DownButtonWidget> createState() => _DownButtonWidgetState();
}

class _DownButtonWidgetState extends State<DownButtonWidget> {
  double onHoverWidth = 40;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (widget.screenHeight < 496) ? widget.screenHeight * 0.1 : 80,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            onHoverWidth = 50;
          });
        },
        onExit: (event) {
          setState(() {
            onHoverWidth = 40;
          });
        },
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 40, end: onHoverWidth),
          duration: const Duration(milliseconds: 200),
          builder: (BuildContext context, double size, Widget? child) {
            return IconButton(
              alignment: Alignment.bottomCenter,
              onPressed: widget.onPressed,
              icon: const Icon(Icons.arrow_downward_rounded),
              color: Colors.black,
              iconSize: size,
              style: const ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(Colors.transparent)),
            );
          },
        ),
      ),
    );
  }
}
