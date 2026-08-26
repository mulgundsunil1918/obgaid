import 'package:flutter/material.dart';
import '../../data/curriculum.dart';
import '../../data/content_registry.dart';
import '../../models/curriculum.dart';
import '../../models/learning_topic.dart';
import '../../widgets/hub_widgets.dart';
import '../../widgets/learning_art.dart';

/// Learn OBG — the curriculum view over the app.
class LearnObgHub extends StatelessWidget {
  const LearnObgHub({super.key});

  /// Art for a section, reusing the learning illustrations.
  static LearningCategory? artFor(String sectionId) => switch (sectionId) {
        'cur-basic-sciences' => LearningCategory.basicSciences,
        'cur-history-examination' => LearningCategory.historyExamination,
        'cur-pregnancy' => LearningCategory.antenatal,
        'cur-labour' => LearningCategory.labourPuerperium,
        'cur-gynaecology' => LearningCategory.gynaecology,
        'cur-sexual-health' => LearningCategory.sexualHealth,
        'cur-procedures' => null,
        _ => null,
      };

  @override
  Widget build(BuildContext context) {
    final total =
        kCurriculum.fold<int>(0, (s, sec) => s + sec.topicCount);
    return HubScaffold(
      title: 'Learn OBG',
      subtitle: '$total topics · ${kCurriculum.length} sections',
      intro: 'The whole app arranged the way the subject is taught. Every '
          'entry opens the page that already covers it — the algorithm, the '
          'topic, the procedure — so nothing here is a second copy.',
      children: [
        for (final s in kCurriculum)
          HubTile(
            title: s.name,
            subtitle: '${s.topicCount} topics · ${s.blurb}',
            icon: Icons.menu_book_outlined,
            art: artFor(s.id) == null
                ? null
                : LearningArt(category: artFor(s.id)!, size: 48),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => CurriculumSectionScreen(s))),
          ),
      ],
    );
  }
}

class CurriculumSectionScreen extends StatelessWidget {
  const CurriculumSectionScreen(this.section, {super.key});
  final CurriculumSection section;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final art = LearnObgHub.artFor(section.id);

    return HubScaffold(
      title: section.name,
      subtitle: '${section.topicCount} topics',
      searchHint: 'Search ${section.topicCount} in ${section.name}…',
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(children: [
            if (art != null) ...[
              LearningArt(category: art, size: 72),
              const SizedBox(width: 15),
            ],
            Expanded(
              child: Text(section.blurb,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.5, color: cs.onSurfaceVariant)),
            ),
          ]),
        ),
        for (final g in section.groups) ...[
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 10),
            child: Text(g.name.toUpperCase(),
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                    color: cs.primary)),
          ),
          for (final e in g.entries)
            if (ContentRegistry.resolve(e.nodeId)?.builder != null)
              HubTile(
                id: e.nodeId,
                title: e.title,
                subtitle: e.note ??
                    ContentRegistry.metaFor(e.nodeId)?.category ??
                    'Open',
                icon: ContentRegistry.resolve(e.nodeId)!.icon,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ContentRegistry.resolve(e.nodeId)!.builder!)),
              ),
        ],
      ],
    );
  }
}
