import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Function callback;

  const LargeButton(
      {Key? key,
      required this.buttonColor,
      required this.text,
      required this.textColor,
      required this.fontSize,
      required this.fontWeight,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return TextButton(
      onPressed: () {
        if (text == String.fromCharCodes(Runes('\u002B'))) {
          callback('+');
        } else if (text == String.fromCharCodes(Runes('\u2212'))) {
          callback('-');
        } else if (text == String.fromCharCodes(Runes('\u00D7'))) {
          callback('*');
        } else if (text == String.fromCharCodes(Runes('\u0025'))) {
          callback('%');
        } else if (text == String.fromCharCodes(Runes('\u00F7'))) {
          callback('/');
        } else {
          callback(text);
        }
      },
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        padding: EdgeInsets.zero,
        shape: const CircleBorder(side: BorderSide.none),
        minimumSize: Size(_size.width * 0.2, _size.width * 0.2),
      ),
    );
  }
}
