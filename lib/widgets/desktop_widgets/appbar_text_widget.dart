import 'package:flutter/material.dart';

class AppBarTextWidget extends StatefulWidget {
  const AppBarTextWidget(
      {super.key,
      required this.maxBarWidth,
      required this.text,
      required this.onPressed,
      required this.active});

  final double maxBarWidth;
  final String text;
  final Function() onPressed;
  final bool active;

  @override
  State<AppBarTextWidget> createState() => _AppBarTextWidgetState();
}

class _AppBarTextWidgetState extends State<AppBarTextWidget> {
  double barWidth = 0;
  CrossAxisAlignment cross = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: (widget.active) ? CrossAxisAlignment.start : cross,
        children: [
          TextButton(
            onHover: (value) {
              setState(() {
                if (value) {
                  barWidth = widget.maxBarWidth;
                  cross = CrossAxisAlignment.start;
                } else {
                  barWidth = 0;
                  cross = CrossAxisAlignment.end;
                }
              });
            },
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: widget.onPressed,
            child: Text(
              widget.text,
              style: const TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          (widget.active)
              ? Container(
                  height: 0.8,
                  width: widget.maxBarWidth,
                  color: Colors.black,
                )
              : AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 0.8,
                  width: barWidth,
                  color: Colors.black,
                ),
        ],
      ),
    );
  }
}
