import 'package:flutter/material.dart';

class AppBarTextMobileWidget extends StatefulWidget {
  const AppBarTextMobileWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  State<AppBarTextMobileWidget> createState() => _AppBarTextMobileWidgetState();
}

class _AppBarTextMobileWidgetState extends State<AppBarTextMobileWidget> {
  double barWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () async {
              setState(() {
                barWidth = 250;
              });
              await Future.delayed(const Duration(milliseconds: 300));
              setState(() {
                widget.onPressed();
              });
            },
            child: Text(
              widget.text,
              style: const TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 35,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 0.8,
              width: barWidth,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
