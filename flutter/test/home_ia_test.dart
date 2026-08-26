import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:obgaid_app/screens/home/home_screen.dart';
import 'package:obgaid_app/theme/app_theme.dart';
import 'package:obgaid_app/theme/theme_provider.dart';

Widget _app() => ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MaterialApp(theme: AppTheme.light(), home: const HomeScreen()),
    );

/// The home screen is the one screen every user sees, so its shape is
/// asserted rather than eyeballed — particularly the emergency path, which is
/// a clinical safety property and not a layout preference.
void main() {
  group('home information architecture', () {
    testWidgets('the doors are flat — no group headings', (t) async {
      await t.pumpWidget(_app());
      await t.pumpAndSettle();
      // The old two-layer structure. If any of these come back, the extra hop
      // has come back with them.
      for (final heading in [
        'IN AN EMERGENCY',
        'AT THE BEDSIDE',
        'IN THEATRE',
        'REFERENCE',
        'LEARNING',
      ]) {
        expect(find.text(heading), findsNothing,
            reason: 'group heading "$heading" is back on home');
      }
    });

    testWidgets('every door is present exactly once', (t) async {
      await t.pumpWidget(_app());
      await t.pumpAndSettle();
      for (final door in [
        'Emergencies',
        'Calculators & Scores',
        'Learn OBG',
        'Clinical Topics',
        'Drug Formulary',
        'Ultrasound',
        'Procedures & Anatomy',
        'Counselling',
        'Reference Library',
        'Academics & CME',
        'Never Again',
      ]) {
        expect(find.text(door), findsOneWidget,
            reason: '"$door" is missing from home, or listed twice');
      }
    });

    testWidgets('Emergencies sits above every other door', (t) async {
      // It is a band, not a grid tile, precisely so that text scaling or a
      // narrow screen can never push it below the fold.
      await t.pumpWidget(_app());
      await t.pumpAndSettle();
      final emergencyY = t.getTopLeft(find.text('Emergencies')).dy;
      for (final door in [
        'Calculators & Scores',
        'Clinical Topics',
        'Never Again',
      ]) {
        expect(emergencyY, lessThan(t.getTopLeft(find.text(door)).dy),
            reason: 'Emergencies is below "$door"');
      }
    });

    testWidgets('Emergencies survives a large text scale', (t) async {
      // Accessibility text sizes are where a grid tile would get pushed down.
      t.view.physicalSize = const Size(360 * 3, 640 * 3);
      t.view.devicePixelRatio = 3.0;
      addTearDown(t.view.reset);

      await t.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(textScaler: TextScaler.linear(2.0)),
          child: _app(),
        ),
      );
      await t.pumpAndSettle();
      expect(find.text('Emergencies'), findsOneWidget);
      final y = t.getTopLeft(find.text('Emergencies')).dy;
      expect(y, lessThan(640),
          reason: 'at 2x text scale Emergencies fell to ${y.round()}px, '
              'below a 640px viewport');
    });

    testWidgets('the search field is reachable from home', (t) async {
      await t.pumpWidget(_app());
      await t.pumpAndSettle();
      expect(find.textContaining('Search algorithms'), findsWidgets);
    });
  });
}
