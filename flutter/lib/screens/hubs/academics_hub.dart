import 'package:flutter/material.dart';
import '../../data/trial_registry.dart';
import '../../models/trial.dart';
import '../../widgets/hub_widgets.dart';
import '../academics/trial_screen.dart';
import '../academics/exam_screen.dart';
import '../../data/exam_topics.dart';

class AcademicsHub extends StatelessWidget {
  const AcademicsHub({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return HubScaffold(
      title: 'Academics',
      subtitle: '${TrialRegistry.all.length} landmark trials',
      intro: 'The trial that changed practice, summarised to the point where '
          'you could defend it on a ward round. Each carries its absolute '
          'effect as well as its relative one, and its limitations alongside '
          'its result.',
      children: [
        HubTile(
          title: 'Examination',
          subtitle: '${kExamTopics.length} topics — high-yield points, viva '
              'questions, and where marks are lost',
          icon: Icons.school_rounded,
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ExamHub())),
        ),
        const SizedBox(height: 14),
        for (final entry in TrialRegistry.byCategory.entries) ...[
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
                title: '${t.acronym}  ·  ${t.year}',
                subtitle: t.takeaway,
                icon: Icons.science_outlined,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TrialScreen(trial: t))),
              )),
        ],
      ],
    );
  }
}
