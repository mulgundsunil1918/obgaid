import 'package:flutter/material.dart';
import '../../data/learning_registry.dart';
import '../../models/learning_topic.dart';
import '../../widgets/hub_widgets.dart';
import 'learning_topic_screen.dart';

/// Category grid. Each box opens the topics in that curriculum area.
class LearningHub extends StatelessWidget {
  const LearningHub({super.key});

  static IconData iconFor(LearningCategory c) => switch (c) {
        LearningCategory.basicSciences => Icons.biotech_outlined,
        LearningCategory.historyExamination => Icons.assignment_outlined,
        LearningCategory.earlyPregnancy => Icons.favorite_outline,
        LearningCategory.antenatal => Icons.pregnant_woman_outlined,
        LearningCategory.labourPuerperium => Icons.child_friendly_outlined,
        LearningCategory.gynaecology => Icons.healing_outlined,
        LearningCategory.sexualHealth => Icons.shield_outlined,
        LearningCategory.reproductive => Icons.spa_outlined,
        LearningCategory.oncology => Icons.coronavirus_outlined,
        LearningCategory.procedures => Icons.medical_services_outlined,
      };

  @override
  Widget build(BuildContext context) {
    final cats = LearningRegistry.populated;
    return HubScaffold(
      title: 'Learning',
      subtitle: '${LearningRegistry.all.length} topics · '
          '${cats.length} curriculum areas',
      intro: 'Structured teaching topics, organised by the NMC '
          'competency-based postgraduate curriculum. Each moves from '
          'definition through to complications, and cites the guideline it '
          'was written from.',
      children: [
        for (final c in cats)
          HubTile(
            title: c.label,
            subtitle: '${LearningRegistry.byCategory[c]!.length} topics · '
                '${c.blurb}',
            icon: iconFor(c),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LearningCategoryScreen(c)),
            ),
          ),
      ],
    );
  }
}

class LearningCategoryScreen extends StatelessWidget {
  const LearningCategoryScreen(this.category, {super.key});
  final LearningCategory category;

  @override
  Widget build(BuildContext context) {
    final topics = LearningRegistry.byCategory[category] ?? const [];
    return HubScaffold(
      title: category.label,
      subtitle: '${topics.length} topics',
      intro: category.blurb,
      children: [
        for (final t in topics)
          HubTile(
            title: t.title,
            subtitle: t.subtitle ?? t.summary,
            icon: LearningHub.iconFor(category),
            badge: t.competency,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LearningTopicScreen(topic: t)),
            ),
          ),
      ],
    );
  }
}
