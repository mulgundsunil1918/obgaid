import '../../models/drug.dart';

const kAspirin = Drug(
  id: 'aspirin',
  generic: 'Aspirin (low dose)',
  drugClass: 'Antiplatelet · irreversible COX inhibitor',
  mechanism: 'Irreversibly acetylates cyclo-oxygenase-1 in platelets, '
      'suppressing thromboxane A2 for the life of the platelet. In pregnancy '
      'this shifts the thromboxane–prostacyclin balance that is deranged in '
      'pre-eclampsia.',
  indications: [
    'Prevention of preterm pre-eclampsia in women at risk',
    'Prevention of fetal growth restriction in placental disease',
    'Antiphospholipid syndrome, with heparin',
  ],
  doses: [
    DrugDose(
      indication: 'Pre-eclampsia prophylaxis',
      dose: '150 mg',
      route: 'Oral',
      frequency: 'Once daily at night',
      notes: 'Start from 12 weeks and certainly before 16, and continue to 36 '
          'weeks. Night-time dosing is more effective than morning. The '
          'window closes at 16 weeks — after that the benefit largely '
          'disappears.',
    ),
    DrugDose(
      indication: 'Antiphospholipid syndrome',
      dose: '75–150 mg',
      route: 'Oral',
      frequency: 'Once daily, with low-molecular-weight heparin',
    ),
  ],
  contraindications: [
    'Aspirin hypersensitivity, including aspirin-exacerbated respiratory '
        'disease',
    'Active peptic ulceration',
    'Severe hepatic or renal impairment',
    'Bleeding disorder',
  ],
  warnings: [
    'The 16-week window matters more than the dose. Started late, it does '
        'little.',
    'It does not need stopping before delivery or before regional anaesthesia '
        'at these doses.',
  ],
  adverseEffects: [
    'Dyspepsia',
    'Minor bleeding and bruising',
    'Gastrointestinal haemorrhage (uncommon at this dose)',
  ],
  interactions: [
    'NSAIDs compete for the COX-1 site and may blunt the antiplatelet effect.',
    'Anticoagulants increase bleeding risk — usually an accepted combination '
        'in antiphospholipid syndrome.',
  ],
  monitoring: [
    'No routine laboratory monitoring at prophylactic dose',
    'Ask about bleeding and dyspepsia at antenatal visits',
  ],
  pregnancy: DrugSafety(
    summary: 'Low-dose aspirin is recommended in pregnancy, not merely '
        'tolerated. The ASPRE trial showed a 62% reduction in preterm '
        'pre-eclampsia in screen-positive women.',
    points: [
      'No increase in congenital malformation at prophylactic doses.',
      'High analgesic doses in the third trimester are a different matter — '
          'they risk premature ductal closure and are avoided.',
    ],
    source: 'Rolnik DL et al. ASPRE trial, N Engl J Med 2017;377:613.',
  ),
  lactation: DrugSafety(
    summary: 'Low doses are compatible. Analgesic doses are best avoided '
        'because of the theoretical association with Reye syndrome and '
        'reported platelet effects in infants.',
    source: 'LactMed.',
  ),
  references: [
    'Rolnik DL et al. N Engl J Med 2017;377:613–622.',
    'NICE NG133 — Hypertension in pregnancy.',
    'ACOG Practice Advisory — Low-Dose Aspirin Use for the Prevention of '
        'Preeclampsia.',
  ],
);

