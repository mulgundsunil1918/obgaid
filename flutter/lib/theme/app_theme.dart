import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ObgAid's visual identity.
///
/// Deliberately *not* PediAid's `#1e3a5f` navy — the two apps must be
/// distinguishable on a home screen at a glance. Deep teal reads clinical and
/// sits beside PediAid as a sibling without being mistaken for it, and steers
/// clear of the pink/rose register that would make this look like a
/// patient-facing pregnancy tracker.
class ObgColors {
  static const teal = Color(0xFF0D5C55); // primary
  static const tealDeep = Color(0xFF063D38); // headers, dark surfaces
  static const tealLight = Color(0xFF1A8078); // accents on dark
  static const clay = Color(0xFFC2603C); // warm accent / CTA
  static const amber = Color(0xFFB8860B); // caution band
  static const danger = Color(0xFFB3261E); // red flags, toxicity

  // Result-band colours, shared by every calculator so a "green" means the
  // same thing on every screen.
  static const bandGood = Color(0xFF1B7F5C);
  static const bandWatch = Color(0xFFB8860B);
  static const bandAlert = Color(0xFFC2603C);
  static const bandCritical = Color(0xFFB3261E);
}

class AppTheme {
  /// Card and border in dark mode. Named here rather than repeated as hex
  /// literals so a card in a hub and a card on home cannot drift apart.
  static const dCard = Color(0xFF17201E);
  static const dBorder = Color(0xFF2A3735);

  static ThemeData light() => _build(Brightness.light);
  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme = ColorScheme.fromSeed(
      seedColor: ObgColors.teal,
      brightness: brightness,
    ).copyWith(
      primary: isDark ? ObgColors.tealLight : ObgColors.teal,
      secondary: ObgColors.clay,
    );

    final base = ThemeData(colorScheme: scheme, useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor:
          isDark ? const Color(0xFF0F1513) : const Color(0xFFF6F8F7),
      textTheme: GoogleFonts.interTextTheme(base.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? const Color(0xFF0F1513) : ObgColors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: isDark ? const Color(0xFF17201E) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(
            color: isDark ? const Color(0xFF25322F) : const Color(0xFFE2E8E6),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? const Color(0xFF17201E) : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFCBD5D2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: isDark ? const Color(0xFF2B3A37) : const Color(0xFFCBD5D2),
          ),
        ),
        isDense: true,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: isDark ? const Color(0xFF25322F) : const Color(0xFFE2E8E6),
        space: 1,
        thickness: 1,
      ),
    );
  }
}
