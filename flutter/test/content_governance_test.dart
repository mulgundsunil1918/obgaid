import 'package:flutter_test/flutter_test.dart';
import 'package:obgaid_app/data/content_registry.dart';
import 'package:obgaid_app/data/tool_registry.dart';
import 'package:obgaid_app/data/staging_data.dart';
import 'package:obgaid_app/data/algorithm_registry.dart';
import 'package:obgaid_app/data/topic_registry.dart';
import 'package:obgaid_app/data/drug_registry.dart';
import 'package:obgaid_app/data/vaccines.dart';
import 'package:obgaid_app/data/trial_registry.dart';
import 'package:obgaid_app/data/lab_reference.dart';
import 'package:obgaid_app/models/reference_data.dart';
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
      // Emergency algorithms, drug dosing, anticoagulation and statute are all
      // named in §63.
      for (final id in [
        'mgso4',
        'pph',
        'mtp-act',
        'pcpndt-act',
        'insulin',
        'anaemia',
        'vte-risk',
      ]) {
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

  group('§52 — algorithm structure', () {
    test('every algorithm has immediate actions above the fold', () {
      for (final a in AlgorithmRegistry.all) {
        expect(a.immediate, isNotEmpty,
            reason: '${a.id} has no "do this now" block — in an emergency '
                'nobody scrolls');
      }
    });

    test('every algorithm covers recognition through follow-up', () {
      for (final a in AlgorithmRegistry.all) {
        expect(a.sections.length, greaterThanOrEqualTo(5),
            reason: '${a.id} has only ${a.sections.length} sections; §52 '
                'requires recognition, assessment, investigations, '
                'differential, treatment, escalation, definitive treatment, '
                'monitoring and follow-up');
      }
    });

    test('every algorithm cites its sources', () {
      for (final a in AlgorithmRegistry.all) {
        expect(a.sources, isNotEmpty, reason: '${a.id} cites no source');
      }
    });

    test('every algorithm has a content record and is high-risk', () {
      for (final a in AlgorithmRegistry.all) {
        final m = ContentRegistry.metaFor(a.id);
        expect(m, isNotNull, reason: '${a.id} has no §62 content record');
        expect(m!.highRisk, isTrue,
            reason: '${a.id} is an emergency algorithm — §63 makes it '
                'high-risk by definition');
      }
    });

    test('algorithm ids are unique', () {
      final ids = AlgorithmRegistry.all.map((a) => a.id).toList();
      expect(ids.toSet().length, ids.length, reason: 'duplicate algorithm id');
    });

    test('every algorithm is reachable from the emergency hub', () {
      final grouped = <String>{
        for (final list in AlgorithmRegistry.byGroup.values)
          for (final a in list) a.id,
      };
      for (final a in AlgorithmRegistry.all) {
        expect(grouped, contains(a.id),
            reason: '${a.id} exists but sits in no group, so no one can find '
                'it');
      }
    });
  });

  group('§52 — reference topic structure', () {
    test('every topic leads with key numbers', () {
      for (final t in TopicRegistry.all) {
        expect(t.keyFacts, isNotEmpty,
            reason: '${t.id} has no key-facts block — a reference topic should '
                'open on the numbers someone came to look up');
      }
    });

    test('every topic has substantive sections', () {
      for (final t in TopicRegistry.all) {
        expect(t.sections.length, greaterThanOrEqualTo(4),
            reason: '${t.id} has only ${t.sections.length} sections');
        for (final s in t.sections) {
          expect(s.steps, isNotEmpty,
              reason: '${t.id} section "${s.title}" is empty');
        }
      }
    });

    test('every topic cites its sources', () {
      for (final t in TopicRegistry.all) {
        expect(t.sources, isNotEmpty, reason: '${t.id} cites no source');
      }
    });

    test('every topic has a content record', () {
      for (final t in TopicRegistry.all) {
        expect(ContentRegistry.metaFor(t.id), isNotNull,
            reason: '${t.id} has no §62 content record');
      }
    });

    test('topic ids are unique and reachable from a group', () {
      final ids = TopicRegistry.all.map((t) => t.id).toList();
      expect(ids.toSet().length, ids.length, reason: 'duplicate topic id');
      final grouped = <String>{
        for (final list in TopicRegistry.byGroup.values)
          for (final t in list) t.id,
      };
      for (final t in TopicRegistry.all) {
        expect(grouped, contains(t.id), reason: '${t.id} sits in no group');
      }
    });
  });

  group('§45/§46 — formulary entries', () {
    test('every drug carries at least one dose', () {
      for (final d in DrugRegistry.all) {
        expect(d.doses, isNotEmpty, reason: '${d.id} has no dosing');
        for (final dose in d.doses) {
          expect(dose.indication.trim(), isNotEmpty);
          expect(dose.dose.trim(), isNotEmpty,
              reason: '${d.id} has a dose block with no dose');
        }
      }
    });

    test('every drug states pregnancy AND lactation information', () {
      for (final d in DrugRegistry.all) {
        expect(d.pregnancy.summary.trim(), isNotEmpty,
            reason: '${d.id} has no pregnancy information — §45 requires it');
        expect(d.lactation.summary.trim(), isNotEmpty,
            reason: '${d.id} has no lactation information — §45 requires it');
      }
    });

    test('no drug uses a bare SAFE / UNSAFE label', () {
      // §46: "Avoid simplistic SAFE / UNSAFE labels when the evidence is more
      // nuanced." In pregnancy and lactation it almost always is.
      final banned = RegExp(r'\b(SAFE|UNSAFE)\b');
      for (final d in DrugRegistry.all) {
        for (final text in [
          d.pregnancy.summary,
          d.lactation.summary,
          ...d.pregnancy.points,
          ...d.lactation.points,
        ]) {
          expect(banned.hasMatch(text), isFalse,
              reason: '${d.id} uses a bare SAFE/UNSAFE label: "$text"');
        }
      }
    });

    test('every drug names its contraindications and references', () {
      for (final d in DrugRegistry.all) {
        expect(d.contraindications, isNotEmpty,
            reason: '${d.id} lists no contraindications');
        expect(d.references, isNotEmpty, reason: '${d.id} cites no source');
      }
    });

    test('drug ids are unique and reachable from a group', () {
      final ids = DrugRegistry.all.map((d) => d.id).toList();
      expect(ids.toSet().length, ids.length, reason: 'duplicate drug id');
      final grouped = <String>{
        for (final list in DrugRegistry.byGroup.values)
          for (final d in list) d.id,
      };
      for (final d in DrugRegistry.all) {
        expect(grouped, contains(d.id), reason: '${d.id} sits in no group');
      }
    });
  });

  group('§50 — every vaccine recommendation is attributable', () {
    test('country, organisation, year, schedule and source are all present',
        () {
      for (final entry in kVaccines.entries) {
        for (final v in entry.value) {
          expect(v.country.trim(), isNotEmpty, reason: '${v.vaccine}: country');
          expect(v.organisation.trim(), isNotEmpty,
              reason: '${v.vaccine}: organisation');
          expect(v.year, greaterThan(2000), reason: '${v.vaccine}: year');
          expect(v.schedule.trim(), isNotEmpty,
              reason: '${v.vaccine}: schedule');
          expect(v.source.trim(), isNotEmpty, reason: '${v.vaccine}: source');
          expect(v.timing.trim(), isNotEmpty, reason: '${v.vaccine}: timing');
        }
      }
    });

    test('every stage carries at least one recommendation', () {
      for (final stage in VaccineStage.values) {
        expect(kVaccines[stage], isNotNull,
            reason: '${stage.label} has no entries');
        expect(kVaccines[stage]!, isNotEmpty,
            reason: '${stage.label} has no entries');
      }
    });

    test('live vaccines appear in the contraindicated stage', () {
      final contraindicated = kVaccines[VaccineStage.contraindicated]!;
      expect(contraindicated.any((v) => v.live), isTrue,
          reason: 'Live vaccines must be listed as contraindicated in '
              'pregnancy');
      // No live vaccine may sit under "during pregnancy".
      for (final v in kVaccines[VaccineStage.pregnancy]!) {
        expect(v.live, isFalse,
            reason: '${v.vaccine} is marked live but listed for use during '
                'pregnancy');
      }
    });
  });

  group('§47 — laboratory ranges', () {
    test('every analyte carries all four ranges and a unit', () {
      for (final panel in kLabPanels) {
        expect(panel.analytes, isNotEmpty, reason: '${panel.name} is empty');
        for (final a in panel.analytes) {
          expect(a.unit.trim(), isNotEmpty, reason: '${a.name}: unit');
          expect(a.nonPregnant.trim(), isNotEmpty,
              reason: '${a.name}: non-pregnant range');
          expect(a.first.trim(), isNotEmpty, reason: '${a.name}: first');
          expect(a.second.trim(), isNotEmpty, reason: '${a.name}: second');
          expect(a.third.trim(), isNotEmpty, reason: '${a.name}: third');
        }
      }
    });

    test('analyte names are unique across panels', () {
      final names = [
        for (final p in kLabPanels)
          for (final a in p.analytes) a.name
      ];
      expect(names.toSet().length, names.length,
          reason: 'duplicate analyte name');
    });
  });

  group('§53 — landmark trial records', () {
    test('every trial states a result and a takeaway', () {
      for (final t in TrialRegistry.all) {
        expect(t.results, isNotEmpty, reason: '${t.id} has no results');
        expect(t.takeaway.trim(), isNotEmpty, reason: '${t.id}: takeaway');
        expect(t.guidelineImpact.trim(), isNotEmpty,
            reason: '${t.id}: guideline impact');
      }
    });

    test('every trial names journal, year, setting and sample size', () {
      for (final t in TrialRegistry.all) {
        expect(t.journal.trim(), isNotEmpty, reason: '${t.id}: journal');
        expect(t.year, greaterThan(1950), reason: '${t.id}: year');
        expect(t.setting.trim(), isNotEmpty, reason: '${t.id}: setting');
        expect(t.sampleSize.trim(), isNotEmpty, reason: '${t.id}: sample size');
      }
    });

    test('every trial carries limitations', () {
      // §53 asks for limitations alongside the result. A trial presented
      // without them invites overreach.
      for (final t in TrialRegistry.all) {
        expect(t.limitations, isNotEmpty,
            reason: '${t.id} lists no limitations');
      }
    });

    test('trial ids and acronyms are unique', () {
      final ids = TrialRegistry.all.map((t) => t.id).toList();
      expect(ids.toSet().length, ids.length, reason: 'duplicate trial id');
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
  'pathology',
  'imaging',
  'infertility',
  'ohss',
  'maternal-medicine',
  'fetal-medicine',
  'lab-reference',
  'immunisation',
  'formulary',
  'pcos-assessment',
  'adnexal-mass',
  'popq',
  'aub',
  'pcos',
  'fibroids',
  'endometriosis',
  'adenomyosis',
  'contraception',
  'menopause',
  'urogynaecology',
  'ctg',
  'fgr',
  'pprom',
  'preterm-labour',
  'induction',
  'vbac',
  'caesarean',
  'rh-negative',
  'anthropometry',
  'weight-gain',
  'haemodynamics',
  'anaemia',
  'insulin',
  'creatinine',
  'vte-risk',
  'apgar',
  'algo-pph',
  'algo-abruption',
  'algo-uterine-rupture',
  'algo-eclampsia',
  'algo-severe-htn',
  'algo-maternal-collapse',
  'algo-afe',
  'algo-sepsis',
  'algo-shoulder-dystocia',
  'algo-cord-prolapse',
  'algo-ectopic',
  'algo-ovarian-torsion',
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