const kEnoxaparin = Drug(
  id: 'enoxaparin',
  generic: 'Enoxaparin',
  brandNames: ['Clexane', 'Lovenox'],
  drugClass: 'Low-molecular-weight heparin',
  mechanism: 'Binds antithrombin and accelerates inactivation of factor Xa, '
      'with less effect on thrombin than unfractionated heparin. It is a large '
      'molecule and does not cross the placenta.',
  indications: [
    'Thromboprophylaxis in pregnancy and the puerperium',
    'Treatment of venous thromboembolism in pregnancy',
    'Antiphospholipid syndrome with recurrent loss, alongside aspirin',
  ],
  doses: [
    DrugDose(
      indication: 'Thromboprophylaxis — by booking weight',
      dose: 'Under 50 kg: 20 mg · 50–90 kg: 40 mg · 91–130 kg: 60 mg · '
          '131–170 kg: 80 mg · over 170 kg: 0.6 mg/kg',
      route: 'Subcutaneous',
      frequency: 'Once daily',
      notes: 'Dose by early-pregnancy weight, not by current weight.',
    ),
    DrugDose(
      indication: 'Treatment of venous thromboembolism',
      dose: '1 mg/kg',
      route: 'Subcutaneous',
      frequency: 'Twice daily',
      notes: 'Twice-daily dosing is preferred in pregnancy because clearance '
          'is increased.',
    ),
  ],
  preparation: 'Pre-filled syringes of 20, 40, 60, 80 and 100 mg.',
  doseAdjustments: [
    'Creatinine clearance below 30 mL/min: reduce dose and consider anti-Xa '
        'monitoring.',
    'Extremes of weight: consider anti-Xa levels, though routine monitoring is '
        'not recommended.',
  ],
  contraindications: [
    'Active major bleeding',
    'Known heparin-induced thrombocytopenia',
    'Severe thrombocytopenia',
    'Acute bacterial endocarditis',
    'Within the exclusion windows for regional anaesthesia',
  ],
  warnings: [
    'REGIONAL ANAESTHESIA TIMING — 12 hours after a prophylactic dose, 24 '
        'hours after a therapeutic dose. Do not remove an epidural catheter '
        'within 12 hours of a dose, and wait at least 4 hours after removal '
        'before the next.',
    'Stop at the onset of labour or 24 hours before a planned caesarean.',
    'Restart 4–6 hours after vaginal birth and 6–12 hours after caesarean.',
  ],
  adverseEffects: [
    'Injection-site bruising — very common',
    'Bleeding',
    'Heparin-induced thrombocytopenia (rare with LMWH)',
    'Osteoporosis with very prolonged use (much less than with unfractionated '
        'heparin)',
    'Hyperkalaemia',
  ],
  interactions: [
    'Antiplatelet agents and NSAIDs increase bleeding risk.',
    'Other anticoagulants — avoid overlap except on specialist advice.',
  ],
  monitoring: [
    'Platelet count at baseline; routine monitoring is unnecessary unless '
        'there has been prior unfractionated heparin exposure',
    'Renal function',
    'Anti-Xa levels only at extremes of weight or in renal impairment',
  ],
  pregnancy: DrugSafety(
    summary: 'The anticoagulant of choice in pregnancy. It does not cross the '
        'placenta, and there is no evidence of teratogenicity or of fetal '
        'bleeding.',
    points: [
      'Warfarin is teratogenic in the first trimester and crosses the '
          'placenta; it is reserved for mechanical heart valves after '
          'specialist discussion.',
      'Direct oral anticoagulants are not recommended in pregnancy.',
    ],
    source: 'RCOG Green-top Guidelines 37a and 37b.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. It is not secreted in milk in meaningful amounts and '
        'would not be absorbed orally by the infant in any case.',
    source: 'LactMed.',
  ),
  antidote: 'Protamine sulphate reverses roughly 60% of the anti-Xa activity. '
      '1 mg protamine per 1 mg enoxaparin given in the preceding 8 hours.',
  perioperative: 'Omit the dose on the morning of surgery. Restart 6–12 hours '
      'postoperatively once haemostasis is secure.',
  references: [
    'RCOG Green-top Guideline 37a — Reducing the Risk of Venous '
        'Thromboembolism during Pregnancy and the Puerperium.',
    'RCOG Green-top Guideline 37b — Acute Management.',
    'Obstetric Anaesthetists Association guidance on regional anaesthesia and '
        'anticoagulation.',
  ],
);

