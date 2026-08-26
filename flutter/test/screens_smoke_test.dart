import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:obgaid_app/data/tool_registry.dart';
import 'package:obgaid_app/widgets/hub_widgets.dart';
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
  _hubLayoutTests();
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

/// The hub layout is the shared surface every module renders through, so it
/// gets asserted rather than eyeballed: tiles must land in a grid, and a hub
/// with more than eight of them must offer a search field.
void _hubLayoutTests() {
  group('hub layout', () {
    testWidgets('tiles render as a grid, not a list', (t) async {
      await t.pumpWidget(MaterialApp(
        home: HubScaffold(
          title: 'Test hub',
          children: [
            for (var i = 0; i < 4; i++)
              HubTile(
                title: 'Tile $i',
                subtitle: 'Subtitle $i',
                icon: Icons.circle,
                onTap: () {},
              ),
          ],
        ),
      ));
      await t.pumpAndSettle();
      expect(find.byType(GridView), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
      expect(find.text('Tile 0'), findsOneWidget);
    });

    testWidgets('section headers survive between grids', (t) async {
      await t.pumpWidget(MaterialApp(
        home: HubScaffold(
          title: 'Grouped',
          children: [
            const Text('SECTION ONE'),
            HubTile(
                title: 'A',
                subtitle: 's',
                icon: Icons.circle,
                onTap: () {}),
            const Text('SECTION TWO'),
            HubTile(
                title: 'B',
                subtitle: 's',
                icon: Icons.circle,
                onTap: () {}),
          ],
        ),
      ));
      await t.pumpAndSettle();
      expect(find.text('SECTION ONE'), findsOneWidget);
      expect(find.text('SECTION TWO'), findsOneWidget);
      expect(find.byType(GridView), findsNWidgets(2));
    });

    testWidgets('search appears past eight tiles and filters', (t) async {
      await t.pumpWidget(MaterialApp(
        home: HubScaffold(
          title: 'Big hub',
          children: [
            for (var i = 0; i < 10; i++)
              HubTile(
                title: 'Item $i',
                subtitle: 'sub',
                icon: Icons.circle,
                onTap: () {},
              ),
          ],
        ),
      ));
      await t.pumpAndSettle();
      expect(find.byType(HubSearchField), findsOneWidget);
      await t.enterText(find.byType(TextField), 'Item 7');
      await t.pumpAndSettle();
      // The search field holds the query text too, so match the tile itself.
      expect(find.widgetWithText(HubTile, 'Item 7'), findsOneWidget);
      expect(find.widgetWithText(HubTile, 'Item 3'), findsNothing);
    });

    testWidgets('the real hubs render as grids, with no list tiles left',
        (t) async {
      // Guards the conversion itself: if any hub regresses to ListTile, or
      // stops producing a grid, this fails rather than being noticed later.
      for (final hub in <(String, Widget)>[
        ('Calculators', const CalculatorsHub()),
        ('Emergencies', const EmergencyHub()),
        ('Topics', const TopicsHub()),
        ('Scores', const ScoresHub()),
        ('Formulary', const FormularyHub()),
        ('Reference', const ReferenceHub()),
      ]) {
        await t.pumpWidget(MaterialApp(theme: AppTheme.light(), home: hub.$2));
        await t.pumpAndSettle();
        expect(find.byType(GridView), findsWidgets,
            reason: '${hub.$1} hub renders no grid');
        expect(find.byType(ListTile), findsNothing,
            reason: '${hub.$1} hub still uses list tiles');
      }
    });

    testWidgets('no search field on a small hub', (t) async {
      await t.pumpWidget(MaterialApp(
        home: HubScaffold(
          title: 'Small hub',
          children: [
            for (var i = 0; i < 3; i++)
              HubTile(
                  title: 'Item $i',
                  subtitle: 'sub',
                  icon: Icons.circle,
                  onTap: () {}),
          ],
        ),
      ));
      await t.pumpAndSettle();
      expect(find.byType(HubSearchField), findsNothing);
    });
  });
}
