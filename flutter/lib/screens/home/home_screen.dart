import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../theme/theme_provider.dart';
import '../../data/tool_registry.dart';
import '../../models/tool.dart';
import '../hubs/calculators_hub.dart';
import '../hubs/emergency_hub.dart';
import '../hubs/topics_hub.dart';
import '../counselling/counselling_screen.dart';
import '../hubs/tumour_staging_hub.dart';
import '../hubs/ultrasound_hub.dart';
import '../hubs/staging_scores_hub.dart';
import '../hubs/labour_hub.dart';
import '../hubs/operative_hub.dart';
import '../hubs/formulary_hub.dart';
import '../hubs/reference_hub.dart';
import '../hubs/never_again_hub.dart';
import '../hubs/academics_hub.dart';
import '../hubs/cme_hub.dart';
import '../search/app_search_delegate.dart';
import '../governance/review_queue_screen.dart';
import '../../data/content_registry.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _open(BuildContext context, Widget Function() builder) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => builder()));
  }

  List<_FeatureDef> _cards(BuildContext context) => [
        _FeatureDef(
          'Emergencies',
          'PPH · eclampsia · collapse · sepsis · dystocia',
          Icons.emergency_rounded,
          const Color(0xFFB3261E),
          () => _open(context, () => const EmergencyHub()),
          highlight: true,
        ),
        _FeatureDef(
          'Calculators & Tools',
          'Obstetric & gynae · bedside tools',
          Icons.calculate_rounded,
          const Color(0xFF0D5C55),
          () => _open(context, () => const CalculatorsHub()),
        ),
        _FeatureDef(
          'Ultrasound',
          'Scan guide · biometry · liquor · EFW',
          Icons.graphic_eq_rounded,
          const Color(0xFF1565C0),
          () => _open(context, () => const UltrasoundHub()),
        ),
        _FeatureDef(
          'Clinical Topics',
          'CTG · preterm · PCOS · fibroids · menopause',
          Icons.article_rounded,
          const Color(0xFF00695C),
          () => _open(context, () => const TopicsHub()),
        ),
        _FeatureDef(
          'Tumour Staging',
          'FIGO cervical · endometrial · ovarian',
          Icons.biotech_rounded,
          const Color(0xFF6A1B9A),
          () => _open(context, () => const TumourStagingHub()),
        ),
        _FeatureDef(
          'Staging & Scores',
          'Bishop · POP-Q · rASRM · Quintero',
          Icons.rule_rounded,
          const Color(0xFF00695C),
          () => _open(context, () => const StagingScoresHub()),
        ),
        _FeatureDef(
          'Labour',
          'WHO Labour Care Guide · induction · VBAC',
          Icons.timeline_rounded,
          const Color(0xFFC2603C),
          () => _open(context, () => const LabourHub()),
        ),
        _FeatureDef(
          'Operative',
          'Obstetric & gynae procedures · ERAS',
          Icons.medical_services_rounded,
          const Color(0xFF6D4C41),
          () => _open(context, () => const OperativeHub()),
        ),
        _FeatureDef(
          'Drug Formulary',
          'Pregnancy & lactation safety',
          Icons.medication_rounded,
          const Color(0xFF00838F),
          () => _open(context, () => const FormularyHub()),
        ),
        _FeatureDef(
          'Reference Library',
          'FOGSI · RCOG · ACOG · NICE · MTP · PCPNDT',
          Icons.menu_book_rounded,
          const Color(0xFF283593),
          () => _open(context, () => const ReferenceHub()),
        ),
        _FeatureDef(
          'Counselling',
          'What to say — and what not to',
          Icons.record_voice_over_rounded,
          const Color(0xFF00838F),
          () => _open(context, () => const CounsellingHub()),
        ),
        _FeatureDef(
          'Never Again',
          'Learn from real mistakes',
          Icons.groups_rounded,
          const Color(0xFF1A237E),
          () => _open(context, () => const NeverAgainHub()),
        ),
        _FeatureDef(
          'Academics',
          'Landmark trials · FOGSI · ICOG',
          Icons.school_rounded,
          const Color(0xFFAD1457),
          () => _open(context, () => const AcademicsHub()),
        ),
        _FeatureDef(
          'CME & Webinars',
          'Find & post events',
          Icons.event_note_rounded,
          const Color(0xFF7B1FA2),
          () => _open(context, () => const CmeHub()),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cs = Theme.of(context).colorScheme;
    final isPhone = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(context, isDark),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            elevation: 0,
            backgroundColor:
                isDark ? const Color(0xFF0F1513) : ObgColors.teal,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            title: Text(
              'ObgAid',
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 22,
                letterSpacing: 0.3,
              ),
            ),
            actions: [
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search, color: Colors.white, size: 22),
                onPressed: () => showSearch(
                    context: context, delegate: AppSearchDelegate()),
              ),
              Consumer<ThemeProvider>(
                builder: (context, tp, _) => IconButton(
                  tooltip: tp.isDarkMode ? 'Light mode' : 'Dark mode',
                  onPressed: tp.toggle,
                  icon: Icon(
                    tp.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(width: 4),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildWelcomeBanner(context, isDark),
                  const SizedBox(height: 22),
                  _sectionHeader(context, 'Modules'),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent: isPhone ? 130 : 140,
                    ),
                    itemCount: _cards(context).length,
                    itemBuilder: (_, i) => _FeatureCardWidget(
                        card: _cards(context)[i], isDark: isDark),
                  ),
                  const SizedBox(height: 26),
                  _sectionHeader(context, 'Quick access'),
                  const SizedBox(height: 12),
                  _buildQuickChips(context, cs, isDark),
                  const SizedBox(height: 28),
                  _buildDisclaimer(context, cs),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String text) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.plusJakartaSans(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.1,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildWelcomeBanner(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF10322E), const Color(0xFF0F1513)]
              : [ObgColors.teal, ObgColors.tealLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Obstetrics & Gynaecology,\nat the bedside.',
            style: GoogleFonts.plusJakartaSans(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w800,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Every threshold digitised from its source publication, with the '
            'reference shown on the screen. Verify before you act.',
            style: GoogleFonts.plusJakartaSans(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 12.5,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _BannerPill('FOGSI'),
              _BannerPill('RCOG'),
              _BannerPill('ACOG'),
              _BannerPill('NICE'),
              _BannerPill('WHO'),
              _BannerPill('FIGO'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickChips(BuildContext context, ColorScheme cs, bool isDark) {
    final tools = ToolRegistry.quickAccess;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tools
          .map((t) => ActionChip(
                avatar: Icon(t.module.icon, size: 16, color: cs.primary),
                label: Text(t.name, style: const TextStyle(fontSize: 12.5)),
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: t.builder)),
              ))
          .toList(),
    );
  }

  Widget _buildDisclaimer(BuildContext context, ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, size: 16, color: cs.onSurfaceVariant),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'ObgAid is a clinical decision support tool for qualified '
              'healthcare professionals. Every calculation and threshold must be '
              'verified against current guidelines and the patient in front of '
              'you before any treatment decision.',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(height: 1.45, color: cs.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context, bool isDark) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDark
                    ? [const Color(0xFF10322E), const Color(0xFF0F1513)]
                    : [ObgColors.teal, ObgColors.tealLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('ObgAid',
                    style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text('Obstetrics & Gynaecology Reference',
                    style: GoogleFonts.plusJakartaSans(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 12)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.fact_check_outlined),
            title: const Text('Clinical review queue'),
            subtitle: Text(
                '${ContentRegistry.awaitingReview.length} awaiting sign-off'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ReviewQueueScreen()));
            },
          ),
          const Divider(),
          for (final item in const [
            ('Settings', Icons.settings_outlined),
            ('Account', Icons.person_outline),
            ('Saved', Icons.bookmark_outline),
            ('My submissions', Icons.upload_file_outlined),
            ('References', Icons.menu_book_outlined),
            ('About', Icons.info_outline),
          ])
            ListTile(
              leading: Icon(item.$2),
              title: Text(item.$1),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.$1} — arriving in Phase 6')),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _BannerPill extends StatelessWidget {
  const _BannerPill(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text,
          style: GoogleFonts.plusJakartaSans(
              color: Colors.white,
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4)),
    );
  }
}

