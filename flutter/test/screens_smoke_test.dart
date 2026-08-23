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
