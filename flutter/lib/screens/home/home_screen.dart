import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../theme/theme_provider.dart';
import '../../data/tool_registry.dart';
import '../../data/topic_registry.dart';
import '../../data/drug_registry.dart';
import '../../data/counselling.dart';
import '../../data/safety_cases.dart';
import '../../data/scores.dart';
import '../../data/algorithm_registry.dart';
import '../../models/tool.dart';
import '../hubs/calculators_hub.dart';
import '../hubs/emergency_hub.dart';
import '../hubs/topics_hub.dart';
import '../counselling/counselling_screen.dart';
import '../hubs/ultrasound_hub.dart';
import '../hubs/operative_hub.dart';
import '../hubs/formulary_hub.dart';
import '../hubs/reference_hub.dart';
import '../hubs/never_again_hub.dart';
import '../hubs/academics_hub.dart';
import '../../data/learning_registry.dart';
import '../../data/curriculum.dart';
import '../curriculum/learn_obg.dart';
import '../../data/trial_registry.dart';
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

  /// Grouped by the question a clinician is asking, not by subject — subject
  /// cross-cuts almost everything here, which is why an accreted flat list
  /// stopped being navigable.
  /// The doors. Flat, no group headings — grouping added a hop and the group
  /// names were doing no work that the card titles were not already doing.
  ///
  /// Emergencies is deliberately NOT here: it renders as a full-width band
  /// above the grid, so no amount of text scaling or narrow-screen reflow can
  /// push it below the fold.
  List<_FeatureDef> _cards(BuildContext context) => [
        _FeatureDef(
          'Calculators & Scores',
          '${ToolRegistry.all.length + _standaloneScoreCount} tools · dating, '
              'EFW, Bishop, MgSO4, MEOWS',
          Icons.calculate_rounded,
          const Color(0xFF0D5C55),
          () => _open(context, () => const CalculatorsHub()),
        ),
        _FeatureDef(
          'Learn OBG',
          '${kCurriculum.fold<int>(0, (a, s) => a + s.topicCount)} topics · '
              'the whole subject, taught in order',
          Icons.school_rounded,
          const Color(0xFF00695C),
          () => _open(context, () => const LearnObgHub()),
        ),
        _FeatureDef(
          'Clinical Topics',
          '${TopicRegistry.all.length + LearningRegistry.all.length} topics · '
              'bedside reference & full curriculum',
          Icons.article_rounded,
          const Color(0xFF283593),
          () => _open(context, () => const TopicsHub()),
        ),
        _FeatureDef(
          'Drug Formulary',
          '${DrugRegistry.all.length} drugs · pregnancy & lactation safety',
          Icons.medication_rounded,
          const Color(0xFF00838F),
          () => _open(context, () => const FormularyHub()),
        ),
        _FeatureDef(
          'Ultrasound',
          'Scan guide · biometry · Doppler · Form F',
          Icons.graphic_eq_rounded,
          const Color(0xFF1565C0),
          () => _open(context, () => const UltrasoundHub()),
        ),
        _FeatureDef(
          'Procedures & Anatomy',
          'Steps, pitfalls, and where the ureter runs',
          Icons.medical_services_rounded,
          const Color(0xFF6D4C41),
          () => _open(context, () => const OperativeHub()),
        ),
        _FeatureDef(
          'Counselling',
          '${kCounsellingGuides.length} guides · what to say · MTP Act',
          Icons.record_voice_over_rounded,
          const Color(0xFF00695C),
          () => _open(context, () => const CounsellingHub()),
        ),
        _FeatureDef(
          'Reference Library',
          'Guidelines · labs · vaccines · tables · FIGO staging',
          Icons.menu_book_rounded,
          const Color(0xFF1A237E),
          () => _open(context, () => const ReferenceHub()),
        ),
        _FeatureDef(
          'Academics & CME',
          '${TrialRegistry.all.length} trials · viva topics · credit log',
          Icons.school_rounded,
          const Color(0xFFAD1457),
          () => _open(context, () => const AcademicsHub()),
        ),
        _FeatureDef(
          'Never Again',
          '${kSafetyCases.length} real cases · learn from real mistakes',
          Icons.groups_rounded,
          const Color(0xFF4527A0),
          () => _open(context, () => const NeverAgainHub()),
        ),
      ];

  /// Scores that are not already a calculator. Seventeen of the twenty-five
  /// carry a toolId, so counting all of them would advertise the same thing
  /// twice.
  static int get _standaloneScoreCount =>
      kScores.where((s) => s.toolId == null).length;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cs = Theme.of(context).colorScheme;
    final isPhone = MediaQuery.of(context).size.width < 600;
    final cols = MediaQuery.of(context).size.width < 600
        ? 2
        : (MediaQuery.of(context).size.width < 980 ? 3 : 4);
    final cards = _cards(context);

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
                  _buildWelcomeBanner(
                    context,
                    isDark,
                    band: _EmergencyBand(
                      count: AlgorithmRegistry.all.length,
                      onTap: () => _open(context, () => const EmergencyHub()),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cols,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      // Card height follows the text scale, or the content
                      // overflows at accessibility sizes.
                      mainAxisExtent: (isPhone ? 146.0 : 152.0) *
                          MediaQuery.textScalerOf(context)
                              .scale(14)
                              .clamp(14, 28) /
                          14,
                    ),
                    itemCount: cards.length,
                    itemBuilder: (_, i) =>
                        _FeatureCardWidget(card: cards[i], isDark: isDark),
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

  String get _greetingLine {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good morning';
    if (h < 17) return 'Good afternoon';
    return 'Good evening';
  }

  IconData get _greetingIcon {
    final h = DateTime.now().hour;
    if (h < 12) return Icons.wb_sunny_rounded;
    if (h < 17) return Icons.wb_cloudy_rounded;
    return Icons.nightlight_round;
  }

  Widget _circle(double size, double alpha) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: alpha),
        ),
      );

  Widget _buildWelcomeBanner(BuildContext context, bool isDark,
      {required Widget band}) {
    // At large accessibility text sizes the decorative half of the hero is
    // what pushes the emergency band off screen, so it is dropped rather than
    // allowed to compete with it.
    final scale = MediaQuery.textScalerOf(context).scale(14) / 14;
    final compact = scale > 1.3;
    return Container(
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
      clipBehavior: Clip.antiAlias,
      child: Stack(children: [
        Positioned(top: -34, right: -40, child: _circle(170, 0.05)),
        Positioned(top: 46, right: 58, child: _circle(84, 0.05)),
        Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(_greetingIcon, color: Colors.white, size: 12),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                _greetingLine,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),
            ]),
          ),
          if (!compact) const SizedBox(height: 10),
          if (!compact)
          Text(
            'What would you like to look up?',
            style: GoogleFonts.plusJakartaSans(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              height: 1.2,
              letterSpacing: -0.3,
            ),
          ),
          if (!compact) const SizedBox(height: 4),
          if (!compact)
          Text(
            'Obstetrics & Gynaecology clinical reference',
            style: GoogleFonts.plusJakartaSans(
              color: Colors.white.withValues(alpha: 0.65),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () =>
                showSearch(context: context, delegate: AppSearchDelegate()),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: Colors.white.withValues(alpha: 0.2)),
              ),
              child: Row(children: [
                Icon(Icons.search,
                    color: Colors.white.withValues(alpha: 0.6), size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Search algorithms, drugs, scores, topics, trials…',
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white.withValues(alpha: 0.55),
                      fontSize: 12.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.tune_rounded,
                    color: Colors.white.withValues(alpha: 0.4), size: 16),
              ]),
            ),
          ),
          const SizedBox(height: 12),
          band,
          if (!compact) const SizedBox(height: 14),
          if (!compact)
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
        ),
      ]),
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

  const _FeatureDef(
    this.title,
    this.subtitle,
    this.icon,
    this.accent,
    this.onTap,
  );
}