class _FeatureDef {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;
  final VoidCallback onTap;
  final bool highlight;

  const _FeatureDef(
    this.title,
    this.subtitle,
    this.icon,
    this.accent,
    this.onTap, {
    this.highlight = false,
  });
}

class _FeatureCardWidget extends StatelessWidget {
  final _FeatureDef card;
  final bool isDark;
  const _FeatureCardWidget({required this.card, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    const highlightBg = Color(0xFFFFF8E1);
    const highlightBorder = Color(0xFFFFC107);
    const highlightBgDark = Color(0xFF2A2415);

    final cardBg = card.highlight
        ? (isDark ? highlightBgDark : highlightBg)
        : (isDark ? const Color(0xFF17201E) : Colors.white);
    final border = card.highlight
        ? highlightBorder
        : (isDark ? const Color(0xFF25322F) : const Color(0xFFD5E0DD));

    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: border, width: card.highlight ? 1.6 : 1.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: card.onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: card.accent.withValues(alpha: isDark ? 0.22 : 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(card.icon, color: card.accent, size: 22),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(card.title,
                      style: GoogleFonts.plusJakartaSans(
                          color: cs.onSurface,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 2),
                  Text(card.subtitle,
                      style: GoogleFonts.plusJakartaSans(
                          color: cs.onSurface.withValues(alpha: 0.55),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          height: 1.25),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
