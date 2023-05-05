import 'package:flutter/material.dart';

class Lien extends StatelessWidget {
  final String title;
  final Widget toWidget;
  const Lien({
    super.key,
    required this.title,
    required this.toWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return toWidget;
        }));
      },
      child: Text(
        title,
        style: const TextStyle(
          color: Color.fromRGBO(19, 29, 226, 1),
          fontSize: 16.0,
        ),
      ),
    );
  }
}
