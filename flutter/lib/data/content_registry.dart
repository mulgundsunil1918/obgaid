import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' show Icons;
import '../models/content_meta.dart';
import '../models/staging.dart';
import 'staging_data.dart';
import '../screens/calculators/dating_screen.dart';
import '../screens/calculators/usg_params_screen.dart';
import '../screens/calculators/efw_screen.dart';
import '../screens/calculators/bishop_screen.dart';
import '../screens/calculators/dipsi_screen.dart';
import '../screens/calculators/mgso4_screen.dart';
import '../screens/calculators/pph_screen.dart';
import '../screens/guides/usg_guide_screen.dart';
import '../screens/legal/mtp_screen.dart';
import '../screens/legal/pcpndt_screen.dart';
import '../screens/staging/staging_screen.dart';

/// A resolved graph node — what a related link points at.
class ContentLink {
  const ContentLink(this.id, this.title, this.icon, this.builder);
  final String id;
  final String title;
  final IconData icon;

  /// Null where the content is specified but not yet built. The link still
  /// renders, marked "soon", so the intended pathway is visible before every
  /// node on it exists.
  final WidgetBuilder? builder;
}

/// Central index of every clinical item: its §62 record and its §68 edges.
///
/// The registry is the reason the specification's "single searchable clinical
/// knowledge system" is achievable — content declares its own identity and its
/// own neighbours, and screens read both from here.
class ContentRegistry {
  static final DateTime _built = DateTime(2026, 8, 21);
  static DateTime _review(int months) =>
      DateTime(_built.year, _built.month + months, _built.day);

  static const _nodes = <ContentLink>[
    ContentLink('dating', 'Dating & gestational age',
        Icons.calendar_month_outlined, _dating),
    ContentLink('usg', 'Ultrasound parameters', Icons.graphic_eq_rounded, _usg),
    ContentLink('usg-guide', 'Ultrasound scan guide', Icons.menu_book_rounded,
        _usgGuide),
    ContentLink('efw', 'Estimated fetal weight', Icons.monitor_weight_outlined,
        _efw),
    ContentLink('bishop', 'Bishop score', Icons.rule_rounded, _bishop),
    ContentLink('gdm', 'GDM screening', Icons.water_drop_outlined, _gdm),
    ContentLink(
        'mgso4', 'Magnesium sulphate', Icons.warning_amber_outlined, _mgso4),
    ContentLink('pph', 'Postpartum haemorrhage', Icons.bloodtype_outlined, _pph),
    ContentLink('mtp-act', 'MTP Act', Icons.gavel_outlined, _mtp),
    ContentLink('pcpndt-act', 'PCPNDT Act', Icons.policy_outlined, _pcpndt),
    ContentLink('figo-cervix-2018', 'Cervical carcinoma — FIGO 2018',
        Icons.biotech_outlined, _cervix),
    ContentLink('figo-endometrium-2023', 'Endometrial carcinoma — FIGO 2023',
        Icons.biotech_outlined, _endometrium),
    ContentLink('figo-ovary-2014', 'Ovarian carcinoma — FIGO 2014',
        Icons.biotech_outlined, _ovary),
    // Specified but not yet built — the pathway is visible before the node is.
    ContentLink('severe-htn', 'Severe hypertension', Icons.emergency_outlined, null),
    ContentLink('eclampsia', 'Eclampsia algorithm', Icons.emergency_outlined, null),
    ContentLink('ctg', 'CTG interpretation', Icons.monitor_heart_outlined, null),
    ContentLink('anaemia', 'Anaemia & Ganzoni iron deficit',
        Icons.water_drop_outlined, null),
    ContentLink('insulin', 'Insulin dosing in pregnancy',
        Icons.medication_outlined, null),
    ContentLink('induction', 'Induction of labour', Icons.timeline_outlined, null),
    ContentLink('blood-products', 'Blood products & massive transfusion',
        Icons.bloodtype_outlined, null),
    ContentLink('fgr', 'Fetal growth restriction', Icons.trending_down, null),
    ContentLink('doppler', 'Doppler indices', Icons.graphic_eq_outlined, null),
    ContentLink('endometrial-thickness', 'Endometrial thickness thresholds',
        Icons.straighten_outlined, null),
  ];

