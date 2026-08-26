import '../models/content_meta.dart';
import 'trial_registry.dart';
import 'counselling.dart';
import 'anatomy.dart';
import 'staging_data.dart';

/// §62 records for the content families whose nodes are generated rather than
/// hand-listed — trials, counselling guides, anatomy entries and staging
/// systems.
///
/// These were previously outside the governance suite entirely: a node with no
/// record is invisible to every rule that iterates records. Deriving the record
/// from the item itself closes that, and the edge tables below supply the one
/// thing that cannot be derived — why two items belong together (§68).
class DerivedMeta {
  static final DateTime _built = DateTime(2026, 8, 26);
  static DateTime _review(int months) =>
      DateTime(_built.year, _built.month + months, _built.day);

  /// Where each trial's evidence actually lands in the app.
  static const _trialEdges = <String, List<Related>>{
    'magpie': [
      Related('mgso4', 'The trial the dosing regimen comes from'),
      Related('algo-eclampsia', 'Why magnesium is given before any '
          'anticonvulsant'),
    ],
    'aspre': [
      Related('algo-severe-htn', 'The prophylaxis that precedes the '
          'emergency'),
      Related('gdm', 'Screened in the same first-trimester visit'),
    ],
    'woman': [
      Related('algo-pph', 'Why tranexamic acid is given within three hours'),
      Related('pph', 'The condition the trial changed practice in'),
    ],
    'emotive': [
      Related('algo-pph', 'The bundle and the drape that detect it earlier'),
      Related('pph', 'Objective measurement instead of visual estimate'),
    ],
    'truffle': [
      Related('algo-fgr', 'The surveillance strategy the timing rests on'),
      Related('fgr', 'Ductus venosus versus short-term variation'),
    ],
    'arrive': [
      Related('induction', 'The evidence behind offering induction at 39 '
          'weeks'),
      Related('bishop', 'The cervix score that predicts whether it will work'),
    ],
    'term-breech': [
      Related('caesarean', 'Why planned caesarean became standard for term '
          'breech'),
    ],
    'oracle': [
      Related('algo-pprom', 'Erythromycin yes, co-amoxiclav no'),
      Related('pprom', 'The antibiotic choice and the reason for it'),
    ],
    'moms': [
      Related('fetal-medicine', 'The trial that made fetal surgery a real '
          'option'),
    ],
    'achois': [
      Related('gdm', 'The trial that established treating mild gestational '
          'diabetes'),
      Related('insulin', 'What treatment means in practice'),
    ],
    'legro-letrozole': [
      Related('pcos', 'Letrozole ahead of clomiphene for ovulation '
          'induction'),
      Related('infertility', 'First-line ovulation induction'),
    ],
    'senat-ttts': [
      Related('quintero', 'The staging the trial randomised by'),
      Related('fetal-medicine', 'Laser ahead of serial amnioreduction'),
    ],
    'landon-vbac': [
      Related('vbac', 'The cohort the counselling numbers come from'),
      Related('algo-uterine-rupture', 'The complication being quantified'),
    ],
    'chips': [
      Related('algo-severe-htn', 'How tight to control, and what it costs'),
    ],
    'hypitat': [
      Related('induction', 'Induction versus expectant management in '
          'gestational hypertension'),
    ],
    'hapo': [
      Related('gdm', 'The observational study the diagnostic thresholds '
          'derive from'),
    ],
    'term-prom': [
      Related('induction', 'Induction versus expectant management once '
          'membranes rupture at term'),
    ],
    'liggins-howie': [
      Related('algo-preterm-labour', 'The trial antenatal corticosteroids '
          'come from'),
    ],
    'actomgso4': [
      Related('algo-preterm-labour', 'Magnesium for neuroprotection, and the '
          'number needed to treat'),
      Related('mgso4', 'The same drug, a different indication and regimen'),
    ],
    'grit': [
      Related('algo-fgr', 'Deliver now or wait — the trial that asked it '
          'directly'),
    ],
    'champion': [
      Related('mtp-act', 'Medical versus surgical termination'),
    ],
    'whi': [
      Related('menopause', 'The trial that changed hormone therapy '
          'prescribing worldwide'),
    ],
    'solo1': [
      Related('figo-ovary-2014', 'Maintenance after first-line treatment of '
          'advanced disease'),
      Related('formulary', 'Olaparib, and who is eligible for it'),
    ],
    'portec3': [
      Related('figo-endometrium-2023', 'The stages the adjuvant question '
          'applies to'),
      Related('couns-cancer-treatment', 'Chemoradiotherapy and what it costs '
          'her'),
    ],
    'lacc': [
      Related('figo-cervix-2018', 'Why open radical hysterectomy returned as '
          'the standard'),
    ],
  };

