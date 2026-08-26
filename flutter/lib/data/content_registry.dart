import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' show Icons;
import '../models/content_meta.dart';
import '../models/staging.dart';
import 'staging_data.dart';
import '../screens/calculators/dating_screen.dart';
import '../screens/calculators/usg_params_screen.dart';
import '../screens/calculators/anthropometry_screen.dart';
import '../screens/calculators/weight_gain_screen.dart';
import '../screens/calculators/haemodynamics_screen.dart';
import '../screens/calculators/anaemia_screen.dart';
import '../screens/calculators/insulin_screen.dart';
import '../screens/calculators/creatinine_screen.dart';
import '../screens/calculators/vte_risk_screen.dart';
import '../screens/calculators/apgar_screen.dart';
import '../screens/calculators/pcos_assessment_screen.dart';
import '../screens/calculators/adnexal_mass_screen.dart';
import '../screens/calculators/popq_screen.dart';
import '../screens/calculators/aub_screen.dart';
import '../screens/scores/epds_screen.dart';
import '../screens/scores/simple_scores.dart';
import '../screens/scores/meows_robson.dart';
import '../screens/scores/caprini_rasrm.dart';
import '../screens/calculators/efw_screen.dart';
import '../screens/calculators/biometry_screen.dart';
import '../screens/calculators/bishop_screen.dart';
import '../screens/calculators/dipsi_screen.dart';
import '../screens/calculators/mgso4_screen.dart';
import '../screens/calculators/pph_screen.dart';
import '../screens/guides/usg_guide_screen.dart';
import '../screens/legal/mtp_screen.dart';
import '../screens/legal/pcpndt_screen.dart';
import '../screens/staging/staging_screen.dart';
import '../screens/topics/topic_screen.dart';
import 'topic_registry.dart';
import 'drug_registry.dart';
import '../screens/formulary/drug_screen.dart';
import '../screens/reference/lab_reference_screen.dart';
import '../screens/reference/immunisation_screen.dart';
import '../screens/anatomy/anatomy_screen.dart';
import 'anatomy.dart';
import 'counselling.dart';
import 'trial_registry.dart';
import 'derived_meta.dart';
import 'scores.dart';
import '../screens/hubs/scores_hub.dart' show ScoreScreen;
import '../screens/counselling/counselling_screen.dart';
import '../screens/academics/trial_screen.dart';
import '../screens/algorithms/algorithm_screen.dart';
import 'algorithm_registry.dart';

/// A resolved graph node — what a related link points at.
class ContentLink {
  const ContentLink(this.id, this.title, this.icon, this.builder);
  final String id;
  final String title;
  final IconData icon;

