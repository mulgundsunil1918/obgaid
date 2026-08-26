import '../../models/drug.dart';

const kAntiD = Drug(
  id: 'anti-d',
  generic: 'Anti-D immunoglobulin',
  drugClass: 'Human immunoglobulin — passive immunisation',
  mechanism: 'Binds fetal RhD-positive red cells in the maternal circulation '
      'and clears them before the maternal immune system can mount a primary '
      'response. It prevents sensitisation; it does nothing once sensitisation '
      'has occurred.',
  indications: [
    'Routine antenatal prophylaxis in RhD-negative women',
    'Postnatal prophylaxis where the baby is RhD positive',
    'After any potentially sensitising event',
  ],
  doses: [
    DrugDose(
      indication: 'Routine antenatal prophylaxis',
      dose: '1500 IU (300 µg) single dose at 28 weeks, OR 500 IU at 28 and 34 '
          'weeks',
      route: 'Intramuscular',
      notes: 'TAKE THE ANTIBODY SCREEN BEFORE GIVING IT — passive anti-D is '
          'otherwise indistinguishable from immune anti-D later.',
    ),
    DrugDose(
      indication: 'Sensitising event before 20 weeks',
      dose: '250 IU (50 µg)',
      route: 'Intramuscular',
      frequency: 'Within 72 hours',
    ),
    DrugDose(
      indication: 'Sensitising event after 20 weeks',
      dose: '500 IU (100 µg), plus a Kleihauer to quantify',
      route: 'Intramuscular',
      frequency: 'Within 72 hours',
      notes: 'Add a further 500 IU for each additional 4 mL of fetal red '
          'cells detected.',
    ),
    DrugDose(
      indication: 'Postnatal',
      dose: 'At least 500 IU, guided by the Kleihauer',
      route: 'Intramuscular',
      frequency: 'Within 72 hours of birth',
    ),
  ],
  preparation: 'Store at 2–8 °C. Do not freeze.',
  contraindications: [
    'Already sensitised — immune anti-D present. Prophylaxis has no role.',
    'RhD-positive mother',
    'Known anaphylaxis to human immunoglobulin',
    'IgA deficiency with anti-IgA antibodies — relative',
  ],
  warnings: [
    'Give within 72 hours. If missed, it retains some value up to 10 days — '
        'give it rather than omitting it.',
    'Withholding prophylaxis because she has completed her family is wrong: '
        'sensitisation affects future transfusion as well as future '
        'pregnancy.',
    'Cell-free fetal DNA typing, where available, avoids giving it to the '
        'roughly 40% carrying an RhD-negative fetus.',
  ],
  adverseEffects: [
    'Injection-site soreness',
    'Fever, headache, malaise',
    'Rarely, hypersensitivity',
  ],
  interactions: [
    'Defer live vaccines — measles, mumps, rubella, varicella — for 3 months '
        'after administration, as passive antibody blunts the response.',
  ],
  monitoring: [
    'Kleihauer–Betke or flow cytometry after any sensitising event beyond 20 '
        'weeks, and after delivery',
    'Repeat the Kleihauer at 48 hours after a large fetomaternal haemorrhage',
  ],
  pregnancy: DrugSafety(
    summary: 'Given specifically in pregnancy for fetal and future-pregnancy '
        'benefit. Human immunoglobulin with a long safety record.',
    source: 'RCOG Green-top Guideline 22; NICE TA156.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. It is a large protein, not absorbed by the infant '
        'gut.',
    source: 'LactMed.',
  ),
  references: [
    'Qureshi H et al. BSH guideline for the use of anti-D immunoglobulin for '
        'the prevention of haemolytic disease of the fetus and newborn. '
        'Transfus Med 2014;24:8-20. RCOG Green-top 22 is archived and points '
        'here.',
    'NICE TA156 — Routine antenatal anti-D prophylaxis.',
    'FOGSI GCPR — Rh Negative Pregnancy; MoHFW Government of India guidance '
        'on Rh prophylaxis.',
  ],
);

