import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String text;
  final double radius;

  const SmallButton({
    Key? key,
    required this.buttonColor,
    required this.text,
    required this.textColor,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        elevation: 0,
        shape: const CircleBorder(side: BorderSide.none),
        minimumSize: Size(radius, radius),
      ),
    );
  }
}
