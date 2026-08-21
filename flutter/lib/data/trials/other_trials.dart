import '../../models/trial.dart';

const kOracle = Trial(
  id: 'oracle',
  acronym: 'ORACLE I & II',
  name: 'Broad-spectrum antibiotics for preterm prelabour rupture of the '
      'membranes (I) and for spontaneous preterm labour with intact membranes '
      '(II)',
  year: 2001,
  journal: 'The Lancet 2001;357:979–988 and 989–994; 7-year follow-up '
      '2008;372:1319–1327',
  setting: '161 centres in 11 countries',
  population: 'ORACLE I — preterm prelabour rupture of membranes. ORACLE II — '
      'spontaneous preterm labour with intact membranes.',
  sampleSize: '4 826 women (I) and 6 295 women (II)',
  intervention: 'Erythromycin, co-amoxiclav, both, or placebo',
  comparator: 'Placebo',
  primaryOutcome: 'Composite of neonatal death, chronic lung disease, or major '
      'cerebral abnormality on ultrasound',
  results: [
    'ORACLE I: erythromycin prolonged pregnancy and reduced the neonatal '
        'composite; benefit was greatest in singleton pregnancies.',
    'ORACLE I: co-amoxiclav significantly INCREASED necrotising enterocolitis '
        '— 1.9% versus 0.5%.',
    'ORACLE II: neither antibiotic improved the neonatal composite in intact '
        'membranes.',
    'ORACLE II 7-year follow-up: children exposed to erythromycin or '
        'co-amoxiclav had MORE functional impairment, and cerebral palsy was '
        'increased.',
  ],
  adverseEvents: [
    'Necrotising enterocolitis with co-amoxiclav in ruptured membranes',
    'Cerebral palsy at 7 years after antibiotic exposure in intact membranes',
  ],
  limitations: [
    'The long-term follow-up was of ORACLE II only, and the mechanism for the '
        'cerebral palsy signal remains unexplained.',
    'Antibiotic resistance patterns have shifted since 2001.',
  ],
  applicability: 'Directly applicable, and the negative findings matter more '
      'than the positive one — this is a trial that stopped a common practice.',
  guidelineImpact: 'Erythromycin became standard in PPROM; co-amoxiclav was '
      'abandoned there. Prophylactic antibiotics for preterm labour with '
      'intact membranes were abandoned entirely.',
  currentRelevance: 'The single most cited reason not to give antibiotics in '
      'threatened preterm labour with intact membranes.',
  takeaway: 'Erythromycin in ruptured membranes, nothing in intact membranes, '
      'and never co-amoxiclav.',
  category: TrialCategory.pretermBirth,
);

const kMoms = Trial(
  id: 'moms',
  acronym: 'MOMS',
  name: 'A Randomized Trial of Prenatal versus Postnatal Repair of '
      'Myelomeningocele',
  year: 2011,
  journal: 'New England Journal of Medicine 2011;364:993–1004',
  setting: 'Three fetal surgery centres in the United States',
  population: 'Singleton pregnancies with fetal myelomeningocele between T1 '
      'and S1, 19–25+6 weeks',
  sampleSize: '183 women; stopped early for efficacy',
  intervention: 'Open fetal surgical repair before 26 weeks',
  comparator: 'Standard postnatal repair',
  primaryOutcome: 'Fetal or neonatal death, or need for cerebrospinal fluid '
      'shunting by 12 months',
  results: [
    'Primary outcome: 68% with prenatal repair versus 98% with postnatal — RR '
        '0.70 (97.7% CI 0.58–0.84).',
    'Shunt placement: 40% versus 82%.',
    'Independent walking at 30 months: 42% versus 21%.',
    'Hindbrain herniation reversed or improved in a majority.',
  ],
  adverseEvents: [
    'Preterm birth: 79% with prenatal repair versus 15%',
    'Mean gestation at delivery 34.1 weeks versus 37.3',
    'Uterine dehiscence at delivery in 10%',
    'Chorioamniotic membrane separation, oligohydramnios, placental abruption',
  ],
  limitations: [
    'Three highly specialised centres; results are not transferable to '
        'general units.',
    'Substantial maternal morbidity, and a hysterotomy that commits every '
        'future pregnancy to caesarean.',
    'Strict inclusion criteria exclude most fetuses with spina bifida.',
  ],
  applicability: 'Available in very few centres worldwide. The counselling '
      'point — that prenatal repair trades maternal risk and prematurity for '
      'motor outcome — is what transfers.',
  guidelineImpact: 'Established prenatal myelomeningocele repair as a '
      'legitimate option in selected cases, and drove the development of '
      'fetoscopic techniques with lower maternal morbidity.',
  takeaway: 'Prenatal repair of spina bifida halves shunting and doubles '
      'independent walking, at the cost of prematurity and maternal surgical '
      'risk.',
  category: TrialCategory.fetalMedicine,
);