const kIvIron = Drug(
  id: 'iv-iron',
  generic: 'Intravenous iron (iron sucrose, ferric carboxymaltose)',
  drugClass: 'Parenteral iron replacement',
  mechanism: 'Delivers iron directly into the reticuloendothelial system, '
      'bypassing the gut. It corrects a deficit in days to weeks rather than '
      'months, which is why it matters beyond 30 weeks when there is no time '
      'left for oral iron to work.',
  indications: [
    'Moderate to severe iron deficiency anaemia in pregnancy',
    'Anaemia beyond 30 weeks, where oral iron cannot act in time',
    'Oral iron not tolerated, not absorbed, or not working',
    'Postpartum anaemia, in preference to transfusion where she is stable',
  ],
  doses: [
    DrugDose(
      indication: 'Iron sucrose',
      dose: '200 mg per dose',
      route: 'Intravenous infusion over 15–30 minutes',
      frequency: 'Up to three doses per week',
      max: '600 mg weekly',
      notes: 'The workhorse of the Indian programme. Safe from the second '
          'trimester. Requires multiple visits, which is its main drawback.',
    ),
    DrugDose(
      indication: 'Ferric carboxymaltose',
      dose: 'Up to 20 mg/kg, maximum 1000 mg in a single sitting',
      route: 'Intravenous infusion over at least 15 minutes',
      frequency: 'Repeat after one week if the deficit requires it',
      notes: 'One or two visits instead of six. Avoid in the first '
          'trimester — safety data are limited.',
    ),
    DrugDose(
      indication: 'Total deficit — Ganzoni',
      dose: 'weight (kg) × (target Hb − actual Hb) × 2.4 + 500 mg',
      route: '—',
      notes: 'This is the deficit to be replaced, not a single dose. Divide '
          'it across the licensed maximum for the preparation used.',
    ),
  ],
  doseAdjustments: [
    'Iron stores component is 500 mg above 35 kg; use 15 mg/kg below that.',
    'Recheck haemoglobin at 4 weeks rather than assuming the arithmetic '
        'worked.',
  ],
  contraindications: [
    'First trimester — for ferric carboxymaltose in particular',
    'Known hypersensitivity to the preparation',
    'Anaemia not due to iron deficiency',
    'Iron overload',
    'Active infection — relative; iron may worsen bacterial growth',
    'Decompensated liver disease',
  ],
  warnings: [
    'Hypersensitivity and anaphylaxis, though far less frequent than with '
        'the older iron dextrans. Resuscitation facilities must be available '
        'and the woman observed for 30 minutes after the infusion.',
    'HYPOPHOSPHATAEMIA after ferric carboxymaltose — usually asymptomatic, '
        'but check phosphate with repeated dosing.',
    'Extravasation causes permanent brown skin staining.',
    'Investigate the cause. In India, iron deficiency and haemoglobinopathy '
        'frequently coexist, and iron alone achieves nothing in a '
        'thalassaemia carrier.',
  ],
  adverseEffects: [
    'Transient hypotension, flushing, nausea, arthralgia during infusion',
    'Headache and metallic taste',
    'Hypophosphataemia (ferric carboxymaltose)',
    'Injection-site staining',
    'Anaphylaxis (rare)',
  ],
  interactions: [
    'Do not give with oral iron — stop oral iron during and for 5 days after.',
    'Do not mix with other intravenous drugs.',
  ],
  monitoring: [
    'Observe for 30 minutes after the infusion',
    'Haemoglobin and ferritin at 4 weeks',
    'Serum phosphate with repeated ferric carboxymaltose dosing',
  ],
  pregnancy: DrugSafety(
    summary: 'Iron sucrose is well established from the second trimester and '
        'is the mainstay of the Indian national programme. Ferric '
        'carboxymaltose is avoided in the first trimester on the grounds of '
        'limited data rather than known harm.',
    points: [
      'Untreated anaemia carries substantial risk — preterm birth, low birth '
          'weight, and death from postpartum haemorrhage that a woman with a '
          'normal haemoglobin would survive.',
      'More than half of Indian pregnant women are anaemic, which makes this '
          'one of the highest-yield interventions available.',
    ],
    source: 'Anemia Mukt Bharat Operational Guidelines; FOGSI GCPR — Anaemia '
        'in Pregnancy.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. Iron in milk is tightly regulated and is not '
        'increased meaningfully by maternal supplementation.',
    source: 'LactMed.',
  ),
  references: [
    'Anemia Mukt Bharat — Operational Guidelines, MoHFW Government of India.',
    'FOGSI GCPR — Anaemia in Pregnancy.',
    'RCOG Green-top Guideline 47 — Blood Transfusion in Obstetrics.',
    'Ganzoni AM. Schweiz Med Wochenschr 1970;100:301.',
  ],
);

