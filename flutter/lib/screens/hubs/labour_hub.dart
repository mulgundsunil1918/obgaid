import 'package:flutter/material.dart';
import '../../data/tool_registry.dart';
import '../../widgets/hub_widgets.dart';

class LabourHub extends StatelessWidget {
  const LabourHub({super.key});

  @override
  Widget build(BuildContext context) {
    final bishop = ToolRegistry.byId('bishop')!;
    final pph = ToolRegistry.byId('pph')!;
    return HubScaffold(
      title: 'Labour',
      subtitle: 'Assessment · induction · third stage',
      intro: 'The WHO Labour Care Guide (2020) has replaced the partograph. '
          'Many apps still ship the old alert and action lines — this one will '
          'not.',
      children: [
        HubTile(
          title: bishop.name,
          subtitle: bishop.blurb,
          icon: Icons.rule_rounded,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: bishop.builder)),
        ),
        HubTile(
          title: pph.name,
          subtitle: pph.blurb,
          icon: Icons.bloodtype_outlined,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: pph.builder)),
        ),
        const SizedBox(height: 18),
        const ComingSoon(phase: 'Phase 1.3 – 2', items: [
          'WHO Labour Care Guide 2020 — full interactive chart',
          'Induction of labour — agent selection, dosing, monitoring',
          'Augmentation — oxytocin regimens, hyperstimulation management',
          'VBAC success prediction (MFMU model)',
          'Shoulder dystocia — HELPERR drill',
          'Cord prolapse and maternal collapse algorithms',
          'Cardiotocograph interpretation (NICE / FIGO categories)',
          'Cord blood gas interpretation',
        ]),
      ],
    );
  }
}
