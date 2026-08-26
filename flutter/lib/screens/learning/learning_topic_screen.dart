import 'package:flutter/material.dart';
import '../../models/learning_topic.dart';
import '../../data/content_registry.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';

class LearningTopicScreen extends StatelessWidget {
  const LearningTopicScreen({super.key, required this.topic});
  final LearningTopic topic;

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
            Text(topic.title, style: const TextStyle(fontSize: 16)),
            Text(
              topic.category.label,
              style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
        children: [
          if (topic.competency != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: cs.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                    border:
                        Border.all(color: cs.primary.withValues(alpha: 0.25)),
                  ),
                  child: Text(
                    'NMC competency ${topic.competency}',
                    style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w700,
                        color: cs.primary),
                  ),
                ),
              ),
            ),
          Text(
            topic.summary,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(height: 1.55, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          if (topic.keyPoints.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
              decoration: BoxDecoration(
                color: cs.primary.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: cs.primary.withValues(alpha: 0.22)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CARRY THIS OUT',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.9,
                          color: cs.primary)),
                  const SizedBox(height: 8),
                  for (final p in topic.keyPoints)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6, right: 8),
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: cs.primary,
                                  shape: BoxShape.circle),
                            ),
                          ),
                          Expanded(
                            child: Text(p,
                                style: const TextStyle(
                                    fontSize: 12.5, height: 1.45)),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 22),
          ],
          for (final s in topic.sections) ...[
            Text(
              s.heading.toUpperCase(),
              style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.85,
                  color: cs.primary),
            ),
            const SizedBox(height: 9),
            for (final p in s.points)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7, right: 9),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                            color: cs.onSurface.withValues(alpha: 0.35),
                            shape: BoxShape.circle),
                      ),
                    ),
                    Expanded(
                      child: Text(p,
                          style:
                              const TextStyle(fontSize: 13, height: 1.5)),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 18),
          ],
          if (topic.related.isNotEmpty) ...[
            Text('GO DEEPER IN THE APP',
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.85,
                    color: cs.primary)),
            const SizedBox(height: 9),
            for (final id in topic.related)
              if (ContentRegistry.resolve(id)?.builder != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: InkWell(
                    onTap: () {
                      final node = ContentRegistry.resolve(id)!;
                      Navigator.push(context,
                          MaterialPageRoute(builder: node.builder!));
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 11),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: cs.outlineVariant),
                      ),
                      child: Row(children: [
                        Icon(ContentRegistry.resolve(id)!.icon,
                            size: 17, color: cs.primary),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(ContentRegistry.resolve(id)!.title,
                              style: const TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w600)),
                        ),
                        const Icon(Icons.chevron_right, size: 18),
                      ]),
                    ),
                  ),
                ),
            const SizedBox(height: 14),
          ],
          ReferenceNote(sources: topic.sources),
          if (meta != null) ContentFooter(meta: meta),
        ],
      ),
    );
  }
}
