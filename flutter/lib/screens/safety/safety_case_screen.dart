import 'package:flutter/material.dart';
import '../../models/safety_case.dart';
import '../../widgets/reference_note.dart';

class SafetyCaseScreen extends StatelessWidget {
  const SafetyCaseScreen({super.key, required this.safetyCase});
  final SafetyCase safetyCase;

  @override
  Widget build(BuildContext context) {
    final c = safetyCase;
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(c.title),
            Text(c.category.label,
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
          Container(
            padding: const EdgeInsets.all(13),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: cs.surfaceContainerHighest.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Text(c.presentation,
                style: const TextStyle(fontSize: 12.5, height: 1.55)),
          ),
          Text('TIMELINE',
              style: TextStyle(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: cs.primary)),
          const SizedBox(height: 10),
          ...c.timeline.map((t) => _TimelineRow(time: t.$1, event: t.$2)),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFB3261E).withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: const Color(0xFFB3261E).withValues(alpha: 0.4)),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('THE CRITICAL EVENT',
                      style: TextStyle(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.8,
                          color: Color(0xFFB3261E))),
                  const SizedBox(height: 7),
                  Text(c.criticalEvent,
                      style: const TextStyle(
                          fontSize: 12.5,
                          height: 1.55,
                          fontWeight: FontWeight.w600)),
                ]),
          ),
          _Section('What went wrong', c.whatWentWrong,
              const Color(0xFFB3261E), expanded: true),
          _Section('Contributing factors', c.contributingFactors,
              const Color(0xFFC2603C)),
          _Section('Warning signs that were present', c.warningSigns,
              const Color(0xFFB8860B), expanded: true),
          _Section('What should have happened', c.correctResponse,
              const Color(0xFF1B7F5C), expanded: true),
          _Section('Prevention', c.prevention, const Color(0xFF1B7F5C)),
          _Section('Key learning points', c.learningPoints, cs.primary,
              expanded: true),
          ReferenceNote(
            sources: c.sources,
            caveat: 'This is an anonymised composite drawn from published '
                'confidential enquiry and incident literature. It describes no '
                'identifiable patient and no single real case.',
          ),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({required this.time, required this.event});
  final String time;
  final String event;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 58,
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(6)),
          child: Text(time,
              style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w800,
                  color: cs.primary)),
        ),
        const SizedBox(width: 11),
        Expanded(
            child: Text(event,
                style: const TextStyle(fontSize: 12, height: 1.5))),
      ]),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section(this.title, this.items, this.accent, {this.expanded = false});
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
