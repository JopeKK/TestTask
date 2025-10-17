import 'dart:math';

import 'package:flutter/material.dart';

/// The page which displays random background color
class RandomBackgroundPage extends StatefulWidget {
  /// Creates a [RandomBackgroundPage].
  const RandomBackgroundPage({super.key});

  @override
  State<RandomBackgroundPage> createState() => _RandomBackgroundPageState();
}

class _RandomBackgroundPageState extends State<RandomBackgroundPage> {
  final Random _random = Random();
  int clickCount = 0;
  bool isTextBlack = true;
  late int red;
  late int green;
  late int blue;

  @override
  void initState() {
    super.initState();
    _setRandomBackgroundColor();
  }

  void _setRandomBackgroundColor() {
    red = _random.nextInt(256);
    green = _random.nextInt(256);
    blue = _random.nextInt(256);
  }

  @override
  Widget build(BuildContext context) {
    final textColor = isTextBlack ? Colors.black : Colors.white;
    return Scaffold(
      backgroundColor: Color.fromRGBO(red, green, blue, 1),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() {
              _setRandomBackgroundColor();
              clickCount++;
            });
          },
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hello there', style: TextStyle(color: textColor)),
                Text(
                  'Click counter: $clickCount',
                  style: TextStyle(color: textColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: textColor, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isTextBlack = !isTextBlack;
                        });
                      },
                      child: Text(
                        'Change text color white <-> black',
                        style: TextStyle(color: textColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