const kMetronidazole = Drug(
  id: 'metronidazole',
  generic: 'Metronidazole',
  drugClass: 'Nitroimidazole antimicrobial',
  mechanism: 'Reduced within anaerobic organisms to a nitroso radical that '
      'damages bacterial DNA. Active against anaerobes, Trichomonas and '
      'Gardnerella; inert against aerobes.',
  indications: [
    'Bacterial vaginosis',
    'Trichomoniasis',
    'Pelvic inflammatory disease, as part of combination therapy',
    'Anaerobic cover for gynaecological surgery and for septic abortion',
  ],
  doses: [
    DrugDose(
      indication: 'Bacterial vaginosis',
      dose: '400 mg twice daily for 7 days, or 2 g as a single dose',
      route: 'Oral',
      notes: 'Intravaginal gel 0.75% nightly for 5 days is an alternative '
          'with fewer systemic effects.',
    ),
    DrugDose(
      indication: 'Trichomoniasis',
      dose: '400 mg twice daily for 7 days, or 2 g single dose',
      route: 'Oral',
      notes: 'Treat the partner simultaneously, or she will be reinfected.',
    ),
    DrugDose(
      indication: 'Pelvic inflammatory disease',
      dose: '400 mg twice daily for 14 days',
      route: 'Oral',
      notes: 'With ceftriaxone and doxycycline.',
    ),
    DrugDose(
      indication: 'Surgical prophylaxis and septic abortion',
      dose: '500 mg',
      route: 'Intravenous',
      frequency: 'Every 8 hours',
    ),
  ],
  contraindications: [
    'Known hypersensitivity',
    'First trimester — relative, for high-dose single-dose regimens',
  ],
  warnings: [
    'Avoid the 2 g single-dose regimen in pregnancy; use the divided '
        'seven-day course.',
    'DISULFIRAM-LIKE REACTION with alcohol — flushing, vomiting, '
        'tachycardia. Warn explicitly, and for 48 hours after the course.',
    'Peripheral neuropathy with prolonged or repeated courses.',
  ],
  adverseEffects: [
    'Metallic taste — very common and a frequent reason for stopping',
    'Nausea, anorexia',
    'Furred tongue and oral candidiasis',
    'Peripheral neuropathy with prolonged use',
    'Dark urine — harmless, but alarming if unwarned',
  ],
  interactions: [
    'Alcohol — disulfiram-like reaction.',
    'Warfarin — potentiated; monitor INR.',
    'Lithium — raised levels.',
    'Phenytoin and phenobarbital reduce its effect.',
  ],
  monitoring: [
    'Symptom resolution; test of cure only where symptoms persist',
    'Neurological symptoms with prolonged courses',
  ],
  pregnancy: DrugSafety(
    summary: 'Extensive use with no established teratogenicity. Treating '
        'symptomatic bacterial vaginosis and trichomoniasis in pregnancy is '
        'appropriate, and untreated infection is associated with preterm '
        'birth.',
    points: [
      'Avoid single high-dose regimens; use the divided course.',
      'Earlier concerns about first-trimester exposure have not been '
          'confirmed in large cohorts.',
    ],
    source: 'BASHH and CDC STI treatment guidelines.',
  ),
  lactation: DrugSafety(
    summary: 'Acceptable in divided doses. Milk levels are appreciable and '
        'may give the milk a bitter taste. After a 2 g single dose, some '
        'sources suggest interrupting breastfeeding for 12–24 hours.',
    points: ['Watch the infant for diarrhoea and oral thrush.'],
    source: 'LactMed.',
  ),
  references: [
    'BASHH national guideline for the management of bacterial vaginosis and '
        'trichomoniasis.',
    'NACO National Guidelines on Prevention, Management and Control of '
        'Sexually Transmitted Infections, Government of India.',
    'FOGSI GCPR — Vaginal Discharge and Pelvic Inflammatory Disease.',
  ],
);

