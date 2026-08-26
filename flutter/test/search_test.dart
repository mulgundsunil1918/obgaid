import 'package:flutter_test/flutter_test.dart';
import 'package:obgaid_app/data/search_index.dart';
import 'package:obgaid_app/data/content_registry.dart';
import 'package:obgaid_app/data/scores.dart';
import 'package:obgaid_app/data/counselling.dart';
import 'package:obgaid_app/data/learning_registry.dart';
import 'package:obgaid_app/data/safety_cases.dart';
import 'package:obgaid_app/data/exam_topics.dart';
import 'package:obgaid_app/data/quick_tables.dart';
import 'package:obgaid_app/data/anatomy.dart';

/// Search previously indexed six hand-listed registries, so roughly 150 of
/// 235 nodes could not be found at all. These tests exist so that cannot
/// silently return.
void main() {
  _depthTests();
  group('global search reaches the whole graph', () {
    test('every reachable node is findable by its own title', () {
      final missing = <String>[];
      for (final n in ContentRegistry.allNodes) {
        if (n.builder == null) continue;
        final hits = SearchIndex.search(n.title);
        if (!hits.any((h) => h.link.id == n.id)) missing.add(n.id);
      }
      expect(missing, isEmpty,
          reason: 'These nodes cannot be found by searching their own '
              'title: ${missing.join(', ')}');
    });

    test('the families that were previously invisible are indexed', () {
      // One representative from each family the old delegate omitted.
      final families = <String, String>{
        'score': kScores.first.name,
        'counselling guide': kCounsellingGuides.first.title,
        'learning topic': LearningRegistry.all.first.title,
        'safety case': kSafetyCases.first.title,
        'exam topic': kExamTopics.first.title,
        'quick table': kQuickTables.first.title,
        'anatomy entry': kAnatomy.first.name,
      };
      families.forEach((family, title) {
        expect(SearchIndex.search(title), isNotEmpty,
            reason: '$family "$title" is not searchable');
      });
    });

    test('abbreviations clinicians actually type resolve', () {
      const cases = {
        'PPH': 'haemorrhage',
        'LSCS': 'caesarean',
        'PPROM': 'pprom',
        'GDM': 'diabetes',
        'MgSO4': 'magnesium',
        'IUGR': 'growth',
        'PMB': 'postmenopausal',
        'MTP': 'act',
        'FGM': 'genital mutilation',
        'DIPSI': 'diabetes',
      };
      cases.forEach((abbrev, expectWord) {
        final hits = SearchIndex.search(abbrev);
        expect(hits, isNotEmpty, reason: '"$abbrev" returns nothing');
        expect(
            hits.any((h) =>
                h.link.title.toLowerCase().contains(expectWord) ||
                h.link.id.toLowerCase().contains(expectWord)),
            isTrue,
            reason: '"$abbrev" did not surface anything matching '
                '"$expectWord" — top hit was "${hits.first.link.title}"');
      });
    });

    test('a title match outranks a category match', () {
      final hits = SearchIndex.search('sepsis');
      expect(hits.first.link.title.toLowerCase(), contains('sepsis'),
          reason: 'top hit for "sepsis" was "${hits.first.link.title}", '
              'which does not have sepsis in its title');
    });

    test('an empty query returns nothing rather than everything', () {
      expect(SearchIndex.search('   '), isEmpty);
    });

    test('no result points at a screen that cannot open', () {
      for (final h in SearchIndex.search('a')) {
        expect(h.link.builder, isNotNull, reason: '${h.link.id} has no screen');
      }
    });
  });
}

/// The landing page promises "type fibrinogen and get the blood product
/// targets". A lookup table that cannot be searched by its cells is not a
/// lookup table.
void _depthTests() {
  group('search reaches into content, not just titles', () {
    test('a quick table is findable by a value inside it', () {
      final hits = SearchIndex.search('fibrinogen');
      expect(hits, isNotEmpty, reason: '"fibrinogen" returns nothing');
      expect(hits.any((h) => h.link.id.startsWith('qt-')), isTrue,
          reason: 'no quick table surfaced for a value it contains');
    });

    test('a drug is findable by its brand name', () {
      final hits = SearchIndex.search('syntocinon');
      expect(hits.any((h) => h.link.id == 'oxytocin'), isTrue,
          reason: 'oxytocin not found by brand name');
    });

    test('a title match still outranks a keyword match', () {
      final hits = SearchIndex.search('oxytocin');
      expect(hits.first.link.title.toLowerCase(), contains('oxytocin'));
    });
  });
}
