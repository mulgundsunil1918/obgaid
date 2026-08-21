import 'package:flutter/material.dart';
import '../../data/tool_registry.dart';
import '../../widgets/hub_widgets.dart';

class StagingScoresHub extends StatelessWidget {
  const StagingScoresHub({super.key});

  @override
  Widget build(BuildContext context) {
    final bishop = ToolRegistry.byId('bishop')!;
    return HubScaffold(
      title: 'Staging & Scores',
      subtitle: 'Non-oncological scoring systems',
      children: [
        HubTile(
          title: bishop.name,
          subtitle: bishop.blurb,
          icon: Icons.rule_rounded,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: bishop.builder)),
        ),
        const SizedBox(height: 18),
        const ComingSoon(phase: 'Phases 2–3', items: [
          'POP-Q — pelvic organ prolapse quantification',
          'rASRM endometriosis staging, and ENZIAN for deep disease',
          'FIGO leiomyoma classification 0–8',
          'PALM-COEIN — abnormal uterine bleeding',
          'Quintero staging for twin-to-twin transfusion syndrome',
          'Rotterdam criteria for PCOS',
          'STRAW+10 menopause staging',
          'Amsel criteria and Nugent score',
          'MEOWS — modified early obstetric warning score',
          'Caprini VTE risk for gynaecological surgery',
        ]),
      ],
    );
  }
}
