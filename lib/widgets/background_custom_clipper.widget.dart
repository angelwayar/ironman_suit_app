import 'package:flutter/material.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const roundFactor = 50.0;

    final path = Path()
      ..moveTo(0, size.height * 0.33)
      ..lineTo(0, size.height - roundFactor)
      ..quadraticBezierTo(0, size.height, roundFactor, size.height)
      ..lineTo(size.width - roundFactor, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - roundFactor)
      ..lineTo(size.width, roundFactor * 2)
      ..quadraticBezierTo(size.width - 5, roundFactor,
          size.width - roundFactor * 2, roundFactor * 1.5)
      ..lineTo(roundFactor * 0.9, size.height * 0.33 - roundFactor * 0.3)
      ..quadraticBezierTo(
          0, size.height * 0.33, 0, size.height * 0.33 + roundFactor);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
