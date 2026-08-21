import 'package:flutter/material.dart';
import '../../data/tool_registry.dart';
import '../../models/tool.dart';
import '../../widgets/hub_widgets.dart';

class CalculatorsHub extends StatelessWidget {
  const CalculatorsHub({super.key});

  @override
  Widget build(BuildContext context) {
    final byModule = <ToolModule, List<Tool>>{};
    for (final t in ToolRegistry.all) {
      byModule.putIfAbsent(t.module, () => []).add(t);
    }

    return HubScaffold(
      title: 'Calculators & Tools',
      subtitle: '${ToolRegistry.all.length} live · more each phase',
      children: [
        for (final entry in byModule.entries) ...[
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 10),
            child: Text(entry.key.label.toUpperCase(),
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                    color: Theme.of(context).colorScheme.primary)),
          ),
          ...entry.value.map((t) => HubTile(
                title: t.name,
                subtitle: t.blurb,
                icon: t.module.icon,
                badge: t.indiaSpecific ? 'India' : null,
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: t.builder)),
              )),
        ],
        const SizedBox(height: 18),
        const ComingSoon(phase: 'Phases 1–3', items: [
          'Anaemia — WHO/AMB grading, Ganzoni iron deficit, IV iron regimens',
          'Doppler — UA PI/RI, MCA PSV (Mari), CPR, ductus venosus centiles',
          'Liquor — AFI and DVP centiles, oligo- and polyhydramnios',
          'Anti-D — Kleihauer-Betke, dosing, MCA-PSV multiples of the median',
          'Preterm — cervical length, fFN, steroid timing, MgSO4 neuroprotection',
          'Aneuploidy screening — combined, quad, NIPT with likelihood ratios',
          'PCOS, HOMA-IR, Ferriman-Gallwey, PBAC',
          'Ovarian reserve — AMH, AFC, POSEIDON',
          'Adnexal mass — RMI, IOTA simple rules, O-RADS, ROMA',
        ]),
      ],
    );
  }
}
