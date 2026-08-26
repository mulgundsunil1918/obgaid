import 'package:flutter/material.dart';
import '../../data/tool_registry.dart';
import '../../models/tool.dart';
import '../../widgets/hub_widgets.dart';
import '../../data/icon_map.dart';
import '../../data/scores.dart';
import 'scores_hub.dart' show ScoreScreen;

class CalculatorsHub extends StatelessWidget {
  const CalculatorsHub({super.key});

  @override
  Widget build(BuildContext context) {
    final byModule = <ToolModule, List<Tool>>{};
    for (final t in ToolRegistry.all) {
      byModule.putIfAbsent(t.module, () => []).add(t);
    }

    return HubScaffold(
      title: 'Calculators & Scores',
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
                icon: IconMap.resolve(t.id, t.module.icon),
                id: t.id,
                badge: t.indiaSpecific ? 'India' : null,
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: t.builder)),
              )),
        ],
        const _CalcSection('Scores without a calculator'),
        // Seventeen of the twenty-five scores already have a calculator and
        // are listed above under their clinical area. Only the standalone
        // ones appear here, so nothing is advertised twice.
        for (final sc in kScores.where((s) => s.toolId == null))
          HubTile(
            title: sc.name,
            subtitle: sc.subtitle,
            icon: IconMap.resolve(sc.id, Icons.rule_outlined),
            id: sc.id,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => ScoreScreen(score: sc))),
          ),
      ],
    );
  }
}

class _CalcSection extends StatelessWidget {
  const _CalcSection(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 10),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
}
