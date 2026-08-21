import 'package:flutter/material.dart';
import '../../widgets/hub_widgets.dart';

class OperativeHub extends StatelessWidget {
  const OperativeHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const HubScaffold(
      title: 'Operative',
      subtitle: 'Obstetric & gynaecological procedures',
      intro: 'Procedure references, peri-operative protocols and surgical '
          'checklists — the things you want on a phone in a scrub room.',
      children: [
        ComingSoon(phase: 'Phase 2 – 3', items: [
          'Caesarean section — classification (Robson), technique notes, '
              'complications',
          'Instrumental delivery — forceps and vacuum: prerequisites, '
              'contraindications, sequential-instrument rules',
          'Perineal repair — OASIS classification and repair technique',
          'B-Lynch and other compression sutures',
          'Stepwise uterine devascularisation and internal iliac ligation',
          'Peripartum hysterectomy',
          'Manual removal of placenta; morbidly adherent placenta planning',
          'Cervical cerclage — McDonald, Shirodkar, indications and timing',
          'ERAS for gynaecological surgery',
          'WHO surgical safety checklist, adapted for obstetrics',
          'Laparoscopic entry techniques and complication management',
          'Hysteroscopy — distension media, fluid deficit thresholds',
        ]),
      ],
    );
  }
}