class _FeatureCardWidget extends StatelessWidget {
  final _FeatureDef card;
  final bool isDark;
  const _FeatureCardWidget({required this.card, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    // The amber highlight left with the emergency card — every card on the
    // grid is now peer-level, and emphasis lives in the red band above it.
    final cardBg = isDark ? AppTheme.dCard : Colors.white;
    final border = isDark ? AppTheme.dBorder : const Color(0xFFD5E0DD);

    return Container(
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
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
                  // Two lines: "Calculators & Scores" and "Procedures &
                  // Anatomy" do not fit a 2-column phone card on one.
                  Text(card.title,
                      style: GoogleFonts.plusJakartaSans(
                          color: cs.onSurface,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.2),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 3),
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

/// Emergencies, rendered as a full-width band rather than a grid tile.
///
/// As a tile it can be pushed below the fold by a large text scale, a narrow
/// screen, or a future extra card. As a band pinned directly under the search
/// bar it cannot. That is a clinical safety property, not a layout preference.
class _EmergencyBand extends StatelessWidget {
  const _EmergencyBand({required this.count, required this.onTap});
  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFB3261E);
    return Semantics(
      button: true,
      label: 'Emergencies. $count algorithms. Opens immediately.',
      child: Material(
        color: red,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.emergency_rounded,
                      color: Colors.white, size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Emergencies',
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          fontSize: 16.5,
                          fontWeight: FontWeight.w800,
                          height: 1.15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$count algorithms · PPH · eclampsia · sepsis · '
                        'collapse',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 11.5,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right, color: Colors.white, size: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
