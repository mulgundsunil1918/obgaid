import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:obgaid_app/data/tool_registry.dart';
import 'package:obgaid_app/data/algorithm_registry.dart';
import 'package:obgaid_app/data/staging_data.dart';
import 'package:obgaid_app/data/topic_registry.dart';
import 'package:obgaid_app/data/drug_registry.dart';
import 'package:obgaid_app/screens/formulary/drug_screen.dart';
import 'package:obgaid_app/screens/reference/lab_reference_screen.dart';
import 'package:obgaid_app/screens/reference/immunisation_screen.dart';
import 'package:obgaid_app/data/trial_registry.dart';
import 'package:obgaid_app/screens/academics/trial_screen.dart';
import 'package:obgaid_app/data/safety_cases.dart';
import 'package:obgaid_app/data/counselling.dart';
import 'package:obgaid_app/data/exam_topics.dart';
import 'package:obgaid_app/data/anatomy.dart';
import 'package:obgaid_app/screens/anatomy/anatomy_screen.dart';
import 'package:obgaid_app/screens/academics/exam_screen.dart';
import 'package:obgaid_app/screens/reference/quick_tables_screen.dart';
import 'package:obgaid_app/screens/counselling/counselling_screen.dart';
import 'package:obgaid_app/screens/safety/safety_case_screen.dart';
import 'package:obgaid_app/screens/reference/guidelines_screen.dart';
import 'package:obgaid_app/screens/reference/change_tracker_screen.dart';
import 'package:obgaid_app/screens/topics/topic_screen.dart';
import 'package:obgaid_app/screens/algorithms/algorithm_screen.dart';
import 'package:obgaid_app/screens/staging/staging_screen.dart';
import 'package:obgaid_app/theme/app_theme.dart';
import 'package:obgaid_app/screens/hubs/calculators_hub.dart';
import 'package:obgaid_app/screens/hubs/emergency_hub.dart';
import 'package:obgaid_app/screens/hubs/topics_hub.dart';
import 'package:obgaid_app/screens/hubs/scores_hub.dart';
import 'package:obgaid_app/data/scores.dart';
import 'package:obgaid_app/screens/hubs/tumour_staging_hub.dart';
import 'package:obgaid_app/screens/hubs/operative_hub.dart';
import 'package:obgaid_app/screens/hubs/formulary_hub.dart';
import 'package:obgaid_app/screens/hubs/reference_hub.dart';
import 'package:obgaid_app/screens/hubs/never_again_hub.dart';
import 'package:obgaid_app/screens/hubs/academics_hub.dart';
import 'package:obgaid_app/screens/hubs/cme_hub.dart';
import 'package:obgaid_app/screens/hubs/ultrasound_hub.dart';

