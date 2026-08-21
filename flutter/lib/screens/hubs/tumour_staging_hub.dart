import 'package:flutter/material.dart';
import '../../data/staging_data.dart';
import '../../widgets/hub_widgets.dart';
import '../staging/staging_screen.dart';

class TumourStagingHub extends StatelessWidget {
  const TumourStagingHub({super.key});

  @override
  Widget build(BuildContext context) {
    return HubScaffold(
      title: 'Tumour Staging',
      subtitle: 'FIGO · current editions',
      intro: 'Each system is transcribed from its source publication, with a '
          'note on what changed in the current edition. Staging is assigned at '
          'diagnosis and does not change afterwards.',
      children: [
        ...kStagingSystems.map((s) => HubTile(
              title: s.name,
              subtitle: s.edition,
              icon: Icons.biotech_outlined,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => StagingScreen(system: s))),
            )),
        const SizedBox(height: 18),
        const ComingSoon(phase: 'Phase 3', items: [
          'Interactive stage assignment — select findings, get the stage',
          'Vaginal carcinoma (FIGO)',
          'Uterine sarcoma (FIGO 2009)',
          'Molecular classification wizard for endometrial carcinoma',
          'Sentinel node algorithms',
        ]),
      ],
    );
  }
}
