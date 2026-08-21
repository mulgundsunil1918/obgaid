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

  group('reference screens render', () {
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
