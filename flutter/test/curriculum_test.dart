import 'package:flutter_test/flutter_test.dart';
import 'package:obgaid_app/data/curriculum.dart';
import 'package:obgaid_app/data/content_registry.dart';

/// Learn OBG points at content rather than owning it, so its integrity is
/// entirely about whether those pointers resolve.
void main() {
  group('Learn OBG curriculum', () {
    test('every entry opens a real screen', () {
      final broken = <String>[];
      for (final s in kCurriculum) {
        for (final g in s.groups) {
          for (final e in g.entries) {
            final node = ContentRegistry.resolve(e.nodeId);
            if (node == null) {
              broken.add('${s.name} › ${e.title} → "${e.nodeId}" missing');
            } else if (node.builder == null) {
              broken.add('${s.name} › ${e.title} → "${e.nodeId}" opens '
                  'nothing');
            }
          }
        }
      }
      expect(broken, isEmpty, reason: broken.join('\n'));
    });

    test('section and group names are unique', () {
      final ids = kCurriculum.map((s) => s.id).toList();
      expect(ids.toSet().length, ids.length, reason: 'duplicate section id');
      for (final s in kCurriculum) {
        final g = s.groups.map((x) => x.name).toList();
        expect(g.toSet().length, g.length,
            reason: '${s.name} has two groups with the same name');
      }
    });

    test('no entry is repeated inside one section', () {
      // Across sections is fine and deliberate — cervical screening belongs
      // to both Sexual Health and Procedures. Twice in one section is a slip.
      for (final s in kCurriculum) {
        final seen = <String>{};
        final dupes = <String>[];
        for (final g in s.groups) {
          for (final e in g.entries) {
            if (!seen.add(e.nodeId)) dupes.add('${s.name} › ${e.nodeId}');
          }
        }
        expect(dupes, isEmpty, reason: dupes.join('\n'));
      }
    });

    test('every section carries a meaningful number of topics', () {
      for (final s in kCurriculum) {
        expect(s.topicCount, greaterThanOrEqualTo(10),
            reason: '${s.name} has only ${s.topicCount} topics');
        expect(s.groups, isNotEmpty);
      }
    });

    test('the curriculum reaches most of the app', () {
      // It is a way through the content, so it should cover the bulk of it.
      final reached = <String>{};
      for (final s in kCurriculum) {
        for (final g in s.groups) {
          for (final e in g.entries) {
            reached.add(e.nodeId);
          }
        }
      }
      expect(reached.length, greaterThan(140),
          reason: 'only ${reached.length} distinct nodes are reachable '
              'through Learn OBG');
    });
  });
}
