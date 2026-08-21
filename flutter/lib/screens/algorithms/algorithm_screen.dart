import 'package:flutter/material.dart';
import '../../models/algorithm.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// Renders any [Algorithm].
///
/// Ordered for the room rather than for the page: the actions you take before
/// thinking come first, in red, expanded. The §52 sections follow, collapsed,
/// for the part of the emergency where there is time to read.
class AlgorithmScreen extends StatelessWidget {
  const AlgorithmScreen({super.key, required this.algorithm});
  final Algorithm algorithm;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final meta = ContentRegistry.metaFor(algorithm.id);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(algorithm.name),
            Text(algorithm.subtitle,
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
          if (algorithm.callFor != null || algorithm.timeTarget != null)
            Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: cs.primaryContainer.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (algorithm.callFor != null)
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Icon(Icons.campaign_outlined, size: 17, color: cs.primary),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Text(algorithm.callFor!,
                            style: const TextStyle(
                                fontSize: 12.5,
                                height: 1.5,
                                fontWeight: FontWeight.w600)),
                      ),
                    ]),
                  if (algorithm.timeTarget != null) ...[
                    if (algorithm.callFor != null) const SizedBox(height: 10),
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Icon(Icons.timer_outlined, size: 17, color: cs.primary),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Text(algorithm.timeTarget!,
                            style: const TextStyle(
                                fontSize: 12.5,
                                height: 1.5,
                                fontWeight: FontWeight.w600)),
                      ),
                    ]),
                  ],
                ],
              ),
            ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 14, 15, 6),
            decoration: BoxDecoration(
              color: const Color(0xFFB3261E).withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                  color: const Color(0xFFB3261E).withValues(alpha: 0.40)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(children: [
                  Icon(Icons.bolt_rounded, size: 17, color: Color(0xFFB3261E)),
                  SizedBox(width: 7),
                  Text('DO THIS NOW',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.0,
                          color: Color(0xFFB3261E))),
                ]),
                const SizedBox(height: 12),
                ...algorithm.immediate.asMap().entries.map((e) =>
                    _StepRow(step: e.value, index: e.key + 1, numbered: true)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...algorithm.sections.map((s) => _SectionTile(section: s)),
          ReferenceNote(
            sources: algorithm.sources,
            caveat: 'An algorithm is a prompt, not a substitute for the '
                'clinician in the room. Follow your unit\'s protocol where it '
                'differs, and escalate earlier than this suggests if the woman '
                'looks wrong.',
          ),
          if (meta != null) ContentFooter(meta: meta),
        ],
      ),
    );
  }
}

class _SectionTile extends StatelessWidget {
  const _SectionTile({required this.section});
  final AlgoSection section;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          childrenPadding: const EdgeInsets.fromLTRB(15, 0, 15, 14),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(section.title,
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
                '${section.steps.length} '
                'point${section.steps.length == 1 ? '' : 's'}',
                style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
          ),
          children:
              section.steps.map((s) => _StepRow(step: s, index: 0)).toList(),
        ),
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow(
      {required this.step, required this.index, this.numbered = false});
  final AlgoStep step;
  final int index;
  final bool numbered;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    const danger = Color(0xFFB3261E);
    final accent = step.avoid
        ? danger
        : step.critical
            ? const Color(0xFFC2603C)
            : cs.primary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (step.avoid)
          const Padding(
            padding: EdgeInsets.only(top: 1, right: 9),
            child: Icon(Icons.block, size: 16, color: danger),
          )
        else if (numbered)
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10, top: 1),
            decoration: BoxDecoration(
                color: danger.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(6)),
            child: Text('$index',
                style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    color: danger)),
          )
        else
          Padding(
            padding: const EdgeInsets.only(top: 6, right: 10),
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(color: accent, shape: BoxShape.circle),
            ),
          ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(step.avoid ? 'DO NOT — ${step.text}' : step.text,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.5,
                  fontWeight: (step.critical || step.avoid)
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: step.avoid ? danger : null,
                )),
            if (step.detail != null)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(step.detail!,
                    style: TextStyle(
                        fontSize: 11.5,
                        height: 1.45,
                        color: cs.onSurfaceVariant)),
              ),
          ]),
        ),
      ]),
    );
  }
}
