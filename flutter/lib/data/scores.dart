import '../models/clinical_score.dart';

/// The §51 score library. Every scoring system in the app, indexed once.
const kScores = <ClinicalScore>[
  // ── Obstetric ────────────────────────────────────────────────────────────
  ClinicalScore(
    id: 'score-meows',
    name: 'MEOWS',
    subtitle: 'Modified Early Obstetric Warning Score',
    category: ScoreCategory.obstetric,
    toolId: 'meows',
    purpose: 'Detect maternal deterioration before it becomes obvious, using '
        'routine observations charted against obstetric-specific thresholds.',
    population: 'Any pregnant or recently pregnant woman — antenatal, '
        'intrapartum or up to 6 weeks postpartum.',
    inputs: [
      'Respiratory rate',
      'Oxygen saturation',
      'Temperature',
      'Systolic and diastolic blood pressure',
      'Heart rate',
      'Conscious level (AVPU)',
      'Pain score and lochia, in some versions',
    ],
    calculation: 'Each observation falls in a white, yellow or red zone. One '
        'red or two yellow triggers escalation. Charts differ between units; '
        'the trigger rule, not the score total, is what matters.',
    interpretation: [
      ('No trigger', 'Continue routine observations'),
      ('One yellow', 'Repeat within 30 minutes; inform the midwife in charge'),
      ('Two yellow, or one red', 'Urgent medical review — this is the trigger'),
      ('Multiple red', 'Immediate senior review and consider critical care'),
    ],
    limitations: [
      'Respiratory rate is the most sensitive parameter and the one most '
          'often left blank — an incomplete chart does not trigger.',
      'Chart designs and thresholds vary between units; there is no single '
          'national MEOWS.',
      'A young woman compensates, so the score may trigger late in '
          'haemorrhage. Clinical concern overrides a non-triggering chart.',
      'Not validated as a mortality predictor — it is a prompt to escalate, '
          'not a diagnosis.',
    ],
    sources: [
      'RCOG Green-top Guideline 56 — Maternal Collapse.',
      'MBRRACE-UK — Saving Lives, Improving Mothers\' Care, recurring themes '
          'on failure to escalate.',
      'FOGSI GCPR — Maternal Early Warning Systems; MoHFW Dakshata.',
    ],
  ),
  ClinicalScore(
    id: 'score-epds',
    name: 'Edinburgh Postnatal Depression Scale',
    subtitle: 'EPDS — 10 items',
    category: ScoreCategory.obstetric,
    toolId: 'epds',
    purpose: 'Screen for depressive symptoms in pregnancy and after birth.',
    population: 'Validated antenatally and postnatally, and across many '
        'languages and cultures including validated Indian translations.',
    inputs: ['Ten self-rated items, each scored 0 to 3, covering the past '
        'seven days'],
    calculation: 'Sum of the ten items. Range 0 to 30. Items 3, 5, 6, 7, 8, 9 '
        'and 10 are reverse-scored.',
    interpretation: [
      ('0 – 9', 'Depression unlikely — but re-screen if concern persists'),
      ('10 – 12', 'Possible depression; repeat in 2 weeks and assess'),
      ('13 or above', 'Probable depression — arrange assessment'),
      ('ITEM 10 above 0', 'Any thought of self-harm requires SAME-DAY '
          'assessment, whatever the total'),
    ],
    limitations: [
      'A screening tool, not a diagnosis. A positive score needs a clinical '
          'assessment.',
      'Item 10 must be reviewed on its own — a woman can score low overall '
          'and still be at risk.',
      'Anxiety is under-detected by the EPDS.',
      'Cut-offs vary between validated translations; use the threshold '
          'validated for the language used.',
    ],
    sources: [
      'Cox JL, Holden JM, Sagovsky R. Detection of postnatal depression. '
          'Br J Psychiatry 1987;150:782–786.',
      'NICE CG192 — Antenatal and postnatal mental health.',
      'MoHFW Government of India — maternal mental health guidance; validated '
          'Indian-language versions of the EPDS.',
    ],
  ),
  ClinicalScore(
    id: 'score-vte',
    name: 'RCOG VTE risk score',
    subtitle: 'Antenatal and postnatal thromboprophylaxis',
    category: ScoreCategory.obstetric,
    toolId: 'vte-risk',
    purpose: 'Decide who needs thromboprophylaxis, and from when.',
    population: 'All pregnant and postpartum women, reassessed at booking, at '
        'every admission, and after delivery.',
    inputs: [
      'Pre-existing risk factors — previous VTE, thrombophilia, comorbidity, '
          'age, BMI, parity, smoking, varicose veins',
      'Obstetric risk factors — pre-eclampsia, ART, multiple pregnancy, mode '
          'of delivery, prolonged labour, haemorrhage, preterm birth, '
          'stillbirth',
      'Transient risk factors — surgery, hyperemesis, OHSS, infection, '
          'immobility',
    ],
    calculation: 'Sum the weighted factors. Antenatal and postnatal totals are '
        'assessed separately.',
    interpretation: [
      ('Antenatal 4 or more', 'LMWH from the first trimester'),
      ('Antenatal 3', 'LMWH from 28 weeks'),
      ('Antenatal below 3', 'Mobilise, avoid dehydration'),
      ('Postnatal 2 or more', 'At least 10 days of LMWH'),
      ('Previous unprovoked VTE or high-risk thrombophilia',
          'Antenatal LMWH regardless of total'),
    ],
    limitations: [
      'A floor, not a ceiling — clinical judgement may justify prophylaxis '
          'below threshold.',
      'A woman with previous VTE needs a haematology plan, not a score.',
      'Weighting is consensus-derived rather than prospectively validated.',
    ],
    sources: [
      'RCOG Green-top Guideline 37a.',
      'FOGSI GCPR — Thromboprophylaxis in Obstetrics and Gynaecology.',
    ],
  ),
  ClinicalScore(
    id: 'score-bpp',
    name: 'Biophysical profile',
    subtitle: 'Five parameters, two points each',
    category: ScoreCategory.obstetric,
    purpose: 'Assess fetal wellbeing where the cardiotocograph is equivocal, '
        'or for surveillance in high-risk pregnancy.',
    population: 'Third-trimester pregnancies under surveillance.',
    inputs: [
      'Fetal breathing movements',
      'Gross body movements',
      'Fetal tone',
      'Amniotic fluid volume',
      'Reactive cardiotocograph',
    ],
    calculation: 'Each parameter scores 2 if present, 0 if absent. Maximum 10.',
    interpretation: [
      ('8 – 10', 'Normal; repeat as scheduled'),
      ('6', 'Equivocal; repeat within 24 hours'),
      ('4 or below', 'Consider delivery, weighing gestation'),
      ('Oligohydramnios alone', 'Warrants assessment for delivery whatever '
          'the total'),
    ],
    limitations: [
      'Time-consuming, and operator-dependent.',
      'Parameters are lost in a predictable order as hypoxia progresses — '
          'cardiotocograph and breathing first, then movement, then tone.',
      'Amniotic fluid reflects chronic rather than acute compromise, which is '
          'why it is weighted separately.',
    ],
    sources: [
      'Manning FA et al. Fetal biophysical profile scoring. Am J Obstet '
          'Gynecol 1980;136:787.',
      'ACOG Practice Bulletin 229 — Antepartum Fetal Surveillance.',
      'ISUOG Practice Guidelines.',
    ],
  ),
  ClinicalScore(
    id: 'score-quintero',
    name: 'Quintero staging',
    subtitle: 'Twin-to-twin transfusion syndrome',
    category: ScoreCategory.obstetric,
    toolId: 'quintero',
    purpose: 'Stage the severity of twin-to-twin transfusion syndrome and '
        'guide the decision to intervene.',
    population: 'Monochorionic diamniotic twin pregnancies with a '
        'polyhydramnios–oligohydramnios sequence.',
    inputs: [
      'Amniotic fluid discordance',
      'Visibility of the donor bladder',
      'Doppler studies — umbilical artery, ductus venosus, umbilical vein',
      'Presence of hydrops',
      'Fetal demise',
    ],
    calculation: 'Sequential stages I to V, each adding a finding to the one '
        'before.',
    interpretation: [
      ('Stage I', 'Polyhydramnios–oligohydramnios sequence; donor bladder '
          'still visible'),
      ('Stage II', 'Donor bladder not visible'),
      ('Stage III', 'Critically abnormal Doppler — absent or reversed '
          'umbilical artery end-diastolic flow, reversed ductus venosus '
          'a-wave, or pulsatile umbilical venous flow'),
      ('Stage IV', 'Hydrops in either twin'),
      ('Stage V', 'Demise of either twin'),
    ],
    limitations: [
      'Progression is not always sequential — a pregnancy can move from I to '
          'IV without passing through the intermediate stages.',
      'Stage does not predict outcome reliably; management of stage I remains '
          'debated.',
      'Requires expert fetal medicine ultrasound.',
    ],
    sources: [
      'Quintero RA et al. Staging of twin-twin transfusion syndrome. '
          'J Perinatol 1999;19:550–555.',
      'Senat MV et al. N Engl J Med 2004;351:136–144.',
      'ISUOG Practice Guidelines — role of ultrasound in twin pregnancy.',
    ],
  ),

  // ── Intrapartum & postpartum ─────────────────────────────────────────────
  ClinicalScore(
    id: 'score-bishop',
    name: 'Bishop score',
    subtitle: 'Induction favourability',
    category: ScoreCategory.intrapartum,
    toolId: 'bishop',
    purpose: 'Assess whether the cervix is favourable for induction, and '
        'therefore which method to use.',
    population: 'Derived in multiparous women for elective induction at term.',
    inputs: [
      'Cervical dilatation',
      'Effacement',
      'Fetal station',
      'Cervical consistency',
      'Cervical position',
    ],
    calculation: 'Sum of five components. Dilatation, effacement and station '
        'score 0–3; consistency and position score 0–2. Maximum 13.',
    interpretation: [
      ('8 or above', 'Favourable — likelihood of vaginal delivery similar to '
          'spontaneous labour'),
      ('6 – 7', 'Intermediate — induction reasonable, consider ripening'),
      ('5 or below', 'Unfavourable — cervical ripening indicated first'),
    ],
    limitations: [
      'Derived in multiparous women; it predicts less well in nulliparas, '
          'where a ripening agent is often reasonable even at intermediate '
          'scores.',
      'Inter-observer variation in effacement and consistency is '
          'considerable.',
      'The modified Bishop score omits position and consistency and performs '
          'comparably.',
    ],
    sources: [
      'Bishop EH. Pelvic scoring for elective induction. Obstet Gynecol '
          '1964;24:266–268.',
      'ACOG Practice Bulletin 107; NICE NG207.',
      'FOGSI GCPR — Induction of Labour.',
    ],
  ),
  ClinicalScore(
    id: 'score-shock-index',
    name: 'Shock index',
    subtitle: 'And the obstetric and modified variants',
    category: ScoreCategory.intrapartum,
    toolId: 'haemodynamics',
    purpose: 'Detect significant blood loss before the blood pressure falls.',
    population: 'Obstetric haemorrhage, and any acutely unwell pregnant or '
        'postpartum woman.',
    inputs: ['Heart rate', 'Systolic blood pressure', 'Mean arterial pressure '
        'for the modified index'],
    calculation: 'Shock index = heart rate ÷ systolic pressure. Modified shock '
        'index = heart rate ÷ mean arterial pressure.',
    interpretation: [
      ('0.7 – 0.9', 'Normal range in pregnancy'),
      ('0.9 or above', 'Abnormal — treat as significant loss even if the '
          'blood pressure looks acceptable'),
      ('1.1 or above', 'Predicts adverse outcome and need for transfusion'),
      ('1.7 or above', 'Severe — activate massive transfusion'),
    ],
    limitations: [
      'Unreliable where heart rate is modified by beta-blockade, regional '
          'anaesthesia or an arrhythmia.',
      'Normal ranges differ from the non-pregnant population — 0.5–0.7 '
          'outside pregnancy.',
      'A single value is less informative than the trend.',
    ],
    sources: [
      'Nathan HL et al. BJOG 2015;122:268–275.',
      'Le Bas A et al. Int J Gynecol Obstet 2014;124:253–255.',
      'RCOG Green-top Guideline 52; FOGSI GCPR — Postpartum Haemorrhage.',
    ],
  ),
  ClinicalScore(
    id: 'score-apgar',
    name: 'Apgar score',
    subtitle: 'At 1 and 5 minutes',
    category: ScoreCategory.intrapartum,
    toolId: 'apgar',
    purpose: 'Describe the newborn\'s condition at birth and the response to '
        'resuscitation.',
    population: 'Every newborn.',
    inputs: [
      'Appearance (colour)',
      'Pulse',
      'Grimace (reflex irritability)',
      'Activity (tone)',
      'Respiration',
    ],
    calculation: 'Each component scores 0, 1 or 2. Maximum 10. Assessed at 1 '
        'and 5 minutes, and every 5 minutes to 20 if below 7.',
    interpretation: [
      ('7 – 10', 'Normal — routine care'),
      ('4 – 6', 'Moderately depressed — continue resuscitation'),
      ('0 – 3', 'Severely depressed — full resuscitation'),
    ],
    limitations: [
      'It does NOT diagnose birth asphyxia and does NOT predict individual '
          'neurological outcome.',
      'It must never guide resuscitation — that begins on breathing, heart '
          'rate and tone, long before the one-minute score exists.',
      'Prematurity, maternal sedation, anaesthesia, congenital anomaly and '
          'neuromuscular disease all lower it without hypoxia.',
    ],
    sources: [
      'Apgar V. Curr Res Anesth Analg 1953;32:260–267.',
      'ACOG Committee Opinion 644 / AAP — The Apgar Score.',
    ],
  ),
  ClinicalScore(
    id: 'score-robson',
    name: 'Robson classification',
    subtitle: 'Ten-group caesarean audit',
    category: ScoreCategory.intrapartum,
    toolId: 'robson',
    purpose: 'Classify every caesarean into one of ten mutually exclusive '
        'groups, so that rates can be compared between units and over time.',
    population: 'Every woman giving birth. It is an audit tool, not a clinical '
        'decision aid.',
    inputs: [
      'Parity, and previous caesarean',
      'Onset of labour — spontaneous, induced, or pre-labour caesarean',
      'Gestational age — term or preterm',
      'Fetal presentation — cephalic, breech, transverse or oblique',
      'Number of fetuses',
    ],
    calculation: 'Assign to one of ten groups. Every woman fits exactly one '
        'group, and no woman fits two.',
    interpretation: [
      ('Groups 1 and 2', 'Nulliparous, single cephalic term — the groups that '
          'drive the future caesarean rate'),
      ('Group 5', 'Previous caesarean, single cephalic term — usually the '
          'largest contributor in units with a high rate'),
      ('Groups 6 – 9', 'Breech, multiple pregnancy and abnormal lie — small '
          'groups with high rates'),
      ('Group 10', 'Preterm single cephalic'),
    ],
    limitations: [
      'It describes; it does not judge. A high rate in group 5 is expected, '
          'and the question is whether group 1 and 2 rates are driving it.',
      'It says nothing about indication or appropriateness.',
      'Requires complete and accurate data on every birth to be meaningful.',
    ],
    sources: [
      'Robson MS. Classification of caesarean sections. Fetal Matern Med Rev '
          '2001;12:23–39.',
      'WHO statement on caesarean section rates; WHO Robson classification '
          'implementation manual.',
      'FOGSI — caesarean audit recommendations.',
    ],
  ),

  // ── Gynaecological ───────────────────────────────────────────────────────
  ClinicalScore(
    id: 'score-fg',
    name: 'Ferriman-Gallwey',
    subtitle: 'Hirsutism scoring',
    category: ScoreCategory.gynaecological,
    toolId: 'pcos-assessment',
    purpose: 'Quantify hirsutism objectively, at diagnosis and to track '
        'response to treatment.',
    population: 'Derived in white European women; thresholds differ '
        'substantially by ethnicity.',
    inputs: ['Nine androgen-sensitive areas, each scored 0 to 4'],
    calculation: 'Sum of nine areas. Range 0 to 36.',
    interpretation: [
      ('8 or above', 'Hirsutism by the conventional cut-off'),
      ('6 or above', 'Often used in South Asian populations'),
      ('2 – 3 or above', 'East Asian populations'),
      ('15 or above', 'Severe hirsutism'),
    ],
    limitations: [
      'Hair density varies enough by population that one cut-off '
          'over-diagnoses some women and misses others. Record which '
          'threshold was applied.',
      'Meaningless after cosmetic hair removal — assess before.',
      'Subjective and moderately reproducible between observers.',
    ],
    sources: [
      'Ferriman D, Gallwey JD. J Clin Endocrinol Metab 1961;21:1440–1447.',
      'International PCOS Guideline, 2023.',
      'FOGSI-ICOG GCPR on PCOS.',
    ],
  ),
  ClinicalScore(
    id: 'score-popq',
    name: 'POP-Q',
    subtitle: 'Pelvic organ prolapse quantification',
    category: ScoreCategory.gynaecological,
    toolId: 'popq',
    purpose: 'Describe pelvic organ prolapse objectively and reproducibly, so '
        'that findings can be compared over time and between clinicians.',
    population: 'Women with symptomatic or suspected prolapse.',
    inputs: [
      'Six points relative to the hymen — Aa, Ba, C, D, Bp, Ap',
      'Genital hiatus, perineal body and total vaginal length',
    ],
    calculation: 'Stage from the most distal point. Negative values are above '
        'the hymen, positive below.',
    interpretation: [
      ('Stage 0', 'No prolapse'),
      ('Stage I', 'Leading edge more than 1 cm above the hymen'),
      ('Stage II', 'Within 1 cm above or below the hymen'),
      ('Stage III', 'More than 1 cm below the hymen, not fully everted'),
      ('Stage IV', 'Complete eversion'),
    ],
    limitations: [
      'Stage correlates poorly with symptoms — a stage II can be highly '
          'bothersome and a stage III barely noticed.',
      'Must be measured at maximum Valsalva; a resting examination '
          'understages.',
      'Point D is omitted after hysterectomy.',
    ],
    sources: [
      'Bump RC et al. Am J Obstet Gynecol 1996;175:10–17.',
      'IUGA/ICS joint report on terminology.',
      'NICE NG123.',
    ],
  ),
  ClinicalScore(
    id: 'score-pbac',
    name: 'PBAC',
    subtitle: 'Pictorial blood loss assessment chart',
    category: ScoreCategory.gynaecological,
    toolId: 'aub',
    purpose: 'Estimate menstrual blood loss semi-objectively.',
    population: 'Women reporting heavy menstrual bleeding.',
    inputs: ['Number and degree of staining of towels and tampons', 'Clots',
        'Flooding episodes'],
    calculation: 'Weighted count over one complete period. Towels score 1, 5 '
        'or 20; tampons 1, 5 or 10; small clots 1, large clots 5; flooding 5.',
    interpretation: [
      ('Above 100', 'Corresponds to a loss above 80 mL — heavy menstrual '
          'bleeding'),
      ('Above 185', 'Very heavy; check haemoglobin and ferritin'),
    ],
    limitations: [
      'Depends on product type and absorbency, which vary.',
      'NICE defines heavy menstrual bleeding by its impact on quality of '
          'life, not by measured volume — a woman whose life is disrupted '
          'deserves treatment whatever her score.',
      'Requires prospective recording over a full period.',
    ],
    sources: [
      'Higham JM et al. Br J Obstet Gynaecol 1990;97:734–739.',
      'NICE NG88; FOGSI GCPR — Abnormal Uterine Bleeding.',
    ],
  ),
  ClinicalScore(
    id: 'score-rasrm',
    name: 'rASRM endometriosis staging',
    subtitle: 'And the #Enzian complement',
    category: ScoreCategory.gynaecological,
    toolId: 'rasrm',
    purpose: 'Stage the anatomical extent of endometriosis found at surgery.',
    population: 'Women undergoing laparoscopy for endometriosis.',
    inputs: [
      'Peritoneal implants — size and depth',
      'Ovarian implants — size and depth, each side',
      'Ovarian adhesions — extent and density, each side',
      'Tubal adhesions — extent and density, each side',
      'Posterior cul-de-sac obliteration — partial or complete',
    ],
    calculation: 'Weighted point score summed across all sites. Total '
        'determines the stage.',
    interpretation: [
      ('1 – 5 · Stage I', 'Minimal'),
      ('6 – 15 · Stage II', 'Mild'),
      ('16 – 40 · Stage III', 'Moderate'),
      ('Above 40 · Stage IV', 'Severe'),
    ],
    limitations: [
      'Correlates POORLY with pain — a stage I can be agonising and a stage '
          'IV asymptomatic.',
      'Correlates only moderately with fertility; the Endometriosis Fertility '
          'Index predicts conception better.',
      'Does not describe deep infiltrating disease well — #Enzian was '
          'developed to complement it by compartment.',
      'Requires surgery, and ESHRE 2022 no longer requires surgery to '
          'diagnose or treat.',
    ],
    sources: [
      'American Society for Reproductive Medicine. Revised classification of '
          'endometriosis: 1996. Fertil Steril 1997;67:817–821.',
      'Keckstein J et al. #Enzian classification. Acta Obstet Gynecol Scand '
          '2021.',
      'ESHRE Endometriosis Guideline 2022; FOGSI GCPR — Endometriosis.',
    ],
  ),
  ClinicalScore(
    id: 'score-caprini',
    name: 'Caprini score',
    subtitle: 'VTE risk in gynaecological surgery',
    category: ScoreCategory.gynaecological,
    toolId: 'caprini',
    purpose: 'Stratify venous thromboembolism risk before gynaecological '
        'surgery and select prophylaxis.',
    population: 'Surgical patients. Validated across general and '
        'gynaecological surgery — NOT the tool for pregnancy, where the RCOG '
        'obstetric score applies.',
    inputs: [
      'Age, BMI',
      'Type and duration of surgery',
      'Malignancy',
      'Previous VTE and thrombophilia',
      'Immobility, sepsis, medical comorbidity',
      'Oestrogen therapy or pregnancy',
    ],
    calculation: 'Weighted sum of factors, each scoring 1, 2, 3 or 5 points.',
    interpretation: [
      ('0 – 1 · Very low', 'Early ambulation'),
      ('2 · Low', 'Mechanical prophylaxis'),
      ('3 – 4 · Moderate', 'Pharmacological or mechanical prophylaxis'),
      ('5 or above · High', 'Pharmacological prophylaxis, and consider '
          'extended duration after cancer surgery'),
    ],
    limitations: [
      'Do not use in pregnancy — use the RCOG Green-top 37a obstetric score.',
      'Derived largely in general surgical populations; validation in '
          'gynaecological oncology is more limited.',
      'Does not account for bleeding risk, which must be weighed separately.',
    ],
    sources: [
      'Caprini JA. Thrombosis risk assessment as a guide to quality patient '
          'care. Dis Mon 2005;51:70–78.',
      'ACOG Practice Bulletin 232 — Prevention of Venous Thromboembolism in '
          'Gynecologic Surgery.',
      'FOGSI GCPR — Thromboprophylaxis in Obstetrics and Gynaecology.',
    ],
  ),
  ClinicalScore(
    id: 'score-mrs',
    name: 'Menopause Rating Scale',
    subtitle: 'MRS — 11 items',
    category: ScoreCategory.gynaecological,
    toolId: 'mrs',
    purpose: 'Quantify menopausal symptom severity and track response to '
        'treatment.',
    population: 'Peri- and postmenopausal women. Validated internationally, '
        'including in Indian populations.',
    inputs: ['Eleven symptoms, each rated 0 (none) to 4 (very severe)'],
    calculation: 'Sum of eleven items, range 0 to 44. Three subscales: '
        'somato-vegetative, psychological and urogenital.',
    interpretation: [
      ('0 – 4', 'None or minimal'),
      ('5 – 8', 'Mild'),
      ('9 – 16', 'Moderate'),
      ('17 or above', 'Severe'),
    ],
    limitations: [
      'Self-rated, so it reflects distress as much as physiology.',
      'Does not distinguish menopausal symptoms from those of depression, '
          'thyroid disease or anaemia — all of which must be excluded.',
      'Change over time in one woman is more useful than comparison between '
          'women.',
    ],
    sources: [
      'Heinemann LAJ et al. The Menopause Rating Scale (MRS): a methodological '
          'review. Health Qual Life Outcomes 2004;2:45.',
      'Indian Menopause Society — clinical practice recommendations.',
      'NICE NG23.',
    ],
  ),
  ClinicalScore(
    id: 'score-rotterdam',
    name: 'Rotterdam criteria',
    subtitle: 'PCOS diagnosis',
    category: ScoreCategory.gynaecological,
    purpose: 'Diagnose polycystic ovary syndrome.',
    population: 'Women of reproductive age. NOT applicable within 8 years of '
        'menarche, where ultrasound must not be used.',
    inputs: [
      'Oligo-ovulation or anovulation',
      'Clinical or biochemical hyperandrogenism',
      'Polycystic ovarian morphology, or raised anti-Müllerian hormone in '
          'adults',
    ],
    calculation: 'Any TWO of the three, with other causes excluded.',
    interpretation: [
      ('Phenotype A', 'All three — worst metabolic profile'),
      ('Phenotype B', 'Hyperandrogenism with ovulatory dysfunction'),
      ('Phenotype C', 'Hyperandrogenism with polycystic morphology'),
      ('Phenotype D', 'Ovulatory dysfunction with polycystic morphology — '
          'mildest metabolically'),
    ],
    limitations: [
      'Ultrasound threshold rose to 20 follicles per ovary in 2023; using 12 '
          'over-diagnoses with modern transducers.',
      'Must exclude thyroid disease, hyperprolactinaemia, non-classical '
          'congenital adrenal hyperplasia, Cushing syndrome and '
          'androgen-secreting tumours first.',
      'Adolescents require BOTH hyperandrogenism and ovulatory dysfunction; '
          'ultrasound plays no part.',
    ],
    sources: [
      'Rotterdam ESHRE/ASRM-Sponsored PCOS Consensus Workshop Group. Fertil '
          'Steril 2004;81:19–25.',
      'International Evidence-Based Guideline for PCOS, 2023.',
      'FOGSI-ICOG GCPR on PCOS.',
    ],
  ),

  // ── Oncological ──────────────────────────────────────────────────────────
  ClinicalScore(
    id: 'score-ecog',
    name: 'ECOG performance status',
    subtitle: 'Fitness for cancer treatment',
    category: ScoreCategory.oncological,
    toolId: 'ecog',
    purpose: 'Describe functional status, to guide fitness for chemotherapy '
        'and surgery and to stratify trial populations.',
    population: 'Patients with malignancy.',
    inputs: ['A single observed grade, 0 to 5'],
    calculation: 'One number, assigned by observation and history.',
    interpretation: [
      ('0', 'Fully active, no restriction'),
      ('1', 'Restricted in strenuous activity; able to do light work'),
      ('2', 'Ambulatory and self-caring, but unable to work; up more than '
          'half of waking hours'),
      ('3', 'Limited self-care; confined to bed or chair more than half of '
          'waking hours'),
      ('4', 'Completely disabled; totally confined to bed or chair'),
      ('5', 'Dead'),
    ],
    limitations: [
      'Crude and subjective, with considerable inter-observer variation.',
      'Most chemotherapy trials enrol only 0–2, so evidence for treating '
          'status 3 and 4 is thin.',
      'Can improve substantially once cancer symptoms are palliated — a '
          'status taken at the worst moment may understate her fitness.',
    ],
    sources: [
      'Oken MM et al. Toxicity and response criteria of the Eastern '
          'Cooperative Oncology Group. Am J Clin Oncol 1982;5:649–655.',
      'National Cancer Grid of India — treatment guidelines.',
    ],
  ),
  ClinicalScore(
    id: 'score-rmi',
    name: 'Risk of Malignancy Index',
    subtitle: 'RMI, with IOTA and O-RADS',
    category: ScoreCategory.oncological,
    toolId: 'adnexal-mass',
    purpose: 'Stratify the risk that an adnexal mass is malignant, and decide '
        'referral to gynaecological oncology.',
    population: 'Women with an adnexal mass. Performs considerably better in '
        'postmenopausal than premenopausal women.',
    inputs: ['Ultrasound features score', 'Menopausal status', 'Serum CA-125'],
    calculation: 'RMI = U × M × CA-125. U is 0, 1 or 3 by the number of '
        'ultrasound features; M is 1 premenopausal, 3 postmenopausal.',
    interpretation: [
      ('200 or above', 'Refer to a gynaecological oncology centre'),
      ('Below 200', 'May be managed locally, with the clinical picture taken '
          'into account'),
    ],
    limitations: [
      'CA-125 is raised by endometriosis, fibroids, pelvic inflammatory '
          'disease, pregnancy and menstruation, so RMI performs poorly in '
          'premenopausal women.',
      'Half of early ovarian cancers have a normal CA-125.',
      'IOTA simple rules are inconclusive in about 20% of masses and then '
          'require an expert examiner.',
    ],
    sources: [
      'Jacobs I et al. Br J Obstet Gynaecol 1990;97:922–929.',
      'Timmerman D et al. IOTA simple rules. Ultrasound Obstet Gynecol '
          '2008;31:681–690.',
      'Andreotti RF et al. O-RADS. Radiology 2020;294:168–185.',
      'RCOG Green-top Guideline 62.',
    ],
  ),
  ClinicalScore(
    id: 'score-gtn',
    name: 'WHO prognostic score for GTN',
    subtitle: 'With FIGO anatomical stage',
    category: ScoreCategory.oncological,
    stagingId: 'figo-who-gtn',
    purpose: 'Separate low-risk from high-risk gestational trophoblastic '
        'neoplasia, and so decide single-agent versus multi-agent '
        'chemotherapy.',
    population: 'Women with gestational trophoblastic neoplasia.',
    inputs: [
      'Age',
      'Antecedent pregnancy',
      'Interval from the index pregnancy',
      'Pre-treatment serum hCG',
      'Largest tumour size including the uterus',
      'Site and number of metastases',
      'Previous failed chemotherapy',
    ],
    calculation: 'Weighted sum across eight factors, each scoring 0, 1, 2 or '
        '4.',
    interpretation: [
      ('0 – 6', 'Low risk — single-agent methotrexate or actinomycin-D'),
      ('7 or above', 'High risk — multi-agent chemotherapy, usually EMA-CO'),
    ],
    limitations: [
      'The score, not the anatomical stage, decides the regimen — a common '
          'point of confusion.',
      'Requires accurate hCG and imaging to be meaningful.',
      'Management should be at, or in discussion with, a trophoblastic '
          'disease centre.',
    ],
    sources: [
      'FIGO Oncology Committee. Int J Gynecol Obstet 2002;77:285–287.',
      'FOGSI GCPR — Gestational Trophoblastic Disease.',
      'National Cancer Grid of India.',
    ],
  ),
];
