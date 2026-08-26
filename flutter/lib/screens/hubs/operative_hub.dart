import 'package:flutter/material.dart';
import '../../data/topic_registry.dart';
import '../../widgets/hub_widgets.dart';
import '../topics/topic_screen.dart';
import '../anatomy/anatomy_screen.dart';
import '../../data/anatomy.dart';

class OperativeHub extends StatelessWidget {
  const OperativeHub({super.key});

  @override
  Widget build(BuildContext context) {
    final procedures = TopicRegistry.byGroup[TopicGroup.procedures] ?? [];
    return HubScaffold(
      title: 'Procedures & Anatomy',
      subtitle: '${procedures.length} procedures',
      intro: 'Procedure references structured to the specification: '
          'indications, contraindications, preparation, equipment, steps, '
          'complications, aftercare, and what to document.',
      children: [
        HubTile(
          title: 'Surgical anatomy',
          subtitle: '${kAnatomy.length} entries · where the structure actually '
              'gets injured',
          icon: Icons.account_tree_outlined,
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const AnatomyHub())),
        ),
        HubTile(
          title: 'Surgical anatomy',
          subtitle: 'Ureter, uterine artery, internal iliac, pelvic spaces, '
              'nerves — the two-minute lookup at the sink',
          icon: Icons.account_tree_outlined,
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AnatomyHub())),
        ),
        const SizedBox(height: 14),
        ...procedures.map((t) => HubTile(
              title: t.name,
              subtitle: t.subtitle,
              icon: Icons.medical_services_outlined,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => TopicScreen(topic: t))),
            )),
      ],
    );
  }
}
