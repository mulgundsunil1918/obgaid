import '../../models/drug.dart';

const kErythromycin = Drug(
  id: 'erythromycin',
  generic: 'Erythromycin',
  drugClass: 'Macrolide antibiotic',
  mechanism: 'Binds the 50S ribosomal subunit and blocks bacterial protein '
      'synthesis. In PPROM its benefit is thought to come from suppressing '
      'subclinical genital tract infection, which prolongs latency.',
  indications: [
    'Preterm prelabour rupture of membranes',
    'Chlamydial infection in pregnancy where azithromycin is unsuitable',
    'Penicillin allergy in selected infections',
  ],
  doses: [
    DrugDose(
      indication: 'PPROM',
      dose: '250 mg',
      route: 'Oral',
      frequency: 'Four times daily',
      max: '10 days, or until labour establishes',
      notes: 'ORACLE I showed prolonged pregnancy and reduced neonatal '
          'morbidity. Benefit was greatest in singletons.',
    ),
  ],
  contraindications: [
    'Known macrolide hypersensitivity',
    'Concurrent ergot alkaloids — risk of ergotism',
    'Congenital long QT syndrome',
  ],
  warnings: [
    'CO-AMOXICLAV MUST NOT BE SUBSTITUTED in PPROM. ORACLE I found a '
        'significant increase in neonatal necrotising enterocolitis.',
    'Potent CYP3A4 inhibitor — raises levels of many drugs.',
    'QT prolongation, particularly with other QT-prolonging agents.',
  ],
  adverseEffects: [
    'Nausea, vomiting, abdominal cramping — common and dose-limiting',
    'Diarrhoea',
    'Cholestatic hepatitis with the estolate salt',
    'QT prolongation',
  ],
  interactions: [
    'Ergot alkaloids including methylergometrine — precipitates ergotism.',
    'Statins — rhabdomyolysis risk.',
    'Warfarin — raises INR.',
    'Other QT-prolonging drugs.',
  ],
  monitoring: [
    'Signs of chorioamnionitis while on treatment',
    'Liver function with prolonged courses',
  ],
  pregnancy: DrugSafety(
    summary: 'Widely used in pregnancy and specifically indicated in PPROM. '
        'No consistent teratogenic signal across large datasets.',
    points: [
      'Some registry data have suggested a small association with cardiac '
          'malformation after first-trimester exposure; the evidence is weak '
          'and inconsistent.',
      'Its indication in PPROM is second and third trimester.',
    ],
    source: 'Kenyon SL et al. ORACLE I, Lancet 2001;357:979.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. Small amounts reach milk. An association with '
        'infantile hypertrophic pyloric stenosis has been reported with direct '
        'neonatal treatment rather than with maternal use.',
    source: 'LactMed.',
  ),
  references: [
    'Kenyon SL et al. ORACLE I trial. Lancet 2001;357:979–988.',
    'RCOG Green-top Guideline 73 — PPROM.',
    'NICE NG25 — Preterm labour and birth.',
    'FOGSI GCPR — Preterm Birth; National Formulary of India.',
  ],
);

