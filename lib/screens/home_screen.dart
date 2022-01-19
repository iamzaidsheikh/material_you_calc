import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_you_calc/widgets/LargeButton.dart';
import 'package:material_you_calc/widgets/SmallButton.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color _primaryColor = const Color.fromRGBO(244, 182, 176, 1);
  final Color _primaryColorLight = const Color.fromRGBO(245, 223, 217, 1);
  final Color _primaryColorDark = const Color.fromRGBO(218, 126, 112, 1);
  final Color _secondaryColor = const Color.fromRGBO(65, 61, 75, 1);
  final Color _backgroundColor = const Color.fromRGBO(252, 237, 234, 1);
  final double _numFontSize = 30.0;

  String _expression = ' ';

  void buttonPressed(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void clear() {
    setState(() {
      if (_expression.isNotEmpty) {
        _expression = _expression.substring(0, _expression.length - 1);
      } else {
        _expression = '';
      }
    });
  }

  void evaluate() {
    Parser p = Parser();
    try {
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        _expression = eval.toString();
      });
    } on FormatException {
      setState(() {
        _expression = 'INVALID';
      });
    } on RangeError {
      setState(() {
        _expression = 'INVALID';
      });
    } on StateError {
      setState(() {
        _expression = 'INVALID';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Icon(
        Icons.arrow_back_rounded,
        color: _secondaryColor,
      ),
      actions: [
        Icon(
          Icons.more_vert_rounded,
          color: _secondaryColor,
        )
      ],
    );
    final _size = MediaQuery.of(context).size;
    final _height = _size.height -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    final _width = _size.width;

    return Scaffold(
      appBar: _appBar,
      body: Container(
          width: _width,
          height: _height,
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Main display
              Container(
                height: _height * 0.3,
                width: _width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      _expression,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        fontSize: 50,
                        color: _secondaryColor,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Row 0
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SmallButton(
                            buttonColor: _backgroundColor,
                            text: '(   )',
                            textColor: _secondaryColor,
                            radius: _height * 0.05,
                          ),
                          SmallButton(
                            buttonColor: _backgroundColor,
                            text: String.fromCharCodes(Runes('\u03C0')),
                            textColor: _secondaryColor,
                            radius: _height * 0.05,
                          ),
                          SmallButton(
                            buttonColor: _backgroundColor,
                            text: 'e',
                            textColor: _secondaryColor,
                            radius: _height * 0.05,
                          ),
                          SmallButton(
                            buttonColor: _backgroundColor,
                            text: '!',
                            textColor: _secondaryColor,
                            radius: _height * 0.05,
                          ),
                          SmallButton(
                            buttonColor: _primaryColor,
                            text: '< >',
                            textColor: _secondaryColor,
                            radius: _height * 0.05,
                          ),
                        ],
                      ),

                      //Row 1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LargeButton(
                            buttonColor: _secondaryColor,
                            text: 'AC',
                            textColor: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            radius: _height * 0.1,
                            callback: allClear,
                          ),
                          LargeButton(
                            buttonColor: _primaryColor,
                            text: String.fromCharCodes(Runes('\u0025')),
                            textColor: _secondaryColor,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w200,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                          LargeButton(
                            buttonColor: _primaryColor,
                            text: String.fromCharCodes(Runes('\u00F7')),
                            textColor: _secondaryColor,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w200,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                          ElevatedButton(
                            onPressed: clear,
                            child: Icon(
                              Icons.backspace_outlined,
                              color: _secondaryColor,
                              size: 25.0,
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: _primaryColor,
                                padding: EdgeInsets.zero,
                                shape:
                                    const CircleBorder(side: BorderSide.none),
                                minimumSize: Size(_height * 0.1, _height * 0.1),
                                elevation: 0),
                          ),
                        ],
                      ),
                      //Row 2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LargeButton(
                            buttonColor: _primaryColorLight,
                            text: '7',
                            textColor: _secondaryColor,
                            fontSize: _numFontSize,
                            fontWeight: FontWeight.normal,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                          LargeButton(
                            buttonColor: _primaryColorLight,
                            text: '8',
                            textColor: _secondaryColor,
                            fontSize: _numFontSize,
                            fontWeight: FontWeight.normal,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                          LargeButton(
                            buttonColor: _primaryColorLight,
                            text: '9',
                            textColor: _secondaryColor,
                            fontSize: _numFontSize,
                            fontWeight: FontWeight.normal,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                          LargeButton(
                            buttonColor: _primaryColor,
                            text: String.fromCharCodes(Runes('\u00D7')),
                            textColor: _secondaryColor,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w200,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                        ],
                      ),
                      //Row 3
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LargeButton(
                            buttonColor: _primaryColorLight,
                            text: '4',
                            textColor: _secondaryColor,
                            fontSize: _numFontSize,
                            fontWeight: FontWeight.normal,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                          LargeButton(
                            buttonColor: _primaryColorLight,
                            text: '5',
                            textColor: _secondaryColor,
                            fontSize: _numFontSize,
                            fontWeight: FontWeight.normal,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                          LargeButton(
                            buttonColor: _primaryColorLight,
                            text: '6',
                            textColor: _secondaryColor,
                            fontSize: _numFontSize,
                            fontWeight: FontWeight.normal,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                          LargeButton(
                            buttonColor: _primaryColor,
                            text: String.fromCharCodes(Runes('\u2212')),
                            textColor: _secondaryColor,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w200,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                        ],
                      ),
                      //Row 4
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LargeButton(
                            buttonColor: _primaryColorLight,
                            text: '1',
                            textColor: _secondaryColor,
                            fontSize: _numFontSize,
                            fontWeight: FontWeight.normal,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                          LargeButton(
                            buttonColor: _primaryColorLight,
                            text: '2',
                            textColor: _secondaryColor,
                            fontSize: _numFontSize,
                            fontWeight: FontWeight.normal,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                          LargeButton(
                            buttonColor: _primaryColorLight,
                            text: '3',
                            textColor: _secondaryColor,
                            fontSize: _numFontSize,
                            fontWeight: FontWeight.normal,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                          LargeButton(
                            buttonColor: _primaryColor,
                            text: String.fromCharCodes(Runes('\u002B')),
                            textColor: _secondaryColor,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w200,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                        ],
                      ),
                      //Row 5
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LargeButton(
                            buttonColor: _primaryColorLight,
                            text: '0',
                            textColor: _secondaryColor,
                            fontSize: _numFontSize,
                            fontWeight: FontWeight.normal,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                          LargeButton(
                            buttonColor: _primaryColorLight,
                            text: '.',
                            textColor: _secondaryColor,
                            fontSize: _numFontSize,
                            fontWeight: FontWeight.normal,
                            radius: _height * 0.1,
                            callback: buttonPressed,
                          ),
                          ElevatedButton(
                            onPressed: evaluate,
                            child: Text(
                              String.fromCharCodes(Runes('\u003D')),
                              style: GoogleFonts.poppins(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: _primaryColorDark,
                                padding: EdgeInsets.zero,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(40.0),
                                        right: Radius.circular(40.0))),
                                minimumSize:
                                    Size(_height * 0.22, _height * 0.1),
                                elevation: 0),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //Buttons
            ],
          )),
    );
  }
}
