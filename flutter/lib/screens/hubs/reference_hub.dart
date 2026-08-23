import 'package:flutter/material.dart';
import '../../widgets/hub_widgets.dart';
import '../legal/mtp_screen.dart';
import '../legal/pcpndt_screen.dart';
import '../../data/topic_registry.dart';
import '../topics/topic_screen.dart';
import '../reference/lab_reference_screen.dart';
import '../reference/immunisation_screen.dart';
import '../reference/guidelines_screen.dart';
import '../reference/change_tracker_screen.dart';
import '../reference/quick_tables_screen.dart';

class ReferenceHub extends StatelessWidget {
  const ReferenceHub({super.key});

  @override
  Widget build(BuildContext context) {
    return HubScaffold(
      title: 'Reference Library',
      subtitle: 'Guidelines · statute · protocols',
      intro: 'The Indian statutory material is the part no imported app '
          'carries, and the part most often got wrong. It leads here.',
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text('INDIAN STATUTE',
              style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: Theme.of(context).colorScheme.primary)),
        ),
        HubTile(
          title: 'MTP Act',
          subtitle: 'Gestational limits · Rule 3B categories · Medical Board · '
              'consent and confidentiality',
          icon: Icons.gavel_outlined,
          badge: 'India',
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const MtpScreen())),
        ),
        HubTile(
          title: 'PCPNDT Act',
          subtitle: 'Form F · Section 4(3) indications · registration · penalties',
          icon: Icons.policy_outlined,
          badge: 'India',
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const PcpndtScreen())),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text('CLINICAL REFERENCE',
              style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: Theme.of(context).colorScheme.primary)),
        ),
        for (final t in TopicRegistry.byGroup[TopicGroup.immunology]!)
          HubTile(
            title: t.name,
            subtitle: t.subtitle,
            icon: Icons.article_outlined,
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => TopicScreen(topic: t))),
          ),
        HubTile(
          title: 'Laboratory reference',
          subtitle: 'Trimester-specific ranges — and the four that catch '
              'people out',
          icon: Icons.science_outlined,
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const LabReferenceScreen())),
        ),
        HubTile(
          title: 'Maternal immunisation',
          subtitle: 'Preconception, pregnancy and postpartum — with the '
              'country and year on every recommendation',
          icon: Icons.vaccines_outlined,
          badge: 'India',
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ImmunisationScreen())),
        ),
        HubTile(
          title: 'Quick reference',
          subtitle: 'Searchable tables — milestones, Doppler, blood products, '
              'antibiotics, labour stages',
          icon: Icons.table_chart_outlined,
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const QuickTablesScreen())),
        ),
        HubTile(
          title: 'What changed',
          subtitle: 'Guideline change tracker — old position, new position, '
              'and why it matters',
          icon: Icons.swap_horiz_rounded,
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ChangeTrackerScreen())),
        ),
        HubTile(
          title: 'Guidelines',
          subtitle: 'WHO · FIGO · NICE · ESHRE · FOGSI · Government of India',
          icon: Icons.menu_book_outlined,
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const GuidelinesScreen())),
        ),
        const SizedBox(height: 18),
        const ComingSoon(phase: 'Phase 4', items: [
          'FOGSI Good Clinical Practice Recommendations — the full set',
          'ICOG guidelines',
          'RCOG Green-top Guidelines',
          'ACOG Practice Bulletins',
          'NICE NG201 antenatal care and NG235 intrapartum care',
          'WHO — ANC 2016, Labour Care Guide 2020, PPH recommendations',
          'Anemia Mukt Bharat — protocols and IV iron pathways',
          'LaQshya labour room quality standards; SUMAN; JSY / JSSK',
          'Trimester-specific laboratory reference ranges',
          'Emergency algorithms — eclampsia, shoulder dystocia, cord prolapse, '
              'amniotic fluid embolism, maternal collapse',
        ]),
      ],
    );
  }
}
