import '../../models/algorithm.dart';

const kPelvicPainAlgorithm = Algorithm(
  id: 'algo-pelvic-pain',
  name: 'Acute pelvic pain',
  subtitle: 'Exclude the four that kill or sterilise',
  callFor: 'Gynaecology registrar. Involve surgery early where the pain is '
      'right-sided and the pregnancy test is negative.',
  timeTarget: 'Pregnancy test within 15 minutes of arrival — it changes '
      'everything that follows.',
  immediate: [
    AlgoStep('URINE OR SERUM betahCG in every woman of reproductive age, '
        'without exception', critical: true),
    AlgoStep('Observations, and look specifically for shock'),
    AlgoStep('Large-bore access and cross-match if she is shocked or the '
        'pregnancy test is positive'),
    AlgoStep('Abdominal examination for peritonism'),
    AlgoStep('Bimanual and speculum — cervical excitation, adnexal mass, '
        'discharge'),
    AlgoStep('Bedside or urgent transvaginal ultrasound', critical: true),
    AlgoStep('attribute pain to a cyst on scan without excluding torsion and '
        'ectopic first', avoid: true),
  ],
  sections: [
    AlgoSection('1 · The four that must not be missed', [
      AlgoStep('ECTOPIC PREGNANCY — positive test, pain, an empty uterus. '
          'Kills.', critical: true),
      AlgoStep('OVARIAN TORSION — sudden severe unilateral pain, vomiting, an '
          'adnexal mass. Costs the ovary.', critical: true),
      AlgoStep('RUPTURED CYST WITH HAEMOPERITONEUM — sudden pain, free fluid, '
          'falling haemoglobin.', critical: true),
      AlgoStep('PELVIC SEPSIS — fever, tachycardia, offensive discharge, '
          'tubo-ovarian abscess. Costs fertility, and sometimes life.',
          critical: true),
    ]),
    AlgoSection('2 · History that discriminates', [
      AlgoStep('Onset: instantaneous suggests torsion, rupture or ectopic; '
          'gradual suggests infection or appendicitis'),
      AlgoStep('Last menstrual period and contraception'),
      AlgoStep('Vaginal discharge, dyspareunia, and sexual history'),
      AlgoStep('Recent ovulation induction or oocyte retrieval — think OHSS '
          'and torsion', critical: true),
      AlgoStep('Bowel and urinary symptoms'),
      AlgoStep('Cyclical pain suggests endometriosis'),
    ]),
    AlgoSection('3 · Investigations', [
      AlgoStep('betahCG, quantitative if positive'),
      AlgoStep('Full blood count, CRP, group and save'),
      AlgoStep('Midstream urine'),
      AlgoStep('Endocervical swabs for chlamydia and gonorrhoea'),
      AlgoStep('Transvaginal ultrasound with Doppler', critical: true),
      AlgoStep('CT where a surgical cause is likely and she is not pregnant'),
      AlgoStep('rely on Doppler flow to exclude torsion', avoid: true,
          detail: 'Flow is preserved in a large proportion of confirmed '
              'torsions because of the dual blood supply.'),
    ]),
    AlgoSection('4 · Non-gynaecological differential', [
      AlgoStep('Appendicitis — the commonest surgical mimic'),
      AlgoStep('Urinary tract infection and renal colic'),
      AlgoStep('Inflammatory bowel disease and diverticulitis'),
      AlgoStep('Irritable bowel syndrome'),
      AlgoStep('Musculoskeletal and abdominal wall pain — worse on tensing '
          'the abdomen'),
    ]),
    AlgoSection('5 · Management by cause', [
      AlgoStep('Positive test with an empty uterus — manage as ectopic until '
          'proven otherwise', critical: true),
      AlgoStep('Suspected torsion — theatre for laparoscopic detorsion. '
          'Untwist and conserve; do not remove a black ovary.',
          critical: true),
      AlgoStep('Haemoperitoneum with instability — theatre'),
      AlgoStep('Pelvic inflammatory disease — start antibiotics on clinical '
          'suspicion, before swab results', critical: true),
      AlgoStep('Tubo-ovarian abscess — antibiotics plus drainage'),
      AlgoStep('Simple cyst rupture, stable — analgesia and observation'),
    ]),
    AlgoSection('6 · Before discharge', [
      AlgoStep('If no cause is found and she is stable, arrange review rather '
          'than closing the episode', critical: true),
      AlgoStep('Give explicit return criteria'),
      AlgoStep('Repeat betahCG in 48 hours where a pregnancy of unknown '
          'location remains'),
      AlgoStep('Partner notification and contact tracing where an infection '
          'was found'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 62 — Management of Suspected Ovarian Masses in '
        'Premenopausal Women.',
    'BASHH UK national guideline for the management of pelvic inflammatory disease (RCOG Green-top 32 is archived).',
    'NICE NG126 — Ectopic pregnancy and miscarriage (this replaced the '
        'withdrawn CG154).',
    'FOGSI GCPR — Acute Abdomen in Gynaecology; NACO National Guidelines on '
        'RTI/STI management.',
  ],
);

const kAubAlgorithm = Algorithm(
  id: 'algo-aub',
  name: 'Heavy or abnormal uterine bleeding',
  subtitle: 'Acute stabilisation, then PALM-COEIN',
  callFor: 'Gynaecology registrar if she is shocked or bleeding briskly. '
      'Interventional radiology where bleeding is uncontrolled.',
  timeTarget: 'Resuscitate first. The cause can be established after she is '
      'haemodynamically stable.',
  immediate: [
    AlgoStep('Assess for shock — pulse, blood pressure, capillary refill',
        critical: true),
    AlgoStep('Two large-bore cannulae, cross-match, and activate major '
        'haemorrhage if she is unstable', critical: true),
    AlgoStep('betahCG — pregnancy complications present as heavy bleeding',
        critical: true),
    AlgoStep('Full blood count, coagulation screen, ferritin'),
    AlgoStep('Speculum — exclude a cervical or vaginal source, and a retained '
        'product or foreign body'),
    AlgoStep('Tranexamic acid 1 g intravenously for acute heavy bleeding'),
    AlgoStep('assume it is dysfunctional without examining the cervix',
        avoid: true,
        detail: 'Cervical cancer bleeds, and is missed exactly this way.'),
  ],
  sections: [
    AlgoSection('1 · Acute control', [
      AlgoStep('High-dose oral or intravenous progestogen, or combined oral '
          'contraceptive, to arrest bleeding'),
      AlgoStep('Tranexamic acid'),
      AlgoStep('Uterine tamponade with a balloon where bleeding is torrential'),
      AlgoStep('Examination under anaesthesia and curettage where medical '
          'measures fail'),
      AlgoStep('Uterine artery embolisation as an alternative to hysterectomy'),
      AlgoStep('Transfuse to symptoms and haemodynamics, not to a number'),
    ]),
    AlgoSection('2 · PALM — the structural causes', [
      AlgoStep('P — Polyp'),
      AlgoStep('A — Adenomyosis'),
      AlgoStep('L — Leiomyoma, subclassified 0 to 8 by FIGO'),
      AlgoStep('M — Malignancy and hyperplasia', critical: true),
      AlgoStep('These are found by imaging and histology'),
    ]),
    AlgoSection('3 · COEIN — the non-structural causes', [
      AlgoStep('C — Coagulopathy. Ask about heavy bleeding since menarche, '
          'postpartum haemorrhage, and dental or surgical bleeding — a '
          'substantial minority of women with heavy menstrual bleeding have '
          'von Willebrand disease', critical: true),
      AlgoStep('O — Ovulatory dysfunction, including PCOS and thyroid disease'),
      AlgoStep('E — Endometrial, a primary disorder of local haemostasis'),
      AlgoStep('I — Iatrogenic: anticoagulants, copper IUD, progestogens'),
      AlgoStep('N — Not otherwise classified'),
    ]),
    AlgoSection('4 · Investigation', [
      AlgoStep('Transvaginal ultrasound as the first-line imaging'),
      AlgoStep('Saline infusion sonography or hysteroscopy where the cavity '
          'is suspect'),
      AlgoStep('Endometrial biopsy where she is 45 or older, or younger with '
          'risk factors, failed treatment, or persistent intermenstrual '
          'bleeding', critical: true),
      AlgoStep('Thyroid function and coagulation screen where the history '
          'suggests it'),
      AlgoStep('Cervical screening up to date — and a smear is not a '
          'substitute for examining a visible lesion', critical: true),
    ]),
    AlgoSection('5 · Ongoing medical management', [
      AlgoStep('Levonorgestrel intrauterine system — most effective medical '
          'option, and first line where contraception is acceptable',
          critical: true),
      AlgoStep('Tranexamic acid on bleeding days'),
      AlgoStep('Mefenamic acid or another NSAID, particularly with '
          'dysmenorrhoea'),
      AlgoStep('Combined hormonal contraception'),
      AlgoStep('Oral progestogen days 5–26 — cyclical luteal-phase dosing is '
          'ineffective', critical: true),
      AlgoStep('GnRH analogue with add-back, short term, before surgery'),
      AlgoStep('Iron replacement — treat the anaemia, not only the bleeding',
          critical: true),
    ]),
    AlgoSection('6 · Surgical management', [
      AlgoStep('Hysteroscopic resection of a polyp or submucous fibroid'),
      AlgoStep('Endometrial ablation, where the family is complete and the '
          'cavity is normal'),
      AlgoStep('Uterine artery embolisation for fibroids'),
      AlgoStep('Myomectomy where fertility is to be preserved'),
      AlgoStep('Hysterectomy as the definitive option'),
      AlgoStep('Contraception is still required after ablation — pregnancy '
          'afterwards is dangerous', critical: true),
    ]),
  ],
  sources: [
    'NICE NG88 — Heavy menstrual bleeding: assessment and management.',
    'Munro MG et al. FIGO classification of causes of abnormal uterine '
        'bleeding (PALM-COEIN). Int J Gynaecol Obstet 2011;113:3–13.',
    'FOGSI GCPR — Abnormal Uterine Bleeding; ICOG Good Clinical Practice '
        'Recommendations on AUB.',
    'MoHFW National Guidelines, Anaemia Mukt Bharat.',
  ],
);

const kPmbAlgorithm = Algorithm(
  id: 'algo-pmb',
  name: 'Postmenopausal bleeding',
  subtitle: 'Cancer until proven otherwise',
  callFor: 'Refer on a suspected-cancer pathway at the first episode.',
  timeTarget: 'Seen within 2 weeks. Roughly one in ten will have endometrial '
      'cancer.',
  immediate: [
    AlgoStep('Treat the FIRST episode as significant — do not wait for a '
        'second', critical: true),
    AlgoStep('Speculum examination of cervix and vagina', critical: true),
    AlgoStep('Bimanual examination'),
    AlgoStep('Transvaginal ultrasound for endometrial thickness'),
    AlgoStep('Review medication — tamoxifen, HRT, anticoagulants'),
    AlgoStep('attribute bleeding to atrophy without imaging or sampling',
        avoid: true,
        detail: 'Atrophy is the commonest cause and the commonest wrong '
            'answer.'),
  ],
  sections: [
    AlgoSection('1 · Definition', [
      AlgoStep('Bleeding 12 months or more after the last period'),
      AlgoStep('Unscheduled bleeding on hormone replacement therapy counts'),
      AlgoStep('Any bleeding on tamoxifen counts, and needs hysteroscopy '
          'regardless of thickness', critical: true),
    ]),
    AlgoSection('2 · Endometrial thickness thresholds', [
      AlgoStep('4 mm or less on transvaginal ultrasound, not on HRT: risk of '
          'cancer is low', critical: true),
      AlgoStep('Above 4 mm: proceed to sampling'),
      AlgoStep('On sequential HRT, measure in the early proliferative phase'),
      AlgoStep('Thickness is unreliable with fibroids, adenomyosis, a previous '
          'ablation, or an unmeasurable endometrium — go straight to '
          'hysteroscopy', critical: true),
      AlgoStep('RECURRENT bleeding requires hysteroscopy whatever the '
          'thickness', critical: true),
    ]),
    AlgoSection('3 · Sampling', [
      AlgoStep('Outpatient pipelle biopsy first line'),
      AlgoStep('Hysteroscopy with directed biopsy where pipelle is '
          'insufficient, fails, or focal disease is suspected'),
      AlgoStep('A blind sample may miss a focal lesion — a negative pipelle '
          'in a woman who keeps bleeding is not an answer', critical: true),
    ]),
    AlgoSection('4 · Differential', [
      AlgoStep('Atrophic vaginitis and endometrial atrophy — the commonest'),
      AlgoStep('Endometrial polyp'),
      AlgoStep('Endometrial hyperplasia, with or without atypia'),
      AlgoStep('ENDOMETRIAL CARCINOMA', critical: true),
      AlgoStep('Cervical carcinoma — visible on speculum', critical: true),
      AlgoStep('Vulval or vaginal lesion'),
      AlgoStep('Hormone replacement therapy'),
      AlgoStep('Non-gynaecological: urinary or rectal bleeding mistaken for '
          'vaginal'),
    ]),
    AlgoSection('5 · Acting on the histology', [
      AlgoStep('Atrophy: topical oestrogen, and safety-net for recurrence'),
      AlgoStep('Polyp: hysteroscopic removal'),
      AlgoStep('Hyperplasia without atypia: levonorgestrel intrauterine '
          'system, with repeat sampling at 6 months'),
      AlgoStep('Atypical hyperplasia: hysterectomy, because a substantial '
          'proportion harbour concurrent carcinoma', critical: true),
      AlgoStep('Carcinoma: stage and refer to gynaecological oncology',
          critical: true),
    ]),
    AlgoSection('6 · Safety-netting', [
      AlgoStep('Tell her to return if bleeding recurs, whatever the result',
          critical: true),
      AlgoStep('Document that this was said'),
      AlgoStep('Re-investigate a recurrence rather than repeating the '
          'reassurance'),
    ]),
  ],
  sources: [
    'RCOG/BSGE Green-top Guideline 67 — Management of Endometrial Hyperplasia.',
    'NICE NG12 — Suspected cancer: recognition and referral.',
    'Timmermans A et al. Endometrial thickness measurement for detecting '
        'endometrial cancer: a meta-analysis. Obstet Gynecol 2010;116:160–167.',
    'FOGSI GCPR — Postmenopausal Bleeding; National Cancer Grid of India '
        'guidelines, endometrial cancer.',
  ],
);

const kOhssAlgorithm = Algorithm(
  id: 'algo-ohss',
  name: 'Ovarian hyperstimulation syndrome',
  subtitle: 'An iatrogenic illness that can kill',
  callFor: 'The treating fertility unit, and a physician for severe disease. '
      'Critical care for the critical grade.',
  timeTarget: 'Daily review in moderate disease. Severe disease is an '
      'admission, not an outpatient problem.',
  immediate: [
    AlgoStep('Ask about recent ovulation induction or oocyte retrieval — '
        'without this the diagnosis is missed', critical: true),
    AlgoStep('Weight, abdominal girth, urine output', critical: true),
    AlgoStep('Full blood count for haematocrit, urea and electrolytes, '
        'albumin, liver function'),
    AlgoStep('Ultrasound for ovarian size and ascites'),
    AlgoStep('betahCG — pregnancy prolongs and worsens the illness',
        critical: true),
    AlgoStep('Thromboprophylaxis with low-molecular-weight heparin',
        critical: true),
    AlgoStep('drain ascites by the transabdominal route in a woman with '
        'enormous ovaries', avoid: true,
        detail: 'Prefer the transvaginal route. The ovaries are fragile and '
            'bleed.'),
    AlgoStep('give diuretics for the ascites', avoid: true,
        detail: 'She is intravascularly depleted. Diuretics worsen '
            'haemoconcentration and thrombotic risk.'),
  ],
  sections: [
    AlgoSection('1 · Grading', [
      AlgoStep('MILD: abdominal bloating, ovaries under 8 cm'),
      AlgoStep('MODERATE: ascites on ultrasound, ovaries 8–12 cm, vomiting'),
      AlgoStep('SEVERE: clinical ascites, oliguria, haematocrit above 45%, '
          'albumin below 35 g/L, ovaries over 12 cm', critical: true),
      AlgoStep('CRITICAL: tense ascites, haematocrit above 55%, white cells '
          'above 25 000, anuria, thromboembolism, ARDS', critical: true),
    ]),
    AlgoSection('2 · Who is at risk', [
      AlgoStep('Polycystic ovary syndrome'),
      AlgoStep('Young age and low body mass index'),
      AlgoStep('High antral follicle count or anti-Mullerian hormone'),
      AlgoStep('Previous OHSS'),
      AlgoStep('High oestradiol and a large number of follicles or oocytes'),
      AlgoStep('hCG used for trigger or for luteal support', critical: true),
      AlgoStep('Pregnancy, especially multiple, prolongs the illness'),
    ]),
    AlgoSection('3 · Prevention', [
      AlgoStep('Antagonist protocol rather than agonist in high responders'),
      AlgoStep('GnRH agonist trigger instead of hCG', critical: true),
      AlgoStep('Freeze all embryos and defer transfer'),
      AlgoStep('Cabergoline from the day of trigger'),
      AlgoStep('Individualised gonadotrophin dosing'),
      AlgoStep('Metformin in women with PCOS'),
    ]),
    AlgoSection('4 · Management — mild and moderate', [
      AlgoStep('Manage as an outpatient with daily or alternate-day review'),
      AlgoStep('Oral fluids to thirst, and record the weight daily'),
      AlgoStep('Paracetamol; avoid NSAIDs where renal function is threatened'),
      AlgoStep('Warn her the illness can escalate — give clear return '
          'criteria', critical: true),
      AlgoStep('Thromboprophylaxis where there is any additional risk factor'),
    ]),
    AlgoSection('5 · Management — severe and critical', [
      AlgoStep('Admit', critical: true),
      AlgoStep('Crystalloid to restore circulating volume; human albumin '
          'where oliguria persists'),
      AlgoStep('Strict fluid balance and daily weight'),
      AlgoStep('Low-molecular-weight heparin for every inpatient',
          critical: true),
      AlgoStep('Transvaginal paracentesis for tense ascites or oliguria'),
      AlgoStep('Thoracentesis for a symptomatic pleural effusion'),
      AlgoStep('Critical care for the critical grade'),
      AlgoStep('Watch for ovarian torsion — sudden severe pain in enlarged '
          'ovaries', critical: true),
    ]),
    AlgoSection('6 · Resolution and follow-up', [
      AlgoStep('Without pregnancy, resolves as hCG falls, over 7–10 days'),
      AlgoStep('With pregnancy, may persist for weeks'),
      AlgoStep('Continue thromboprophylaxis into the first trimester where '
          'the disease was severe — thrombosis has occurred weeks later',
          critical: true),
      AlgoStep('Plan a different stimulation protocol next cycle'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 5 — Ovarian Hyperstimulation Syndrome, '
        'Management.',
    'ESHRE guideline — Ovarian Stimulation for IVF/ICSI.',
    'Practice Committee, ASRM. Prevention and treatment of moderate and '
        'severe OHSS. Fertil Steril 2016;106:1634–1647.',
    'ICMR National Guidelines for Accreditation, Supervision and Regulation '
        'of ART Clinics in India; ART (Regulation) Act 2021; ISAR practice '
        'recommendations.',
  ],
);