  /// Each counselling guide belongs beside the clinical content it explains.
  static const _counsellingEdges = <String, List<Related>>{
    'couns-warning-signs': [
      Related('algo-severe-htn', 'The emergency most of these signs point at'),
      Related('couns-antenatal-care', 'Where the signs are first taught'),
    ],
    'couns-vbac': [Related('vbac', 'The clinical content behind the '
        'conversation')],
    'couns-gdm': [Related('gdm', 'The clinical content behind the '
        'conversation')],
    'couns-miscarriage': [
      Related('algo-miscarriage', 'What is actually done, while this is what '
          'is said'),
    ],
    'couns-postpartum-contraception': [
      Related('contraception', 'Methods, timing and eligibility'),
    ],
    'couns-induction': [Related('induction', 'The clinical content behind the '
        'conversation')],
    'couns-preeclampsia': [
      Related('algo-severe-htn', 'What happens if the counselling fails'),
      Related('couns-hypertension', 'The chronic condition it is confused '
          'with'),
    ],
    'couns-caesarean': [Related('caesarean', 'The operation being consented '
        'for')],
    'couns-breastfeeding': [
      Related('couns-postpartum-contraception', 'Lactational amenorrhoea and '
          'method choice'),
    ],
    'couns-ectopic': [Related('algo-ectopic', 'The management this explains')],
    'couns-pcos': [Related('pcos', 'The clinical content behind the '
        'conversation')],
    'couns-menopause': [
      Related('menopause', 'The clinical content behind the conversation'),
      Related('whi', 'The trial that shapes what she has already heard'),
    ],
    'couns-antenatal-care': [
      Related('couns-nutrition', 'Delivered in the same visit'),
      Related('couns-warning-signs', 'The part of the visit that saves lives'),
      Related('immunisation', 'The schedule discussed at booking'),
    ],
    'couns-nutrition': [
      Related('anaemia', 'What the advice is mostly trying to prevent'),
      Related('weight-gain', 'The target the advice is set against'),
    ],
    'couns-fetal-movements': [
      Related('algo-rfm', 'What happens when she does ring'),
    ],
    'couns-labour-preparation': [
      Related('bishop', 'What is assessed when she arrives'),
      Related('couns-caesarean', 'The conversation she may need next'),
    ],
    'couns-hypertension': [
      Related('algo-severe-htn', 'The emergency this is trying to avoid'),
      Related('formulary', 'Which drug replaces the ACE inhibitor'),
    ],
    'couns-pph': [
      Related('algo-pph', 'What was done to her, in clinical terms'),
      Related('anaemia', 'The part that is still being treated at discharge'),
    ],
    'couns-infertility': [
      Related('infertility', 'The clinical content behind the conversation'),
      Related('couns-ivf', 'The next conversation if treatment is chosen'),
    ],
    'couns-ivf': [
      Related('algo-ohss', 'The complication being consented for'),
      Related('infertility', 'The investigation that led here'),
    ],
    'couns-endometriosis': [
      Related('endometriosis', 'The clinical content behind the conversation'),
    ],
    'couns-fibroids': [
      Related('fibroids', 'The clinical content behind the conversation'),
      Related('algo-aub', 'The symptom that usually brings her in'),
    ],
    'couns-cancer-diagnosis': [
      Related('couns-cancer-treatment', 'The conversation that follows'),
      Related('figo-cervix-2018', 'The staging that shapes what you can say'),
    ],
    'couns-cancer-treatment': [
      Related('couns-cancer-diagnosis', 'The conversation that preceded it'),
      Related('formulary', 'The regimens and their side effects'),
    ],
  };