const kBetamethasone = Drug(
  id: 'antenatal-corticosteroids',
  generic: 'Betamethasone / Dexamethasone (antenatal)',
  drugClass: 'Corticosteroid — for fetal lung maturation',
  mechanism: 'Crosses the placenta and accelerates type II pneumocyte '
      'maturation and surfactant production, alongside effects on the fetal '
      'gut, gut vasculature and cerebral vasculature.',
  indications: [
    'Anticipated preterm birth between 24 and 34 weeks',
    'Consider from 22 weeks where active neonatal care is planned',
    'Consider up to 36 weeks where preterm birth is imminent',
    'Before elective caesarean before 39 weeks',
  ],
  doses: [
    DrugDose(
      indication: 'Betamethasone',
      dose: '12 mg',
      route: 'Intramuscular',
      frequency: 'Two doses, 24 hours apart',
    ),
    DrugDose(
      indication: 'Dexamethasone',
      dose: '6 mg',
      route: 'Intramuscular',
      frequency: 'Four doses, 12 hours apart',
      notes: 'Equivalent in effect and more widely available in India.',
    ),
  ],
  doseAdjustments: [
    'A single repeat course only if the first was over 7 days ago, gestation '
        'remains below 34 weeks, and delivery is likely within a week.',
  ],
  contraindications: [
    'Active untreated systemic infection, including tuberculosis — relative, '
        'and weighed against the benefit',
    'Chorioamnionitis — deliver rather than delay for steroids',
  ],
  warnings: [
    'Maximum benefit falls between 24 hours and 7 days after the course. Do '
        'not delay a necessary delivery to complete it.',
    'Repeated courses are associated with reduced birth weight and head '
        'circumference.',
    'Glycaemic control in diabetes will be disrupted for 24–48 hours — '
        'anticipate it rather than react to it.',
  ],
  adverseEffects: [
    'Maternal hyperglycaemia',
    'Transient maternal leucocytosis — do not mistake it for infection',
    'Transient reduction in fetal movements and fetal heart rate variability '
        'for 24–48 hours',
    'Pulmonary oedema when combined with tocolysis and fluid loading',
  ],
  interactions: [
    'Beta-agonist tocolytics plus steroids raise the risk of pulmonary oedema.',
    'Insulin requirements rise sharply and temporarily.',
  ],
  monitoring: [
    'Capillary glucose four-hourly for 24–48 hours in diabetic women',
    'Cardiotocograph interpretation should allow for the transient reduction '
        'in variability',
  ],
  pregnancy: DrugSafety(
    summary: 'Given specifically for fetal benefit. A single course reduces '
        'respiratory distress syndrome, intraventricular haemorrhage, '
        'necrotising enterocolitis and neonatal death.',
    points: [
      'Ruptured membranes are not a contraindication.',
      'The evidence for benefit is among the strongest in obstetrics.',
    ],
    source: 'Roberts D et al. Cochrane Database Syst Rev 2017.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. Single antenatal courses have no relevance to '
        'breastfeeding.',
    source: 'LactMed.',
  ),
  references: [
    'Roberts D et al. Antenatal corticosteroids for accelerating fetal lung '
        'maturation. Cochrane Database Syst Rev 2017.',
    'NICE NG25 — Preterm labour and birth.',
    'RCOG Green-top Guideline 74 — Antenatal Corticosteroids.',
  ],
);

const kLetrozole = Drug(
  id: 'letrozole',
  generic: 'Letrozole',
  brandNames: ['Femara', 'Letoval'],
  drugClass: 'Third-generation non-steroidal aromatase inhibitor',
  mechanism: 'Blocks conversion of androgens to oestrogens, lowering '
      'oestradiol and releasing the hypothalamus from negative feedback. FSH '
      'rises and a follicle develops. Unlike clomiphene it does not deplete '
      'oestrogen receptors, so the endometrium and cervical mucus are spared.',
  indications: [
    'Ovulation induction in PCOS — first line',
    'Unexplained infertility, with intrauterine insemination',
    'Mild endometriosis-associated infertility',
    'Adjuvant treatment of hormone-receptor-positive breast cancer (oncology '
        'indication)',
  ],
  doses: [
    DrugDose(
      indication: 'Ovulation induction',
      dose: '2.5 mg, increasing to 5 mg then 7.5 mg in later cycles if '
          'anovulatory',
      route: 'Oral',
      frequency: 'Once daily on cycle days 3–7 (or 5–9)',
      max: '7.5 mg daily',
      notes: 'Confirm ovulation with a mid-luteal progesterone. Monitor '
          'follicles by ultrasound in the first cycle where possible.',
    ),
  ],
  contraindications: [
    'Pregnancy — exclude before each cycle',
    'Severe hepatic impairment',
    'Known hypersensitivity',
  ],
  warnings: [
    'Multiple pregnancy risk is lower than with clomiphene but not absent.',
    'Ovarian hyperstimulation is rare with oral agents but possible.',
  ],
  adverseEffects: [
    'Hot flushes',
    'Fatigue and headache',
    'Dizziness',
    'Bone and joint pain with prolonged oncological use',
  ],
  interactions: [
    'Tamoxifen reduces letrozole levels — do not combine.',
    'Strong CYP3A4 and CYP2A6 inducers reduce efficacy.',
  ],
  monitoring: [
    'Mid-luteal progesterone to confirm ovulation',
    'Follicular tracking by transvaginal ultrasound, at least in the first '
        'cycle',
  ],
  pregnancy: DrugSafety(
    summary: 'Not taken during pregnancy — it is given in the follicular phase '
        'and cleared before implantation. Early concern about teratogenicity '
        'has not been borne out by subsequent data.',
    points: [
      'The 2005 congenital-anomaly signal was not confirmed in larger '
          'series, and major guidelines now endorse its use for ovulation '
          'induction.',
      'Exclude pregnancy before starting each cycle.',
    ],
    source: 'Legro RS et al. N Engl J Med 2014;371:119; International PCOS '
        'Guideline 2023.',
  ),
  lactation: DrugSafety(
    summary: 'Not relevant to the fertility indication. For oncological use, '
        'data are absent and breastfeeding is generally not recommended.',
    source: 'LactMed.',
  ),
  fertility: 'Higher live birth rate than clomiphene in PCOS. First-line for '
      'ovulation induction in the 2023 international guideline.',
  references: [
    'Legro RS et al. Letrozole versus clomiphene for infertility in the '
        'polycystic ovary syndrome. N Engl J Med 2014;371:119–129.',
    'Teede HJ et al. International PCOS Guideline, 2023.',
    'NICE CG156 — Fertility problems.',
  ],
);

