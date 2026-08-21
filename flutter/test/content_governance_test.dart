import 'package:flutter_test/flutter_test.dart';
import 'package:obgaid_app/data/content_registry.dart';
import 'package:obgaid_app/data/tool_registry.dart';
import 'package:obgaid_app/data/staging_data.dart';
import 'package:obgaid_app/models/content_meta.dart';

/// Enforces the content specification's rules in CI rather than by memory.
/// §61 traceability, §62 versioning, §63 mandatory review, §68 interconnection.
void main() {
  group('§68 — interconnection', () {
    test('every related edge resolves to a real node', () {
      final dangling = <String>[];
      for (final id in _allMetaIds) {
        final meta = ContentRegistry.metaFor(id)!;
        for (final rel in meta.related) {
          if (ContentRegistry.resolve(rel.id) == null) {
            dangling.add('$id → ${rel.id}');
          }
        }
      }
      expect(dangling, isEmpty,
          reason: 'Related links pointing at content that does not exist: '
              '${dangling.join(', ')}');
    });

    test('every edge states why it exists', () {
      for (final id in _allMetaIds) {
        for (final rel in ContentRegistry.metaFor(id)!.related) {
          expect(rel.why.trim(), isNotEmpty,
              reason: '$id → ${rel.id} has no stated reason');
        }
      }
    });

    test('no content item is an island', () {
      for (final id in _allMetaIds) {
        expect(ContentRegistry.metaFor(id)!.related, isNotEmpty,
            reason: '$id connects to nothing — §68 requires every item to '
                'connect to related content');
      }
    });
  });

  group('§61/§62 — traceability and versioning', () {
    test('every clinical item names a source organisation and title', () {
      for (final id in _allMetaIds) {
        final m = ContentRegistry.metaFor(id)!;
        expect(m.sourceOrg.trim(), isNotEmpty, reason: '$id has no source org');
        expect(m.sourceTitle.trim(), isNotEmpty,
            reason: '$id has no source title');
      }
    });

    test('every clinical item carries an author and a version', () {
      for (final id in _allMetaIds) {
        final m = ContentRegistry.metaFor(id)!;
        expect(m.author.trim(), isNotEmpty);
        expect(RegExp(r'^\d+\.\d+\.\d+$').hasMatch(m.version), isTrue,
            reason: '$id version "${m.version}" is not semver');
      }
    });
  });

  group('§63 — mandatory medical review', () {
    test('high-risk content is flagged as such', () {
      // Emergency algorithms, drug dosing and statute are named in §63.
      for (final id in ['mgso4', 'pph', 'mtp-act', 'pcpndt-act']) {
        expect(ContentRegistry.metaFor(id)!.highRisk, isTrue,
            reason: '$id falls under §63 and must be marked highRisk');
      }
    });

    test('high-risk content carries a review-due date', () {
      for (final id in _allMetaIds) {
        final m = ContentRegistry.metaFor(id)!;
        if (m.highRisk) {
          expect(m.nextReview, isNotNull,
              reason: '$id is high-risk and needs a review clock');
        }
      }
    });

    test('unreviewed high-risk content surfaces in the review queue', () {
      final queued = ContentRegistry.awaitingReview.map((m) => m.id).toSet();
      for (final id in _allMetaIds) {
        final m = ContentRegistry.metaFor(id)!;
        if (m.highRisk && m.reviewer == null) {
          expect(queued, contains(id),
              reason: '$id is high-risk and unreviewed but is not queued');
        }
      }
    });

    test('nothing high-risk is marked published without a reviewer', () {
      for (final id in _allMetaIds) {
        final m = ContentRegistry.metaFor(id)!;
        if (m.highRisk && m.status == ContentStatus.published) {
          expect(m.reviewer, isNotNull,
              reason: '$id is published as high-risk content with no medical '
                  'reviewer — §63 forbids this');
        }
      }
    });
  });

  group('registry integrity', () {
    test('every working tool has a content record', () {
      for (final t in ToolRegistry.all) {
        expect(ContentRegistry.metaFor(t.id), isNotNull,
            reason: 'Tool "${t.id}" has no §62 content record');
      }
    });

    test('staging systems all cite a source', () {
      for (final s in kStagingSystems) {
        expect(s.sources, isNotEmpty, reason: '${s.id} cites no source');
      }
    });
  });
}

const _allMetaIds = [
  'dating',
  'usg',
  'usg-guide',
  'efw',
  'bishop',
  'gdm',
  'mgso4',
  'pph',
  'mtp-act',
  'pcpndt-act',
];
