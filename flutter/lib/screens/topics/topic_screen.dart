import 'package:flutter/material.dart';
import '../../models/topic.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({super.key, required this.topic});
  final ClinicalTopic topic;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final meta = ContentRegistry.metaFor(topic.id);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(topic.name),
            Text(topic.subtitle,
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
          if (topic.headline != null)
            Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                color: cs.primaryContainer.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(topic.headline!,
                  style: const TextStyle(
                      fontSize: 12.5, height: 1.55, fontWeight: FontWeight.w600)),
            ),
          if (topic.keyFacts.isNotEmpty)
            Container(
              padding: const EdgeInsets.fromLTRB(15, 13, 15, 13),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Icon(Icons.bookmark_border,
                        size: 14, color: cs.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Text('KEY NUMBERS',
                        style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.8,
                            color: cs.onSurfaceVariant)),
                  ]),
                  const SizedBox(height: 10),
                  ...topic.keyFacts.map((f) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(f.$1,
                                    style: TextStyle(
                                        fontSize: 11.5,
                                        height: 1.4,
                                        color: cs.onSurfaceVariant)),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(f.$2,
                                    style: const TextStyle(
                                        fontSize: 11.5,
                                        height: 1.4,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ]),
                      )),
                ],
              ),
            ),
          ...topic.sections.map((s) => _TopicSectionTile(section: s)),
          ReferenceNote(sources: topic.sources),
          if (meta != null) ContentFooter(meta: meta),
        ],
      ),
    );
  }
}

class _TopicSectionTile extends StatelessWidget {
  const _TopicSectionTile({required this.section});
  final TopicSection section;

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
          children: section.steps.map((p) => _PointRow(point: p)).toList(),
        ),
      ),
    );
  }
}

class _PointRow extends StatelessWidget {
  const _PointRow({required this.point});
  final TopicPoint point;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    const danger = Color(0xFFB3261E);
    final accent = point.avoid
        ? danger
        : point.critical
            ? const Color(0xFFC2603C)
            : cs.primary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (point.avoid)
          const Padding(
            padding: EdgeInsets.only(top: 1, right: 9),
            child: Icon(Icons.block, size: 16, color: danger),
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
            Text(point.avoid ? 'DO NOT — ${point.text}' : point.text,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.5,
                  fontWeight: (point.critical || point.avoid)
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: point.avoid ? danger : null,
                )),
            if (point.detail != null)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(point.detail!,
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
