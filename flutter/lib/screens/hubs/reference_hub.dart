import 'package:flutter/material.dart';
import '../../widgets/hub_widgets.dart';
import '../../data/staging_data.dart';
import '../staging/staging_screen.dart';
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
        const _SectionLabel('FIGO staging'),
        ...kStagingSystems.map((sys) => HubTile(
              title: sys.name,
              subtitle: sys.edition,
              icon: Icons.biotech_outlined,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => StagingScreen(system: sys))),
            )),
      ],
    );
  }
}

/// A heading between grids inside a hub. HubScaffold treats any non-HubTile
/// child as full width, which is what makes sectioning work.
class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 10),
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
