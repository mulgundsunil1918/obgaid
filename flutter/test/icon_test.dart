import 'package:flutter_test/flutter_test.dart';
import 'package:obgaid_app/data/content_registry.dart';
import 'package:obgaid_app/data/icon_map.dart';
import 'package:obgaid_app/data/algorithm_registry.dart';

/// Icons used to be assigned per group, so every tool in a module shared one
/// glyph — three fetal-biometry cards rendered as identical triplets. These
/// tests hold the per-item assignment.
void main() {
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