const kFluconazole = Drug(
  id: 'fluconazole',
  generic: 'Fluconazole',
  drugClass: 'Triazole antifungal',
  mechanism: 'Inhibits fungal cytochrome P450 lanosterol 14-α-demethylase, '
      'blocking ergosterol synthesis and disrupting the fungal cell membrane.',
  indications: [
    'Vulvovaginal candidiasis — uncomplicated and recurrent',
    'Candidiasis unresponsive to topical treatment',
  ],
  doses: [
    DrugDose(
      indication: 'Uncomplicated vulvovaginal candidiasis',
      dose: '150 mg',
      route: 'Oral',
      frequency: 'Single dose',
    ),
    DrugDose(
      indication: 'Recurrent candidiasis — four or more episodes a year',
      dose: '150 mg every 72 hours for 3 doses, then 150 mg weekly',
      route: 'Oral',
      max: '6 months of maintenance',
      notes: 'Confirm the diagnosis on culture before committing to six '
          'months — recurrent symptoms are frequently not candidal.',
    ),
  ],
  contraindications: [
    'PREGNANCY — for oral fluconazole. Use topical imidazoles instead.',
    'Concurrent terfenadine, cisapride or quinidine',
    'Known azole hypersensitivity',
  ],
  warnings: [
    'AVOID ORAL FLUCONAZOLE IN PREGNANCY. High-dose first-trimester exposure '
        'is associated with a distinctive congenital syndrome, and even the '
        'single 150 mg dose has been linked in cohort studies with '
        'miscarriage and with cardiac septal defects.',
    'Topical imidazoles — clotrimazole pessary or cream — are the treatment '
        'of choice in pregnancy, and courses need to be longer, usually 7 '
        'days.',
    'QT prolongation and hepatotoxicity with prolonged use.',
  ],
  adverseEffects: [
    'Nausea, abdominal pain',
    'Headache',
    'Rash',
    'Transaminase rise',
    'QT prolongation',
  ],
  interactions: [
    'CYP2C9 and CYP3A4 inhibitor — raises warfarin, phenytoin, statins, '
        'ciclosporin and tacrolimus.',
    'QT-prolonging drugs.',
    'Reduces the efficacy of some hormonal contraception at high doses — '
        'though not at the single 150 mg dose.',
  ],
  monitoring: [
    'Liver function with prolonged maintenance therapy',
    'Culture before starting long-term suppression',
  ],
  pregnancy: DrugSafety(
    summary: 'Avoid the oral drug. Topical imidazoles are effective, safe and '
        'the recommended treatment throughout pregnancy.',
    points: [
      'High-dose exposure (400–800 mg daily) in the first trimester has been '
          'associated with a recognisable pattern of craniofacial, skeletal '
          'and cardiac anomalies.',
      'Even the single 150 mg dose has been associated in large cohorts with '
          'spontaneous abortion and, less consistently, with cardiac septal '
          'defects.',
      'Candidiasis is commoner in pregnancy and needs treating — with a '
          'topical agent, for 7 days rather than the usual shorter course.',
    ],
    source: 'EMA and MHRA safety reviews; Mølgaard-Nielsen D et al. JAMA '
        '2016;315:58.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. Milk levels are appreciable but well below doses '
        'given directly to infants for candidiasis.',
    source: 'LactMed.',
  ),
  references: [
    'BASHH national guideline on the management of vulvovaginal candidiasis.',
    'NACO National Guidelines on STI management, Government of India.',
    'FOGSI GCPR — Vaginal Discharge.',
    'MHRA Drug Safety Update on fluconazole in pregnancy.',
  ],
);

