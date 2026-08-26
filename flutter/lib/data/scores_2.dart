import '../models/clinical_score.dart';

/// Spec §51 — the score families the library was still missing: sepsis
/// screening, pelvic pain, sexual function, urinary symptoms, and the
/// adnexal risk models beyond RMI.
const kScores2 = <ClinicalScore>[
  ClinicalScore(
    id: 'score-omqsofa',
    name: 'Obstetrically modified qSOFA',
    subtitle: 'Bedside sepsis screening in pregnancy',
    category: ScoreCategory.obstetric,
    purpose: 'Identify, at the bedside and without blood tests, the pregnant '
        'or recently pregnant woman with suspected infection who is at risk '
        'of deterioration.',
    population: 'Pregnant and postpartum women with suspected infection. '
        'Modified from the general qSOFA because normal pregnancy shifts '
        'blood pressure and respiratory rate, so the unmodified thresholds '
        'flag healthy women and miss sick ones.',
    inputs: [
      'Systolic blood pressure below 90 mmHg',
      'Respiratory rate 25 breaths per minute or more',
      'Altered mentation — any reduction in alertness',
    ],
    calculation: 'One point for each criterion present. Maximum 3.',
    interpretation: [
      ('0', 'Lower risk. Continue to reassess — a single normal score does '
          'not exclude sepsis'),
      ('1', 'Escalate to senior review and start investigations'),
      ('2 or more', 'High risk of poor outcome. Senior obstetric and critical '
          'care review, and the sepsis six within the hour'),
    ],
    limitations: [
      'A screening tool, not a diagnosis. It does not define sepsis and must '
          'not be used to withhold treatment from a woman who looks unwell.',
      'Derived and validated largely in high-income intensive care and '
          'obstetric populations; performance in low-resource settings is '
          'less well established.',
      'Poor sensitivity early in the illness — a score of 0 in a woman with '
          'suspected infection still needs review and repeat assessment.',
      'Altered mentation is subjective and is the criterion most often '
          'missed.',
      'It does not replace a full early warning score such as MEOWS.',
    ],
    sources: [
      'Bowyer L et al. SOMANZ guidelines for the investigation and management '
          'of sepsis in pregnancy. Aust N Z J Obstet Gynaecol 2017;57:540–551.',
      'Singer M et al. Sepsis-3 definitions. JAMA 2016;315:801–810.',
      'RCOG Green-top Guidelines 64a and 64b — Bacterial Sepsis in Pregnancy '
          'and Following Pregnancy.',
      'NICE NG51 — Sepsis: recognition, diagnosis and early management.',
      'FOGSI GCPR — Maternal Sepsis; MoHFW guidance on maternal sepsis under '
          'the LaQshya programme.',
    ],
  ),
  ClinicalScore(
    id: 'score-iciq-ui',
    name: 'ICIQ-UI Short Form',
    subtitle: 'Urinary incontinence symptoms and their impact',
    category: ScoreCategory.gynaecological,
    purpose: 'Measure the frequency and volume of urinary leakage and the '
        'impact it has on daily life, and track change after treatment.',
    population: 'Adults with urinary incontinence. Validated across a wide '
        'range of settings and languages, with published translations '
        'including several Indian languages.',
    inputs: [
      'How often urine leaks — never through to all the time (0–5)',
      'How much urine leaks each time — none through to a large amount '
          '(0, 2, 4, 6)',
      'How much the leaking interferes with everyday life — 0 to 10',
      'A fourth question on when leakage occurs, which is descriptive and '
          'not scored',
    ],
    calculation: 'Sum of the first three items. Range 0 to 21. The fourth '
        'item classifies the type — stress, urgency, mixed or other — and '
        'carries no score.',
    interpretation: [
      ('1–5', 'Slight'),
      ('6–12', 'Moderate'),
      ('13–18', 'Severe'),
      ('19–21', 'Very severe'),
      ('Change', 'A reduction of about 4 points is generally taken as '
          'clinically meaningful'),
    ],
    limitations: [
      'Self-reported, so it measures what she is willing to report — under '
          'reporting is common where incontinence carries stigma.',
      'The severity bands describe symptom burden, not the underlying '
          'diagnosis; it does not distinguish cause.',
      'The impact question conflates several dimensions of quality of life.',
      'It cannot replace a bladder diary, examination, or urodynamics where '
          'those are indicated.',
      'Use the validated translation for the language she speaks; ad hoc '
          'translation invalidates the score.',
    ],
    sources: [
      'Avery K et al. ICIQ: a brief and robust measure for evaluating the '
          'symptoms and impact of urinary incontinence. Neurourol Urodyn '
          '2004;23:322–330.',
      'International Consultation on Incontinence — ICIQ modules.',
      'NICE NG123 — Urinary incontinence and pelvic organ prolapse in women.',
      'Urogynecological Society of India guidance on assessment of urinary '
          'incontinence; validated Hindi and regional-language ICIQ-UI SF '
          'translations.',
    ],
  ),
  ClinicalScore(
    id: 'score-fsfi',
    name: 'Female Sexual Function Index',
    subtitle: 'FSFI — six domains of sexual function',
    category: ScoreCategory.gynaecological,
    purpose: 'Assess sexual function across desire, arousal, lubrication, '
        'orgasm, satisfaction and pain, and measure change with treatment.',
    population: 'Adult women. Derived in women with and without female sexual '
        'arousal disorder. It asks about the past four weeks, so it is not '
        'valid in a woman who has not been sexually active in that period.',
    inputs: [
      'Desire — 2 items',
      'Arousal — 4 items',
      'Lubrication — 4 items',
      'Orgasm — 3 items',
      'Satisfaction — 3 items',
      'Pain — 3 items',
    ],
    calculation: 'Nineteen items. Each domain score is the sum of its items '
        'multiplied by a domain factor; the full-scale score is the sum of '
        'the six domain scores, from 2 to 36.',
    interpretation: [
      ('26.55 or below', 'The commonly cited cut-off for sexual dysfunction '
          '(Wiegel 2005)'),
      ('Domain scores', 'Read individually — a low pain domain with normal '
          'desire points somewhere quite different from the reverse'),
      ('Higher totals', 'Better function'),
    ],
    limitations: [
      'Not validated in women who have not been sexually active in the past '
          'four weeks; the scoring produces a spuriously low result.',
      'Assumes a partner and, in places, heterosexual activity, so it fits '
          'some women poorly.',
      'A score is not a diagnosis — sexual dysfunction requires associated '
          'distress.',
      'Cultural context strongly affects reporting; use a validated '
          'translation and interpret with care.',
      'It measures function, not the relationship, coercion, or safety — ask '
          'about those separately.',
    ],
    sources: [
      'Rosen R et al. The Female Sexual Function Index. J Sex Marital Ther '
          '2000;26:191–208.',
      'Wiegel M et al. FSFI cross-validation and diagnostic cut-off scores. '
          'J Sex Marital Ther 2005;31:1–20.',
      'ISSWSH and ACOG guidance on female sexual dysfunction; ACOG Practice '
          'Bulletin 213 — Female Sexual Dysfunction.',
      'Validated Hindi and regional-language FSFI translations; Indian '
          'Journal of Psychiatry guidelines on sexual dysfunction assessment.',
    ],
  ),
  ClinicalScore(
    id: 'score-ehp30',
    name: 'Endometriosis Health Profile-30',
    subtitle: 'EHP-30 — pain and its cost, measured',
    category: ScoreCategory.gynaecological,
    purpose: 'Measure the health-related quality of life of women with '
        'endometriosis, so that pelvic pain is tracked as something other '
        'than a number out of ten.',
    population: 'Women with diagnosed endometriosis. Developed from '
        'interviews with affected women rather than from clinician opinion, '
        'which is why it captures domains a pain score does not.',
    inputs: [
      'Core questionnaire, 30 items across five scales: pain, control and '
          'powerlessness, emotional wellbeing, social support, self-image',
      'Modular questionnaire, 23 items: work, relationship with children, '
          'sexual intercourse, medical profession, treatment, infertility',
    ],
    calculation: 'Each scale is scored 0 to 100, where 0 is the best possible '
        'and 100 the worst. Scales are reported separately; there is no '
        'single total.',
    interpretation: [
      ('0', 'Best possible health status on that scale'),
      ('100', 'Worst possible health status on that scale'),
      ('Scale by scale', 'Read separately — control and powerlessness often '
          'moves when pain does not'),
      ('Change', 'Useful for tracking an individual over time and for trial '
          'endpoints'),
    ],
    limitations: [
      'Long for routine clinic use; EHP-5 exists as a short form.',
      'Developed in women with a laparoscopic diagnosis, so it does not fit '
          'undiagnosed chronic pelvic pain.',
      'It measures impact, not disease extent — and in endometriosis the two '
          'correlate poorly, which is the point.',
      'Requires a validated translation for the language she speaks.',
      'It does not by itself distinguish endometriosis pain from other '
          'causes of chronic pelvic pain.',
    ],
    sources: [
      'Jones G, Kennedy S, Barnard A, Wong J, Jenkinson C. Development of an '
          'endometriosis quality-of-life instrument: the Endometriosis Health '
          'Profile-30. Obstet Gynecol 2001;98:258–264.',
      'Jones G et al. The Endometriosis Health Profile-5. Qual Life Res '
          '2004;13:695–704.',
      'ESHRE guideline — Endometriosis, 2022.',
      'FOGSI-ICOG Good Clinical Practice Recommendations on Endometriosis.',
    ],
  ),
  ClinicalScore(
    id: 'score-roma',
    name: 'Risk of Ovarian Malignancy Algorithm',
    subtitle: 'ROMA — HE4 and CA-125 with menopausal status',
    category: ScoreCategory.oncological,
    purpose: 'Stratify the risk that an adnexal mass is epithelial ovarian '
        'cancer, using two markers rather than one.',
    population: 'Women with an adnexal mass planned for surgery. Separate '
        'cut-offs apply before and after the menopause.',
    inputs: [
      'Serum CA-125',
      'Serum HE4',
      'Menopausal status',
    ],
    calculation: 'A predictive index combining the logarithms of HE4 and '
        'CA-125, with different coefficients before and after the menopause, '
        'converted to a predicted probability. Calculated by the assay '
        'platform rather than by hand.',
    interpretation: [
      ('Premenopausal, 11.4% or above', 'High risk of epithelial ovarian '
          'cancer'),
      ('Postmenopausal, 29.9% or above', 'High risk of epithelial ovarian '
          'cancer'),
      ('Below the cut-off', 'Low risk — but the clinical and ultrasound '
          'picture still governs'),
      ('Cut-offs', 'Assay-specific; use the ones your laboratory reports'),
    ],
    limitations: [
      'HE4 is not universally available and adds cost, which matters where '
          'testing is paid for out of pocket.',
      'HE4 rises with age and in renal impairment, and falls in pregnancy.',
      'Performs poorly for non-epithelial tumours — germ cell and sex '
          'cord-stromal cancers are missed.',
      'Not validated for screening an asymptomatic population.',
      'Head-to-head studies have not consistently shown ROMA to outperform '
          'IOTA ultrasound-based models in expert hands.',
    ],
    sources: [
      'Moore RG et al. A novel multiple marker bioassay utilizing HE4 and '
          'CA125 for the prediction of ovarian cancer. Gynecol Oncol '
          '2009;112:40–46.',
      'Moore RG et al. Comparison of ROMA with RMI. Obstet Gynecol '
          '2011;118:280–288.',
      'RCOG Green-top Guideline 62 — Management of Suspected Ovarian Masses '
          'in Premenopausal Women.',
      'National Cancer Grid of India — resource-stratified guidelines for '
          'ovarian cancer; ICMR consensus document for management of ovarian '
          'cancer.',
    ],
  ),
  ClinicalScore(
    id: 'score-iota-adnex',
    name: 'IOTA ADNEX',
    subtitle: 'Ultrasound model separating five outcomes',
    category: ScoreCategory.oncological,
    toolId: 'adnexal-mass',
    purpose: 'Estimate the probability that an adnexal mass is benign, '
        'borderline, stage I invasive, stage II–IV invasive, or metastatic — '
        'rather than a single benign-or-malignant answer.',
    population: 'Women with an adnexal mass on ultrasound. Developed and '
        'externally validated in large multicentre cohorts across many '
        'countries.',
    inputs: [
      'Age',
      'Serum CA-125 (optional — the model runs with or without it)',
      'Type of centre — oncology referral centre or not',
      'Maximum lesion diameter',
      'Maximum diameter of the largest solid part',
      'More than 10 cyst locules',
      'Number of papillary projections',
      'Acoustic shadows',
      'Ascites',
    ],
    calculation: 'A multinomial logistic regression returning a probability '
        'for each of the five outcomes, summing to 100%. Computed by the '
        'published calculator, not by hand.',
    interpretation: [
      ('Probability of malignancy below 10%', 'Generally managed '
          'conservatively or by a general gynaecologist'),
      ('10% or above', 'Discuss at a gynaecological oncology '
          'multidisciplinary meeting'),
      ('Separate outcomes', 'The value of ADNEX is distinguishing borderline '
          'and stage I disease, where fertility-sparing surgery may be '
          'possible'),
      ('Simple Rules', 'A quicker alternative — five benign and five '
          'malignant features; inconclusive in around 20%'),
    ],
    limitations: [
      'Operator-dependent. It assumes ultrasound performed and interpreted '
          'to IOTA standards.',
      'Not applicable in pregnancy.',
      'Not for masses already known to be malignant, or for screening.',
      'The centre-type variable means the same mass scores differently in '
          'different units, which is intended but often misunderstood.',
      'Performance for rare tumour types is based on small numbers.',
    ],
    sources: [
      'Van Calster B et al. Evaluating the risk of ovarian cancer before '
          'surgery using the ADNEX model. BMJ 2014;349:g5920.',
      'Timmerman D et al. IOTA simple rules. Ultrasound Obstet Gynecol '
          '2008;31:681–690.',
      'Timmerman D et al. ESGO/ISUOG/IOTA/ESGE consensus statement on '
          'pre-operative diagnosis of ovarian tumours. Ultrasound Obstet '
          'Gynecol 2021;58:148–168.',
      'RCOG Green-top Guideline 62; National Cancer Grid of India ovarian '
          'cancer guidelines.',
    ],
  ),
];
