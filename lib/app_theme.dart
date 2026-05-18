import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _black = Color(0xFF1A1A1A);

  static ThemeData lightTheme(BuildContext context) {
    final base = ThemeData.light(useMaterial3: true);
    final poppins = GoogleFonts.poppinsTextTheme(base.textTheme);

    return base.copyWith(
      colorScheme: ColorScheme.light(
        primary: _black,
        onPrimary: Colors.white,
        secondary: _black,
        surface: Colors.white,
        onSurface: _black,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: poppins,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: _black,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: _black,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _black,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _black,
          side: BorderSide(color: Colors.grey.shade200),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _black,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade50,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.orange.shade300, width: 1.5),
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: Colors.grey.shade100),
        ),
        margin: EdgeInsets.zero,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey.shade200,
        thickness: 0.5,
        space: 0,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: _black,
        contentTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 13,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
