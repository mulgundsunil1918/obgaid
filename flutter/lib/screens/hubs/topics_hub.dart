import 'package:flutter/material.dart';
import '../../data/topic_registry.dart';
import '../../widgets/hub_widgets.dart';
import '../../data/icon_map.dart';
import '../../data/learning_registry.dart';
import '../../models/learning_topic.dart';
import '../learning/learning_hub.dart';
import '../topics/topic_screen.dart';

class TopicsHub extends StatelessWidget {
  const TopicsHub({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return HubScaffold(
      title: 'Clinical Topics',
      subtitle: '${TopicRegistry.all.length} references',
      intro: 'Structured reference for the decisions that are made over hours '
          'rather than seconds. Each opens on the numbers you came to look up.',
      children: [
        for (final entry in TopicRegistry.byGroup.entries) ...[
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 10),
            child: Text(entry.key.label.toUpperCase(),
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                    color: cs.primary)),
          ),
          ...entry.value.map((t) => HubTile(
                title: t.name,
                subtitle: t.subtitle,
                icon: IconMap.resolve(t.id, Icons.article_outlined),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TopicScreen(topic: t))),
              )),
        ],
        const _Section('Curriculum'),
        for (final c in LearningRegistry.populated)
          HubTile(
            title: c.label,
            subtitle: '${LearningRegistry.byCategory[c]!.length} topics · '
                '${c.blurb}',
            icon: LearningHub.iconFor(c),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => LearningCategoryScreen(c))),
          ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 10),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
}