/// Builds every clinical screen once.
///
/// The governance tests prove a content record exists; this proves the screen
/// that reads it actually renders. Several screens dereference
/// `ContentRegistry.metaFor(id)!`, which the analyzer cannot check — a missing
/// record would crash at the bedside rather than in CI without this.
void main() {
  Widget wrap(Widget child) => MaterialApp(
        theme: AppTheme.light(),
        home: MediaQuery(
          data: const MediaQueryData(size: Size(400, 1400)),
          child: child,
        ),
      );

  // Every hub was edited when the roadmap blocks came out; nothing covered
  // them before, so a dangling widget would have shipped silently.
  group('every hub renders', () {
    final hubs = <String, Widget Function()>{
      'calculators': () => const CalculatorsHub(),
      'emergency': () => const EmergencyHub(),
      'topics': () => const TopicsHub(),
      'scores': () => const ScoresHub(),
      'tumour staging': () => const TumourStagingHub(),
      'operative': () => const OperativeHub(),
      'formulary': () => const FormularyHub(),
      'reference': () => const ReferenceHub(),
      'never again': () => const NeverAgainHub(),
      'academics': () => const AcademicsHub(),
      'cme': () => const CmeHub(),
      'ultrasound': () => const UltrasoundHub(),
      'anatomy': () => const AnatomyHub(),
      'counselling': () => const CounsellingHub(),
      'examination': () => const ExamHub(),
    };
    hubs.forEach((name, build) {
      testWidgets(name, (tester) async {
        await tester.pumpWidget(wrap(build()));
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    });
  });

  group('every score reference page renders', () {
    for (final score in kScores) {
      testWidgets(score.id, (tester) async {
        await tester.pumpWidget(wrap(ScoreScreen(score: score)));
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('every registered tool renders', () {
    for (final tool in ToolRegistry.all) {
      testWidgets(tool.id, (tester) async {
        await tester.pumpWidget(wrap(Builder(builder: tool.builder)));
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('every algorithm renders', () {
    for (final algo in AlgorithmRegistry.all) {
      testWidgets(algo.id, (tester) async {
        await tester
            .pumpWidget(wrap(AlgorithmScreen(algorithm: algo)));
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('every clinical topic renders', () {
    for (final topic in TopicRegistry.all) {
      testWidgets(topic.id, (tester) async {
        await tester.pumpWidget(wrap(TopicScreen(topic: topic)));
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('every drug page renders', () {
    for (final drug in DrugRegistry.all) {
      testWidgets(drug.id, (tester) async {
        await tester.pumpWidget(wrap(DrugScreen(drug: drug)));
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('every trial renders', () {
    for (final trial in TrialRegistry.all) {
      testWidgets(trial.id, (tester) async {
        await tester.pumpWidget(wrap(TrialScreen(trial: trial)));
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('every anatomy entry renders', () {
    for (final a in kAnatomy) {
      testWidgets(a.id, (tester) async {
        await tester.pumpWidget(wrap(AnatomyScreen(entry: a)));
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('every drug renders', () {
    for (final d in DrugRegistry.all) {
      testWidgets(d.id, (tester) async {
        await tester.pumpWidget(wrap(DrugScreen(drug: d)));
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('every exam topic renders', () {
    for (final t in kExamTopics) {
      testWidgets(t.id, (tester) async {
        await tester.pumpWidget(wrap(ExamScreen(topic: t)));
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('every counselling guide renders', () {
    for (final g in kCounsellingGuides) {
      testWidgets(g.id, (tester) async {
        await tester.pumpWidget(wrap(CounsellingScreen(guide: g)));
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('every safety case renders', () {
    for (final c in kSafetyCases) {
      testWidgets(c.id, (tester) async {
        await tester.pumpWidget(wrap(SafetyCaseScreen(safetyCase: c)));
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  });

  group('reference screens render', () {
    testWidgets('guidelines', (tester) async {
      await tester.pumpWidget(wrap(const GuidelinesScreen()));
      await tester.pump();
      expect(tester.takeException(), isNull);
    });
    testWidgets('change tracker', (tester) async {
      await tester.pumpWidget(wrap(const ChangeTrackerScreen()));
      await tester.pump();
      expect(tester.takeException(), isNull);
    });
    testWidgets('quick reference tables', (tester) async {
      await tester.pumpWidget(wrap(const QuickTablesScreen()));
      await tester.pump();
      expect(tester.takeException(), isNull);
    });
    testWidgets('lab reference', (tester) async {
      await tester.pumpWidget(wrap(const LabReferenceScreen()));
      await tester.pump();
      expect(tester.takeException(), isNull);
    });
    testWidgets('maternal immunisation', (tester) async {
      await tester.pumpWidget(wrap(const ImmunisationScreen()));
      await tester.pump();
      expect(tester.takeException(), isNull);
    });
  });

  group('every staging system renders', () {
    for (final system in kStagingSystems) {
      testWidgets(system.id, (tester) async {
        await tester.pumpWidget(wrap(StagingScreen(system: system)));
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  });
}