const kCefazolin = Drug(
  id: 'cefazolin',
  generic: 'Cefazolin',
  drugClass: 'First-generation cephalosporin',
  mechanism: 'Inhibits bacterial cell wall synthesis by binding '
      'penicillin-binding proteins. Chosen for surgical prophylaxis because it '
      'covers skin flora, reaches useful tissue levels quickly, and is cheap.',
  indications: [
    'Surgical antibiotic prophylaxis at caesarean section',
    'Prophylaxis at hysterectomy and other gynaecological surgery',
    'Treatment of susceptible skin and soft tissue infection',
  ],
  doses: [
    DrugDose(
      indication: 'Caesarean prophylaxis',
      dose: '2 g (3 g if above 120 kg)',
      route: 'Intravenous',
      frequency: 'Single dose',
      notes: 'GIVE BEFORE SKIN INCISION, not after cord clamping. This '
          'roughly halves maternal infectious morbidity and is the most '
          'commonly omitted step on the checklist.',
    ),
    DrugDose(
      indication: 'Non-elective caesarean',
      dose: 'Add azithromycin 500 mg IV',
      route: 'Intravenous',
      frequency: 'With the cefazolin',
    ),
    DrugDose(
      indication: 'Hysterectomy prophylaxis',
      dose: '2 g',
      route: 'Intravenous',
      frequency: 'Within 60 minutes of incision; add metronidazole for '
          'vaginal routes',
    ),
  ],
  doseAdjustments: [
    'Repeat the dose if the operation exceeds 4 hours or blood loss exceeds '
        '1500 mL.',
    'Reduce frequency in significant renal impairment.',
  ],
  contraindications: [
    'Immediate hypersensitivity to cephalosporins',
    'Severe immediate (anaphylactic) penicillin allergy — cross-reactivity is '
        'low but not zero',
  ],
  warnings: [
    'A history of penicillin rash is not a contraindication; a history of '
        'anaphylaxis is.',
    'Timing matters more than the drug. After cord clamping is too late.',
  ],
  adverseEffects: [
    'Rash',
    'Diarrhoea, including Clostridioides difficile',
    'Phlebitis at the injection site',
    'Rarely, anaphylaxis',
  ],
  interactions: [
    'Probenecid raises levels.',
    'No clinically important interaction with the drugs used at caesarean.',
  ],
  monitoring: ['Observe for hypersensitivity after the dose'],
  pregnancy: DrugSafety(
    summary: 'Cephalosporins are among the best-established antibiotics in '
        'pregnancy, with no evidence of teratogenicity.',
    source: 'ACOG Practice Bulletin 199.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. Milk levels are very low and no adverse effects are '
        'reported in breastfed infants.',
    source: 'LactMed.',
  ),
  perioperative: 'Single pre-incision dose. Continuing prophylaxis beyond 24 '
      'hours confers no benefit and drives resistance.',
  references: [
    'NICE NG192 — Caesarean birth.',
    'ACOG Practice Bulletin 199 — Use of Prophylactic Antibiotics in Labor '
        'and Delivery.',
    'WHO recommendations for prevention and treatment of maternal peripartum '
        'infections.',
    'FOGSI GCPR — Caesarean Section; National Formulary of India.',
  ],
);

const kBenzylpenicillin = Drug(
  id: 'benzylpenicillin',
  generic: 'Benzylpenicillin (penicillin G)',
  drugClass: 'Beta-lactam antibiotic',
  mechanism: 'Inhibits cell wall cross-linking. Remains the drug of choice '
      'against Group B streptococcus and Treponema pallidum, neither of which '
      'has developed meaningful resistance.',
  indications: [
    'Intrapartum prophylaxis against Group B streptococcus',
    'Syphilis in pregnancy (as benzathine penicillin)',
    'Susceptible streptococcal infection',
  ],
  doses: [
    DrugDose(
      indication: 'Group B streptococcus prophylaxis',
      dose: '3 g loading, then 1.5 g',
      route: 'Intravenous',
      frequency: 'Every 4 hours until delivery',
      notes: 'At least 4 hours before birth where possible — that is what '
          'determines whether the prophylaxis works.',
    ),
    DrugDose(
      indication: 'Syphilis in pregnancy',
      dose: 'Benzathine penicillin 2.4 million units',
      route: 'Intramuscular',
      frequency: 'Weekly for 1–3 doses by stage',
      notes: 'The ONLY adequate treatment for maternal and congenital '
          'syphilis. Desensitise a penicillin-allergic woman rather than '
          'substituting.',
    ),
  ],
  contraindications: ['Immediate hypersensitivity to penicillin'],
  warnings: [
    'JARISCH-HERXHEIMER REACTION after treating syphilis — fever, rigors and '
        'uterine contractions within hours. It can precipitate preterm labour '
        'and fetal distress. Warn her, and monitor.',
    'Penicillin allergy in syphilis is an indication for desensitisation, not '
        'for an alternative agent.',
  ],
  adverseEffects: [
    'Rash and hypersensitivity',
    'Jarisch-Herxheimer reaction in syphilis',
    'Diarrhoea',
    'Neurotoxicity and seizures at very high doses in renal failure',
  ],
  interactions: [
    'Probenecid raises and prolongs levels — used deliberately in some '
        'regimens.',
  ],
  monitoring: [
    'Fetal heart rate after treating syphilis, because of the '
        'Jarisch-Herxheimer reaction',
    'Time from first dose to delivery for GBS prophylaxis',
  ],
  pregnancy: DrugSafety(
    summary: 'The safest and best-studied antibiotic class in pregnancy. It '
        'crosses the placenta, which is exactly what is required to treat the '
        'fetus in congenital syphilis.',
    source: 'WHO guidelines for the treatment of Treponema pallidum.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. Trace amounts in milk; watch only for infant rash or '
        'loose stools.',
    source: 'LactMed.',
  ),
  references: [
    'RCOG Green-top Guideline 36 — Group B Streptococcal Disease.',
    'WHO guideline on syphilis screening and treatment for pregnant women.',
    'NACO National Guidelines on Prevention, Management and Control of '
        'Sexually Transmitted Infections, Government of India.',
    'MoHFW — National Strategic Plan for elimination of congenital syphilis.',
  ],
);

