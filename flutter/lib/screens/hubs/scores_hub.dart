import 'package:flutter/material.dart';
import '../../data/scores.dart';
import '../../data/content_registry.dart';
import '../../data/staging_data.dart';
import '../../models/clinical_score.dart';
import '../../widgets/hub_widgets.dart';
import '../../widgets/reference_note.dart';
import '../staging/staging_screen.dart';

/// The §51 score library — every scoring system in the app, indexed once.
///
/// Built because the scores had scattered: Bishop sat under Labour,
/// Ferriman-Gallwey inside PCOS assessment, POP-Q under Gynaecology, Apgar
/// under Neonatal. "Which scores exist" had no single answer.
class ScoresHub extends StatelessWidget {
  const ScoresHub({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final byCategory = <ScoreCategory, List<ClinicalScore>>{};
    for (final s in kScores) {
      byCategory.putIfAbsent(s.category, () => []).add(s);
    }

    return HubScaffold(
      title: 'Scores',
      subtitle: '${kScores.length} scoring systems',
      intro: 'Every score in the app, in one place. Each carries what §51 '
          'asks for — purpose, the population it was derived in, inputs, '
          'calculation, interpretation and limitations. Tap to open the '
          'calculator where there is one.',
      children: [
        for (final entry in byCategory.entries) ...[
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 10),
            child: Text(entry.key.label.toUpperCase(),
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                    color: cs.primary)),
          ),
          ...entry.value.map((s) => HubTile(
                title: s.name,
                subtitle: s.subtitle,
                icon: s.isInteractive
                    ? Icons.calculate_outlined
                    : Icons.rule_outlined,
                badge: s.isInteractive ? null : 'Reference',
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ScoreScreen(score: s))),
              )),
        ],
      ],
    );
  }
}

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key, required this.score});
  final ClinicalScore score;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tool =
        score.toolId == null ? null : ContentRegistry.resolve(score.toolId!);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(score.name),
            Text(score.subtitle,
                style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
        children: [
          if (tool?.builder != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: tool!.builder!)),
                  icon: const Icon(Icons.calculate_outlined, size: 18),
                  label: const Text('Open the calculator'),
                ),
              ),
            ),
          if (score.stagingId != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => StagingScreen(
                              system: kStagingSystems.firstWhere(
                                  (s) => s.id == score.stagingId)))),
                  icon: const Icon(Icons.biotech_outlined, size: 18),
                  label: const Text('Open the staging system'),
                ),
              ),
            ),
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: cs.primaryContainer.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(score.purpose,
                style: const TextStyle(fontSize: 12.5, height: 1.55)),
          ),
          _Block('Population it was derived in', [score.population],
              const Color(0xFFB8860B), expanded: true),
          _Block('Inputs', score.inputs, cs.primary),
          _Block('Calculation', [score.calculation], cs.primary),
          Card(
            margin: const EdgeInsets.only(bottom: 9),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                initiallyExpanded: true,
                tilePadding: const EdgeInsets.symmetric(horizontal: 15),
                childrenPadding: const EdgeInsets.fromLTRB(15, 0, 15, 13),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: Text('Interpretation',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: cs.primary)),
                children: score.interpretation
                    .map((i) => Padding(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 108,
                                  child: Text(i.$1,
                                      style: const TextStyle(
                                          fontSize: 11.5,
                                          height: 1.4,
                                          fontWeight: FontWeight.w800)),
                                ),
                                Expanded(
                                    child: Text(i.$2,
                                        style: const TextStyle(
                                            fontSize: 12, height: 1.45))),
                              ]),
                        ))
                    .toList(),
              ),
            ),
          ),
          _Block('Limitations', score.limitations, const Color(0xFFB3261E),
              expanded: true),
          ReferenceNote(sources: score.sources),
        ],
      ),
    );
  }
}

class _Block extends StatelessWidget {
  const _Block(this.title, this.items, this.accent, {this.expanded = false});
  final String title;
  final List<String> items;
  final Color accent;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 9),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: expanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 15),
          childrenPadding: const EdgeInsets.fromLTRB(15, 0, 15, 13),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 13, color: accent)),
          children: items
              .map((i) => Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('•  ', style: TextStyle(color: accent)),
                          Expanded(
                              child: Text(i,
                                  style: const TextStyle(
                                      fontSize: 12, height: 1.5))),
                        ]),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
