import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/my_colors.dart';

class AppThemes {
  AppThemes._();
  static final light = ThemeData(

      // iconTheme: IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(backgroundColor: MyColors.appcolor),
      colorScheme: ColorScheme.fromSeed(seedColor: MyColors.appcolor),
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily);
  static final dark = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: MyColors.secondarycolor),
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily);
}
