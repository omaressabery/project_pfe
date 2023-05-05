import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final MaterialColor buttonBackgroundColor;
  const MyButton({
    super.key,
    required this.buttonName,
    required this.buttonBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('clicked');
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              buttonBackgroundColor,
              buttonBackgroundColor,
            ])),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
