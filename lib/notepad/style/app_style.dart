import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppStyle{
      static Color mainColor = const Color(0xfeeefff9);
      static Color bgColor = const Color(0XFFE2E2EE);
      static Color accentColor = const Color(0Xff0065FF);
// cards color
      static List<Color>  cardsColor  = [
            Colors.white,
            Colors.red.shade100,
            Colors.pink.shade50,
            Colors.purple.shade100,
            Colors.yellow.shade100,
            Colors.orange.shade100,
            Colors.blue.shade100,
            Colors.blueGrey.shade100,


      ];

      //textstyle
      static TextStyle mainTitle = GoogleFonts.roboto(
            fontSize:  18,
            fontWeight: FontWeight.bold,

      );
      static TextStyle mainContent  = GoogleFonts.nunito(
            fontSize:  16,
            fontWeight: FontWeight.normal,

      );

      static TextStyle dateTime  = GoogleFonts.roboto(
            fontSize:  13,
            fontWeight: FontWeight.w500,

      );


}