const kTamoxifen = Drug(
  id: 'tamoxifen',
  generic: 'Tamoxifen',
  drugClass: 'Selective oestrogen receptor modulator',
  mechanism: 'Competitively blocks the oestrogen receptor in breast tissue '
      'while acting as a partial AGONIST at the endometrium and bone. That '
      'tissue-selective agonism is the reason it causes endometrial pathology.',
  indications: [
    'Adjuvant and metastatic hormone-receptor-positive breast cancer',
    'Risk reduction in women at high risk of breast cancer',
    'Ovulation induction — an older alternative to clomiphene',
  ],
  doses: [
    DrugDose(
      indication: 'Adjuvant breast cancer',
      dose: '20 mg daily',
      route: 'Oral',
      max: '5 to 10 years',
    ),
    DrugDose(
      indication: 'Ovulation induction',
      dose: '20–40 mg daily on cycle days 2–6',
      route: 'Oral',
      notes: 'Letrozole and clomiphene are preferred; tamoxifen is an option '
          'where they are unsuitable.',
    ),
  ],
  contraindications: [
    'Pregnancy',
    'History of venous thromboembolism — relative, and requires oncology '
        'discussion',
    'Undiagnosed abnormal uterine bleeding, until investigated',
  ],
  warnings: [
    'ENDOMETRIAL EFFECTS — polyps, hyperplasia, and a two- to threefold '
        'increase in endometrial carcinoma. Any abnormal bleeding on tamoxifen '
        'requires urgent investigation and cannot be attributed to the drug.',
    'Routine ultrasound surveillance of the endometrium is NOT recommended in '
        'asymptomatic women — it generates false positives, because tamoxifen '
        'thickens the endometrium sonographically without disease.',
    'Venous thromboembolism risk is increased, particularly perioperatively '
        'and with immobility.',
    'DO NOT co-prescribe strong CYP2D6 inhibitors — paroxetine and '
        'fluoxetine reduce conversion to the active metabolite endoxifen.',
  ],
  adverseEffects: [
    'Hot flushes and night sweats',
    'Vaginal discharge and dryness',
    'Menstrual irregularity',
    'Venous thromboembolism',
    'Endometrial polyps, hyperplasia and carcinoma',
    'Cataract; rarely retinopathy',
    'Mood change',
  ],
  interactions: [
    'CYP2D6 inhibitors — paroxetine and fluoxetine in particular. Use '
        'venlafaxine or citalopram for flushes instead.',
    'Warfarin — markedly potentiated.',
    'Aromatase inhibitors — do not combine.',
  ],
  monitoring: [
    'Investigate ANY abnormal uterine bleeding promptly',
    'No routine endometrial surveillance in asymptomatic women',
    'Annual ophthalmic review with long-term use',
    'Bone density in premenopausal women, in whom it accelerates bone loss',
  ],
  pregnancy: DrugSafety(
    summary: 'Contraindicated. Effective non-hormonal contraception is '
        'required throughout treatment and for two months afterwards.',
    points: [
      'Craniofacial and genital anomalies have been reported after '
          'first-trimester exposure.',
      'Its long half-life means a washout period is needed before conception.',
    ],
  ),
  lactation: DrugSafety(
    summary: 'Not recommended. It suppresses lactation and infant exposure '
        'data are absent.',
    source: 'LactMed.',
  ),
  fertility: 'Suppresses ovulation at oncological doses in some women, but is '
      'not contraceptive. Discuss fertility preservation before starting '
      'long-term adjuvant therapy in a premenopausal woman.',
  references: [
    'RCOG Scientific Impact Paper 40 — Management of Endometrial '
        'Abnormalities in Women on Tamoxifen.',
    'National Cancer Grid of India — breast cancer guidelines.',
    'NICE NG101 — Early and locally advanced breast cancer.',
  ],
);

