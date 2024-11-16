import 'package:flutter/material.dart';

class logo extends StatelessWidget {
  const logo({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                child: Image.network(
                  "https://marketplace.canva.com/EAFQBv9efdM/1/0/1600w/canva-blue-and-black-electronic-store-logo-6aYA8_ft3X4.jpg",
                  height: 110,
                  width: 110,
                ),
              ),
            );
  }
}