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
      ],
    );
  }
}