const kOndansetron = Drug(
  id: 'ondansetron',
  generic: 'Ondansetron',
  drugClass: '5-HT3 receptor antagonist',
  mechanism: 'Blocks serotonin at 5-HT3 receptors in the chemoreceptor '
      'trigger zone and on vagal afferents in the gut.',
  indications: [
    'Nausea and vomiting of pregnancy, and hyperemesis gravidarum, where '
        'first-line agents have failed',
    'Postoperative nausea and vomiting',
    'Chemotherapy-induced nausea',
  ],
  doses: [
    DrugDose(
      indication: 'Hyperemesis gravidarum',
      dose: '4–8 mg',
      route: 'Oral, intravenous or intramuscular',
      frequency: 'Every 8 hours',
      max: '24 mg daily',
      notes: 'Second or third line. Try doxylamine-pyridoxine, cyclizine or '
          'promethazine first.',
    ),
    DrugDose(
      indication: 'Postoperative nausea',
      dose: '4 mg',
      route: 'Intravenous',
      frequency: 'Single dose, repeat once if needed',
    ),
  ],
  contraindications: [
    'Congenital long QT syndrome',
    'Concurrent apomorphine',
  ],
  warnings: [
    'QT prolongation — avoid doses above 16 mg intravenously in a single dose, '
        'and check electrolytes in a woman who has been vomiting.',
    'Constipation is common and can be severe in a dehydrated woman.',
    'First-trimester safety data are reassuring overall but not unanimous — '
        'discuss and document where used before 10 weeks.',
  ],
  adverseEffects: [
    'Constipation — very common',
    'Headache',
    'QT prolongation',
    'Serotonin syndrome with other serotonergic drugs',
  ],
  interactions: [
    'Other QT-prolonging drugs.',
    'Serotonergic agents — SSRIs, tramadol.',
  ],
  monitoring: [
    'Electrolytes, particularly potassium and magnesium, in prolonged vomiting',
    'ECG where other QT-prolonging drugs are used',
    'Bowel function',
  ],
  pregnancy: DrugSafety(
    summary: 'Large cohort studies have not shown an overall increase in major '
        'malformation. Individual studies have reported small associations '
        'with orofacial cleft and with cardiac septal defects, and these '
        'remain contested.',
    points: [
      'The absolute risk, if real, is very small — of the order of a few '
          'additional cases per 10 000 exposures.',
      'Untreated hyperemesis carries its own substantial maternal and fetal '
          'risk, including Wernicke encephalopathy.',
      'Reasonable to use where first-line agents have failed, with the '
          'discussion documented.',
    ],
    source: 'RCOG Green-top Guideline 69; large Scandinavian and US cohort '
        'studies.',
  ),
  lactation: DrugSafety(
    summary: 'Limited data, but the short half-life and low oral '
        'bioavailability in infants make significant exposure unlikely. '
        'Generally considered acceptable.',
    source: 'LactMed.',
  ),
  references: [
    'RCOG Green-top Guideline 69 — The Management of Nausea and Vomiting of '
        'Pregnancy and Hyperemesis Gravidarum.',
    'ACOG Practice Bulletin 189 — Nausea and Vomiting of Pregnancy.',
    'FOGSI GCPR — Nausea and Vomiting of Pregnancy.',
  ],
);

