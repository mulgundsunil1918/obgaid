import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:obgaid_app/models/learning_topic.dart';
import 'package:obgaid_app/widgets/learning_art.dart';
import 'package:obgaid_app/data/learning_registry.dart';
import 'package:obgaid_app/theme/app_theme.dart';

/// The illustrations are bundled assets drawn by hand, so they can break by a
/// missing file, an unreferenced file, or a path that stops tinting — none of
/// which the compiler sees.
void main() {
  group('learning category art', () {
    test('every populated category has an illustration', () {
      final missing = LearningRegistry.populated
          .where((c) => LearningArt.assetFor(c) == null)
          .map((c) => c.label)
          .toList();
      expect(missing, isEmpty,
          reason: 'no art for: ${missing.join(", ")}');
    });

    test('every referenced illustration exists on disk', () {
      final missing = LearningArt.assets
          .where((a) => !File('assets/learning/$a.svg').existsSync())
          .toList();
      expect(missing, isEmpty, reason: 'not bundled: ${missing.join(", ")}');
    });

    test('every bundled illustration is used', () {
      final used = LearningArt.assets.toSet();
      final orphans = Directory('assets/learning')
          .listSync()
          .whereType<File>()
          .map((f) => f.path.split('/').last.replaceAll('.svg', ''))
          .where((n) => !used.contains(n))
          .toList();
      expect(orphans, isEmpty,
          reason: 'shipping unused art: ${orphans.join(", ")}');
    });

    test('linework is themeable and the accent is not', () {
      // currentColor lets the outline follow light and dark. The clay accent
      // is a literal so it stays constant — that two-tone is the whole design,
      // and a colorFilter anywhere would flatten it.
      for (final a in LearningArt.assets) {
        final body = File('assets/learning/$a.svg').readAsStringSync();
        expect(body, contains('currentColor'),
            reason: '$a.svg has no currentColor stroke, so it cannot theme');
        expect(body, contains('#C2603C'),
            reason: '$a.svg has no accent, so it is flat line art');
      }
    });

    testWidgets('art renders for every category', (t) async {
      for (final c in LearningRegistry.populated) {
        await t.pumpWidget(MaterialApp(
          theme: AppTheme.light(),
          home: Scaffold(body: LearningArt(category: c)),
        ));
        await t.pump();
        expect(find.byType(SvgPicture), findsOneWidget,
            reason: '${c.label} rendered no illustration');
      }
    });
  });
}
