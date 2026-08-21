import '../models/guideline.dart';

/// Guideline library (§54) and change tracker (§55).
const kGuidelines = <Guideline>[
  Guideline(
    id: 'nice-ng133',
    organisation: 'NICE',
    title: 'Hypertension in pregnancy: diagnosis and management',
    published: 'June 2019, updated April 2023',
    version: 'NG133',
    topic: 'Hypertensive disorders of pregnancy',
    source: 'nice.org.uk/guidance/ng133',
    keyRecommendations: [
      'Offer aspirin 75–150 mg daily from 12 weeks to women with one high or '
          'two moderate risk factors for pre-eclampsia.',
      'Treat sustained blood pressure of 140/90 or above — a change from the '
          'previous 150/100 threshold.',
      'Target 135/85 mmHg with treatment.',
      'Labetalol first line; nifedipine and methyldopa as alternatives.',
      'Offer placental growth factor-based testing to help rule out '
          'pre-eclampsia between 20 and 35 weeks.',
    ],
    changes: [
      GuidelineChange(
        topic: 'Treatment threshold for hypertension in pregnancy',
        previous: 'Treat at 150/100 mmHg; target below 150/100.',
        now: 'Treat at 140/90 mmHg; target 135/85.',
        whatChanged: 'The threshold to start antihypertensive treatment fell '
            'by 10 mmHg systolic and diastolic.',
        whyItMatters: 'The CHIPS trial showed tighter control reduced severe '
            'hypertension without increasing fetal growth restriction. Many '
            'women who were previously monitored are now treated.',
        source: 'NICE NG133 (2019); Magee LA et al. CHIPS, NEJM 2015',
        year: 2019,
      ),
    ],
  ),
  Guideline(
    id: 'figo-endometrial-2023',
    organisation: 'FIGO',
    title: 'FIGO staging of endometrial cancer: 2023',
    published: '2023',
    topic: 'Gynaecological oncology',
    source: 'Berek JS et al. Int J Gynecol Obstet 2023;162:383–394',
    keyRecommendations: [
      'Separate non-aggressive from aggressive histological types throughout '
          'the system.',
      'Substantial lymphovascular space invasion becomes Stage IIB in its own '
          'right.',
      'Molecular classification modifies stage in early disease — POLEmut '
          'confined to the uterus becomes Stage IAmPOLEmut; p53abn with '
          'myometrial invasion becomes Stage IICmp53abn.',
      'Record the molecular classification in all cases where available.',
    ],
    changes: [
      GuidelineChange(
        topic: 'Endometrial cancer staging',
        previous: 'FIGO 2009 staged on anatomical extent and depth of '
            'myometrial invasion alone.',
        now: 'FIGO 2023 incorporates histological type, lymphovascular space '
            'invasion and molecular classification.',
        whatChanged: 'Staging moved from a purely anatomical system to one '
            'that combines anatomy, histology and molecular biology.',
        whyItMatters: 'A pathology report without molecular classification '
            'cannot be staged to the current system. Some women are '
            'up-staged and some down-staged, which changes adjuvant treatment '
            'in both directions.',
        source: 'Berek JS et al. Int J Gynecol Obstet 2023;162:383',
        year: 2023,
      ),
    ],
  ),
  Guideline(
    id: 'who-lcg',
    organisation: 'WHO',
    title: 'WHO Labour Care Guide',
    published: '2020',
    topic: 'Intrapartum care',
    source: 'WHO Labour Care Guide: user\'s manual, 2020',
    keyRecommendations: [
      'Replaces the partograph with its alert and action lines.',
      'Records observations against reference thresholds that prompt '
          'assessment rather than automatic intervention.',
      'Abandons the 1 cm per hour rule — the active phase is now taken to '
          'begin at 5 cm, and progress varies widely between women.',
      'Supports respectful maternity care and companionship in labour as '
          'recorded elements.',
    ],
    changes: [
      GuidelineChange(
        topic: 'Monitoring progress in labour',
        previous: 'Partograph with alert and action lines, assuming cervical '
            'dilatation of at least 1 cm per hour from 4 cm.',
        now: 'Labour Care Guide, with the active phase beginning at 5 cm and '
            'no fixed rate of progress.',
        whatChanged: 'The 1 cm per hour standard was abandoned, and the '
            'threshold for active labour moved from 4 cm to 5 cm.',
        whyItMatters: 'Large numbers of caesareans and augmentations were '
            'performed for "slow progress" against a rate that most normal '
            'labours never achieve. Many apps and wall charts still use the '
            'old partograph.',
        source: 'WHO Labour Care Guide 2020; WHO recommendations on '
            'intrapartum care, 2018',
        year: 2020,
      ),
    ],
  ),
  Guideline(
    id: 'pcos-2023',
    organisation: 'International PCOS Network (ESHRE / ASRM / Monash)',
    title: 'International Evidence-Based Guideline for the Assessment and '
        'Management of Polycystic Ovary Syndrome',
    published: '2023',
    topic: 'Reproductive endocrinology',
    source: 'Teede HJ et al., 2023 update',
    keyRecommendations: [
      'Rotterdam criteria retained — any two of three, with other causes '
          'excluded.',
      'Ultrasound threshold for polycystic morphology raised to 20 follicles '
          'per ovary, or ovarian volume of 10 mL or more.',
      'Anti-Müllerian hormone may replace ultrasound in adults.',
      'Ultrasound must not be used for diagnosis within 8 years of menarche.',
      'Letrozole is first-line for ovulation induction.',
      'Oral glucose tolerance testing at diagnosis and every 1–3 years.',
    ],
    changes: [
      GuidelineChange(
        topic: 'Polycystic ovarian morphology on ultrasound',
        previous: '12 or more follicles of 2–9 mm per ovary.',
        now: '20 or more follicles per ovary, on a transducer of 8 MHz or '
            'above; or ovarian volume of 10 mL or more.',
        whatChanged: 'The follicle threshold rose from 12 to 20, and '
            'ultrasound was removed from the diagnosis in adolescents '
            'entirely.',
        whyItMatters: 'Modern high-frequency transducers count more follicles '
            'than the equipment on which the old threshold was derived. '
            'Applying 12 today over-diagnoses PCOS, particularly in young '
            'women with normal multifollicular ovaries.',
        source: 'International PCOS Guideline 2023',
        year: 2023,
      ),
      GuidelineChange(
        topic: 'First-line ovulation induction in PCOS',
        previous: 'Clomiphene citrate.',
        now: 'Letrozole.',
        whatChanged: 'Letrozole displaced clomiphene after fifty years as the '
            'first-line agent.',
        whyItMatters: 'Higher live birth rates and fewer multiple pregnancies. '
            'Clomiphene remains a reasonable second line where letrozole is '
            'unavailable.',
        source: 'Legro RS et al. NEJM 2014;371:119; International PCOS '
            'Guideline 2018 and 2023',
        year: 2018,
      ),
    ],
  ),
  Guideline(
    id: 'eshre-endometriosis-2022',
    organisation: 'ESHRE',
    title: 'ESHRE Guideline: Endometriosis',
    published: '2022',
    topic: 'Endometriosis',
    source: 'eshre.eu guideline on endometriosis, 2022',
    keyRecommendations: [
      'Laparoscopy is no longer required before starting empirical treatment.',
      'Imaging supports the diagnosis but a normal scan does not exclude '
          'superficial disease.',
      'Excision is preferred to ablation for deep disease.',
      'Counsel explicitly about the effect of endometrioma cystectomy on '
          'ovarian reserve.',
    ],
    changes: [
      GuidelineChange(
        topic: 'Diagnosis of endometriosis',
        previous: 'Laparoscopy with histological confirmation was the '
            'diagnostic gold standard, and was generally required before '
            'treatment.',
        now: 'Diagnosis may be made clinically, and treatment started, without '
            'laparoscopy.',
        whatChanged: 'Surgery moved from a diagnostic prerequisite to a '
            'therapeutic option.',
        whyItMatters: 'The average delay to diagnosis has been measured in '
            'years, much of it spent waiting for an operation. Empirical '
            'treatment can start at the first consultation.',
        source: 'ESHRE Endometriosis Guideline 2022; NICE NG73',
        year: 2022,
      ),
    ],
  ),
  Guideline(
    id: 'fda-pllr',
    organisation: 'US Food and Drug Administration',
    title: 'Pregnancy and Lactation Labeling Rule',
    published: 'Effective June 2015',
    topic: 'Drug safety in pregnancy',
    source: 'FDA PLLR final rule, 2014',
    keyRecommendations: [
      'Pregnancy letter categories A, B, C, D and X were withdrawn.',
      'Labelling now carries narrative risk summaries, clinical '
          'considerations and data sections.',
      'Separate sections for pregnancy, lactation, and females and males of '
          'reproductive potential.',
    ],
    changes: [
      GuidelineChange(
        topic: 'Pregnancy drug safety categories',
        previous: 'Letter categories A, B, C, D and X.',
        now: 'Narrative risk summaries with clinical considerations and the '
            'underlying data.',
        whatChanged: 'The letter system was abolished a decade ago.',
        whyItMatters: 'The letters implied a graded scale of risk that did not '
            'exist, and gave no guidance on what to actually do. Any '
            'reference still displaying "category C" is quoting a system the '
            'regulator abandoned in 2015.',
        source: 'FDA Pregnancy and Lactation Labeling Rule, 2015',
        year: 2015,
      ),
    ],
  ),
  Guideline(
    id: 'mtp-2021',
    organisation: 'Government of India',
    title: 'Medical Termination of Pregnancy (Amendment) Act and Rules',
    published: 'In force 24 September 2021',
    topic: 'Statute',
    region: GuidelineRegion.india,
    source: 'Act No. 8 of 2021; MTP (Amendment) Rules 2021',
    keyRecommendations: [
      'Up to 20 weeks — one registered medical practitioner.',
      '20 to 24 weeks — two practitioners, for women in the seven Rule 3B '
          'categories.',
      'Beyond 24 weeks — State Medical Board approval, for substantial fetal '
          'abnormality.',
      'Contraceptive failure now applies to any woman and her partner.',
      'Section 5A protects confidentiality, with a penalty of up to one year.',
    ],
    changes: [
      GuidelineChange(
        topic: 'Upper gestational limit for termination',
        previous: '20 weeks for all women; contraceptive failure applied only '
            'to a married woman and her husband.',
        now: '24 weeks for women in the seven Rule 3B categories; '
            'contraceptive failure applies to any woman and her partner.',
        whatChanged: 'The limit was extended for defined categories, and the '
            'marital restriction on the contraceptive failure ground was '
            'removed.',
        whyItMatters: 'Many anomalies are only detectable at the anomaly scan '
            'around 20 weeks, which left almost no time to act under the old '
            'limit. Unmarried women no longer need a different legal basis.',
        source: 'MTP (Amendment) Act 2021, Government of India',
        year: 2021,
      ),
    ],
  ),
  Guideline(
    id: 'moh-gdm',
    organisation: 'Ministry of Health & Family Welfare, Government of India',
    title: 'National Guidelines for Diagnosis and Management of Gestational '
        'Diabetes Mellitus',
    published: '2018',
    topic: 'Diabetes in pregnancy',
    region: GuidelineRegion.india,
    source: 'MoHFW National Guidelines on GDM; DIPSI criteria',
    keyRecommendations: [
      'Single-step 75 g oral glucose, given irrespective of the last meal.',
      'Two-hour plasma glucose of 140 mg/dL or above diagnoses gestational '
          'diabetes.',
      '200 mg/dL or above indicates diabetes in pregnancy rather than GDM.',
      'Test at the first antenatal contact and again at 24–28 weeks.',
      'Universal screening — not risk-factor based.',
    ],
    changes: [
      GuidelineChange(
        topic: 'GDM screening in India',
        previous: 'Two-step or fasting-based testing adapted from '
            'international criteria, requiring a fasting sample.',
        now: 'Single-step, non-fasting DIPSI test at the point of contact.',
        whatChanged: 'The requirement to fast was removed, and screening '
            'became universal.',
        whyItMatters: 'A woman who has walked to a clinic and been told to '
            'return fasting frequently does not return. The non-fasting test '
            'is completed at the visit she is already attending, which is why '
            'it is the national standard despite differing from IADPSG.',
        source: 'MoHFW National Guidelines for GDM, 2018; Seshiah V et al.',
        year: 2018,
      ),
    ],
  ),
];
