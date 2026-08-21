import 'package:flutter/material.dart';
import '../../widgets/hub_widgets.dart';

class NeverAgainHub extends StatelessWidget {
  const NeverAgainHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const HubScaffold(
      title: 'Never Again',
      subtitle: 'Learn from real mistakes',
      intro: 'Anonymous, moderated accounts of things that went wrong and what '
          'was learned — the same module that runs in PediAid, scoped to '
          'obstetrics and gynaecology. Obstetric near-misses are '
          'under-discussed precisely because they are the ones that frighten '
          'people most.',
      children: [
        ComingSoon(phase: 'Phase 6', items: [
          'Submit an anonymised case — what happened, what was learned',
          'Moderated review before anything is published',
          'Browse by category: haemorrhage, hypertensive disease, sepsis, '
              'labour, surgical, diagnostic, medication',
          'Comment and discussion, with the same moderation queue',
          'Shares PediAid\'s existing backend module — no second system to build',
        ]),
      ],
    );
  }
}
