import '../models/quick_table.dart';

const kQuickTables = <QuickTable>[
  QuickTable(
    id: 'qt-milestones',
    title: 'Pregnancy milestones',
    subtitle: 'What happens when, and which windows close',
    group: QuickTableGroup.antenatal,
    columns: ['Gestation', 'Milestone'],
    rows: [
      ['4 – 5 wk', 'Gestational sac visible on transvaginal scan'],
      ['5.5 wk', 'Yolk sac visible'],
      ['6 wk', 'Fetal pole with cardiac activity (CRL about 2 mm)'],
      ['7 – 13+6 wk', 'CRL dating — most accurate method there is'],
      ['11+0 – 13+6', 'Nuchal translucency and combined screening. Window is '
          'absolute.'],
      ['Before 16 wk', 'Aspirin 150 mg must be started. After this it does '
          'little.'],
      ['15 – 20 wk', 'Quadruple test, if the combined window was missed'],
      ['18 – 22 wk', 'Anomaly scan (TIFFA), ideally 19 – 20'],
      ['20 wk', 'MTP limit with one registered medical practitioner (India)'],
      ['22 wk', 'Threshold of viability where active neonatal care is planned'],
      ['24 wk', 'MTP limit with two practitioners, Rule 3B categories (India)'],
      ['24 – 28 wk', 'GDM screening; repeat FBC and antibody screen'],
      ['24 – 34 wk', 'Antenatal corticosteroid window'],
      ['Below 30 – 32 wk', 'Magnesium sulphate for fetal neuroprotection'],
      ['27 – 36 wk', 'Tdap (where used); RSV vaccine 32 – 36 wk'],
      ['28 wk', 'Routine anti-D prophylaxis. Take the antibody screen FIRST.'],
      ['28 – 32 wk', 'Growth scan in high-risk pregnancy'],
      ['34 – 36 wk', 'Second growth scan; GBS swab where screening is used'],
      ['36 wk', 'Stop aspirin'],
      ['37+0 wk', 'Term begins'],
      ['39+0 wk', 'Full term. Earliest for elective caesarean without a '
          'clinical reason.'],
      ['41+0 wk', 'Offer membrane sweep and discuss induction'],
      ['42+0 wk', 'Post-term'],
    ],
    note: 'The three windows that close and cannot be reopened: aspirin at 16 '
        'weeks, nuchal translucency at 13+6, and the MTP limits at 20 and 24 '
        'weeks.',
    sources: [
      'NICE NG201 — Antenatal care; NG207 — Inducing labour.',
      'ACOG Committee Opinion 700.',
      'MTP (Amendment) Act 2021, Government of India.',
    ],
  ),
  QuickTable(
    id: 'qt-antenatal-tests',
    title: 'Antenatal investigations',
    subtitle: 'What to send, and when',
    group: QuickTableGroup.antenatal,
    columns: ['Visit', 'Investigations'],
    rows: [
      ['Booking', 'FBC · blood group and antibody screen · HIV · hepatitis B · '
          'syphilis · rubella immunity · urine culture · random or fasting '
          'glucose (DIPSI at first contact in India) · TSH if risk factors · '
          'haemoglobin electrophoresis where indicated'],
      ['11+0 – 13+6', 'Dating scan with nuchal translucency; free β-hCG and '
          'PAPP-A'],
      ['15 – 20 wk', 'Quadruple test if combined screening was missed'],
      ['18 – 22 wk', 'Anomaly scan; cervical length in high-risk women'],
      ['24 – 28 wk', 'FBC · antibody screen · GDM screening (DIPSI or OGTT)'],
      ['28 wk', 'Anti-D 1500 IU (after the antibody screen is taken)'],
      ['34 – 36 wk', 'FBC · growth scan in high-risk · GBS swab where screened'],
      ['Every visit', 'Blood pressure · urine for protein · symphysis-fundal '
          'height from 24 wk · ask about fetal movements'],
    ],
    note: 'Absence of proteinuria does not exclude pre-eclampsia. Hypertension '
        'with any severe feature is pre-eclampsia.',
    sources: [
      'NICE NG201 — Antenatal care.',
      'MoHFW Government of India — antenatal care guidelines; DIPSI.',
      'RCOG Green-top Guideline 22.',
    ],
  ),
  QuickTable(
    id: 'qt-doppler',
    title: 'Doppler indices',
    subtitle: 'Thresholds and what each one means',
    group: QuickTableGroup.antenatal,
    columns: ['Vessel', 'Abnormal', 'Meaning'],
    rows: [
      ['Umbilical artery PI', 'Above the 95th centile',
          'Rising placental resistance. The first index to change.'],
      ['Umbilical artery EDF', 'Absent, then reversed',
          'A deteriorating sequence over days to weeks. AEDF: deliver by 34 '
              'wk. REDF: deliver by 30 – 32 wk.'],
      ['Middle cerebral artery PI', 'Below the 5th centile',
          'Brain sparing — a compensation, not a reassurance'],
      ['MCA peak systolic velocity', 'Above 1.5 multiples of the median',
          'Moderate or severe fetal anaemia. The trigger for cordocentesis or '
              'intrauterine transfusion.'],
      ['Cerebroplacental ratio', 'Below the 5th centile, or below 1',
          'Redistribution. More sensitive than either vessel alone in late '
              'FGR.'],
      ['Ductus venosus a-wave', 'Reduced, absent or reversed',
          'Cardiac decompensation. A late sign that usually prompts delivery.'],
      ['Uterine artery PI', 'Above the 95th centile',
          'Raised pre-eclampsia and FGR risk. A screening tool, not a '
              'surveillance one.'],
    ],
    note: 'MCA-PSV above 1.5 MoM has replaced serial amniocentesis for fetal '
        'anaemia. It is non-invasive and at least as accurate.',
    sources: [
      'ISUOG Practice Guidelines — use of Doppler in obstetrics.',
      'Mari G et al. N Engl J Med 2000;342:9–14.',
      'RCOG Green-top Guideline 31.',
      'FOGSI-ICOG GCPR — Fetal Growth Restriction.',
    ],
  ),
  QuickTable(
    id: 'qt-preeclampsia',
    title: 'Pre-eclampsia — severe features',
    subtitle: 'Any one of these changes the management',
    group: QuickTableGroup.antenatal,
    columns: ['Feature', 'Threshold'],
    rows: [
      ['Blood pressure', 'Systolic ≥ 160 or diastolic ≥ 110 mmHg'],
      ['Platelets', 'Below 100 × 10⁹/L'],
      ['Creatinine', 'Above 1.1 mg/dL, or doubled from her own baseline'],
      ['Transaminases', 'Twice the upper limit of normal — remember the '
          'pregnancy limit is LOWER'],
      ['Pulmonary oedema', 'Present'],
      ['Neurological', 'New headache unresponsive to analgesia, visual '
          'disturbance, clonus, altered consciousness'],
      ['Epigastric or RUQ pain', 'Persistent, not explained otherwise'],
      ['Fetal', 'Growth restriction, oligohydramnios, abnormal Doppler'],
    ],
    note: 'Proteinuria is NOT required. Hypertension after 20 weeks with any '
        'of the above is pre-eclampsia. Magnesium sulphate is indicated for '
        'severe features; it is not an antihypertensive.',
    sources: [
      'ACOG Practice Bulletin 222.',
      'NICE NG133.',
      'ISSHP classification of hypertensive disorders of pregnancy.',
      'FOGSI-ICOG GCPR — Hypertensive Disorders of Pregnancy.',
    ],
  ),
  QuickTable(
    id: 'qt-labour-stages',
    title: 'Stages of labour',
    subtitle: 'Current definitions — the 1 cm/hour rule is gone',
    group: QuickTableGroup.intrapartum,
    columns: ['Stage', 'Definition', 'Duration'],
    rows: [
      ['First — latent', 'Onset of contractions to 5 cm',
          'Highly variable; may last many hours or days'],
      ['First — active', '5 cm to full dilatation',
          'No fixed rate. The WHO Labour Care Guide abandoned 1 cm/hour.'],
      ['Second — passive', 'Full dilatation, no urge to push',
          'Up to 2 hours (or longer with an epidural)'],
      ['Second — active, nulliparous', 'Active pushing to birth',
          'Up to 2 h without epidural, 3 h with'],
      ['Second — active, multiparous', 'Active pushing to birth',
          'Up to 1 h without epidural, 2 h with'],
      ['Third', 'Birth of baby to delivery of placenta',
          'Prolonged beyond 30 min with active management, 60 min without'],
    ],
    note: 'The active phase now begins at 5 cm, not 4. Enormous numbers of '
        'caesareans and augmentations were performed for "slow progress" '
        'against a rate most normal labours never achieve.',
    sources: [
      'WHO Labour Care Guide, 2020.',
      'WHO recommendations on intrapartum care for a positive childbirth '
          'experience, 2018.',
      'NICE NG235 — Intrapartum care.',
    ],
  ),
  QuickTable(
    id: 'qt-induction',
    title: 'Induction methods',
    subtitle: 'Agent, dose and when not to use it',
    group: QuickTableGroup.intrapartum,
    columns: ['Method', 'Dose', 'Caution'],
    rows: [
      ['Membrane sweep', 'At the 40 or 41 week visit',
          'An adjunct, not an induction'],
      ['Dinoprostone (PGE2) gel', '1 – 2 mg vaginally',
          'Tachysystole; remove if the trace becomes non-reassuring'],
      ['Dinoprostone pessary', '10 mg controlled-release over 24 h',
          'Removable, which is its main advantage'],
      ['Misoprostol vaginal', '25 µg every 4 hours',
          'NEVER after a caesarean. The term dose is a tenth of the '
              'early-pregnancy dose.'],
      ['Misoprostol oral', '25 µg every 2 hours',
          'Same caution'],
      ['Foley catheter', 'Balloon inflated to 30 – 60 mL, up to 12 – 24 h',
          'Preferred method in a scarred uterus. Not with ruptured membranes.'],
      ['Amniotomy', 'Once the cervix is favourable',
          'Cord prolapse if the presenting part is high'],
      ['Oxytocin', 'Start 1 – 2 mU/min, increase every 30 min, max 20 mU/min',
          'Continuous monitoring mandatory. Target 4 – 5 contractions in 10 '
              'min.'],
    ],
    note: 'Prostaglandins raise uterine rupture risk two- to threefold in a '
        'scarred uterus. Use mechanical methods there.',
    sources: [
      'NICE NG207 — Inducing labour.',
      'RCOG Green-top Guideline 45.',
      'WHO recommendations on induction of labour.',
    ],
  ),
  QuickTable(
    id: 'qt-blood-products',
    title: 'Blood products',
    subtitle: 'Doses, expected rise, and targets',
    group: QuickTableGroup.transfusion,
    columns: ['Product', 'Dose', 'Expected effect'],
    rows: [
      ['Packed red cells', '1 unit (about 250 – 300 mL)',
          'Raises haemoglobin by roughly 1 g/dL'],
      ['Fresh frozen plasma', '12 – 15 mL/kg (about 4 units)',
          'Replaces clotting factors'],
      ['Platelets', '1 adult therapeutic dose',
          'Raises the count by roughly 20 – 40 × 10⁹/L'],
      ['Cryoprecipitate', '10 units (2 pools)',
          'Raises fibrinogen by roughly 1 g/L'],
      ['Fibrinogen concentrate', '2 – 4 g',
          'Faster and more predictable than cryoprecipitate where available'],
      ['Massive transfusion ratio', 'Red cells : FFP : platelets = 1 : 1 : 1',
          'Until laboratory results can guide'],
      ['TARGET — haemoglobin', 'Above 8 g/dL while bleeding', ''],
      ['TARGET — platelets', 'Above 50 × 10⁹/L', ''],
      ['TARGET — fibrinogen', 'Above 2 g/L', 'The one most often missed'],
      ['TARGET — PT / APTT ratio', 'Below 1.5', ''],
    ],
    note: 'Fibrinogen RISES in pregnancy to 3.7 – 6.2 g/L at term. A result of '
        '2.5 g/L reads as normal on the report and is dangerously low in a '
        'woman who is bleeding.',
    sources: [
      'RCOG Green-top Guideline 47 — Blood Transfusion in Obstetrics.',
      'RCOG Green-top Guideline 52.',
      'FOGSI GCPR — Blood Transfusion in Obstetrics; National Blood '
          'Transfusion Council of India standards.',
      'Abbassi-Ghanavati M et al. Obstet Gynecol 2009;114:1326.',
    ],
  ),
  QuickTable(
    id: 'qt-antibiotics',
    title: 'Antibiotic prophylaxis',
    subtitle: 'When, what, and the timing that matters',
    group: QuickTableGroup.transfusion,
    columns: ['Situation', 'Regimen', 'Timing'],
    rows: [
      ['Caesarean section', 'Cefazolin 2 g IV (3 g if above 120 kg)',
          'BEFORE skin incision, not after cord clamping'],
      ['Non-elective caesarean', 'Add azithromycin 500 mg IV',
          'With the cefazolin'],
      ['Third or fourth degree tear', 'Single dose broad-spectrum',
          'At the time of repair'],
      ['Manual removal of placenta', 'Single dose broad-spectrum',
          'At the procedure'],
      ['PPROM', 'Erythromycin 250 mg four times daily',
          'For 10 days or until labour. NEVER co-amoxiclav.'],
      ['Group B streptococcus', 'Benzylpenicillin 3 g IV then 1.5 g every 4 h',
          'At least 4 hours before birth where possible'],
      ['Preterm labour, intact membranes', 'None',
          'ORACLE II showed harm — cerebral palsy at 7 years'],
      ['Cervical cerclage', 'Not routine', ''],
      ['Hysterectomy', 'Cefazolin, with metronidazole for vaginal routes',
          'Within 60 min of incision'],
      ['IUCD insertion, hysteroscopy', 'Not routine', ''],
    ],
    note: 'Giving caesarean prophylaxis before the skin incision rather than '
        'after cord clamping roughly halves maternal infectious morbidity, and '
        'is still the most commonly omitted step on the checklist.',
    sources: [
      'NICE NG192 — Caesarean birth.',
      'ACOG Practice Bulletin 199 — Prophylactic Antibiotics in Labor and '
          'Delivery.',
      'Kenyon SL et al. ORACLE I and II, Lancet 2001.',
    ],
  ),
  QuickTable(
    id: 'qt-contraception',
    title: 'Contraceptive effectiveness',
    subtitle: 'Typical use versus perfect use',
    group: QuickTableGroup.gynaecology,
    columns: ['Method', 'Typical use', 'Perfect use'],
    rows: [
      ['Implant', '0.1%', '0.1%'],
      ['Levonorgestrel IUS', '0.1 – 0.4%', '0.1 – 0.4%'],
      ['Vasectomy', '0.15%', '0.1%'],
      ['Copper IUD', '0.8%', '0.6%'],
      ['Female sterilisation', '0.5%', '0.5%'],
      ['Injectable (DMPA)', '4%', '0.2%'],
      ['Combined pill', '7%', '0.3%'],
      ['Progestogen-only pill', '7%', '0.3%'],
      ['Male condom', '13%', '2%'],
      ['Withdrawal', '20%', '4%'],
      ['Fertility awareness', '2 – 23%', '0.4 – 5%'],
    ],
    note: 'Failure rates per 100 women per year. The gap between typical and '
        'perfect use is the gap the implant and intrauterine methods close, '
        'because there is nothing to remember.',
    sources: [
      'Trussell J. Contraceptive failure in the United States. Contraception '
          '2011;83:397–404.',
      'WHO Medical Eligibility Criteria, 5th edition.',
    ],
  ),
  QuickTable(
    id: 'qt-ovarian-masses',
    title: 'Ovarian mass risk',
    subtitle: 'RMI, IOTA and O-RADS at a glance',
    group: QuickTableGroup.gynaecology,
    columns: ['System', 'Threshold', 'Action'],
    rows: [
      ['RMI', '≥ 200', 'Refer to gynaecological oncology'],
      ['IOTA — M-features only', 'One or more, no B-features', 'Malignant'],
      ['IOTA — B-features only', 'One or more, no M-features', 'Benign'],
      ['IOTA — both or neither', 'About 20% of masses',
          'Inconclusive — expert examiner or second-stage test'],
      ['O-RADS 1', 'Normal premenopausal ovary', 'No follow-up'],
      ['O-RADS 2', 'Under 1% malignancy risk', 'Almost certainly benign'],
      ['O-RADS 3', '1 – under 10%', 'Low risk'],
      ['O-RADS 4', '10 – under 50%', 'Intermediate — specialist assessment'],
      ['O-RADS 5', '50% or more', 'High risk — gynaecological oncology'],
    ],
    note: 'CA-125 is raised by endometriosis, fibroids, PID, pregnancy and '
        'menstruation, which is why RMI performs poorly in premenopausal '
        'women. Half of early ovarian cancers have a normal CA-125.',
    sources: [
      'Jacobs I et al. BJOG 1990;97:922.',
      'Timmerman D et al. Ultrasound Obstet Gynecol 2008;31:681.',
      'Andreotti RF et al. Radiology 2020;294:168.',
      'RCOG Green-top Guideline 62.',
    ],
  ),
  QuickTable(
    id: 'qt-anaemia',
    title: 'Anaemia in pregnancy',
    subtitle: 'Grading and what to give',
    group: QuickTableGroup.antenatal,
    columns: ['Grade', 'Haemoglobin', 'Treatment'],
    rows: [
      ['Not anaemic', '≥ 11 g/dL (≥ 10.5 in 2nd trimester)',
          'Routine supplementation'],
      ['Mild', '10 – 10.9 g/dL',
          'Oral iron; recheck at 4 weeks. Alternate-day dosing absorbs '
              'better.'],
      ['Moderate', '7 – 9.9 g/dL',
          'Intravenous iron, especially beyond 30 weeks'],
      ['Severe', 'Below 7 g/dL',
          'IV iron; consider transfusion near term. Deliver where blood is '
              'available.'],
      ['Very severe', 'Below 4 g/dL',
          'Transfuse. Cardiac failure is likely.'],
      ['Postpartum', 'Below 10 g/dL', 'IV iron in preference to transfusion '
          'where she is stable'],
      ['Ferritin', 'Below 30 ng/mL', 'Iron deficiency — a higher threshold '
          'than outside pregnancy'],
    ],
    note: 'Ganzoni deficit (mg) = weight × (target Hb − actual Hb) × 2.4 + 500. '
        'In India, iron deficiency and haemoglobinopathy frequently coexist — '
        'giving iron alone to a thalassaemia carrier achieves nothing.',
    sources: [
      'WHO haemoglobin thresholds, WHO/NMH/NHD/MNM/11.1.',
      'Anemia Mukt Bharat Operational Guidelines, Government of India.',
      'FOGSI GCPR — Anaemia in Pregnancy.',
    ],
  ),
];