  /// Every node resolves to a screen. Where a subject is covered inside
  /// another topic rather than having its own, the edge points at the topic
  /// that actually carries it — a related link that cannot be opened is a
  /// dead end, not a signpost.
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
    ContentLink('figo-vulva-2021', 'Vulvar carcinoma — FIGO 2021',
        Icons.biotech_outlined, _vulva),
    ContentLink('figo-who-gtn', 'Gestational trophoblastic neoplasia',
        Icons.biotech_outlined, _gtn),
    // Specified but not yet built — the pathway is visible before the node is.
    ContentLink('ctg', 'CTG interpretation', Icons.monitor_heart_outlined, _tCtg),
    ContentLink('pprom', 'PPROM', Icons.article_outlined, _tPprom),
    ContentLink('preterm-labour', 'Preterm labour', Icons.article_outlined,
        _tPreterm),
    ContentLink('vbac', 'VBAC / TOLAC', Icons.article_outlined, _tVbac),
    ContentLink('caesarean', 'Caesarean section', Icons.article_outlined,
        _tCaesarean),
    ContentLink('rh-negative', 'Rh-negative pregnancy', Icons.article_outlined,
        _tRh),
    ContentLink('pcos', 'PCOS', Icons.article_outlined, _tPcos),
    ContentLink('fibroids', 'Fibroids', Icons.article_outlined, _tFibroids),
    ContentLink('endometriosis', 'Endometriosis', Icons.article_outlined,
        _tEndo),
    ContentLink('adenomyosis', 'Adenomyosis', Icons.article_outlined, _tAdeno),
    ContentLink('contraception', 'Contraception', Icons.article_outlined,
        _tContraception),
    ContentLink('menopause', 'Menopause', Icons.article_outlined, _tMenopause),
    ContentLink('urogynaecology', 'Urogynaecology', Icons.article_outlined,
        _tUrogynae),
    ContentLink('infertility', 'Infertility', Icons.article_outlined,
        _tInfertility),
    ContentLink('ohss', 'IVF & OHSS', Icons.article_outlined, _tOhss),
    ContentLink('maternal-medicine', 'Maternal medicine',
        Icons.article_outlined, _tMatMed),
    ContentLink('fetal-medicine', 'Fetal medicine', Icons.article_outlined,
        _tFetMed),
    ContentLink('lab-reference', 'Laboratory reference',
        Icons.science_outlined, _labRef),
    ContentLink('immunisation', 'Maternal immunisation',
        Icons.vaccines_outlined, _immunisation),
    ContentLink('pathology', 'Pathology reference', Icons.article_outlined,
        _tPathology),
    ContentLink('imaging', 'Imaging reference', Icons.article_outlined,
        _tImaging),
    ContentLink('proc-balloon', 'Intrauterine balloon tamponade',
        Icons.medical_services_outlined, _tBalloon),
    ContentLink('proc-iucd', 'IUCD insertion & removal',
        Icons.medical_services_outlined, _tIucd),
    ContentLink('proc-endometrial-biopsy', 'Endometrial sampling',
        Icons.medical_services_outlined, _tBiopsy),
    ContentLink('proc-avd', 'Assisted vaginal delivery',
        Icons.medical_services_outlined, _pAvd),
    ContentLink('proc-perineal-repair', 'Perineal and OASIS repair',
        Icons.medical_services_outlined, _pPerineal),
    ContentLink('proc-manual-removal', 'Manual removal of placenta',
        Icons.medical_services_outlined, _pManual),
    ContentLink('proc-oxytocin', 'Oxytocin infusion',
        Icons.medical_services_outlined, _procOxytocin),
    ContentLink('proc-uterine-exploration', 'Uterine exploration',
        Icons.medical_services_outlined, _procUterineExp),
    ContentLink('proc-vaginal-surgery', 'Vaginal surgery',
        Icons.medical_services_outlined, _procVaginalSurg),
    ContentLink('proc-vaginal-exam', 'Vaginal examination in labour',
        Icons.medical_services_outlined, _pVe),
    ContentLink('proc-pap', 'Cervical screening',
        Icons.medical_services_outlined, _pPap),
    ContentLink('proc-colposcopy', 'Colposcopy',
        Icons.medical_services_outlined, _pColpo),
    ContentLink('proc-hysteroscopy', 'Hysteroscopy',
        Icons.medical_services_outlined, _pHystero),
    ContentLink('proc-laparoscopy', 'Diagnostic laparoscopy',
        Icons.medical_services_outlined, _pLap),
    ContentLink('proc-surgical-miscarriage', 'Surgical management of '
        'miscarriage', Icons.medical_services_outlined, _pMiscarriage),
    ContentLink('proc-implant', 'Contraceptive implant',
        Icons.medical_services_outlined, _pImplant),
    // Surgical anatomy — the pre-scrub lookup.
    ContentLink('anat-ureter', 'Ureter', Icons.account_tree_outlined,
        _anUreter),
    ContentLink('anat-uterine-artery', 'Uterine artery',
        Icons.account_tree_outlined, _anUterine),
    ContentLink('anat-internal-iliac', 'Internal iliac artery',
        Icons.account_tree_outlined, _anIliac),
    ContentLink('anat-abdominal-wall', 'Abdominal wall and port placement',
        Icons.account_tree_outlined, _anWall),
    ContentLink('anat-spaces', 'Pelvic avascular spaces',
        Icons.account_tree_outlined, _anSpaces),
    ContentLink('anat-nerves', 'Pelvic nerves', Icons.account_tree_outlined,
        _anNerves),
    ContentLink('anat-perineum', 'Perineum and anal sphincter',
        Icons.account_tree_outlined, _anPerineum),
    ContentLink('biometry', 'Biometry centiles & growth velocity',
        Icons.straighten_outlined, _biometryS),
    ContentLink('vulval-disorders', 'Vulval disorders',
        Icons.healing_outlined, _vulval),
    ContentLink('aub', 'Abnormal uterine bleeding — PALM-COEIN',
        Icons.female_outlined, _cAub),
    ContentLink('pcos-assessment', 'PCOS assessment', Icons.female_outlined,
        _cPcosAssess),
    ContentLink('adnexal-mass', 'Adnexal mass', Icons.female_outlined,
        _cAdnexal),
    ContentLink('popq', 'POP-Q', Icons.female_outlined, _cPopq),
    ContentLink('meows', 'MEOWS', Icons.rule_outlined, _cMeows),
    ContentLink('epds', 'EPDS', Icons.rule_outlined, _cEpds),
    ContentLink('caprini', 'Caprini score', Icons.rule_outlined, _cCaprini),
    ContentLink('robson', 'Robson classification', Icons.rule_outlined,
        _cRobson),
    ContentLink('quintero', 'Quintero staging', Icons.rule_outlined,
        _cQuintero),
    ContentLink('rasrm', 'rASRM staging', Icons.rule_outlined, _cRasrm),
    ContentLink('mrs', 'Menopause Rating Scale', Icons.rule_outlined, _cMrs),
    ContentLink('ecog', 'ECOG performance status', Icons.rule_outlined,
        _cEcog),
    ContentLink('anaemia', 'Anaemia & iron', Icons.water_drop_outlined,
        _anaemiaS),
    ContentLink('insulin', 'Insulin in pregnancy',
        Icons.medication_outlined, _insulinS),
    ContentLink('anthropometry', 'Maternal anthropometry',
        Icons.straighten_outlined, _anthroS),
    ContentLink('weight-gain', 'Gestational weight gain',
        Icons.monitor_weight_outlined, _weightGainS),
    ContentLink('haemodynamics', 'Obstetric haemodynamics',
        Icons.favorite_outline, _haemoS),
    ContentLink('creatinine', 'Renal function',
        Icons.medical_information_outlined, _creatinineS),
    ContentLink('vte-risk', 'VTE risk', Icons.healing_outlined, _vteS),
    ContentLink('apgar', 'Apgar score', Icons.child_care_outlined, _apgarS),
    ContentLink('induction', 'Induction of labour', Icons.timeline_outlined,
        _tInduction),
    ContentLink('formulary', 'Drug formulary', Icons.medication_outlined,
        _formulary),
    ContentLink('fgr', 'Fetal growth restriction', Icons.trending_down, _tFgr),
  ];

  /// Counselling guides and trials are generated rather than listed, because
  /// they are already registries of their own — duplicating them by hand is
  /// how a graph drifts out of step with its content.
  static final List<ContentLink> _generated = [
    // Every algorithm in the registry gets a node automatically. Adding an
    // algorithm without a node is therefore impossible by construction.
    for (final a in AlgorithmRegistry.all)
      ContentLink(a.id, a.name, Icons.emergency_outlined,
          (_) => AlgorithmScreen(algorithm: a)),
    for (final sc in kScores)
      ContentLink(sc.id, sc.name, Icons.calculate_outlined,
          (_) => ScoreScreen(score: sc)),
    for (final g in kCounsellingGuides)
      ContentLink(g.id, g.title, Icons.record_voice_over_outlined,
          (_) => CounsellingScreen(guide: g)),
    for (final t in TrialRegistry.all)
      ContentLink(t.id, '${t.acronym} · ${t.year}', Icons.science_outlined,
          (_) => TrialScreen(trial: t)),
  ];

  /// Every node in the graph, hand-listed and generated alike.
  static List<ContentLink> get allNodes => [..._nodes, ..._generated];

  static ContentLink? resolve(String id) {
    for (final n in allNodes) {
      if (n.id == id) return n;
    }
    return null;
  }

  static ContentMeta? metaFor(String id) => _meta[id];

  /// Every id carrying a content record. Derived from the map itself so the
  /// governance suite cannot drift out of step with what is actually here.
  static List<String> get allMetaIds => _meta.keys.toList();

  /// Every item flagged under §63 that no clinician has signed off yet.
  static List<ContentMeta> get awaitingReview => _meta.values
      .where((m) => m.awaitingMandatoryReview)
      .toList()
    ..sort((a, b) => a.title.compareTo(b.title));

  static final Map<String, ContentMeta> _meta = {
    ...DerivedMeta.build(),
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
        Related('fgr', 'Indices and centiles for the Doppler studies'),
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
        Related('fgr', 'Umbilical and cerebral Doppler decide timing in FGR'),
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
        Related('algo-eclampsia', 'The algorithm this drug sits inside'),
        Related('algo-severe-htn', 'Magnesium is not an antihypertensive — '
            'severe hypertension needs its own treatment alongside'),
        Related('algo-pph', 'Magnesium relaxes the uterus and raises atony risk'),
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
        Related('algo-pph', 'The full algorithm — 4 Ts, escalation, surgery'),
        Related('lab-reference', 'Transfusion and massive transfusion protocol'),
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
    // ── Tier 1B emergency algorithms (spec §19, §20, §43) ────────────────
    // Every one of these is on the §63 mandatory-review list by definition:
    // they are emergency algorithms carrying drug doses.
    'algo-pph': ContentMeta(
      id: 'algo-pph',
      title: 'Postpartum haemorrhage algorithm',
      category: 'Obstetrics · Emergency',
      sourceOrg: 'WHO / RCOG / ACOG / FOGSI',
      sourceTitle: 'E-MOTIVE trial NEJM 2023; WOMAN trial Lancet 2017; '
          'Green-top 52; Practice Bulletin 183',
      year: 2023,
      evidence: EvidenceLevel.rct,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('pph', 'Shock index and proportion of blood volume lost'),
        Related('mgso4', 'Magnesium relaxes the uterus — it worsens atony'),
        Related('algo-abruption', 'Abruption causes both the bleeding and the '
            'coagulopathy'),
        Related('lab-reference', 'Massive transfusion ratios and targets'),
      ],
    ),
    'algo-abruption': ContentMeta(
      id: 'algo-abruption',
      title: 'Placental abruption algorithm',
      category: 'Obstetrics · Emergency',
      sourceOrg: 'RCOG / FOGSI',
      sourceTitle: 'Green-top Guideline 63 — Antepartum Haemorrhage',
      year: 2011,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-pph', 'Atony plus coagulopathy makes PPH near-inevitable'),
        Related('algo-severe-htn', 'Pre-eclampsia is a leading risk factor'),
        Related('pph', 'Quantify the loss you cannot see'),
      ],
    ),
    'algo-uterine-rupture': ContentMeta(
      id: 'algo-uterine-rupture',
      title: 'Uterine rupture algorithm',
      category: 'Obstetrics · Emergency',
      sourceOrg: 'RCOG / ACOG / FOGSI',
      sourceTitle: 'Green-top Guideline 45 — Birth After Previous Caesarean '
          'Birth; Practice Bulletin 205',
      year: 2015,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('bishop', 'Induction of a scarred uterus is the modifiable '
            'risk factor'),
        Related('ctg', 'An abnormal trace is the earliest sign'),
        Related('algo-pph', 'Haemorrhage control after delivery'),
      ],
    ),
    'algo-eclampsia': ContentMeta(
      id: 'algo-eclampsia',
      title: 'Eclampsia algorithm',
      category: 'Obstetrics · Emergency',
      sourceOrg: 'RCOG / NICE / WHO / FOGSI',
      sourceTitle: 'Magpie Trial Lancet 2002; Green-top 10(A); NICE NG133',
      year: 2002,
      evidence: EvidenceLevel.rct,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('mgso4', 'Regimens, monitoring and the toxicity ladder'),
        Related('algo-severe-htn', 'Magnesium stops the fits; it does not '
            'lower the pressure'),
        Related('algo-maternal-collapse', 'Where the seizure does not stop or '
            'she does not wake'),
      ],
    ),
    'algo-severe-htn': ContentMeta(
      id: 'algo-severe-htn',
      title: 'Severe hypertension algorithm',
      category: 'Obstetrics · Emergency',
      sourceOrg: 'NICE / ACOG / RCOG',
      sourceTitle: 'NICE NG133; ACOG Practice Bulletin 222 and Committee '
          'Opinion 767',
      year: 2019,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('mgso4', 'When seizure prophylaxis is indicated alongside'),
        Related('algo-eclampsia', 'What this is trying to prevent'),
        Related('dating', 'Delivery thresholds are gestation-dependent'),
      ],
    ),
    'algo-maternal-collapse': ContentMeta(
      id: 'algo-maternal-collapse',
      title: 'Maternal collapse algorithm',
      category: 'Obstetrics · Emergency',
      sourceOrg: 'Resuscitation Council UK / AHA / RCOG',
      sourceTitle: 'Cardiac Arrest in Pregnancy, Circulation 2015;132:1747; '
          'Green-top Guideline 56',
      year: 2015,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-afe', 'A leading cause, and the hardest to recognise'),
        Related('algo-pph', 'Haemorrhage is the commonest cause of all'),
        Related('algo-eclampsia', 'Seizure and intracranial haemorrhage'),
        Related('mgso4', 'Magnesium toxicity is a reversible cause — calcium '
            'gluconate is the antidote'),
      ],
    ),
    'algo-afe': ContentMeta(
      id: 'algo-afe',
      title: 'Amniotic fluid embolism algorithm',
      category: 'Obstetrics · Emergency',
      sourceOrg: 'SMFM / RCOG',
      sourceTitle: 'SMFM Clinical Guideline 9, Am J Obstet Gynecol '
          '2016;215:B16; Green-top Guideline 56',
      year: 2016,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-maternal-collapse', 'The resuscitation this sits inside'),
        Related('algo-pph', 'The coagulopathy presents as unstoppable bleeding'),
        Related('lab-reference', 'Empirical 1:1:1 before the results return'),
      ],
    ),
    'algo-sepsis': ContentMeta(
      id: 'algo-sepsis',
      title: 'Obstetric sepsis algorithm',
      category: 'Obstetrics · Emergency',
      sourceOrg: 'RCOG / NICE / Surviving Sepsis Campaign',
      sourceTitle: 'Green-top Guideline 64, BJOG 2025; NICE NG51; Surviving '
          'Sepsis Campaign 2021',
      year: 2021,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-maternal-collapse', 'Where septic shock becomes arrest'),
        Related('algo-pph', 'Sepsis and haemorrhage look alike early, and '
            'often coexist'),
      ],
    ),
    'algo-shoulder-dystocia': ContentMeta(
      id: 'algo-shoulder-dystocia',
      title: 'Shoulder dystocia algorithm',
      category: 'Obstetrics · Emergency',
      sourceOrg: 'RCOG / ACOG',
      sourceTitle: 'Green-top Guideline 42; ACOG Practice Bulletin 178',
      year: 2012,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('efw', 'Macrosomia raises the risk, though most cases occur in '
            'normally grown babies'),
        Related('gdm', 'Diabetes is the strongest modifiable risk factor'),
        Related('algo-pph', 'Haemorrhage after dystocia should be anticipated, '
            'not awaited'),
      ],
    ),
    'algo-cord-prolapse': ContentMeta(
      id: 'algo-cord-prolapse',
      title: 'Cord prolapse algorithm',
      category: 'Obstetrics · Emergency',
      sourceOrg: 'RCOG',
      sourceTitle: 'Green-top Guideline 50 — Umbilical Cord Prolapse',
      year: 2014,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('ctg', 'Sudden bradycardia after membrane rupture is the '
            'presentation'),
        Related('algo-uterine-rupture', 'The other cause of abrupt, '
            'unexplained bradycardia'),
      ],
    ),
    'algo-ectopic': ContentMeta(
      id: 'algo-ectopic',
      title: 'Ectopic pregnancy algorithm',
      category: 'Gynaecology · Emergency',
      sourceOrg: 'NICE / RCOG / ACOG',
      sourceTitle: 'NICE NG126; Green-top Guideline 21; ACOG Practice '
          'Bulletin 193',
      year: 2019,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-ovarian-torsion', 'The other diagnosis behind sudden '
            'unilateral pelvic pain'),
        Related('usg', 'Transvaginal findings and the discriminatory zone'),
        Related('dating', 'Where an intrauterine pregnancy is confirmed instead'),
      ],
    ),
    'algo-ovarian-torsion': ContentMeta(
      id: 'algo-ovarian-torsion',
      title: 'Ovarian torsion algorithm',
      category: 'Gynaecology · Emergency',
      sourceOrg: 'RCOG / ACOG',
      sourceTitle: 'Green-top Guideline 62; ACOG Committee Opinion 783',
      year: 2019,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-ectopic', 'Exclude it first — the pregnancy test comes '
            'before the scan'),
        Related('usg', 'The scan findings, and why normal Doppler proves '
            'nothing'),
      ],
    ),
    'algo-ruptured-cyst': ContentMeta(
      id: 'algo-ruptured-cyst',
      title: 'Ruptured ovarian cyst algorithm',
      category: 'Gynaecology · Emergency',
      sourceOrg: 'RCOG / ACOG',
      sourceTitle: 'Green-top Guidelines 62 and 34; ACOG Practice Bulletin '
          '174',
      year: 2016,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-ectopic', 'The diagnosis it is mistaken for, in the '
            'direction that kills'),
        Related('algo-pelvic-pain', 'The wider differential this sits in'),
        Related('adnexal-mass', 'Assessing the mass that remains afterwards'),
      ],
    ),
    'algo-septic-abortion': ContentMeta(
      id: 'algo-septic-abortion',
      title: 'Septic abortion algorithm',
      category: 'Obstetrics · Early pregnancy',
      sourceOrg: 'WHO / RCOG / MoHFW',
      sourceTitle: 'WHO Abortion Care Guideline 2022; Green-top Guideline '
          '64; MoHFW Comprehensive Abortion Care guidelines',
      year: 2022,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-miscarriage', 'The same evacuation, without the '
            'sepsis'),
        Related('algo-sepsis', 'The resuscitation this runs on'),
        Related('mtp-act', 'The legal route that prevents this presentation'),
        Related('proc-uterine-exploration', 'How the source control is '
            'performed'),
      ],
    ),
    'algo-pelvic-sepsis': ContentMeta(
      id: 'algo-pelvic-sepsis',
      title: 'Pelvic inflammatory disease and tubo-ovarian abscess algorithm',
      category: 'Gynaecology · Emergency',
      sourceOrg: 'RCOG / BASHH / NACO',
      sourceTitle: 'Green-top Guideline 32; BASHH PID guideline; NACO '
          'National RTI/STI Guidelines',
      year: 2019,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-pelvic-pain', 'Where this sits in the differential'),
        Related('infertility', 'The consequence that makes early treatment '
            'worth the overtreatment'),
        Related('algo-ectopic', 'The other consequence of tubal damage'),
      ],
    ),
    'algo-bartholin': ContentMeta(
      id: 'algo-bartholin',
      title: 'Bartholin abscess algorithm',
      category: 'Gynaecology · Emergency',
      sourceOrg: 'RCOG / ACOG',
      sourceTitle: 'Green-top Guideline 58; ACOG Practice Bulletin 224',
      year: 2022,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(18),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('vulval-disorders', 'The rest of the vulval differential'),
        Related('anat-perineum', 'Where the gland sits, and why the incision '
            'goes inside the hymenal ring'),
        Related('figo-vulva-2021', 'What a biopsy showing carcinoma leads '
            'to'),
      ],
    ),
    'algo-vaginal-foreign-body': ContentMeta(
      id: 'algo-vaginal-foreign-body',
      title: 'Vaginal foreign body algorithm',
      category: 'Gynaecology · Emergency',
      sourceOrg: 'RCOG / BritSPAG / MoHFW',
      sourceTitle: 'RCOG paediatric and adolescent gynaecology guidance; '
          'BritSPAG guidance; MoHFW medico-legal care protocols',
      year: 2021,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(18),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('vulval-disorders', 'The discharge differential it hides '
            'inside'),
        Related('pcpndt-act', 'The other place where a statutory duty sits '
            'inside a clinical encounter'),
        Related('popq', 'Pessary review, where the retained object is one we '
            'placed'),
      ],
    ),
    'algo-urinary-retention': ContentMeta(
      id: 'algo-urinary-retention',
      title: 'Acute urinary retention algorithm',
      category: 'Gynaecology · Emergency',
      sourceOrg: 'NICE / RCOG / EAU',
      sourceTitle: 'NICE NG123; RCOG postpartum bladder care guidance; EAU '
          'guidelines on female LUTS',
      year: 2019,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(18),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('urogynaecology', 'The bladder in the rest of its life'),
        Related('score-iciq-ui', 'Measuring the symptoms that follow'),
        Related('proc-vaginal-surgery', 'Where obstruction after continence '
            'surgery comes from'),
      ],
    ),
    'algo-postop-haemorrhage': ContentMeta(
      id: 'algo-postop-haemorrhage',
      title: 'Postoperative haemorrhage algorithm',
      category: 'Gynaecology · Emergency',
      sourceOrg: 'RCOG / BSH / NICE',
      sourceTitle: 'Green-top Guideline 47; BSH major haemorrhage guideline; '
          'NICE NG24',
      year: 2015,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-pph', 'The same physiology, a different operation'),
        Related('proc-vaginal-surgery', 'The pedicles that slip'),
        Related('anat-internal-iliac', 'The vessel behind a retroperitoneal '
            'bleed'),
        Related('proc-laparoscopy', 'Port-site and epigastric vessel injury'),
      ],
    ),
    'biometry': ContentMeta(
      id: 'biometry',
      title: 'Biometry centiles and growth velocity',
      category: 'Obstetrics · Fetal growth',
      sourceOrg: 'Hadlock / INTERGROWTH-21st',
      sourceTitle: 'Hadlock biometry references 1982; INTERGROWTH-21st fetal '
          'and newborn standards, Lancet 2014',
      year: 2014,
      evidence: EvidenceLevel.observational,
      created: _built,
      nextReview: _review(18),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('efw', 'The weight this breaks apart into its components'),
        Related('algo-fgr', 'What a falling AC centile leads to'),
        Related('fgr', 'Why the trajectory matters more than the value'),
        Related('usg', 'How the measurements are taken'),
      ],
    ),
    'vulval-disorders': ContentMeta(
      id: 'vulval-disorders',
      title: 'Vulval disorders',
      category: 'Gynaecology',
      sourceOrg: 'BAD / BSSVD / RCOG',
      sourceTitle: 'BAD lichen sclerosus guideline 2018; Green-top Guideline '
          '58; BSSVD guidance',
      year: 2018,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(18),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('figo-vulva-2021', 'Where a biopsy that shows invasion goes '
            'next'),
        Related('algo-pelvic-pain', 'Vulvodynia sits in the same differential '
            'as chronic pelvic pain'),
        Related('menopause', 'Atrophy is the differential that is treated '
            'instead, wrongly'),
        Related('anat-perineum', 'The anatomy the architectural changes '
            'destroy'),
      ],
    ),
    'proc-oxytocin': ContentMeta(
      id: 'proc-oxytocin',
      title: 'Oxytocin infusion',
      category: 'Obstetrics · Procedure',
      sourceOrg: 'NICE / RCOG / WHO',
      sourceTitle: 'NICE NG235 and NG207; Green-top Guideline 45',
      year: 2023,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-ctg', 'The trace that must stop the infusion'),
        Related('algo-uterine-rupture', 'The complication oxytocin causes in '
            'a scarred uterus'),
        Related('induction', 'The pathway this usually follows'),
        Related('proc-vaginal-exam', 'The examination that must precede it'),
      ],
    ),
    'proc-uterine-exploration': ContentMeta(
      id: 'proc-uterine-exploration',
      title: 'Uterine exploration',
      category: 'Obstetrics · Procedure',
      sourceOrg: 'RCOG / WHO',
      sourceTitle: 'Green-top Guidelines 52 and 27a; WHO PPH recommendations',
      year: 2016,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-pph', 'The bleeding that brings you here'),
        Related('proc-manual-removal', 'The step that usually precedes it'),
        Related('figo-who-gtn', 'Why the tissue always goes to histology'),
      ],
    ),
    'proc-vaginal-surgery': ContentMeta(
      id: 'proc-vaginal-surgery',
      title: 'Vaginal surgery',
      category: 'Gynaecology · Procedure',
      sourceOrg: 'NICE / RCOG / AAGL',
      sourceTitle: 'NICE NG123; RCOG consent advice; AAGL position statement '
          'on route of hysterectomy',
      year: 2019,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('popq', 'The staging that decides what to repair'),
        Related('anat-ureter', 'The structure closest to the uterine '
            'pedicle'),
        Related('urogynaecology', 'Continence, which prolapse surgery can '
            'unmask'),
        Related('anat-perineum', 'The support being reconstructed'),
      ],
    ),
    // ── Tier 1B/2 algorithms added to complete spec §52 ──────────────────
    'algo-rfm': ContentMeta(
      id: 'algo-rfm',
      title: 'Reduced fetal movements algorithm',
      category: 'Obstetrics · Antenatal',
      sourceOrg: 'RCOG / NHS England',
      sourceTitle: "Green-top Guideline 57; Saving Babies' Lives Care Bundle",
      year: 2011,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-fgr', 'The commonest pathology found behind reduced '
            'movements'),
        Related('algo-ctg', 'What to do when the trace taken for reduced '
            'movements is abnormal'),
        Related('ctg', 'How to read the trace you have just taken'),
        Related('usg', 'Growth, liquor and Doppler within 24 hours'),
      ],
    ),
    'algo-ctg': ContentMeta(
      id: 'algo-ctg',
      title: 'Non-reassuring CTG algorithm',
      category: 'Obstetrics · Intrapartum',
      sourceOrg: 'NICE / FIGO',
      sourceTitle: 'NICE NG229; FIGO consensus guidelines on intrapartum '
          'fetal monitoring',
      year: 2022,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('ctg', 'The classification this algorithm acts on'),
        Related('algo-cord-prolapse', 'Excluded by vaginal examination before '
            'anything else'),
        Related('algo-uterine-rupture', 'The cause you must not treat as a '
            'simple bradycardia'),
        Related('algo-abruption', 'Pain and a tonic uterus alongside the '
            'trace'),
        Related('proc-avd', 'The delivery route when the cervix is fully '
            'dilated'),
      ],
    ),
    'algo-pprom': ContentMeta(
      id: 'algo-pprom',
      title: 'PPROM algorithm',
      category: 'Obstetrics · Antenatal',
      sourceOrg: 'RCOG / NICE',
      sourceTitle: 'Green-top Guideline 73; NICE NG25',
      year: 2019,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('pprom', 'The condition in full, beyond the acute pathway'),
        Related('algo-preterm-labour', 'Steroids, magnesium and transfer are '
            'shared between the two'),
        Related('algo-sepsis', 'Chorioamnionitis is the complication that '
            'forces delivery'),
      ],
    ),
    'algo-fgr': ContentMeta(
      id: 'algo-fgr',
      title: 'Fetal growth restriction algorithm',
      category: 'Obstetrics · Antenatal',
      sourceOrg: 'RCOG / ISUOG',
      sourceTitle: 'Green-top Guideline 31; Delphi consensus definition; '
          'ISUOG Practice Guidelines',
      year: 2016,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('fgr', 'The condition in full, beyond surveillance and '
            'timing'),
        Related('efw', 'The weight and centile this pathway is built on'),
        Related('algo-rfm', 'How growth restriction most often announces '
            'itself'),
        Related('usg', 'Doppler technique and interpretation'),
      ],
    ),
    'algo-preterm-labour': ContentMeta(
      id: 'algo-preterm-labour',
      title: 'Preterm labour algorithm',
      category: 'Obstetrics · Antenatal',
      sourceOrg: 'NICE / RCOG',
      sourceTitle: 'NICE NG25; Green-top Guideline 1B',
      year: 2022,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('preterm-labour', 'The condition in full, including '
            'prevention'),
        Related('algo-pprom', 'The same pathway once membranes have ruptured'),
        Related('formulary', 'Betamethasone, dexamethasone, nifedipine and '
            'magnesium doses'),
      ],
    ),
    'algo-miscarriage': ContentMeta(
      id: 'algo-miscarriage',
      title: 'Miscarriage algorithm',
      category: 'Obstetrics · Early pregnancy',
      sourceOrg: 'NICE / RCOG',
      sourceTitle: 'NICE NG126; Green-top Guideline 17',
      year: 2021,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-ectopic', 'Excluded before any bleeding is called a '
            'miscarriage'),
        Related('proc-surgical-miscarriage', 'How the evacuation is actually '
            'done'),
        Related('rh-negative', 'Anti-D after surgical management'),
        Related('mtp-act', 'The legal frame around evacuation in India'),
      ],
    ),
    'algo-pelvic-pain': ContentMeta(
      id: 'algo-pelvic-pain',
      title: 'Acute pelvic pain algorithm',
      category: 'Gynaecology · Emergency',
      sourceOrg: 'RCOG / NICE',
      sourceTitle: 'Green-top Guidelines 62 and 32; NICE CG154',
      year: 2019,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-ectopic', 'The diagnosis the pregnancy test is looking '
            'for'),
        Related('algo-ovarian-torsion', 'The diagnosis that costs an ovary if '
            'it waits'),
        Related('algo-ohss', 'Where the pain follows recent ovulation '
            'induction'),
        Related('endometriosis', 'The commonest cause of pain that recurs '
            'cyclically'),
      ],
    ),
    'algo-aub': ContentMeta(
      id: 'algo-aub',
      title: 'Heavy or abnormal uterine bleeding algorithm',
      category: 'Gynaecology · Emergency',
      sourceOrg: 'NICE / FIGO',
      sourceTitle: 'NICE NG88; FIGO PALM-COEIN classification',
      year: 2018,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('aub', 'The condition in full, beyond acute control'),
        Related('algo-pmb', 'The same symptom after the menopause, where the '
            'threshold for cancer changes'),
        Related('fibroids', 'The commonest structural cause'),
        Related('anaemia', 'What the bleeding has usually already caused'),
        Related('proc-endometrial-biopsy', 'How the sample is taken'),
      ],
    ),
    'algo-pmb': ContentMeta(
      id: 'algo-pmb',
      title: 'Postmenopausal bleeding algorithm',
      category: 'Gynaecology · Emergency',
      sourceOrg: 'RCOG / BSGE / NICE',
      sourceTitle: 'Green-top Guideline 67; NICE NG12',
      year: 2016,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('figo-endometrium-2023', 'How a positive histology is then '
            'staged'),
        Related('proc-hysteroscopy', 'Required whatever the thickness when '
            'bleeding recurs'),
        Related('proc-endometrial-biopsy', 'The first-line sample'),
        Related('menopause', 'Unscheduled bleeding on hormone therapy counts '
            'as postmenopausal bleeding'),
      ],
    ),
    'algo-ohss': ContentMeta(
      id: 'algo-ohss',
      title: 'Ovarian hyperstimulation syndrome algorithm',
      category: 'Gynaecology · Emergency',
      sourceOrg: 'RCOG / ESHRE / ICMR',
      sourceTitle: 'Green-top Guideline 5; ESHRE ovarian stimulation '
          'guideline; ICMR ART guidelines',
      year: 2016,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('ohss', 'The condition in full, including prediction'),
        Related('algo-ovarian-torsion', 'Enlarged stimulated ovaries torse'),
        Related('vte-risk', 'Why every inpatient gets heparin'),
        Related('infertility', 'The treatment that caused it'),
      ],
    ),
    // ── Tier 1A calculators (spec §4, §5, §8, §9, §12, §24) ──────────────
    'anthropometry': ContentMeta(
      id: 'anthropometry',
      title: 'Maternal anthropometry',
      category: 'Obstetrics · Anthropometry',
      sourceOrg: 'WHO / ICMR',
      sourceTitle: 'WHO Technical Report 894; WHO Expert Consultation on '
          'Asian BMI, Lancet 2004;363:157; Mosteller NEJM 1987; Devine 1974',
      year: 2004,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('weight-gain', 'Pre-pregnancy BMI sets the gain target'),
        Related('vte-risk', 'BMI 30 scores 1 and BMI 40 scores 2'),
        Related('gdm', 'Raised BMI is a leading risk factor for GDM'),
      ],
    ),
    'weight-gain': ContentMeta(
      id: 'weight-gain',
      title: 'Gestational weight gain',
      category: 'Obstetrics · Anthropometry',
      sourceOrg: 'Institute of Medicine',
      sourceTitle: 'Weight Gain During Pregnancy: Reexamining the Guidelines',
      year: 2009,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('anthropometry', 'Where the pre-pregnancy BMI comes from'),
        Related('efw', 'Poor gain and fetal growth restriction travel together'),
        Related('gdm', 'Excessive gain raises the risk of GDM and macrosomia'),
      ],
    ),
    'haemodynamics': ContentMeta(
      id: 'haemodynamics',
      title: 'Obstetric haemodynamics',
      category: 'Obstetrics · Haemodynamics',
      sourceOrg: 'RCOG / BJOG',
      sourceTitle: 'Nathan HL et al. Shock index in postpartum haemorrhage, '
          'BJOG 2015;122:268; Le Bas A et al. Int J Gynecol Obstet 2014',
      year: 2015,
      evidence: EvidenceLevel.observational,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('algo-pph', 'Where a rising shock index should take you'),
        Related('algo-severe-htn', 'When the pressure is the problem rather '
            'than the perfusion'),
        Related('pph', 'Blood loss against estimated blood volume'),
      ],
    ),
    'anaemia': ContentMeta(
      id: 'anaemia',
      title: 'Anaemia & iron',
      category: 'Obstetrics · Haematology',
      sourceOrg: 'WHO / Anemia Mukt Bharat / FOGSI',
      sourceTitle: 'WHO haemoglobin thresholds WHO/NMH/NHD/MNM/11.1; Anemia '
          'Mukt Bharat Operational Guidelines; Ganzoni 1970',
      year: 2018,
      evidence: EvidenceLevel.nationalGuideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-pph', 'Antenatal anaemia is what makes a survivable '
            'loss fatal'),
        Related('pph', 'Blood volume and proportion lost'),
        Related('lab-reference', 'When iron is too slow and she needs blood'),
      ],
    ),
    'insulin': ContentMeta(
      id: 'insulin',
      title: 'Insulin in pregnancy',
      category: 'Obstetrics · Diabetes',
      sourceOrg: 'NICE / ACOG / ADA',
      sourceTitle: 'NICE NG3; ACOG Practice Bulletins 190 and 201; ADA '
          'Standards of Care',
      year: 2020,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('gdm', 'The diagnosis that brings her here'),
        Related('efw', 'Serial growth scans for macrosomia'),
        Related('algo-shoulder-dystocia', 'What poor control risks at delivery'),
      ],
    ),
    'creatinine': ContentMeta(
      id: 'creatinine',
      title: 'Renal function in pregnancy',
      category: 'Obstetrics · Maternal medicine',
      sourceOrg: 'Cockcroft & Gault / CKD-EPI / RCOG',
      sourceTitle: 'Nephron 1976;16:31; Inker LA et al. NEJM 2021;385:1737; '
          'Wiles K et al. BMC Nephrol 2019;20:401',
      year: 2021,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('algo-severe-htn', 'A rising creatinine is a severe feature'),
        Related('mgso4', 'Magnesium is cleared entirely by the kidney — '
            'impairment changes the maintenance dose'),
      ],
    ),
    'vte-risk': ContentMeta(
      id: 'vte-risk',
      title: 'VTE risk assessment',
      category: 'Obstetrics · Thromboprophylaxis',
      sourceOrg: 'RCOG',
      sourceTitle: 'Green-top Guideline 37a — Reducing the Risk of Venous '
          'Thromboembolism during Pregnancy and the Puerperium',
      year: 2015,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('anthropometry', 'BMI contributes 1 or 2 points'),
        Related('algo-pph', 'Haemorrhage and transfusion each add a point, and '
            'she needs prophylaxis once bleeding stops'),
      ],
    ),
    'apgar': ContentMeta(
      id: 'apgar',
      title: 'Apgar score',
      category: 'Neonatal',
      sourceOrg: 'ACOG / AAP',
      sourceTitle: 'Committee Opinion 644 — The Apgar Score; Apgar V, Curr '
          'Res Anesth Analg 1953;32:260',
      year: 2015,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('algo-shoulder-dystocia', 'Where the neonatal assessment '
            'after a difficult birth belongs'),
        Related('algo-cord-prolapse', 'Cord gases and encephalopathy '
            'assessment after acute hypoxia'),
      ],
    ),
    // ── Tier 1C reference topics (spec §10, §13, §17, §23, §26–28) ───────
    'ctg': ContentMeta(
      id: 'ctg',
      title: 'CTG interpretation',
      category: 'Obstetrics · Fetal monitoring',
      sourceOrg: 'NICE / FIGO',
      sourceTitle: 'NICE NG229 Fetal monitoring in labour; FIGO consensus '
          'guidelines on intrapartum fetal monitoring, Int J Gynecol Obstet '
          '2015;131:13',
      year: 2022,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-cord-prolapse', 'Sudden bradycardia after membrane '
            'rupture'),
        Related('algo-uterine-rupture', 'The other cause of abrupt, '
            'unexplained bradycardia'),
        Related('fgr', 'Where a suspicious trace and a small fetus meet'),
        Related('induction', 'Continuous monitoring is mandatory once '
            'oxytocin is running'),
      ],
    ),
    'fgr': ContentMeta(
      id: 'fgr',
      title: 'Fetal growth restriction',
      category: 'Obstetrics · Fetal growth',
      sourceOrg: 'RCOG / ISUOG',
      sourceTitle: 'Green-top Guideline 31; Gordijn SJ et al. Delphi consensus '
          'definition, UOG 2016;48:333; TRUFFLE, Lancet 2015;385:2162',
      year: 2016,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      related: [
        Related('efw', 'The measurement that starts the conversation'),
        Related('fgr', 'The indices that decide when to deliver'),
        Related('preterm-labour', 'Steroids and neuroprotection before an '
            'early delivery'),
        Related('ctg', 'Surveillance while she is monitored'),
      ],
    ),
    'pprom': ContentMeta(
      id: 'pprom',
      title: 'Preterm prelabour rupture of membranes',
      category: 'Obstetrics · Preterm birth',
      sourceOrg: 'RCOG / NICE',
      sourceTitle: 'Green-top Guideline 73; NICE NG25; ORACLE I, Lancet '
          '2001;357:979; PPROMT, Lancet 2016;387:444',
      year: 2019,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('preterm-labour', 'Steroids, neuroprotection and transfer'),
        Related('algo-sepsis', 'Where chorioamnionitis becomes maternal sepsis'),
        Related('algo-cord-prolapse', 'A high presenting part with ruptured '
            'membranes'),
      ],
    ),
    'preterm-labour': ContentMeta(
      id: 'preterm-labour',
      title: 'Preterm labour',
      category: 'Obstetrics · Preterm birth',
      sourceOrg: 'NICE / RCOG',
      sourceTitle: 'NICE NG25; Green-top 1B; ORACLE II, Lancet 2001;357:989 '
          'and 7-year follow-up 2008;372:1319',
      year: 2019,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('mgso4', 'Neuroprotection uses a different regimen from '
            'eclampsia prophylaxis'),
        Related('pprom', 'The commonest antecedent'),
        Related('fgr', 'Where prematurity is iatrogenic and planned'),
      ],
    ),
    'induction': ContentMeta(
      id: 'induction',
      title: 'Induction of labour',
      category: 'Obstetrics · Labour',
      sourceOrg: 'NICE / ACOG / WHO',
      sourceTitle: 'NICE NG207; ACOG Practice Bulletin 107; ARRIVE trial, '
          'NEJM 2018;379:513',
      year: 2021,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('bishop', 'The score that chooses the method'),
        Related('vbac', 'Induction of a scarred uterus changes the rules'),
        Related('ctg', 'Continuous monitoring once oxytocin is running'),
        Related('algo-pph', 'A long induction fatigues the myometrium'),
      ],
    ),
    'vbac': ContentMeta(
      id: 'vbac',
      title: 'VBAC / TOLAC',
      category: 'Obstetrics · Labour',
      sourceOrg: 'RCOG / ACOG',
      sourceTitle: 'Green-top Guideline 45; ACOG Practice Bulletin 205; '
          'Landon MB et al. NEJM 2004;351:2581',
      year: 2015,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      related: [
        Related('algo-uterine-rupture', 'The risk that governs the whole '
            'discussion'),
        Related('induction', 'Mechanical methods only, and no prostaglandins'),
        Related('caesarean', 'The alternative she is choosing between'),
        Related('ctg', 'Continuous monitoring is mandatory'),
      ],
    ),
    'caesarean': ContentMeta(
      id: 'caesarean',
      title: 'Caesarean section',
      category: 'Obstetrics · Operative',
      sourceOrg: 'NICE / RCOG / ACOG',
      sourceTitle: 'NICE NG192; Green-top 27a; CORONIS, Lancet 2013;382:234; '
          'Robson classification',
      year: 2021,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('vte-risk', 'Every caesarean scores, and needs prophylaxis'),
        Related('vbac', 'What a repeat caesarean is weighed against'),
        Related('algo-pph', 'Haemorrhage is the commonest complication'),
        Related('algo-uterine-rupture', 'The scar this operation leaves'),
      ],
    ),
    'rh-negative': ContentMeta(
      id: 'rh-negative',
      title: 'Rh-negative pregnancy',
      category: 'Obstetrics · Immunology',
      sourceOrg: 'RCOG / NICE',
      sourceTitle: 'Green-top Guidelines 22 and 65; NICE TA156; Mari G et al. '
          'NEJM 2000;342:9',
      year: 2014,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-abruption', 'A sensitising event needing a Kleihauer'),
        Related('algo-ectopic', 'Anti-D is required after surgical management'),
        Related('fgr', 'MCA peak systolic velocity for fetal anaemia'),
        Related('ctg', 'A sinusoidal trace means fetal anaemia until proven '
            'otherwise'),
      ],
    ),
    // ── Tier 2 gynaecology (spec §32–35, §38–40) ─────────────────────────
    'pcos': ContentMeta(
      id: 'pcos',
      title: 'PCOS',
      category: 'Gynaecology · Reproductive endocrine',
      sourceOrg: 'International PCOS Network / ESHRE / ASRM',
      sourceTitle: 'International Evidence-Based Guideline for the Assessment '
          'and Management of PCOS 2023; Legro RS et al. NEJM 2014;371:119',
      year: 2023,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('anthropometry', 'BMI and South Asian waist thresholds drive '
            'the metabolic assessment'),
        Related('gdm', 'Screen every pregnancy, early and again at 24–28 weeks'),
        Related('infertility', 'Ovulation induction pathway'),
        Related('pathology', 'Chronic anovulation means unopposed oestrogen'),
      ],
    ),
    'fibroids': ContentMeta(
      id: 'fibroids',
      title: 'Fibroids',
      category: 'Gynaecology · Structural',
      sourceOrg: 'FIGO / NICE / ACOG',
      sourceTitle: 'Munro MG et al. FIGO leiomyoma subclassification, Int J '
          'Gynecol Obstet 2011;113:3; NICE NG88; ACOG Practice Bulletin 228',
      year: 2011,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('adenomyosis', 'The diagnosis most often confused with this '
            'one on ultrasound'),
        Related('aub', 'Where fibroids sit in the PALM-COEIN system'),
        Related('anaemia', 'Heavy bleeding is why she is anaemic'),
      ],
    ),
    'endometriosis': ContentMeta(
      id: 'endometriosis',
      title: 'Endometriosis',
      category: 'Gynaecology · Structural',
      sourceOrg: 'ESHRE / NICE',
      sourceTitle: 'ESHRE Endometriosis Guideline 2022; NICE NG73',
      year: 2022,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('adenomyosis', 'The two coexist often enough to look for both'),
        Related('infertility', 'Endometriosis Fertility Index and ART'),
        Related('infertility', 'Cystectomy costs ovarian cortex'),
      ],
    ),
    'adenomyosis': ContentMeta(
      id: 'adenomyosis',
      title: 'Adenomyosis',
      category: 'Gynaecology · Structural',
      sourceOrg: 'MUSA consensus / NICE',
      sourceTitle: 'Van den Bosch T et al. MUSA consensus, Ultrasound Obstet '
          'Gynecol 2015;46:284; NICE NG88',
      year: 2015,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('fibroids', 'Telling the two apart changes the operation'),
        Related('endometriosis', 'Frequently coexist'),
        Related('aub', 'A common cause of heavy menstrual bleeding'),
      ],
    ),
    'contraception': ContentMeta(
      id: 'contraception',
      title: 'Contraception',
      category: 'Gynaecology · Family planning',
      sourceOrg: 'WHO / FSRH / MoHFW Government of India',
      sourceTitle: 'WHO Medical Eligibility Criteria 5th edition; FSRH '
          'guidance; Antara and Chhaya programme guidelines',
      year: 2015,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('menopause', 'Contraception is still needed through the '
            'perimenopause'),
        Related('pcos', 'The combined pill does double duty for cycle control '
            'and hyperandrogenism'),
        Related('vte-risk', 'Oestrogen and thrombosis risk'),
      ],
    ),
    'menopause': ContentMeta(
      id: 'menopause',
      title: 'Menopause',
      category: 'Gynaecology · Midlife health',
      sourceOrg: 'NICE / BMS / NAMS',
      sourceTitle: 'NICE NG23; British Menopause Society consensus statements; '
          'NAMS 2022 Hormone Therapy Position Statement; ESHRE POI guideline',
      year: 2022,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('urogynaecology', 'Vaginal oestrogen treats urgency and '
            'recurrent infection as well as dryness'),
        Related('contraception', 'Still required until 12 months of '
            'amenorrhoea over 50, or 24 months under 50'),
        Related('vte-risk', 'Why transdermal is preferred where risk exists'),
      ],
    ),
    'urogynaecology': ContentMeta(
      id: 'urogynaecology',
      title: 'Urogynaecology',
      category: 'Gynaecology · Urogynaecology',
      sourceOrg: 'NICE / IUGA / ICS / WHO',
      sourceTitle: 'NICE NG123; Bump RC et al. POP-Q, Am J Obstet Gynecol '
          '1996;175:10; WHO obstetric fistula guiding principles',
      year: 2019,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('menopause', 'Vaginal oestrogen underpins much of this'),
        Related('caesarean', 'Timely operative delivery is what prevents '
            'obstetric fistula'),
      ],
    ),
    'pcos-assessment': ContentMeta(
      id: 'pcos-assessment',
      title: 'PCOS assessment — Ferriman-Gallwey & HOMA-IR',
      category: 'Gynaecology · Reproductive endocrine',
      sourceOrg: 'International PCOS Network',
      sourceTitle: 'Ferriman D, Gallwey JD. J Clin Endocrinol Metab '
          '1961;21:1440; Matthews DR et al. Diabetologia 1985;28:412; '
          'International PCOS Guideline 2023',
      year: 2023,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('pcos', 'The diagnostic criteria these scores feed'),
        Related('anthropometry', 'BMI and waist circumference complete the '
            'metabolic picture'),
        Related('gdm', 'An OGTT, not HOMA-IR, is what the guideline asks for'),
      ],
    ),
    'adnexal-mass': ContentMeta(
      id: 'adnexal-mass',
      title: 'Adnexal mass risk assessment',
      category: 'Gynaecology · Oncology',
      sourceOrg: 'RCOG / IOTA / ACR',
      sourceTitle: 'Jacobs I et al. RMI, BJOG 1990;97:922; Timmerman D et al. '
          'IOTA simple rules, UOG 2008;31:681; Andreotti RF et al. O-RADS, '
          'Radiology 2020;294:168',
      year: 2020,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('figo-ovary-2014', 'Staging once malignancy is confirmed'),
        Related('endometriosis', 'An endometrioma raises CA-125 and confounds '
            'the RMI'),
        Related('algo-ovarian-torsion', 'A mass over 5 cm is the main risk '
            'factor for torsion'),
      ],
    ),
    'popq': ContentMeta(
      id: 'popq',
      title: 'POP-Q staging',
      category: 'Gynaecology · Urogynaecology',
      sourceOrg: 'IUGA / ICS',
      sourceTitle: 'Bump RC et al. Am J Obstet Gynecol 1996;175:10; NICE NG123',
      year: 1996,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('urogynaecology', 'What to do with the stage once you have it'),
        Related('menopause', 'Vaginal oestrogen alongside a pessary prevents '
            'erosion'),
      ],
    ),
    'aub': ContentMeta(
      id: 'aub',
      title: 'Abnormal uterine bleeding',
      category: 'Gynaecology · Menstrual disorders',
      sourceOrg: 'FIGO / NICE',
      sourceTitle: 'Munro MG et al. PALM-COEIN, Int J Gynecol Obstet '
          '2011;113:3, revised 2018; Higham JM et al. PBAC, BJOG 1990;97:734; '
          'NICE NG88',
      year: 2018,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('fibroids', 'The L of PALM-COEIN'),
        Related('adenomyosis', 'The A'),
        Related('anaemia', 'Check haemoglobin and ferritin in everyone'),
        Related('pathology', 'Sample the endometrium over 45, or younger '
            'with risk factors'),
      ],
    ),
    // ── Tier 2 formulary (spec §44–46) ───────────────────────────────────
    'formulary': ContentMeta(
      id: 'formulary',
      title: 'Drug formulary',
      category: 'Formulary · Obstetrics & gynaecology',
      sourceOrg: 'RCOG / NICE / WHO / LactMed',
      sourceTitle: 'Green-top Guidelines 52, 37a, 10(A), 74; NICE NG133, NG25, '
          'NG207; WHO PPH recommendations; NIH LactMed database',
      year: 2023,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-pph', 'Where the uterotonic ladder is actually used'),
        Related('algo-eclampsia', 'Magnesium regimens in context'),
        Related('algo-severe-htn', 'Choosing between labetalol, nifedipine '
            'and hydralazine'),
        Related('vte-risk', 'Enoxaparin dosing follows the risk score'),
        Related('pcos', 'Letrozole is first-line for ovulation induction'),
      ],
    ),
    // ── Tier 2 remainder (spec §24, §25, §36, §37, §47, §50) ─────────────
    'infertility': ContentMeta(
      id: 'infertility',
      title: 'Infertility',
      category: 'Gynaecology · Reproductive medicine',
      sourceOrg: 'NICE / WHO / ESHRE',
      sourceTitle: 'NICE CG156; WHO Laboratory Manual for the Examination and '
          'Processing of Human Semen, 6th edition 2021; POSEIDON criteria',
      year: 2021,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('pcos', 'The commonest cause of anovulatory infertility'),
        Related('ohss', 'Where stimulation goes next, and what it risks'),
        Related('endometriosis', 'Surgery, the fertility index, and when to go '
            'straight to IVF'),
        Related('infertility', 'AMH and antral follicle count in detail'),
      ],
    ),
    'ohss': ContentMeta(
      id: 'ohss',
      title: 'IVF and ovarian hyperstimulation syndrome',
      category: 'Gynaecology · Reproductive medicine',
      sourceOrg: 'RCOG / ESHRE',
      sourceTitle: 'Green-top Guideline 5 — Management of Ovarian '
          'Hyperstimulation Syndrome; ESHRE guideline on ovarian stimulation',
      year: 2016,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('infertility', 'The evaluation that precedes stimulation'),
        Related('vte-risk', 'Thromboprophylaxis is mandatory in severe OHSS'),
        Related('pcos', 'The dominant risk factor'),
        Related('formulary', 'Enoxaparin and cabergoline dosing'),
      ],
    ),
    'maternal-medicine': ContentMeta(
      id: 'maternal-medicine',
      title: 'Maternal medicine',
      category: 'Obstetrics · Maternal medicine',
      sourceOrg: 'ESC / ATA / RCOG / NICE',
      sourceTitle: 'ESC Guidelines on cardiovascular disease in pregnancy '
          '2018; ATA thyroid in pregnancy guidelines; NICE NG217; RCOG '
          'Green-top 39',
      year: 2018,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('lab-reference', 'Trimester-specific ranges for every test '
            'named here'),
        Related('creatinine', 'Why a normal creatinine is not normal'),
        Related('algo-maternal-collapse', 'Cardiac disease is the leading '
            'indirect cause of maternal death'),
        Related('formulary', 'Which drugs continue and which must stop'),
      ],
    ),
    'fetal-medicine': ContentMeta(
      id: 'fetal-medicine',
      title: 'Fetal medicine',
      category: 'Obstetrics · Fetal medicine',
      sourceOrg: 'ISUOG / RCOG / NHS FASP',
      sourceTitle: 'ISUOG Practice Guidelines; RCOG Green-top 8; MOMS trial '
          'NEJM 2011;364:993; Senat MV et al. NEJM 2004;351:136',
      year: 2022,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('usg-guide', 'The scans at which these findings appear'),
        Related('rh-negative', 'Intrauterine transfusion for fetal anaemia'),
        Related('mtp-act', 'Termination beyond 24 weeks needs Medical Board '
            'approval — start early'),
        Related('fgr', 'The commonest reason for fetal medicine referral'),
      ],
    ),
    'lab-reference': ContentMeta(
      id: 'lab-reference',
      title: 'Laboratory reference in pregnancy',
      category: 'Reference · Laboratory',
      sourceOrg: 'Obstetrics & Gynecology / ATA / RCOG',
      sourceTitle: 'Abbassi-Ghanavati M et al. Pregnancy and laboratory '
          'studies: a reference table for clinicians. Obstet Gynecol '
          '2009;114:1326',
      year: 2009,
      evidence: EvidenceLevel.referenceText,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('algo-pph', 'Fibrinogen below 2 g/L predicts severe '
            'haemorrhage — and 2.5 is already low at term'),
        Related('creatinine', 'Renal function in detail'),
        Related('maternal-medicine', 'The conditions these results point to'),
        Related('anaemia', 'Haemoglobin and ferritin thresholds'),
      ],
    ),
    'immunisation': ContentMeta(
      id: 'immunisation',
      title: 'Maternal immunisation',
      category: 'Reference · Immunisation',
      sourceOrg: 'MoHFW Government of India / WHO / ACOG / CDC',
      sourceTitle: 'National Immunization Schedule India; WHO position papers; '
          'ACOG Committee Opinions 718 and 741; CDC ACIP',
      year: 2024,
      evidence: EvidenceLevel.nationalGuideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('contraception', 'Live vaccines postpartum need contraception '
            'for 4 weeks'),
        Related('maternal-medicine', 'Influenza and varicella are more severe '
            'in pregnancy'),
      ],
    ),
    'pathology': ContentMeta(
      id: 'pathology',
      title: 'Pathology reference',
      category: 'Reference · Pathology',
      sourceOrg: 'WHO / Bethesda / RCOG',
      sourceTitle: 'WHO Classification of Tumours: Female Genital Tumours 5th '
          'edition 2020; Bethesda System 3rd edition 2015; RCOG Green-top 67',
      year: 2020,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('adnexal-mass', 'Risk stratification before the histology '
            'exists'),
        Related('figo-endometrium-2023', 'Molecular classification is now part '
            'of the stage'),
        Related('aub', 'When to sample the endometrium'),
        Related('pathology', 'Managing what the report says'),
      ],
    ),
    'imaging': ContentMeta(
      id: 'imaging',
      title: 'Imaging reference',
      category: 'Reference · Imaging',
      sourceOrg: 'ACOG / RCOG / ACR',
      sourceTitle: 'ACOG Committee Opinion 723 — Diagnostic Imaging During '
          'Pregnancy and Lactation; Ray JG et al. JAMA 2016;316:952',
      year: 2017,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('usg-guide', 'The obstetric scans in detail'),
        Related('pcpndt-act', 'Form F applies to every prenatal scan'),
        Related('maternal-medicine', 'Imaging a pregnant woman with suspected '
            'pulmonary embolism'),
      ],
    ),
    // ── Tier 3 procedures (spec §57) ─────────────────────────────────────
    'proc-balloon': ContentMeta(
      id: 'proc-balloon',
      title: 'Intrauterine balloon tamponade',
      category: 'Procedures · Obstetrics',
      sourceOrg: 'RCOG / FOGSI',
      sourceTitle: 'Green-top Guideline 52; condom catheter tamponade '
          'literature from South Asian practice',
      year: 2016,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-pph', 'The algorithm this sits inside'),
        Related('pph', 'Quantifying the loss that brought you here'),
        Related('formulary', 'Uterotonics that should already be running'),
      ],
    ),
    'proc-iucd': ContentMeta(
      id: 'proc-iucd',
      title: 'IUCD insertion and removal',
      category: 'Procedures · Gynaecology',
      sourceOrg: 'FSRH / WHO / MoHFW Government of India',
      sourceTitle: 'FSRH Intrauterine Contraception guideline; WHO MEC 5th '
          'edition; MoHFW Postpartum IUCD reference manual',
      year: 2023,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('contraception', 'Method choice and eligibility'),
        Related('aub', 'The levonorgestrel system as treatment, not just '
            'contraception'),
      ],
    ),
    'proc-endometrial-biopsy': ContentMeta(
      id: 'proc-endometrial-biopsy',
      title: 'Endometrial sampling',
      category: 'Procedures · Gynaecology',
      sourceOrg: 'RCOG / BSGE / NICE',
      sourceTitle: 'Green-top Guideline 67; NICE NG88; Clark TJ et al. BJOG '
          '2002;109:313',
      year: 2016,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('aub', 'When sampling is indicated'),
        Related('pathology', 'Interpreting what comes back'),
        Related('pathology', 'Acting on atypical hyperplasia'),
      ],
    ),
    // ── Expanded procedures (spec §57) ───────────────────────────────────
    'proc-avd': ContentMeta(
      id: 'proc-avd',
      title: 'Assisted vaginal delivery',
      category: 'Procedures · Obstetrics',
      sourceOrg: 'RCOG / ACOG / FOGSI',
      sourceTitle: 'Green-top Guideline 26; ACOG Practice Bulletin 219; FOGSI GCPR — Operative Vaginal Delivery',
      year: 2020,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-shoulder-dystocia', 'The complication that follows a difficult instrumental delivery'),
        Related('proc-perineal-repair', 'Examine rectally after every assisted birth'),
        Related('algo-pph', 'Anticipate haemorrhage rather than react to it'),
      ],
    ),
    'proc-perineal-repair': ContentMeta(
      id: 'proc-perineal-repair',
      title: 'Perineal and OASIS repair',
      category: 'Procedures · Obstetrics',
      sourceOrg: 'RCOG / NICE / FOGSI',
      sourceTitle: 'Green-top Guideline 29; NICE NG235; FOGSI GCPR — Perineal Trauma',
      year: 2015,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('anat-perineum', 'The anatomy that decides the classification'),
        Related('proc-avd', 'The delivery that most often causes it'),
      ],
    ),
    'proc-manual-removal': ContentMeta(
      id: 'proc-manual-removal',
      title: 'Manual removal of placenta',
      category: 'Procedures · Obstetrics',
      sourceOrg: 'RCOG / FOGSI / MoHFW',
      sourceTitle: 'Green-top Guidelines 52 and 27a; FOGSI GCPR — Third Stage of Labour; MoHFW Dakshata',
      year: 2016,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-pph', 'Haemorrhage is the reason and the risk'),
        Related('proc-balloon', 'If bleeding continues after removal'),
      ],
    ),
    'proc-vaginal-exam': ContentMeta(
      id: 'proc-vaginal-exam',
      title: 'Vaginal examination in labour',
      category: 'Procedures · Obstetrics',
      sourceOrg: 'NICE / WHO / MoHFW',
      sourceTitle: 'NICE NG235 and NG207; WHO Labour Care Guide 2020; MoHFW Dakshata and LaQshya',
      year: 2020,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('algo-cord-prolapse', 'The complication of amniotomy with a high head'),
        Related('bishop', 'Scoring what you have just felt'),
        Related('induction', 'Where amniotomy fits in the induction pathway'),
      ],
    ),
    'proc-pap': ContentMeta(
      id: 'proc-pap',
      title: 'Cervical screening',
      category: 'Procedures · Gynaecology',
      sourceOrg: 'WHO / MoHFW / National Cancer Grid',
      sourceTitle: 'WHO screening and treatment guideline 2021; MoHFW Operational Framework for Management of Common Cancers',
      year: 2021,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('pathology', 'Interpreting the report that comes back'),
        Related('proc-colposcopy', 'Where an abnormal result leads'),
        Related('figo-cervix-2018', 'Staging if invasion is found'),
      ],
    ),
    'proc-colposcopy': ContentMeta(
      id: 'proc-colposcopy',
      title: 'Colposcopy',
      category: 'Procedures · Gynaecology',
      sourceOrg: 'IFCPC / BSCCP / WHO',
      sourceTitle: 'IFCPC 2011 terminology; WHO 2021 screening guideline; Kyrgiou M et al. BMJ 2016;354:i3633',
      year: 2021,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('proc-pap', 'The screening result that brought her here'),
        Related('pathology', 'Cervical cytology and histology terminology'),
        Related('preterm-labour', 'Excision depth raises preterm birth risk'),
      ],
    ),
    'proc-hysteroscopy': ContentMeta(
      id: 'proc-hysteroscopy',
      title: 'Hysteroscopy',
      category: 'Procedures · Gynaecology',
      sourceOrg: 'RCOG / BSGE / AAGL',
      sourceTitle: 'Green-top Guideline 59; AAGL practice guidelines on distending media; NICE NG88',
      year: 2011,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('aub', 'The commonest indication'),
        Related('proc-endometrial-biopsy', 'The less invasive first step'),
        Related('fibroids', 'Types 0 to 2 come out this way'),
      ],
    ),
    'proc-laparoscopy': ContentMeta(
      id: 'proc-laparoscopy',
      title: 'Diagnostic laparoscopy',
      category: 'Procedures · Gynaecology',
      sourceOrg: 'RCOG / BSGE / FOGSI',
      sourceTitle: 'Green-top Guideline 49 — Preventing Entry-Related Laparoscopic Injuries; FOGSI GCPR — Gynaecological Endoscopy',
      year: 2008,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('anat-abdominal-wall', 'Where the entry injuries happen'),
        Related('algo-ovarian-torsion', 'A common emergency indication'),
        Related('endometriosis', 'Diagnosis and treatment at the same sitting'),
      ],
    ),
    'proc-surgical-miscarriage': ContentMeta(
      id: 'proc-surgical-miscarriage',
      title: 'Surgical management of miscarriage',
      category: 'Procedures · Gynaecology',
      sourceOrg: 'NICE / RCOG / WHO / MoHFW',
      sourceTitle: 'NICE NG126; RCOG Green-top 25; WHO safe abortion handbook; MoHFW Comprehensive Abortion Care training manual',
      year: 2019,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-ectopic', 'Consider it if no products are seen'),
        Related('mtp-act', 'The legal frame in India'),
        Related('rh-negative', 'Anti-D is required'),
      ],
    ),
    'proc-implant': ContentMeta(
      id: 'proc-implant',
      title: 'Contraceptive implant',
      category: 'Procedures · Gynaecology',
      sourceOrg: 'FSRH / WHO / MoHFW',
      sourceTitle: 'FSRH Progestogen-only Implant guideline; WHO MEC 5th edition; MoHFW Family Planning reference manuals',
      year: 2021,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('contraception', 'Method choice and eligibility'),
        Related('proc-iucd', 'The other long-acting reversible option'),
      ],
    ),
    // ── §51 score library additions ──────────────────────────────────────
    'meows': ContentMeta(
      id: 'meows',
      title: 'MEOWS',
      category: 'Obstetrics · Early warning',
      sourceOrg: 'RCOG / MBRRACE-UK / FOGSI',
      sourceTitle: 'Green-top Guideline 56; MBRRACE-UK confidential enquiries; FOGSI GCPR — Maternal Early Warning Systems',
      year: 2011,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('algo-sepsis', 'The commonest reason a MEOWS chart triggers'),
        Related('algo-maternal-collapse', 'Where an untriggered deterioration ends'),
        Related('haemodynamics', 'Shock index catches what blood pressure hides'),
      ],
    ),
    'epds': ContentMeta(
      id: 'epds',
      title: 'Edinburgh Postnatal Depression Scale',
      category: 'Obstetrics · Mental health',
      sourceOrg: 'Br J Psychiatry / NICE / MoHFW',
      sourceTitle: 'Cox JL et al. Br J Psychiatry 1987;150:782; NICE CG192; MoHFW maternal mental health guidance',
      year: 1987,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('couns-preeclampsia', 'How to open a difficult conversation'),
        Related('maternal-medicine', 'Coexisting conditions that mimic depression'),
      ],
    ),
    'caprini': ContentMeta(
      id: 'caprini',
      title: 'Caprini score',
      category: 'Gynaecology · Thromboprophylaxis',
      sourceOrg: 'ACOG / Dis Mon / FOGSI',
      sourceTitle: 'Caprini JA. Dis Mon 2005;51:70; ACOG Practice Bulletin 232; FOGSI GCPR — Thromboprophylaxis',
      year: 2005,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('vte-risk', 'The obstetric score — use that one in pregnancy'),
        Related('proc-laparoscopy', 'The surgery this is scored before'),
        Related('formulary', 'Enoxaparin dosing'),
      ],
    ),
    'robson': ContentMeta(
      id: 'robson',
      title: 'Robson classification',
      category: 'Obstetrics · Audit',
      sourceOrg: 'WHO / FOGSI',
      sourceTitle: 'Robson MS. Fetal Matern Med Rev 2001;12:23; WHO Robson implementation manual 2017',
      year: 2001,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('caesarean', 'What the audit is auditing'),
        Related('vbac', 'Group 5 is where the rate is usually decided'),
      ],
    ),
    'quintero': ContentMeta(
      id: 'quintero',
      title: 'Quintero staging',
      category: 'Obstetrics · Fetal medicine',
      sourceOrg: 'J Perinatol / ISUOG / FOGSI',
      sourceTitle: 'Quintero RA et al. J Perinatol 1999;19:550; Senat MV et al. NEJM 2004;351:136',
      year: 1999,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(12),
      status: ContentStatus.draft,
      highRisk: true,
      related: [
        Related('fetal-medicine', 'Laser therapy and the referral pathway'),
        Related('senat-ttts', 'The trial that made laser standard'),
      ],
    ),
    'rasrm': ContentMeta(
      id: 'rasrm',
      title: 'rASRM endometriosis staging',
      category: 'Gynaecology · Endometriosis',
      sourceOrg: 'ASRM / ESHRE / FOGSI',
      sourceTitle: 'ASRM revised classification 1996, Fertil Steril 1997;67:817; ESHRE Endometriosis Guideline 2022',
      year: 1996,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('endometriosis', 'Why the stage predicts pain so poorly'),
        Related('infertility', 'The Endometriosis Fertility Index predicts conception better'),
      ],
    ),
    'mrs': ContentMeta(
      id: 'mrs',
      title: 'Menopause Rating Scale',
      category: 'Gynaecology · Menopause',
      sourceOrg: 'Indian Menopause Society / NICE',
      sourceTitle: 'Heinemann LAJ et al. Health Qual Life Outcomes 2004;2:45; Indian Menopause Society recommendations',
      year: 2004,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('menopause', 'What to do with a raised score'),
        Related('urogynaecology', 'The urogenital subscale needs separate treatment'),
      ],
    ),
    'ecog': ContentMeta(
      id: 'ecog',
      title: 'ECOG performance status',
      category: 'Oncology',
      sourceOrg: 'ECOG / National Cancer Grid',
      sourceTitle: 'Oken MM et al. Am J Clin Oncol 1982;5:649; National Cancer Grid of India guidelines',
      year: 1982,
      evidence: EvidenceLevel.guideline,
      created: _built,
      nextReview: _review(24),
      status: ContentStatus.draft,
      related: [
        Related('figo-ovary-2014', 'Staging the disease being treated'),
        Related('formulary', 'Fitness for platinum-taxane chemotherapy'),
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
Widget _vulva(BuildContext _) => StagingScreen(system: _system('figo-vulva-2021'));
Widget _gtn(BuildContext _) => StagingScreen(system: _system('figo-who-gtn'));


Widget _anthroS(BuildContext _) => const AnthropometryScreen();
Widget _weightGainS(BuildContext _) => const WeightGainScreen();
Widget _haemoS(BuildContext _) => const HaemodynamicsScreen();
Widget _anaemiaS(BuildContext _) => const AnaemiaScreen();
Widget _insulinS(BuildContext _) => const InsulinScreen();
Widget _creatinineS(BuildContext _) => const CreatinineScreen();
Widget _vteS(BuildContext _) => const VteRiskScreen();
Widget _apgarS(BuildContext _) => const ApgarScreen();

Widget _tCtg(BuildContext _) => _t('ctg');
Widget _tFgr(BuildContext _) => _t('fgr');
Widget _tPprom(BuildContext _) => _t('pprom');
Widget _tPreterm(BuildContext _) => _t('preterm-labour');
Widget _tInduction(BuildContext _) => _t('induction');
Widget _tVbac(BuildContext _) => _t('vbac');
Widget _tCaesarean(BuildContext _) => _t('caesarean');
Widget _tRh(BuildContext _) => _t('rh-negative');

Widget _cAub(BuildContext _) => const AubScreen();
Widget _cMeows(BuildContext _) => const MeowsScreen();
Widget _cEpds(BuildContext _) => const EpdsScreen();
Widget _cCaprini(BuildContext _) => const CapriniScreen();
Widget _cRobson(BuildContext _) => const RobsonScreen();
Widget _cQuintero(BuildContext _) => const QuinteroScreen();
Widget _cRasrm(BuildContext _) => const RasrmScreen();
Widget _cMrs(BuildContext _) => const MrsScreen();
Widget _cEcog(BuildContext _) => const EcogScreen();
Widget _cPcosAssess(BuildContext _) => const PcosAssessmentScreen();
Widget _cAdnexal(BuildContext _) => const AdnexalMassScreen();
Widget _cPopq(BuildContext _) => const PopQScreen();

Widget _an(String id) =>
    AnatomyScreen(entry: kAnatomy.firstWhere((a) => a.id == id));
Widget _anUreter(BuildContext _) => _an('anat-ureter');
Widget _anUterine(BuildContext _) => _an('anat-uterine-artery');
Widget _anIliac(BuildContext _) => _an('anat-internal-iliac');
Widget _anWall(BuildContext _) => _an('anat-abdominal-wall');
Widget _anSpaces(BuildContext _) => _an('anat-spaces');
Widget _anNerves(BuildContext _) => _an('anat-nerves');
Widget _anPerineum(BuildContext _) => _an('anat-perineum');

Widget _pAvd(BuildContext _) => _t('proc-avd');
Widget _pPerineal(BuildContext _) => _t('proc-perineal-repair');
Widget _pManual(BuildContext _) => _t('proc-manual-removal');
Widget _pVe(BuildContext _) => _t('proc-vaginal-exam');
Widget _pPap(BuildContext _) => _t('proc-pap');
Widget _pColpo(BuildContext _) => _t('proc-colposcopy');
Widget _pHystero(BuildContext _) => _t('proc-hysteroscopy');
Widget _pLap(BuildContext _) => _t('proc-laparoscopy');
Widget _pMiscarriage(BuildContext _) => _t('proc-surgical-miscarriage');
Widget _pImplant(BuildContext _) => _t('proc-implant');
Widget _tBalloon(BuildContext _) => _t('proc-balloon');
Widget _tIucd(BuildContext _) => _t('proc-iucd');
Widget _tBiopsy(BuildContext _) => _t('proc-endometrial-biopsy');
Widget _tPathology(BuildContext _) => _t('pathology');
Widget _tImaging(BuildContext _) => _t('imaging');
Widget _tInfertility(BuildContext _) => _t('infertility');
Widget _tOhss(BuildContext _) => _t('ohss');
Widget _tMatMed(BuildContext _) => _t('maternal-medicine');
Widget _tFetMed(BuildContext _) => _t('fetal-medicine');
Widget _labRef(BuildContext _) => const LabReferenceScreen();
Widget _immunisation(BuildContext _) => const ImmunisationScreen();

Widget _tPcos(BuildContext _) => _t('pcos');
Widget _tFibroids(BuildContext _) => _t('fibroids');
Widget _tEndo(BuildContext _) => _t('endometriosis');
Widget _tAdeno(BuildContext _) => _t('adenomyosis');
Widget _tContraception(BuildContext _) => _t('contraception');
Widget _tMenopause(BuildContext _) => _t('menopause');
Widget _tUrogynae(BuildContext _) => _t('urogynaecology');

Widget _formulary(BuildContext _) =>
    DrugScreen(drug: DrugRegistry.byId('oxytocin')!);

Widget _t(String id) => TopicScreen(topic: TopicRegistry.byId(id)!);

Widget _biometryS(BuildContext _) => const BiometryScreen();
Widget _vulval(BuildContext _) => _t('vulval-disorders');
Widget _procOxytocin(BuildContext _) => _t('proc-oxytocin');
Widget _procUterineExp(BuildContext _) => _t('proc-uterine-exploration');
Widget _procVaginalSurg(BuildContext _) => _t('proc-vaginal-surgery');

StagingSystem _system(String id) =>
    kStagingSystems.firstWhere((s) => s.id == id);