  static const _anatomyEdges = <String, List<Related>>{
    'anat-ureter': [
      Related('proc-laparoscopy', 'Where it is most often injured'),
      Related('anat-uterine-artery', 'The crossing point that defines the '
          'danger'),
    ],
    'anat-uterine-artery': [
      Related('anat-ureter', 'Water under the bridge'),
      Related('algo-pph', 'The vessel ligated when bleeding will not stop'),
    ],
    'anat-internal-iliac': [
      Related('algo-pph', 'Ligation as a last resort before hysterectomy'),
      Related('anat-ureter', 'Crosses the bifurcation and is at risk during '
          'ligation'),
    ],
    'anat-abdominal-wall': [
      Related('caesarean', 'The layers opened at every caesarean'),
      Related('proc-laparoscopy', 'Where the ports go, and what they miss'),
    ],
    'anat-spaces': [
      Related('anat-ureter', 'Opened to find and protect it'),
      Related('proc-laparoscopy', 'The planes developed in dissection'),
    ],
    'anat-nerves': [
      Related('proc-laparoscopy', 'Port placement and nerve injury'),
      Related('anat-abdominal-wall', 'Where the nerves run in the layers'),
    ],
    'anat-perineum': [
      Related('proc-perineal-repair', 'The structures being repaired'),
      Related('popq', 'The support this anatomy provides, and its failure'),
    ],
  };

  static const _stagingEdges = <String, List<Related>>{
    'figo-cervix-2018': [
      Related('proc-colposcopy', 'How the disease is found before it is '
          'staged'),
      Related('lacc', 'The trial that changed the surgery for early stages'),
      Related('couns-cancer-diagnosis', 'How the stage is communicated'),
    ],
    'figo-endometrium-2023': [
      Related('algo-pmb', 'The symptom that leads to the diagnosis'),
      Related('proc-endometrial-biopsy', 'The sample that establishes it'),
    ],
    'figo-ovary-2014': [
      Related('adnexal-mass', 'The finding that starts the pathway'),
      Related('couns-cancer-treatment', 'What the stage means for treatment'),
    ],
    'figo-vulva-2021': [
      Related('couns-cancer-diagnosis', 'How the stage is communicated'),
      Related('anat-perineum', 'The anatomy the staging depends on'),
    ],
    'figo-who-gtn': [
      Related('algo-miscarriage', 'Where the products must go to histology'),
      Related('formulary', 'Methotrexate and the multi-agent regimens'),
    ],
  };

  static Map<String, ContentMeta> build() {
    final out = <String, ContentMeta>{};

    for (final t in TrialRegistry.all) {
      out[t.id] = ContentMeta(
        id: t.id,
        title: '${t.acronym} — ${t.name}',
        category: 'Evidence · ${t.category}',
        sourceOrg: t.journal,
        sourceTitle: '${t.name}. ${t.journal} ${t.year}',
        year: t.year,
        evidence: EvidenceLevel.rct,
        created: _built,
        nextReview: _review(24),
        status: ContentStatus.draft,
        related: _trialEdges[t.id] ?? const [],
      );
    }

    for (final g in kCounsellingGuides) {
      out[g.id] = ContentMeta(
        id: g.id,
        title: g.title,
        category: 'Counselling',
        sourceOrg: _org(g.sources),
        sourceTitle: g.sources.isEmpty ? g.title : g.sources.first,
        evidence: EvidenceLevel.guideline,
        created: _built,
        nextReview: _review(18),
        status: ContentStatus.draft,
        related: _counsellingEdges[g.id] ?? const [],
      );
    }

    for (final a in kAnatomy) {
      out[a.id] = ContentMeta(
        id: a.id,
        title: a.name,
        category: 'Surgical anatomy',
        sourceOrg: _org(a.sources),
        sourceTitle: a.sources.isEmpty ? a.name : a.sources.first,
        evidence: EvidenceLevel.referenceText,
        created: _built,
        nextReview: _review(24),
        status: ContentStatus.draft,
        highRisk: true,
        related: _anatomyEdges[a.id] ?? const [],
      );
    }

    for (final s in kStagingSystems) {
      out[s.id] = ContentMeta(
        id: s.id,
        title: '${s.name} · ${s.edition}',
        category: 'Oncology · Staging',
        sourceOrg: 'FIGO',
        sourceTitle: s.sources.isEmpty ? s.edition : s.sources.first,
        evidence: EvidenceLevel.guideline,
        created: _built,
        nextReview: _review(24),
        status: ContentStatus.draft,
        highRisk: true,
        related: _stagingEdges[s.id] ?? const [],
      );
    }

    return out;
  }

  /// The issuing body, taken from the front of the first citation.
  static String _org(List<String> sources) {
    if (sources.isEmpty) return 'Reference text';
    final first = sources.first;
    for (final sep in [' — ', '. ', ' recommendations', ' Practice']) {
      final i = first.indexOf(sep);
      if (i > 0) return first.substring(0, i).trim();
    }
    return first.length > 60 ? first.substring(0, 60).trim() : first.trim();
  }
}
