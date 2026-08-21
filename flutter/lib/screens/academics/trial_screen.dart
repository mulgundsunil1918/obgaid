import 'package:flutter/material.dart';
import '../../models/trial.dart';
import '../../widgets/reference_note.dart';

class TrialScreen extends StatelessWidget {
  const TrialScreen({super.key, required this.trial});
  final Trial trial;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(trial.acronym),
            Text('${trial.year} · ${trial.category.label}',
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
          // The one sentence leads, because that is what gets remembered.
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: cs.primaryContainer.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('TAKEAWAY',
                  style: TextStyle(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: cs.primary)),
              const SizedBox(height: 7),
              Text(trial.takeaway,
                  style: const TextStyle(
                      fontSize: 13.5, height: 1.5, fontWeight: FontWeight.w700)),
            ]),
          ),
          Text(trial.name,
              style: const TextStyle(fontSize: 13, height: 1.5)),
          const SizedBox(height: 12),
          _meta(context, 'Journal', trial.journal),
          _meta(context, 'Setting', trial.setting),
          _meta(context, 'Population', trial.population),
          _meta(context, 'Sample size', trial.sampleSize),
          const SizedBox(height: 16),
          _Block('Intervention', [trial.intervention], cs.primary),
          _Block('Comparator', [trial.comparator], cs.primary),
          _Block('Primary outcome', [trial.primaryOutcome], cs.primary),
          _Block('Results', trial.results, const Color(0xFF1B7F5C),
              expanded: true),
          if (trial.secondaryOutcomes.isNotEmpty)
            _Block('Secondary outcomes', trial.secondaryOutcomes, cs.primary),
          if (trial.inclusion.isNotEmpty)
            _Block('Inclusion criteria', trial.inclusion, cs.primary),
          if (trial.exclusion.isNotEmpty)
            _Block('Exclusion criteria', trial.exclusion, cs.primary),
          if (trial.adverseEvents.isNotEmpty)
            _Block('Adverse events', trial.adverseEvents,
                const Color(0xFFC2603C)),
          if (trial.limitations.isNotEmpty)
            _Block('Limitations', trial.limitations, const Color(0xFFB3261E),
                expanded: true),
          if (trial.applicability != null)
            _Block('Applicability', [trial.applicability!],
                const Color(0xFFB8860B), expanded: true),
          _Block('Guideline impact', [trial.guidelineImpact], cs.primary,
              expanded: true),
          if (trial.currentRelevance != null)
            _Block('Current relevance', [trial.currentRelevance!], cs.primary),
          ReferenceNote(
            sources: [trial.journal, if (trial.link != null) trial.link!],
            caveat: 'A trial result is a statement about the population that '
                'was studied. Read the applicability and the limitations '
                'before transferring it to the woman in front of you.',
          ),
        ],
      ),
    );
  }

  Widget _meta(BuildContext context, String k, String v) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            width: 92,
            child: Text(k,
                style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant))),
        Expanded(
            child: Text(v,
                style: const TextStyle(
                    fontSize: 11.5, height: 1.45, fontWeight: FontWeight.w600))),
      ]),
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
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 9),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: expanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
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
                                  style: TextStyle(
                                      fontSize: 12,
                                      height: 1.5,
                                      color: cs.onSurface))),
                        ]),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