const kDoxylaminePyridoxine = Drug(
  id: 'doxylamine-pyridoxine',
  generic: 'Doxylamine with pyridoxine',
  brandNames: ['Diclegis', 'Doxinate', 'Pregnidoxin'],
  drugClass: 'Antihistamine with vitamin B6',
  mechanism: 'Doxylamine is a sedating H1 antihistamine with antiemetic '
      'action; pyridoxine is a cofactor in neurotransmitter metabolism and has '
      'independent antiemetic effect in pregnancy.',
  indications: [
    'Nausea and vomiting of pregnancy — first-line pharmacological treatment',
  ],
  doses: [
    DrugDose(
      indication: 'Nausea and vomiting of pregnancy',
      dose: 'Two tablets at bedtime, increasing to four daily if needed',
      route: 'Oral',
      frequency: 'Up to four tablets daily — one morning, one midday, two at '
          'night',
      max: '4 tablets daily',
      notes: 'Each tablet typically contains doxylamine 10 mg with pyridoxine '
          '10 mg. Take on an empty stomach with water.',
    ),
    DrugDose(
      indication: 'Pyridoxine alone',
      dose: '10–25 mg',
      route: 'Oral',
      frequency: 'Three times daily',
      notes: 'Where the combination is unavailable.',
    ),
  ],
  contraindications: [
    'Concurrent monoamine oxidase inhibitor',
    'Known hypersensitivity',
  ],
  warnings: [
    'Sedation is common — warn about driving.',
    'Anticholinergic effects add to those of other such drugs.',
  ],
  adverseEffects: [
    'Drowsiness — the commonest reason for stopping',
    'Dry mouth',
    'Constipation',
    'Dizziness',
  ],
  interactions: [
    'Additive sedation with alcohol, opioids and other antihistamines.',
    'MAO inhibitors — contraindicated.',
  ],
  monitoring: [
    'Weight and ketonuria in significant vomiting',
    'Hydration status',
  ],
  pregnancy: DrugSafety(
    summary: 'The best-studied antiemetic in pregnancy, with data from '
        'millions of exposures and no evidence of teratogenicity. It is '
        'first-line for exactly that reason.',
    points: [
      'The historical Bendectin litigation was not supported by the '
          'subsequent evidence, and the combination was reintroduced.',
      'Untreated nausea and vomiting is itself associated with poorer '
          'outcomes and considerable suffering.',
    ],
    source: 'ACOG Practice Bulletin 189; RCOG Green-top Guideline 69.',
  ),
  lactation: DrugSafety(
    summary: 'Occasional use is acceptable. Sedating antihistamines may cause '
        'infant drowsiness and, with regular use, may reduce milk supply.',
    points: ['Watch a young infant for drowsiness and poor feeding.'],
    source: 'LactMed.',
  ),
  references: [
    'ACOG Practice Bulletin 189 — Nausea and Vomiting of Pregnancy.',
    'RCOG Green-top Guideline 69.',
    'FOGSI GCPR — Nausea and Vomiting of Pregnancy; National Formulary of '
        'India.',
  ],
);

const kParacetamol = Drug(
  id: 'paracetamol',
  generic: 'Paracetamol (acetaminophen)',
  drugClass: 'Simple analgesic and antipyretic',
  mechanism: 'Central inhibition of prostaglandin synthesis, with additional '
      'action on descending serotonergic pathways. Minimal peripheral '
      'anti-inflammatory effect, which is why it does not carry the NSAID '
      'risks.',
  indications: [
    'Analgesia and fever in pregnancy — first-line',
    'Postpartum and post-caesarean analgesia',
    'Part of multimodal analgesia to spare opioids',
  ],
  doses: [
    DrugDose(
      indication: 'Analgesia',
      dose: '1 g',
      route: 'Oral, rectal or intravenous',
      frequency: 'Every 6 hours',
      max: '4 g in 24 hours',
      notes: 'Reduce to 3 g daily below 50 kg, in hepatic impairment, chronic '
          'alcohol use or malnutrition.',
    ),
  ],
  doseAdjustments: [
    'Below 50 kg: 15 mg/kg per dose, maximum 60 mg/kg daily.',
    'Hepatic impairment or chronic malnutrition: maximum 3 g daily.',
  ],
  contraindications: ['Severe hepatic impairment'],
  warnings: [
    'Hepatotoxicity in overdose is dose-dependent and initially silent.',
    'Check other preparations she is taking — combination cold and analgesic '
        'products frequently contain paracetamol and cause inadvertent '
        'overdose.',
  ],
  adverseEffects: [
    'Very few at therapeutic dose',
    'Hepatotoxicity in overdose',
    'Rarely, rash',
  ],
  interactions: [
    'Warfarin — regular high-dose use may raise INR.',
    'Enzyme inducers increase the risk of hepatotoxicity in overdose.',
  ],
  monitoring: ['None routinely at therapeutic dose'],
  pregnancy: DrugSafety(
    summary: 'The analgesic of choice throughout pregnancy. Decades of use '
        'with no established teratogenicity.',
    points: [
      'Observational studies have reported associations with childhood '
          'neurodevelopmental outcomes, but these are confounded by the '
          'indication and no causal link is established.',
      'Regulatory bodies continue to recommend it as first-line, at the '
          'lowest effective dose for the shortest time.',
      'Untreated pain and fever carry their own risks — maternal fever in '
          'early pregnancy is itself associated with neural tube defects.',
    ],
    source: 'EMA and MHRA reviews; ACOG.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible and preferred. Milk levels are very low, and it is a '
        'first-choice analgesic for breastfeeding women.',
    source: 'LactMed.',
  ),
  antidote: 'N-acetylcysteine, given according to the nomogram. It is '
      'effective in pregnancy and must not be withheld.',
  overdose: 'Above 150 mg/kg is potentially hepatotoxic. Take a paracetamol '
      'level at 4 hours or later and treat by the nomogram. Pregnancy is not a '
      'reason to delay N-acetylcysteine — untreated maternal hepatic failure '
      'kills the fetus too.',
  references: [
    'RCOG and MHRA guidance on analgesia in pregnancy.',
    'ACOG Practice Advisory on acetaminophen use in pregnancy.',
    'National Formulary of India; Indian Pharmacopoeia.',
  ],
);

