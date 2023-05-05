// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget {
  final IconData icon;
  final MaterialColor iconColor;
  final String title;
  final Widget toWidget;
  const MyMenu({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.toWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) {
                return toWidget;
              },
            ),
          );
        },
        splashColor: Colors.green,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  icon,
                  size: 70.00,
                  color: iconColor,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'VarFont',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