const kCarboplatinPaclitaxel = Drug(
  id: 'carbo-taxol',
  generic: 'Carboplatin and paclitaxel',
  drugClass: 'Platinum alkylating agent with a taxane',
  mechanism: 'Carboplatin forms platinum–DNA adducts that block replication. '
      'Paclitaxel stabilises microtubules and arrests cells in mitosis. '
      'Together they remain the backbone of gynaecological oncology '
      'chemotherapy.',
  indications: [
    'First-line chemotherapy for epithelial ovarian, fallopian tube and '
        'primary peritoneal carcinoma',
    'Advanced or recurrent endometrial carcinoma',
    'Chemoradiation and adjuvant therapy in cervical carcinoma',
  ],
  doses: [
    DrugDose(
      indication: 'Standard first-line regimen',
      dose: 'Carboplatin AUC 5–6, with paclitaxel 175 mg/m²',
      route: 'Intravenous',
      frequency: 'Every 21 days for 6 cycles',
      notes: 'Carboplatin is dosed by AUC using the Calvert formula: dose in '
          'mg = AUC × (GFR + 25). It is not dosed by body surface area.',
    ),
    DrugDose(
      indication: 'Dose-dense weekly paclitaxel',
      dose: 'Paclitaxel 80 mg/m² weekly with 3-weekly carboplatin',
      route: 'Intravenous',
      notes: 'An alternative schedule; benefit varies by population.',
    ),
  ],
  doseAdjustments: [
    'Carboplatin dose follows renal function through the Calvert formula — '
        'recalculate when the GFR changes.',
    'Delay or reduce for neutropenia, thrombocytopenia or grade 2 or higher '
        'neuropathy.',
  ],
  contraindications: [
    'Severe myelosuppression',
    'Severe hypersensitivity to platinum agents or to Cremophor',
    'Pregnancy in the first trimester',
    'Severe renal impairment — for carboplatin',
  ],
  warnings: [
    'CARBOPLATIN HYPERSENSITIVITY typically appears after the sixth or later '
        'exposure, not the first — the risk rises with cumulative cycles and '
        'is highest on re-treatment for recurrence.',
    'Paclitaxel requires corticosteroid and antihistamine premedication.',
    'Peripheral neuropathy from paclitaxel is cumulative and often '
        'permanent — it is the toxicity that most affects long-term quality '
        'of life.',
    'Discuss fertility preservation BEFORE the first cycle, not after.',
  ],
  adverseEffects: [
    'Myelosuppression — neutropenia and thrombocytopenia',
    'Peripheral sensory neuropathy (paclitaxel), often permanent',
    'Alopecia',
    'Nausea and vomiting',
    'Hypersensitivity reactions',
    'Arthralgia and myalgia',
    'Ototoxicity and nephrotoxicity — more with cisplatin than carboplatin',
    'Premature ovarian insufficiency',
  ],
  interactions: [
    'Nephrotoxic drugs — aminoglycosides, NSAIDs — worsen platinum renal '
        'toxicity.',
    'CYP3A4 and CYP2C8 inhibitors raise paclitaxel levels.',
    'Live vaccines are contraindicated during treatment.',
  ],
  monitoring: [
    'Full blood count before every cycle',
    'Renal function, to recalculate the carboplatin AUC',
    'Neurological assessment for neuropathy before each cycle',
    'CA-125 and imaging for response',
    'Audiometry where cisplatin is used',
  ],
  pregnancy: DrugSafety(
    summary: 'Contraindicated in the first trimester. Platinum-taxane '
        'chemotherapy has been given in the second and third trimesters for '
        'cancer diagnosed during pregnancy, in a specialist multidisciplinary '
        'setting.',
    points: [
      'First-trimester exposure carries a substantial teratogenic risk.',
      'Second and third trimester administration is associated with fetal '
          'growth restriction and preterm birth, but reported neonatal '
          'outcomes have been broadly reassuring.',
      'Stop chemotherapy about three weeks before planned delivery to allow '
          'maternal and fetal marrow recovery.',
    ],
    source: 'ESGO-ESMO guidance on cancer in pregnancy.',
  ),
  lactation: DrugSafety(
    summary: 'Contraindicated. Breastfeeding must be stopped during treatment '
        'and for a period afterwards determined by the specific agents.',
    source: 'LactMed.',
  ),
  fertility: 'Gonadotoxic. Refer for fertility preservation before the first '
      'cycle — delay closes the option.',
  references: [
    'National Cancer Grid of India — ovarian, endometrial and cervical cancer '
        'management guidelines.',
    'ESGO-ESTRO-ESP guidelines for gynaecological cancers.',
    'NCCN Clinical Practice Guidelines in Oncology.',
    'Calvert AH et al. Carboplatin dosage: prospective evaluation of a simple '
        'formula. J Clin Oncol 1989;7:1748-1756.',
  ],
);