const kNsaids = Drug(
  id: 'nsaids',
  generic: 'NSAIDs in pregnancy (ibuprofen, diclofenac)',
  drugClass: 'Non-steroidal anti-inflammatory drugs',
  mechanism: 'Inhibit cyclo-oxygenase and prostaglandin synthesis. In the '
      'fetus, prostaglandins keep the ductus arteriosus open and maintain '
      'renal perfusion — which is precisely why these drugs cause harm in the '
      'third trimester.',
  indications: [
    'Postpartum analgesia, including after caesarean',
    'Dysmenorrhoea and heavy menstrual bleeding',
    'Analgesia in the first and second trimesters, where clearly needed and '
        'briefly',
  ],
  doses: [
    DrugDose(
      indication: 'Postpartum analgesia',
      dose: 'Ibuprofen 400 mg',
      route: 'Oral',
      frequency: 'Every 6–8 hours with food',
      max: '1200–1600 mg daily',
      notes: 'Part of multimodal analgesia with paracetamol; markedly reduces '
          'opioid requirement after caesarean.',
    ),
    DrugDose(
      indication: 'Dysmenorrhoea and heavy menstrual bleeding',
      dose: 'Mefenamic acid 500 mg or ibuprofen 400 mg',
      route: 'Oral',
      frequency: 'Three times daily during menstruation',
    ),
  ],
  contraindications: [
    'From 20 weeks of pregnancy onwards, other than in specific supervised '
        'indications',
    'Active peptic ulceration',
    'Severe renal impairment',
    'Aspirin-exacerbated respiratory disease',
    'Severe pre-eclampsia with renal impairment, postpartum',
  ],
  warnings: [
    'AVOID FROM 20 WEEKS. Oligohydramnios and fetal renal impairment can '
        'occur from around 20 weeks, and premature constriction of the ductus '
        'arteriosus from about 30 weeks.',
    'The FDA extended its warning from 30 to 20 weeks in 2020 — a change many '
        'references have not caught up with.',
    'Avoid postpartum where there is renal impairment or poorly controlled '
        'hypertension after pre-eclampsia.',
  ],
  adverseEffects: [
    'Dyspepsia and gastrointestinal bleeding',
    'Renal impairment',
    'Fluid retention and raised blood pressure',
    'Fetal: oligohydramnios, ductal constriction, neonatal pulmonary '
        'hypertension',
  ],
  interactions: [
    'Aspirin — competes at COX-1 and may blunt its antiplatelet effect.',
    'Anticoagulants — bleeding risk.',
    'ACE inhibitors and diuretics — the "triple whammy" of renal injury.',
    'Methotrexate — reduced clearance.',
  ],
  monitoring: [
    'Renal function with prolonged use',
    'Blood pressure postpartum',
    'Amniotic fluid volume if used beyond 20 weeks for a specific indication',
  ],
  pregnancy: DrugSafety(
    summary: 'Best avoided from 20 weeks. Before that, short courses for a '
        'clear indication are generally acceptable, though some data suggest '
        'a small increase in miscarriage with use around conception.',
    points: [
      'From about 20 weeks: fetal renal effects and oligohydramnios.',
      'From about 30 weeks: premature closure of the ductus arteriosus and '
          'persistent pulmonary hypertension of the newborn.',
      'Indomethacin as a tocolytic is a supervised exception, used briefly and '
          'usually below 32 weeks with fluid monitoring.',
    ],
    source: 'FDA Drug Safety Communication 2020; ACOG.',
  ),
  lactation: DrugSafety(
    summary: 'Ibuprofen is a first-choice analgesic in breastfeeding — milk '
        'levels are extremely low and its short half-life helps.',
    source: 'LactMed.',
  ),
  references: [
    'FDA Drug Safety Communication, October 2020 — NSAID use at 20 weeks and '
        'beyond.',
    'ACOG Practice Advisory on NSAIDs in pregnancy.',
    'NICE NG192 — Caesarean birth: postoperative analgesia.',
  ],
);
