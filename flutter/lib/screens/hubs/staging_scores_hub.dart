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
      ],
    );
  }
}
