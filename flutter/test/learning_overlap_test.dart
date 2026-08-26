import 'package:flutter_test/flutter_test.dart';
import 'package:obgaid_app/data/learning_registry.dart';
import 'package:obgaid_app/data/content_registry.dart';
import 'package:obgaid_app/data/topic_registry.dart';
import 'package:obgaid_app/data/algorithm_registry.dart';

/// The Learning section teaches; the rest of the app is used at the bedside.
/// They may cross-reference each other but they must not restate each other —
/// two pages on the same subject drift apart, and the reader has no way to
/// know which one is current.
///
/// So: a Learning topic may only exist where no node already owns the subject.
/// Where one does, the Learning topic links to it instead.
String _norm(String s) => s
    .toLowerCase()
    .replaceAll(RegExp(r'[^a-z0-9 ]'), ' ')
    .replaceAll(RegExp(r'\b(the|a|an|of|in|and|for|to|its)\b'), ' ')
    .replaceAll(RegExp(r'\s+'), ' ')
    .trim();

void main() {
  group('Learning section does not duplicate existing content', () {
    test('no learning topic restates an existing node title', () {
      // Every node except the Learning ones themselves.
      final learningIds = LearningRegistry.all.map((t) => t.id).toSet();
      final existing = <String, String>{};
      for (final n in ContentRegistry.allNodes) {
        if (learningIds.contains(n.id)) continue;
        existing[_norm(n.title)] = n.id;
      }

      final clashes = <String>[];
      for (final t in LearningRegistry.all) {
        final hit = existing[_norm(t.title)];
        if (hit != null) clashes.add('${t.id} ("${t.title}") duplicates $hit');
      }
      expect(clashes, isEmpty,
          reason: 'These learning topics restate content that already '
              'exists — link to it instead:\n${clashes.join('\n')}');
    });

    test('no learning topic restates a clinical topic or algorithm subject',
        () {
      final owned = <String, String>{
        for (final t in TopicRegistry.all) _norm(t.name): 'topic ${t.id}',
        for (final a in AlgorithmRegistry.all) _norm(a.name): 'algorithm ${a.id}',
      };
      final clashes = <String>[];
      for (final t in LearningRegistry.all) {
        final hit = owned[_norm(t.title)];
        if (hit != null) clashes.add('${t.id} duplicates $hit');
      }
      expect(clashes, isEmpty, reason: clashes.join('\n'));
    });

    test('learning topic ids and titles are unique among themselves', () {
      final ids = LearningRegistry.all.map((t) => t.id).toList();
      expect(ids.toSet().length, ids.length, reason: 'duplicate learning id');
      final titles = LearningRegistry.all.map((t) => _norm(t.title)).toList();
      expect(titles.toSet().length, titles.length,
          reason: 'two learning topics share a title');
    });

    test('every learning topic points at the deeper content it relies on', () {
      for (final t in LearningRegistry.all) {
        for (final id in t.related) {
          expect(ContentRegistry.resolve(id), isNotNull,
              reason: '${t.id} links to "$id", which does not exist');
        }
      }
    });

    test('every learning topic carries structure and a source', () {
      for (final t in LearningRegistry.all) {
        expect(t.summary.trim(), isNotEmpty, reason: '${t.id} has no summary');
        expect(t.sections.length, greaterThanOrEqualTo(3),
            reason: '${t.id} has only ${t.sections.length} sections');
        for (final s in t.sections) {
          expect(s.points, isNotEmpty,
              reason: '${t.id} section "${s.heading}" is empty');
        }
        expect(t.keyPoints, isNotEmpty, reason: '${t.id} has no key points');
        expect(t.sources, isNotEmpty, reason: '${t.id} cites nothing');
      }
    });

    test('every learning topic reaches an Indian source', () {
      final indian = RegExp(
          r'FOGSI|ICOG|MoHFW|ICMR|NACO|National Medical Commission|NMC|'
          r'Indian|India|ISAR|NABH|Dakshata|LaQshya|DIPSI|Anemia Mukt|'
          r'National Cancer Grid|Tata Memorial|PCPNDT|MTP Act|ART \(Reg',
          caseSensitive: false);
      final bare = <String>[];
      for (final t in LearningRegistry.all) {
        if (!t.sources.any(indian.hasMatch)) bare.add(t.id);
      }
      expect(bare, isEmpty,
          reason: 'India-first is the claim; these cite no Indian source: '
              '${bare.join(', ')}');
    });
  });
}
