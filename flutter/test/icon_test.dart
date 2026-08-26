import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:obgaid_app/theme/app_theme.dart';
import 'package:obgaid_app/widgets/hub_widgets.dart';
import 'package:obgaid_app/data/content_registry.dart';
import 'package:obgaid_app/data/icon_map.dart';
import 'package:obgaid_app/data/algorithm_registry.dart';

/// Icons used to be assigned per group, so every tool in a module shared one
/// glyph — three fetal-biometry cards rendered as identical triplets. These
/// tests hold the per-item assignment.
void main() {
  _svgTests();
  _svgRenderTests();
  group('icons identify the item, not its bucket', () {
    test('no icon is shared by more than 12 nodes', () {
      final byIcon = <int, List<String>>{};
      for (final n in ContentRegistry.allNodes) {
        byIcon.putIfAbsent(n.icon.codePoint, () => []).add(n.id);
      }
      final worst = byIcon.entries
          .where((e) => e.value.length > 12)
          .map((e) => '${e.value.length}× ${e.value.take(5).join(", ")}')
          .toList();
      expect(worst, isEmpty,
          reason: 'these icons are reused too widely to distinguish '
              'anything:\n${worst.join("\n")}');
    });

    test('every emergency algorithm has its own icon', () {
      // The emergency hub is the screen where telling tiles apart matters
      // most, and it was 29 identical glyphs.
      final icons = <int, String>{};
      final clashes = <String>[];
      for (final a in AlgorithmRegistry.all) {
        final icon = IconMap.of(a.id);
        expect(icon, isNotNull, reason: '${a.id} has no icon assigned');
        final prior = icons[icon!.codePoint];
        if (prior != null) clashes.add('${a.id} shares its icon with $prior');
        icons[icon.codePoint] = a.id;
      }
      expect(clashes, isEmpty, reason: clashes.join('\n'));
    });

    test('the graph draws on a wide icon vocabulary', () {
      final distinct = ContentRegistry.allNodes
          .map((n) => n.icon.codePoint)
          .toSet()
          .length;
      // It was 31 across 235 nodes.
      expect(distinct, greaterThan(90),
          reason: 'only $distinct distinct icons across '
              '${ContentRegistry.allNodes.length} nodes');
    });

    test('every mapped id is a real node', () {
      final ids = ContentRegistry.allNodes.map((n) => n.id).toSet();
      final stale = <String>[];
      for (final id in IconMap.mappedIds) {
        if (!ids.contains(id)) stale.add(id);
      }
      expect(stale, isEmpty,
          reason: 'icon map points at ids that no longer exist: '
              '${stale.join(", ")}');
    });
  });
}

/// The SVG layer is bundled assets, so it can break by a missing file rather
/// than a compile error. These prove the map and the bundle agree.
void _svgTests() {
  group('Health Icons assets', () {
    test('every referenced asset exists on disk', () {
      final missing = <String>[];
      for (final name in IconMap.svgAssets) {
        if (!File('assets/icons/$name.svg').existsSync()) missing.add(name);
      }
      expect(missing, isEmpty,
          reason: 'icon map references assets that are not bundled: '
              '${missing.join(", ")}');
    });

    test('every bundled asset is actually used', () {
      final used = IconMap.svgAssets.toSet();
      final orphans = Directory('assets/icons')
          .listSync()
          .whereType<File>()
          .map((f) => f.path.split('/').last.replaceAll('.svg', ''))
          .where((n) => !used.contains(n))
          .toList();
      expect(orphans, isEmpty,
          reason: 'bundled but never referenced, so shipping dead weight: '
              '${orphans.join(", ")}');
    });

    test('every svg-mapped id is a real node', () {
      final ids = ContentRegistry.allNodes.map((n) => n.id).toSet();
      final stale = <String>[];
      for (final n in ContentRegistry.allNodes) {
        // no-op; the check below is the real one
        if (n.id.isEmpty) stale.add(n.id);
      }
      for (final id in IconMap.svgMappedIds) {
        if (!ids.contains(id)) stale.add(id);
      }
      expect(stale, isEmpty,
          reason: 'svg map points at ids that do not exist: '
              '${stale.join(", ")}');
    });

    test('assets are tintable', () {
      // fill="currentColor" is what lets the glyph follow the theme. A file
      // with a baked-in colour would render wrong in dark mode.
      for (final name in IconMap.svgAssets) {
        final body = File('assets/icons/$name.svg').readAsStringSync();
        expect(body, contains('currentColor'),
            reason: '$name.svg has no currentColor fill, so it cannot be '
                'tinted');
      }
    });
  });
}

/// Proves the SVG layer actually reaches the screen, not just the map.
void _svgRenderTests() {
  group('Health Icons reach the screen', () {
    testWidgets('a hub tile with an svg-mapped id renders an SvgPicture',
        (t) async {
      await t.pumpWidget(MaterialApp(
        theme: AppTheme.light(),
        home: HubScaffold(
          title: 'Test',
          children: [
            HubTile(
              // 'efw' is mapped to the fetus glyph.
              id: 'efw',
              title: 'Estimated fetal weight',
              subtitle: 'Hadlock',
              icon: Icons.calculate_outlined,
              onTap: () {},
            ),
          ],
        ),
      ));
      await t.pump();
      expect(find.byType(SvgPicture), findsOneWidget,
          reason: 'the fetus glyph did not render for "efw"');
    });

    testWidgets('a tile with no svg falls back to a Material icon',
        (t) async {
      await t.pumpWidget(MaterialApp(
        theme: AppTheme.light(),
        home: HubScaffold(
          title: 'Test',
          children: [
            HubTile(
              id: 'no-such-node',
              title: 'Unmapped',
              subtitle: 'x',
              icon: Icons.calculate_outlined,
              onTap: () {},
            ),
          ],
        ),
      ));
      await t.pump();
      expect(find.byType(SvgPicture), findsNothing);
      expect(find.byIcon(Icons.calculate_outlined), findsOneWidget);
    });
  });
}
