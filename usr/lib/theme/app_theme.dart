import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0A0E11), // Deep dark blue/black
    primaryColor: const Color(0xFF00E676), // Neon Green
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF00E676),
      secondary: Color(0xFF2979FF), // Tech Blue
      surface: Color(0xFF151A1F), // Slightly lighter panel
      error: Color(0xFFFF1744),
      onSurface: Colors.white,
    ),
    textTheme: GoogleFonts.jetbrainsMonoTextTheme(
      ThemeData.dark().textTheme,
    ).apply(
      bodyColor: const Color(0xFFB0BEC5),
      displayColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0A0E11),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF151A1F),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.white.withOpacity(0.05)),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: const Color(0xFF00E676),
      inactiveTrackColor: const Color(0xFF151A1F),
      thumbColor: Colors.white,
      overlayColor: const Color(0xFF00E676).withOpacity(0.2),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF00E676);
        }
        return Colors.grey;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const Color(0xFF00E676).withOpacity(0.3);
        }
        return Colors.grey.withOpacity(0.3);
      }),
    ),
  );
}