  static ContentLink? resolve(String id) {
    for (final n in _nodes) {
      if (n.id == id) return n;
    }
    return null;
  }

  static ContentMeta? metaFor(String id) => _meta[id];

  /// Every item flagged under §63 that no clinician has signed off yet.
  static List<ContentMeta> get awaitingReview => _meta.values
      .where((m) => m.awaitingMandatoryReview)
      .toList()
    ..sort((a, b) => a.title.compareTo(b.title));

  static final Map<String, ContentMeta> _meta = {
    'dating': ContentMeta(
      id: 'dating',
      title: 'Dating & gestational age',
      category: 'Obstetrics · Dating',
      sourceOrg: 'ACOG / AIUM / SMFM',
      sourceTitle: 'Committee Opinion 700 — Methods for Estimating the Due Date',
      year: 2017,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('usg', 'Derive the gestational age this screen needs from CRL '
            'or biometry'),
        Related('usg-guide', 'Which scan establishes dating, and its valid window'),
        Related('mtp-act', 'The 20 and 24-week limits turn entirely on accurate '
            'dating'),
        Related('efw', 'Growth centiles require a settled gestational age'),
      ],
    ),
    'usg': ContentMeta(
      id: 'usg',
      title: 'Ultrasound parameters',
      category: 'Obstetrics · Ultrasound',
      sourceOrg: 'Hadlock / Robinson & Fleming',
      sourceTitle: 'Fetal biometry and CRL dating equations',
      year: 1984,
      evidence: EvidenceLevel.observational,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('dating', 'Turn this gestational age into an EDD, or test it '
            'against the LMP'),
        Related('efw', 'Same biometry, estimated weight and centile'),
        Related('usg-guide', 'What each scan measures and why'),
        Related('pcpndt-act', 'Form F must be completed before any prenatal scan'),
      ],
    ),
    'usg-guide': ContentMeta(
      id: 'usg-guide',
      title: 'Ultrasound scan guide',
      category: 'Obstetrics · Ultrasound',
      sourceOrg: 'ISUOG',
      sourceTitle: 'Practice Guidelines — first-trimester, mid-trimester, '
          'Doppler and fetal echocardiography',
      year: 2022,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('usg', 'Work the measurements from any of these scans'),
        Related('efw', 'Estimated weight from the growth scan'),
        Related('pcpndt-act', 'The legal frame every Indian scan sits inside'),
        Related('doppler', 'Indices and centiles for the Doppler studies'),
      ],
    ),
    'efw': ContentMeta(
      id: 'efw',
      title: 'Estimated fetal weight',
      category: 'Obstetrics · Fetal growth',
      sourceOrg: 'Hadlock FP et al.',
      sourceTitle: 'In utero analysis of fetal growth: a sonographic weight '
          'standard. Radiology 1991;181:129–133',
      year: 1991,
      evidence: EvidenceLevel.observational,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('fgr', 'A weight below the 10th centile is where growth '
            'restriction is worked up'),
        Related('doppler', 'Umbilical and cerebral Doppler decide timing in FGR'),
        Related('dating', 'The centile is only as good as the gestational age'),
        Related('gdm', 'Macrosomia is the reason glycaemic control matters'),
      ],
    ),
    'bishop': ContentMeta(
      id: 'bishop',
      title: 'Bishop score',
      category: 'Obstetrics · Labour',
      sourceOrg: 'ACOG',
      sourceTitle: 'Practice Bulletin 107 — Induction of Labor',
      year: 2009,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('induction', 'An unfavourable cervix decides the ripening agent'),
        Related('ctg', 'Monitoring through induction and augmentation'),
        Related('pph', 'Prolonged induction raises the risk of atony'),
      ],
    ),
    'gdm': ContentMeta(
      id: 'gdm',
      title: 'GDM screening — DIPSI & IADPSG',
      category: 'Obstetrics · Diabetes',
      sourceOrg: 'DIPSI / MoHFW Government of India',
      sourceTitle: 'National Guidelines for Diagnosis & Management of '
          'Gestational Diabetes Mellitus',
      year: 2018,
      evidence: EvidenceLevel.nationalGuideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('insulin', 'Where nutrition therapy fails to reach target'),
        Related('efw', 'Serial growth scans for macrosomia'),
        Related('induction', 'Timing of delivery in diabetic pregnancy'),
      ],
    ),
    'mgso4': ContentMeta(
      id: 'mgso4',
      title: 'Magnesium sulphate',
      category: 'Obstetrics · Hypertensive disorders',
      sourceOrg: 'FOGSI–ICOG / WHO',
      sourceTitle: 'GCPR Hypertensive Disorders of Pregnancy; WHO '
          'recommendations for prevention and treatment of pre-eclampsia and '
          'eclampsia; Magpie Trial',
      year: 2002,
      evidence: EvidenceLevel.rct,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('eclampsia', 'The algorithm this drug sits inside'),
        Related('severe-htn', 'Magnesium is not an antihypertensive — severe '
            'hypertension needs its own treatment alongside'),
        Related('pph', 'Magnesium relaxes the uterus and raises atony risk'),
      ],
    ),
    'pph': ContentMeta(
      id: 'pph',
      title: 'Postpartum haemorrhage',
      category: 'Obstetrics · Emergency',
      sourceOrg: 'WHO / RCOG / FOGSI',
      sourceTitle: 'E-MOTIVE trial (NEJM 2023); RCOG Green-top 52; WOMAN trial',
      year: 2023,
      evidence: EvidenceLevel.rct,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('blood-products', 'Transfusion and massive transfusion protocol'),
        Related('mgso4', 'Magnesium given for pre-eclampsia worsens atony'),
        Related('anaemia', 'Antenatal anaemia is what makes a given loss lethal'),
      ],
    ),
    'mtp-act': ContentMeta(
      id: 'mtp-act',
      title: 'MTP Act',
      category: 'India · Statute',
      sourceOrg: 'Government of India',
      sourceTitle: 'Medical Termination of Pregnancy (Amendment) Act, 2021 and '
          'Rules, 2021',
      year: 2021,
      evidence: EvidenceLevel.statute,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('dating', 'Every gestational limit in the Act depends on the '
            'dating method used'),
        Related('pcpndt-act', 'The other statute governing every Indian '
            'antenatal encounter'),
      ],
    ),
    'pcpndt-act': ContentMeta(
      id: 'pcpndt-act',
      title: 'PCPNDT Act',
      category: 'India · Statute',
      sourceOrg: 'Government of India',
      sourceTitle: 'Pre-conception and Pre-natal Diagnostic Techniques '
          '(Prohibition of Sex Selection) Act, 1994, as amended 2003',
      year: 2003,
      evidence: EvidenceLevel.statute,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('usg-guide', 'Every scan listed there requires Form F'),
        Related('mtp-act', 'The two statutes are read together in practice'),
      ],
    ),
  };
}

Widget _dating(BuildContext _) => const DatingScreen();
Widget _usg(BuildContext _) => const UsgParamsScreen();
Widget _usgGuide(BuildContext _) => const UsgGuideScreen();
Widget _efw(BuildContext _) => const EfwScreen();
Widget _bishop(BuildContext _) => const BishopScreen();
Widget _gdm(BuildContext _) => const DipsiScreen();
Widget _mgso4(BuildContext _) => const MgSo4Screen();
Widget _pph(BuildContext _) => const PphScreen();
Widget _mtp(BuildContext _) => const MtpScreen();
Widget _pcpndt(BuildContext _) => const PcpndtScreen();
Widget _cervix(BuildContext _) => StagingScreen(system: _system('figo-cervix-2018'));
Widget _endometrium(BuildContext _) =>
    StagingScreen(system: _system('figo-endometrium-2023'));
Widget _ovary(BuildContext _) => StagingScreen(system: _system('figo-ovary-2014'));

StagingSystem _system(String id) =>
    kStagingSystems.firstWhere((s) => s.id == id);