const kAchois = Trial(
  id: 'achois',
  acronym: 'ACHOIS',
  name: 'Effect of Treatment of Gestational Diabetes Mellitus on Pregnancy '
      'Outcomes',
  year: 2005,
  journal: 'New England Journal of Medicine 2005;352:2477–2486',
  setting: '18 centres in Australia and the United Kingdom',
  population: 'Women with gestational diabetes between 24 and 34 weeks',
  sampleSize: '1 000 women',
  intervention: 'Dietary advice, blood glucose monitoring and insulin as '
      'required',
  comparator: 'Routine care',
  primaryOutcome: 'Serious perinatal complications — death, shoulder dystocia, '
      'bone fracture, nerve palsy',
  results: [
    'Serious perinatal complications: 1% with treatment versus 4% with routine '
        'care — RR 0.33 (95% CI 0.14–0.75). Number needed to treat 34.',
    'Macrosomia: 10% versus 21%.',
    'No perinatal deaths in the treatment group versus five in the routine '
        'care group.',
    'Induction of labour was more common with treatment; caesarean rates did '
        'not differ.',
  ],
  adverseEvents: [
    'More frequent antenatal visits and neonatal nursery admission',
    'Higher rates of induction',
  ],
  limitations: [
    'Diagnostic criteria differ from those in current use, including DIPSI and '
        'IADPSG.',
    'Predominantly Australian and British population.',
  ],
  applicability: 'The principle — that treating gestational diabetes improves '
      'perinatal outcome — is what transfers. The diagnostic threshold used in '
      'India is DIPSI, not the ACHOIS criteria.',
  guidelineImpact: 'Settled the question of whether gestational diabetes '
      'should be treated at all, and underpins every subsequent guideline.',
  takeaway: 'Treating gestational diabetes cuts serious perinatal '
      'complications by two-thirds.',
  category: TrialCategory.diabetes,
);

const kLegro = Trial(
  id: 'legro-letrozole',
  acronym: 'PPCOS II',
  name: 'Letrozole versus Clomiphene for Infertility in the Polycystic Ovary '
      'Syndrome',
  year: 2014,
  journal: 'New England Journal of Medicine 2014;371:119–129',
  setting: 'Multicentre, United States',
  population: 'Infertile women with polycystic ovary syndrome',
  sampleSize: '750 women, up to five treatment cycles',
  intervention: 'Letrozole 2.5–7.5 mg on cycle days 3–7',
  comparator: 'Clomiphene citrate 50–150 mg on cycle days 3–7',
  primaryOutcome: 'Live birth',
  results: [
    'Live birth: 27.5% with letrozole versus 19.1% with clomiphene — rate '
        'ratio 1.44 (95% CI 1.10–1.87). Absolute increase 8.4%.',
    'Ovulation: 61.7% versus 48.3% of cycles.',
    'Multiple pregnancy: 3.4% with letrozole versus 7.4% with clomiphene.',
  ],
  adverseEvents: [
    'More fatigue and dizziness with letrozole',
    'More hot flushes with clomiphene',
    'No difference in congenital anomaly, though the trial was not powered for '
        'it',
  ],
  limitations: [
    'Not powered to detect a difference in congenital anomaly.',
    'Obese women predominated, consistent with the American PCOS population.',
  ],
  applicability: 'Directly applicable. Letrozole is inexpensive and widely '
      'available in India, and its lower multiple pregnancy rate matters where '
      'monitoring is limited.',
  guidelineImpact: 'Letrozole became first-line for ovulation induction in '
      'PCOS in the 2018 and 2023 international guidelines, displacing '
      'clomiphene after fifty years.',
  currentRelevance: 'The reason clomiphene is now second-line.',
  takeaway: 'Letrozole gives more live births and fewer twins than clomiphene '
      'in PCOS.',
  category: TrialCategory.reproductive,
);

