import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const Button({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 400,
      color: const Color.fromARGB(255, 22, 87, 139),
      height: 40,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