const kClomiphene = Drug(
  id: 'clomiphene',
  generic: 'Clomiphene citrate',
  brandNames: ['Clomid', 'Fertyl'],
  drugClass: 'Selective oestrogen receptor modulator',
  mechanism: 'Occupies hypothalamic oestrogen receptors, blocking negative '
      'feedback so that GnRH and then FSH rise. Because it depletes oestrogen '
      'receptors elsewhere it also thins the endometrium and thickens cervical '
      'mucus — the reason ovulation rates exceed pregnancy rates.',
  indications: [
    'Ovulation induction in anovulatory infertility, where letrozole is '
        'unavailable',
    'Unexplained infertility, with intrauterine insemination',
  ],
  doses: [
    DrugDose(
      indication: 'Ovulation induction',
      dose: '50 mg, increasing to 100 mg then 150 mg in subsequent cycles',
      route: 'Oral',
      frequency: 'Once daily for 5 days from cycle day 2–5',
      max: '150 mg daily; usually no more than 6 ovulatory cycles',
      notes: 'Ovulation occurs in about 80%, but only around 40% conceive — '
          'the anti-oestrogenic effect on endometrium and mucus accounts for '
          'much of the gap.',
    ),
  ],
  contraindications: [
    'Pregnancy',
    'Liver disease',
    'Undiagnosed abnormal uterine bleeding',
    'Ovarian cyst not due to PCOS',
    'Hormone-dependent tumour',
  ],
  warnings: [
    'Multiple pregnancy in about 8% — mostly twins.',
    'Do not continue beyond six ovulatory cycles without review.',
    'Ovarian hyperstimulation syndrome is uncommon but reported.',
    'Visual disturbance is an indication to stop permanently.',
  ],
  adverseEffects: [
    'Hot flushes',
    'Mood swings',
    'Abdominal discomfort and ovarian enlargement',
    'Thin endometrium',
    'Visual disturbance — scotomata, blurring',
  ],
  interactions: [
    'No clinically important interactions at fertility doses.',
  ],
  monitoring: [
    'Mid-luteal progesterone to confirm ovulation',
    'Ultrasound follicular tracking in the first cycle',
    'Endometrial thickness where implantation repeatedly fails',
  ],
  pregnancy: DrugSafety(
    summary: 'Taken before conception, not during pregnancy. Exclude pregnancy '
        'before each course. No consistent teratogenic signal in large '
        'series.',
  ),
  lactation: DrugSafety(
    summary: 'Not recommended. Clomiphene suppresses prolactin and may reduce '
        'milk production.',
    source: 'LactMed.',
  ),
  fertility: 'Superseded by letrozole as first line in PCOS, but remains '
      'widely used, inexpensive and effective.',
  references: [
    'NICE CG156 — Fertility problems: assessment and treatment.',
    'Legro RS et al. N Engl J Med 2014;371:119–129.',
    'FOGSI GCPR — Ovulation Induction.',
  ],
);