const kSenatTtts = Trial(
  id: 'senat-ttts',
  acronym: 'Eurofoetus',
  name: 'Endoscopic Laser Surgery versus Serial Amnioreduction for Severe '
      'Twin-to-Twin Transfusion Syndrome',
  year: 2004,
  journal: 'New England Journal of Medicine 2004;351:136–144',
  setting: 'European fetal medicine centres',
  population: 'Monochorionic diamniotic twins with severe twin-to-twin '
      'transfusion syndrome before 26 weeks',
  sampleSize: '142 women; stopped early for efficacy',
  intervention: 'Fetoscopic laser ablation of placental anastomoses',
  comparator: 'Serial amnioreduction',
  primaryOutcome: 'Survival of at least one twin to 28 days',
  results: [
    'Survival of at least one twin to 28 days: 76% with laser versus 56% with '
        'amnioreduction (P = 0.009).',
    'Survival to 6 months: 76% versus 51%.',
    'Neurological complications at 6 months: 52% versus 31% free of them.',
    'Gestational age at delivery was higher with laser — 33.3 versus 29.0 '
        'weeks.',
  ],
  limitations: [
    'Stopped early, which can overestimate effect.',
    'Requires a fetal medicine centre with laser expertise.',
    'Quintero stage I disease was under-represented, and its management '
        'remains debated.',
  ],
  applicability: 'The referral is what transfers. Laser is available in a '
      'limited number of Indian centres, and early referral is the '
      'intervention a general obstetrician controls.',
  guidelineImpact: 'Made fetoscopic laser the treatment of choice for severe '
      'twin-to-twin transfusion syndrome from Quintero stage II.',
  takeaway: 'Laser ablation beats amnioreduction for severe TTTS — refer '
      'early, because the window closes at 26 weeks.',
  category: TrialCategory.fetalMedicine,
);

const kLandonVbac = Trial(
  id: 'landon-vbac',
  acronym: 'NICHD MFMU Cesarean Registry',
  name: 'Maternal and Perinatal Outcomes Associated with a Trial of Labor '
      'after Prior Cesarean Delivery',
  year: 2004,
  journal: 'New England Journal of Medicine 2004;351:2581–2589',
  setting: '19 academic medical centres, United States',
  population: 'Women with a previous caesarean delivery',
  sampleSize: '17 898 trial of labour and 15 801 elective repeat caesarean',
  intervention: 'Trial of labour after caesarean',
  comparator: 'Elective repeat caesarean delivery',
  primaryOutcome: 'Symptomatic uterine rupture and adverse perinatal outcome',
  results: [
    'Uterine rupture: 0.7% with trial of labour versus none with elective '
        'repeat caesarean.',
    'Hypoxic-ischaemic encephalopathy: 0.08% versus 0% — 12 cases, of which 7 '
        'followed rupture.',
    'Endometritis and transfusion were more common with trial of labour.',
    'Trial of labour was successful in about 73%.',
  ],
  limitations: [
    'Observational rather than randomised — women were not allocated.',
    'Conducted in academic centres with immediate caesarean capability.',
  ],
  applicability: 'The absolute numbers are what counsel with. In a unit '
      'without immediate access to theatre and blood, the risk-benefit shifts '
      'against trial of labour.',
  guidelineImpact: 'Provides the absolute risk figures quoted in every VBAC '
      'counselling guideline — RCOG Green-top 45 and ACOG Practice Bulletin '
      '205.',
  takeaway: 'Trial of labour after caesarean succeeds about three times in '
      'four, with a rupture risk near 1 in 140 and encephalopathy near 1 in '
      '1250.',
  category: TrialCategory.labour,
);
