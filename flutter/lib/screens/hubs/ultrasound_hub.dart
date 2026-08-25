import 'package:flutter/material.dart';
import '../../data/tool_registry.dart';
import '../../widgets/hub_widgets.dart';
import '../guides/usg_guide_screen.dart';

class UltrasoundHub extends StatelessWidget {
  const UltrasoundHub({super.key});

  @override
  Widget build(BuildContext context) {
    final params = ToolRegistry.byId('usg')!;
    final efw = ToolRegistry.byId('efw')!;
    return HubScaffold(
      title: 'Ultrasound',
      subtitle: 'Parameters · guide to every scan',
      children: [
        HubTile(
          title: 'Scan guide',
          subtitle: 'Every scan in pregnancy — when it is done, what is '
              'measured, and what you are looking for',
          icon: Icons.menu_book_rounded,
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const UsgGuideScreen())),
        ),
        HubTile(
          title: params.name,
          subtitle: params.blurb,
          icon: Icons.graphic_eq_rounded,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: params.builder)),
        ),
        HubTile(
          title: efw.name,
          subtitle: efw.blurb,
          icon: Icons.monitor_weight_outlined,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: efw.builder)),
        ),
      ],
    );
  }
}
