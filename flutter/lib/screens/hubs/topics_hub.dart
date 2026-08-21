import 'package:flutter/material.dart';
import '../../data/topic_registry.dart';
import '../../widgets/hub_widgets.dart';
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
                icon: Icons.article_outlined,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TopicScreen(topic: t))),
              )),
        ],
        const SizedBox(height: 18),
        const ComingSoon(phase: 'Tier 2', items: [
          'Antenatal care — schedule, investigations, surveillance',
          'Operative vaginal delivery — forceps and vacuum',
          'Postpartum care and complications',
          'Multiple pregnancy — chorionicity, TTTS, timing',
          'First-trimester bleeding and miscarriage',
          'Maternal medicine — cardiac, renal, endocrine, neurological',
          'Fetal medicine — anomalies, genetic screening, fetal therapy',
          'Cervical insufficiency and cerclage',
        ]),
      ],
    );
  }
}
