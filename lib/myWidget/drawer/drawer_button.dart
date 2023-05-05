import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final MaterialColor iconColor;
  final String routeName;
  const DrawerButton({
    super.key,
    required this.name,
    required this.icon,
    required this.iconColor,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 29, vertical: 10),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ]),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                color: iconColor,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