const kOlaparib = Drug(
  id: 'olaparib',
  generic: 'Olaparib',
  drugClass: 'PARP inhibitor',
  mechanism: 'Inhibits poly(ADP-ribose) polymerase, blocking single-strand '
      'break repair. In a cell that has already lost homologous recombination '
      '— a BRCA-mutated tumour cell — the unrepaired damage becomes lethal. '
      'Normal cells, retaining that pathway, survive. This is synthetic '
      'lethality.',
  indications: [
    'Maintenance after first-line platinum chemotherapy in BRCA-mutated '
        'advanced ovarian carcinoma',
    'Maintenance in platinum-sensitive relapsed ovarian carcinoma',
    'With bevacizumab in homologous-recombination-deficient ovarian carcinoma',
  ],
  doses: [
    DrugDose(
      indication: 'Ovarian cancer maintenance',
      dose: '300 mg twice daily (two 150 mg tablets)',
      route: 'Oral',
      max: '2 years in the first-line setting, or until progression',
      notes: 'Tablets and capsules are NOT interchangeable milligram for '
          'milligram. Prescribe by formulation.',
    ),
  ],
  doseAdjustments: [
    'Reduce to 250 mg twice daily, then 200 mg, for toxicity.',
    'Reduce in moderate renal impairment.',
    'Reduce with strong CYP3A inhibitors, or avoid the combination.',
  ],
  contraindications: [
    'Pregnancy and breastfeeding',
    'Known hypersensitivity',
  ],
  warnings: [
    'MYELODYSPLASTIC SYNDROME and acute myeloid leukaemia occur in about 1% — '
        'investigate any persistent unexplained cytopenia rather than '
        'attributing it to the drug.',
    'Pneumonitis — investigate new or worsening respiratory symptoms.',
    'Requires BRCA or homologous recombination deficiency testing to select '
        'patients. Testing every woman with high-grade serous ovarian cancer '
        'is what makes the treatment possible.',
  ],
  adverseEffects: [
    'Nausea — very common, usually manageable',
    'Fatigue',
    'Anaemia, in about a fifth at grade 3 or higher',
    'Neutropenia and thrombocytopenia',
    'Vomiting, diarrhoea, dysgeusia',
    'Myelodysplastic syndrome or AML (about 1%)',
    'Pneumonitis (rare)',
  ],
  interactions: [
    'Strong CYP3A inhibitors — itraconazole, clarithromycin — raise levels.',
    'Strong CYP3A inducers — rifampicin, carbamazepine, St John\'s wort — '
        'reduce efficacy substantially.',
    'Avoid grapefruit and Seville oranges.',
  ],
  monitoring: [
    'Full blood count monthly for the first year, then periodically',
    'Investigate persistent cytopenia with a marrow examination',
    'Renal and liver function',
    'Imaging and CA-125 for progression',
  ],
  pregnancy: DrugSafety(
    summary: 'Contraindicated. It is genotoxic and teratogenic in animal '
        'studies. Effective contraception is required throughout and for at '
        'least 6 months after the last dose.',
  ),
  lactation: DrugSafety(
    summary: 'Contraindicated during treatment and for one month afterwards.',
    source: 'LactMed.',
  ),
  fertility: 'BRCA mutation carriers should be offered genetic counselling '
      'for themselves and their families, and fertility and risk-reducing '
      'surgery discussed as a separate conversation.',
  references: [
    'Moore K et al. SOLO-1. N Engl J Med 2018;379:2495–2505.',
    'National Cancer Grid of India — ovarian cancer guidelines.',
    'ESGO-ESMO consensus on ovarian cancer; NCCN guidelines.',
  ],
);
