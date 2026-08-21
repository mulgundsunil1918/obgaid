import 'package:flutter/material.dart';
import '../../widgets/hub_widgets.dart';

class FormularyHub extends StatelessWidget {
  const FormularyHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const HubScaffold(
      title: 'Drug Formulary',
      subtitle: 'Pregnancy & lactation safety',
      intro: 'FDA pregnancy letter categories (A/B/C/D/X) were withdrawn in '
          '2015 and replaced by the narrative PLLR format. Apps still showing '
          'letter grades are giving you a system the regulator abandoned a '
          'decade ago.',
      children: [
        ComingSoon(phase: 'Phase 5', items: [
          'Pregnancy safety — PLLR narrative summaries by trimester',
          'Lactation safety — LactMed-derived infant risk and relative infant dose',
          'Common obstetric drugs — uterotonics, tocolytics, antihypertensives, '
              'anticoagulants, antibiotics',
          'Common gynaecological drugs — hormonal therapy, ovulation induction, '
              'GnRH analogues, chemotherapy protocols',
          'Anti-epileptics in pregnancy — teratogenic risk comparison',
          'Antimicrobials — safe choices by trimester',
          'Search, bookmarks, and offline access',
        ]),
      ],
    );
  }
}
