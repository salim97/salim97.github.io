import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static const body = Color(0xFFEDF9FE);
  static const text_color = Color(0xFF001C55);
  static const secondaryText_color = Color(0xFF7F8DAA);
  static const highlight =        Color(0xFFA6E1FA);
  static const headerColor =      Color(0x0E6BA877);
  static const dark =             Color(0xFF00072D);
  static const imageHighlight =   Color(0xFF0E6BA8);
  static const compImgHighlight = Color(0xFFE6E6E6);
  static const jacketColor =      Color(0xFF0A2472);
  static const card_header_color =      Color(0xFF85B7D6);
  static const card_body_color =      Color(0xFFEDF9FE);


  static ThemeData blueThemeDataDesktop = ThemeData(
    textTheme: textThemeDesktop,
    brightness: Brightness.light,
    primaryColor: body,
  );
  static ThemeData blueThemeDataTablet = ThemeData(
    textTheme: textThemeTablet,
    brightness: Brightness.light,
    primaryColor: body,
  );
  static ThemeData blueThemeDataMobile = ThemeData(
    textTheme: textThemeMobile,
    brightness: Brightness.light,
    primaryColor: body,
  );



  static TextTheme textThemeDesktop = TextTheme(
    headline1: TextStyle(fontSize: 70.0, fontFamily: "Google Sans Bold", color: text_color, fontWeight: FontWeight.w700),
    subtitle1: TextStyle(fontSize: 30.0, fontFamily: "Google Sans BoldItalic", color: text_color, fontWeight: FontWeight.w700),
    bodyText1: TextStyle(fontSize: 40.0, fontFamily: "Google Sans Medium", color: secondaryText_color, fontWeight: FontWeight.w400),
    button: TextStyle(fontSize: 19.0, fontFamily: "Google Sans Regular", color: text_color, fontWeight: FontWeight.w700),
   
    headline2: TextStyle(fontSize: 60.0, fontFamily: "Google Sans Bold", color: text_color, fontWeight: FontWeight.w700),
    headline3: TextStyle(fontSize: 56.0, fontFamily: "Google Sans Bold", color: text_color, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(fontSize: 20.0, fontFamily: "Google Sans BoldItalic", color: secondaryText_color, fontWeight: FontWeight.w400),

    headline4: TextStyle(fontSize: 20.0, fontFamily: "Google Sans Medium", color: text_color, fontWeight: FontWeight.w700),
    bodyText2: TextStyle(fontSize: 20.0, fontFamily: "Google Sans Regular", color: text_color, fontWeight: FontWeight.w700),
    
  
    caption: GoogleFonts.lato(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );

  static TextTheme textThemeTablet = TextTheme(
    headline1: TextStyle(fontSize: 50.0, fontFamily: "Google Sans Bold", color: text_color, fontWeight: FontWeight.w700),
    subtitle1: TextStyle(fontSize: 30.0, fontFamily: "Google Sans BoldItalic", color: text_color, fontWeight: FontWeight.w700),
    bodyText1: TextStyle(fontSize: 20.0, fontFamily: "Google Sans Medium", color: secondaryText_color, fontWeight: FontWeight.w400),
    button: TextStyle(fontSize: 18.0, fontFamily: "Google Sans Regular", color: Color.fromRGBO(237, 249, 254, 1), fontWeight: FontWeight.w500),
   
    headline2: TextStyle(fontSize: 50.0, fontFamily: "Google Sans Bold", color: text_color, fontWeight: FontWeight.w700),
    headline3: TextStyle(fontSize: 40.0, fontFamily: "Google Sans Bold", color: text_color, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(fontSize: 20.0, fontFamily: "Google Sans BoldItalic", color: secondaryText_color, fontWeight: FontWeight.w400),
   
  
    headline4: TextStyle(fontSize: 20.0, fontFamily: "Google Sans Medium", color: text_color, fontWeight: FontWeight.w700),
    bodyText2: TextStyle(fontSize: 20.0, fontFamily: "Google Sans Regular", color: text_color, fontWeight: FontWeight.w400),
    

    caption: GoogleFonts.lato(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );

  static TextTheme textThemeMobile = TextTheme(
    headline1: TextStyle(fontSize: 30.0, fontFamily: "Google Sans Bold", color: text_color, fontWeight: FontWeight.w700),
    subtitle1: TextStyle(fontSize: 25.0, fontFamily: "Google Sans BoldItalic", color: text_color, fontWeight: FontWeight.w700),
    bodyText1: TextStyle(fontSize: 16.0, fontFamily: "Google Sans Medium", color: secondaryText_color, fontWeight: FontWeight.w400),
    button: TextStyle(fontSize: 15.0, fontFamily: "Google Sans Regular", color: Color.fromRGBO(237, 249, 254, 1), fontWeight: FontWeight.w500),
   
    headline2: TextStyle(fontSize: 30.0, fontFamily: "Google Sans Bold", color: text_color, fontWeight: FontWeight.w700),
    headline3: TextStyle(fontSize: 30.0, fontFamily: "Google Sans Bold", color: text_color, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(fontSize: 16.0, fontFamily: "Google Sans BoldItalic", color: secondaryText_color, fontWeight: FontWeight.w400),
   
  
    headline4: TextStyle(fontSize: 20.0, fontFamily: "Google Sans Medium", color: text_color, fontWeight: FontWeight.w700),
    bodyText2: TextStyle(fontSize: 20.0, fontFamily: "Google Sans Regular", color: text_color, fontWeight: FontWeight.w400),
    
    caption: GoogleFonts.lato(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
    overline: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  );
}
