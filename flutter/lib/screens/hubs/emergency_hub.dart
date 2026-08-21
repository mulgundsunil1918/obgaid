import 'package:flutter/material.dart';
import '../../data/algorithm_registry.dart';
import '../../widgets/hub_widgets.dart';
import '../algorithms/algorithm_screen.dart';

class EmergencyHub extends StatelessWidget {
  const EmergencyHub({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return HubScaffold(
      title: 'Emergencies',
      subtitle: '${AlgorithmRegistry.all.length} algorithms',
      intro: 'Each algorithm opens on the actions you take before you think. '
          'The full assessment, investigations, differential, escalation and '
          'follow-up sit below that, collapsed, for the part of the emergency '
          'where there is time to read.',
      children: [
        for (final entry in AlgorithmRegistry.byGroup.entries) ...[
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 10),
            child: Text(entry.key.label.toUpperCase(),
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                    color: cs.primary)),
          ),
          ...entry.value.map((a) => HubTile(
                title: a.name,
                subtitle: a.subtitle,
                icon: Icons.emergency_outlined,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AlgorithmScreen(algorithm: a))),
              )),
        ],
        const SizedBox(height: 18),
        const ComingSoon(phase: 'Tier 1C – 2', items: [
          'Non-reassuring CTG — categorisation and response',
          'Preterm labour and PPROM',
          'Miscarriage and pregnancy of unknown location',
          'Reduced fetal movement',
          'Ruptured ovarian cyst; acute pelvic pain',
          'Septic abortion; pelvic sepsis',
          'Ovarian hyperstimulation syndrome',
          'Acute urinary retention; postoperative haemorrhage',
        ]),
      ],
    );
  }
}
