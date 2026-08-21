import 'package:flutter/material.dart';
import '../../data/guidelines.dart';
import '../../models/guideline.dart';
import '../../widgets/reference_note.dart';

class GuidelinesScreen extends StatelessWidget {
  const GuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final byRegion = <GuidelineRegion, List<Guideline>>{};
    for (final g in kGuidelines) {
      byRegion.putIfAbsent(g.region, () => []).add(g);
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Guidelines'),
            Text('${kGuidelines.length} records',
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
          for (final entry in byRegion.entries) ...[
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 10),
              child: Text(entry.key.label.toUpperCase(),
                  style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: cs.primary)),
            ),
            ...entry.value.map((g) => _GuidelineCard(g: g)),
          ],
          const ReferenceNote(
            sources: [
              'Individual guideline sources are named on each record.',
            ],
            caveat: 'Guidelines are revised without notice. Each record states '
                'its publication date so that staleness is visible — check '
                'the issuing body before relying on any recommendation here.',
          ),
        ],
      ),
    );
  }
}

class _GuidelineCard extends StatelessWidget {
  const _GuidelineCard({required this.g});
  final Guideline g;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(15, 0, 15, 14),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(g.title,
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
                '${g.organisation} · ${g.published}'
                '${g.version != null ? ' · ${g.version}' : ''}',
                style: TextStyle(fontSize: 11.5, color: cs.onSurfaceVariant)),
          ),
          children: [
            Text('KEY RECOMMENDATIONS',
                style: TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                    color: cs.primary)),
            const SizedBox(height: 8),
            ...g.keyRecommendations.map((r) => Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('•  ', style: TextStyle(color: cs.primary)),
                        Expanded(
                            child: Text(r,
                                style: const TextStyle(
                                    fontSize: 12, height: 1.5))),
                      ]),
                )),
            if (g.changes.isNotEmpty) ...[
              const SizedBox(height: 10),
              ...g.changes.map((c) => ChangeCard(c: c)),
            ],
            const SizedBox(height: 6),
            Text('Source: ${g.source}',
                style: TextStyle(
                    fontSize: 10.5,
                    fontStyle: FontStyle.italic,
                    color: cs.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}

/// A §55 change record. Shared with the standalone change tracker.
class ChangeCard extends StatelessWidget {
  const ChangeCard({super.key, required this.c, this.showTopic = false});
  final GuidelineChange c;
  final bool showTopic;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xFFFFC107)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Icon(Icons.swap_horiz_rounded,
              size: 16, color: Color(0xFF8D6E00)),
          const SizedBox(width: 7),
          Expanded(
            child: Text(showTopic ? c.topic : 'WHAT CHANGED · ${c.year}',
                style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                    color: Color(0xFF8D6E00))),
          ),
          if (showTopic)
            Text('${c.year}',
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF8D6E00))),
        ]),
        const SizedBox(height: 10),
        _row(context, 'Previously', c.previous, strike: true),
        const SizedBox(height: 6),
        _row(context, 'Now', c.now, bold: true),
        const SizedBox(height: 9),
        Text(c.whatChanged,
            style: const TextStyle(
                fontSize: 12, height: 1.5, color: Color(0xFF4A3B00))),
        const SizedBox(height: 7),
        Text('Why it matters',
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6,
                color: cs.onSurfaceVariant)),
        const SizedBox(height: 3),
        Text(c.whyItMatters,
            style: const TextStyle(
                fontSize: 12, height: 1.5, color: Color(0xFF4A3B00))),
        const SizedBox(height: 7),
        Text(c.source,
            style: const TextStyle(
                fontSize: 10,
                fontStyle: FontStyle.italic,
                color: Color(0xFF6B5A20))),
      ]),
    );
  }

  Widget _row(BuildContext context, String label, String text,
      {bool strike = false, bool bold = false}) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        width: 72,
        child: Text(label,
            style: const TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
                color: Color(0xFF8D6E00))),
      ),
      Expanded(
        child: Text(text,
            style: TextStyle(
              fontSize: 12,
              height: 1.45,
              color: strike ? const Color(0xFF7A6A3A) : const Color(0xFF3A2E00),
              decoration: strike ? TextDecoration.lineThrough : null,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
            )),
      ),
    ]);
  }
}
