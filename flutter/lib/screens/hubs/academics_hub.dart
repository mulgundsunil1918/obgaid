import 'package:flutter/material.dart';
import '../../widgets/hub_widgets.dart';

class AcademicsHub extends StatelessWidget {
  const AcademicsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const HubScaffold(
      title: 'Academics',
      subtitle: 'Landmark trials · guidelines · teaching',
      intro: 'The trial that changed practice, summarised to the point where '
          'you could defend it on a ward round.',
      children: [
        ComingSoon(phase: 'Phase 6', items: [
          'Landmark trials — Magpie, CRASH-2/WOMAN, E-MOTIVE, Term Breech, '
              'ACHOIS, HYPITAT, ARRIVE, ASPRE, TBS, CHIPS, GRIT, TRUFFLE',
          'Guideline notes — what changed, and what it means at the bedside',
          'Submissions from users, with moderation and authorship credit',
          'Reference codes for citing in teaching and presentations',
          'Search across trials and guidelines',
          'Shares PediAid\'s academics backend — content scoped by specialty',
        ]),
      ],
    );
  }
}
