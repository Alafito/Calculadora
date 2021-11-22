// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class CalBotao extends StatelessWidget {
  final String text;
  final Function callback;
  final int color;

  const CalBotao(this.text, this.color, this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
          child: Text(
            text,
            style: GoogleFonts.rubik(
                textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            )),
          ),
          onPressed: () {
            callback(text);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(color)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
          ),
        ),
      ),
    );
  }
}
