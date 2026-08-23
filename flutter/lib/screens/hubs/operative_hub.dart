import 'package:flutter/material.dart';
import '../../data/topic_registry.dart';
import '../../widgets/hub_widgets.dart';
import '../topics/topic_screen.dart';
import '../anatomy/anatomy_screen.dart';

class OperativeHub extends StatelessWidget {
  const OperativeHub({super.key});

  @override
  Widget build(BuildContext context) {
    final procedures = TopicRegistry.byGroup[TopicGroup.procedures] ?? [];
    return HubScaffold(
      title: 'Operative',
      subtitle: '${procedures.length} procedures',
      intro: 'Procedure references structured to the specification: '
          'indications, contraindications, preparation, equipment, steps, '
          'complications, aftercare, and what to document.',
      children: [
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
        const SizedBox(height: 18),
        const ComingSoon(phase: 'Tier 3 continued', items: [
          'Caesarean section — technique, the impacted head, accreta spectrum',
          'Assisted vaginal delivery — forceps and vacuum',
          'Manual removal of placenta and uterine exploration',
          'Perineal and OASIS repair',
          'B-Lynch and stepwise devascularisation',
          'Cervical cerclage',
          'Colposcopy and cervical excision',
          'Hysteroscopy — distension media and fluid deficit thresholds',
          'Diagnostic laparoscopy and entry techniques',
          'ERAS for gynaecological surgery',
        ]),
      ],
    );
  }
}
