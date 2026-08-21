import '../../models/drug.dart';

const kOxytocin = Drug(
  id: 'oxytocin',
  generic: 'Oxytocin',
  brandNames: ['Syntocinon', 'Pitocin'],
  drugClass: 'Synthetic nonapeptide · oxytocic',
  mechanism: 'Binds myometrial oxytocin receptors, raising intracellular '
      'calcium and producing rhythmic contraction. Receptor density rises '
      'steeply through pregnancy, which is why the same dose does almost '
      'nothing at 20 weeks and a great deal at term.',
  indications: [
    'Induction and augmentation of labour',
    'Active management of the third stage',
    'Prevention and treatment of postpartum haemorrhage',
    'Uterine tone at caesarean section',
    'Medical management of miscarriage and termination',
  ],
  doses: [
    DrugDose(
      indication: 'Third stage — active management',
      dose: '10 IU',
      route: 'Intramuscular',
      frequency: 'Single dose with delivery of the anterior shoulder',
      notes: 'Or 5 IU by slow intravenous injection.',
    ),
    DrugDose(
      indication: 'Postpartum haemorrhage — treatment',
      dose: '5 IU by slow IV injection, then 40 IU in 500 mL over 4 hours',
      route: 'Intravenous',
      max: 'Infusion rate 10 IU/hour',
      notes: 'The bolus must be given slowly. A rapid push causes profound '
          'hypotension, tachycardia and ischaemic ECG change.',
    ),
    DrugDose(
      indication: 'Induction or augmentation of labour',
      dose: 'Start at 1–2 mU/min',
      route: 'Intravenous infusion',
      frequency: 'Increase every 30 minutes',
      max: '20 mU/min in most protocols; some permit 32',
      notes: 'Titrate to 4–5 contractions in 10 minutes. A woman already '
          'contracting adequately does not need more.',
    ),
    DrugDose(
      indication: 'Caesarean section',
      dose: '5 IU by slow IV injection over at least 5 minutes',
      route: 'Intravenous',
      notes: 'Followed by an infusion where there is a risk of atony. Lower '
          'doses (3 IU) are used in cardiac disease.',
    ),
  ],
  preparation: 'Ampoules of 5 IU/mL or 10 IU/mL.',
  dilution: 'For infusion, 40 IU in 500 mL of a balanced crystalloid or normal '
      'saline. Avoid large volumes of hypotonic fluid.',
  administrationRate: 'Never as a rapid intravenous bolus.',
  doseAdjustments: [
    'Reduce or stop for tachysystole — more than 5 contractions in 10 minutes '
        'averaged over 30 minutes.',
    'Halve the rate if the fetal heart rate becomes non-reassuring.',
  ],
  contraindications: [
    'Hypertonic uterine contractions',
    'Mechanical obstruction to delivery',
    'Fetal distress where delivery is not imminent',
    'Any condition in which labour or vaginal delivery is contraindicated',
    'Severe cardiovascular disease — relative, and requires anaesthetic input',
  ],
  warnings: [
    'Rapid intravenous bolus causes hypotension, tachycardia and ECG change — '
        'the commonest avoidable harm from this drug.',
    'Water intoxication and hyponatraemia with prolonged high-dose infusion in '
        'large volumes of hypotonic fluid — oxytocin has antidiuretic '
        'activity. Watch for confusion, seizures and a falling sodium.',
    'Tachysystole and uterine hyperstimulation, particularly with '
        'prostaglandin priming.',
    'Uterine rupture, especially in a scarred or grand multiparous uterus.',
    'Oxytocin receptor desensitisation after prolonged exposure — a woman '
        'augmented for many hours may respond poorly to oxytocin for '
        'postpartum haemorrhage.',
  ],
  adverseEffects: [
    'Nausea and vomiting',
    'Headache and flushing',
    'Hypotension and reflex tachycardia',
    'Arrhythmia and myocardial ischaemia',
    'Hyponatraemia with prolonged infusion',
    'Anaphylactoid reaction (rare)',
  ],
  interactions: [
    'Prostaglandins potentiate the uterotonic effect — allow an interval after '
        'a prostaglandin pessary before starting oxytocin.',
    'Vasoconstrictors and ergot alkaloids may cause severe hypertension.',
    'Volatile anaesthetic agents reduce the uterotonic response.',
  ],
  monitoring: [
    'Contraction frequency and duration',
    'Continuous electronic fetal monitoring during induction and augmentation',
    'Maternal pulse and blood pressure',
    'Strict fluid balance during prolonged infusion',
    'Serum sodium if the infusion runs beyond 24 hours',
  ],
  pregnancy: DrugSafety(
    summary: 'Used in pregnancy for its intended pharmacological effect. It '
        'does not cross the placenta in meaningful amounts, and the fetal '
        'risk comes from the contractions rather than the drug.',
    points: [
      'Not used before term other than for termination or the management of '
          'miscarriage.',
      'The fetal consequence of concern is hypoxia from tachysystole, not '
          'teratogenicity.',
    ],
  ),
  lactation: DrugSafety(
    summary: 'Compatible with breastfeeding. Oxytocin is a peptide, destroyed '
        'in the infant gut, and endogenous oxytocin is released with every '
        'feed in any case.',
    source: 'LactMed.',
  ),
  antidote: 'None. Stop the infusion. For tachysystole give acute tocolysis — '
      'terbutaline 250 µg subcutaneously — and reposition into the left '
      'lateral position.',
  overdose: 'Tachysystole, uterine rupture, and water intoxication with '
      'hyponatraemic seizures. Stop the infusion, restrict fluid, and correct '
      'sodium cautiously.',
  references: [
    'WHO Recommendations for the Prevention and Treatment of Postpartum '
        'Haemorrhage.',
    'NICE NG207 — Inducing labour.',
    'RCOG Green-top Guideline 52 — Prevention and Management of Postpartum '
        'Haemorrhage.',
    'Gallos I et al. E-MOTIVE trial. N Engl J Med 2023;389:11–21.',
  ],
);

const kMisoprostol = Drug(
  id: 'misoprostol',
  generic: 'Misoprostol',
  brandNames: ['Cytotec', 'Misoprost'],
  drugClass: 'Synthetic prostaglandin E1 analogue',
  mechanism: 'Agonist at prostaglandin EP2 and EP3 receptors, softening the '
      'cervix through collagen breakdown and stimulating myometrial '
      'contraction. Heat-stable and orally active, which is why it works where '
      'a cold chain does not exist.',
  indications: [
    'Postpartum haemorrhage where injectable uterotonics are unavailable',
    'Cervical ripening and induction of labour at term',
    'Medical management of miscarriage',
    'Medical termination of pregnancy, with mifepristone',
    'Cervical priming before hysteroscopy or surgical evacuation',
  ],
  doses: [
    DrugDose(
      indication: 'Postpartum haemorrhage',
      dose: '800 µg',
      route: 'Sublingual',
      frequency: 'Single dose',
      notes: 'Sublingual gives the fastest peak. Rectal is slower and less '
          'reliable in an emergency.',
    ),
    DrugDose(
      indication: 'Induction of labour at term',
      dose: '25 µg',
      route: 'Vaginal',
      frequency: 'Every 4 hours',
      notes: 'Or 25 µg orally every 2 hours. These doses are an order of '
          'magnitude below those used in early pregnancy.',
    ),
    DrugDose(
      indication: 'Missed miscarriage',
      dose: '800 µg',
      route: 'Vaginal',
      frequency: 'Repeat after 24–48 hours if no response',
    ),
    DrugDose(
      indication: 'Cervical priming before hysteroscopy',
      dose: '400 µg',
      route: 'Vaginal',
      frequency: '3 hours before the procedure',
    ),
  ],
  preparation: 'Tablets of 25, 100 and 200 µg. Splitting a 200 µg tablet to '
      'obtain 25 µg is imprecise — use the correct strength where available.',
  contraindications: [
    'Previous caesarean section or any uterine scar, for induction at term',
    'Known hypersensitivity to prostaglandins',
    'Established labour',
    'Suspected ectopic pregnancy, for medical abortion regimens',
  ],
  warnings: [
    'THE DOSE AT TERM IS FAR SMALLER THAN IN EARLY PREGNANCY. Confusing the '
        'two is a recognised cause of uterine rupture and fetal death.',
    'Dose-dependent tachysystole and hyperstimulation.',
    'Uterine rupture, particularly in a scarred uterus or high parity.',
    'Where a pregnancy continues after failed medical abortion, misoprostol is '
        'teratogenic — Möbius sequence and terminal transverse limb defects.',
  ],
  adverseEffects: [
    'Pyrexia and shivering — common, dose-related, and often mistaken for '
        'sepsis',
    'Diarrhoea, nausea, vomiting, abdominal cramping',
    'Tachysystole',
  ],
  interactions: [
    'Additive with oxytocin — allow an interval before starting an oxytocin '
        'infusion.',
    'Magnesium-containing antacids worsen the diarrhoea.',
  ],
  monitoring: [
    'Contraction frequency after each dose',
    'Fetal heart rate where the fetus is viable',
    'Temperature — distinguish drug pyrexia from infection',
  ],
  pregnancy: DrugSafety(
    summary: 'Used deliberately in pregnancy for its uterotonic effect. It is '
        'teratogenic if the pregnancy continues after exposure, so it must '
        'never be given to a woman with a wanted ongoing pregnancy.',
    points: [
      'Möbius sequence, terminal transverse limb reduction defects and '
          'arthrogryposis are reported after first-trimester exposure with a '
          'continuing pregnancy.',
      'Where medical abortion fails, surgical completion is advised rather '
          'than continuation.',
    ],
  ),
  lactation: DrugSafety(
    summary: 'Compatible. Misoprostol acid appears in milk in small amounts '
        'and is cleared rapidly; no interruption of breastfeeding is required '
        'for the doses used in obstetrics.',
    points: [
      'Peak milk levels occur within an hour and fall to undetectable by five '
          'hours.',
      'Infant diarrhoea has been reported only rarely.',
    ],
    source: 'LactMed.',
  ),
  antidote: 'None. Stop further dosing, remove any vaginal tablet, and treat '
      'tachysystole with terbutaline 250 µg subcutaneously.',
  references: [
    'FIGO Misoprostol-only Recommended Regimens.',
    'WHO Recommendations on Induction of Labour.',
    'NICE NG126 — Ectopic pregnancy and miscarriage.',
    'RCOG Green-top Guideline 52.',
  ],
);

const kCarboprost = Drug(
  id: 'carboprost',
  generic: 'Carboprost tromethamine',
  brandNames: ['Hemabate', 'Prostodin'],
  drugClass: '15-methyl prostaglandin F2α analogue',
  mechanism: 'Prostaglandin F receptor agonist producing sustained, powerful '
      'myometrial contraction. The 15-methyl substitution resists degradation, '
      'giving a longer duration than natural PGF2α.',
  indications: [
    'Postpartum haemorrhage from uterine atony, refractory to oxytocin and '
        'ergometrine',
    'Second-trimester termination of pregnancy',
  ],
  doses: [
    DrugDose(
      indication: 'Postpartum haemorrhage',
      dose: '250 µg',
      route: 'Deep intramuscular',
      frequency: 'Every 15 minutes as required',
      max: '2 mg — eight doses',
      notes: 'May be given intramyometrially by an experienced operator, '
          'though this route is unlicensed.',
    ),
  ],
  preparation: 'Ampoules of 250 µg/mL. Refrigerate.',
  contraindications: [
    'Asthma or any reactive airways disease — this is the one that matters',
    'Active cardiac, pulmonary, renal or hepatic disease',
    'Known hypersensitivity',
  ],
  warnings: [
    'Bronchospasm can be severe and is the reason asthma is an absolute '
        'contraindication.',
    'Pyrexia is common and drug-induced — do not mistake it for sepsis and '
        'delay the next dose.',
    'Hypertension and, rarely, pulmonary oedema.',
  ],
  adverseEffects: [
    'Diarrhoea — very common; consider prophylactic antiemetic and '
        'antidiarrhoeal',
    'Vomiting and nausea',
    'Pyrexia and flushing',
    'Bronchospasm',
    'Hypertension',
  ],
  interactions: [
    'Additive uterotonic effect with oxytocin and ergometrine.',
    'Augments the action of other oxytocics — watch for hyperstimulation '
        'before delivery.',
  ],
  monitoring: [
    'Respiratory rate and oxygen saturation, particularly for wheeze',
    'Blood pressure',
    'Temperature',
    'Uterine tone and ongoing blood loss',
  ],
  pregnancy: DrugSafety(
    summary: 'Not used in a continuing pregnancy. It is an abortifacient and '
        'is given either after delivery or to end a pregnancy.',
  ),
  lactation: DrugSafety(
    summary: 'Considered compatible. Data are limited, but the half-life is '
        'short and the doses used are single or few.',
    source: 'LactMed.',
  ),
  antidote: 'None. Stop further doses. Treat bronchospasm with nebulised '
      'salbutamol and standard asthma measures.',
  references: [
    'RCOG Green-top Guideline 52 — Prevention and Management of Postpartum '
        'Haemorrhage.',
    'WHO Recommendations for the Prevention and Treatment of Postpartum '
        'Haemorrhage.',
    'FOGSI GCPR — Postpartum Haemorrhage.',
  ],
);

const kMethylergometrine = Drug(
  id: 'methylergometrine',
  generic: 'Methylergometrine (methylergonovine)',
  brandNames: ['Methergine', 'Methergin'],
  drugClass: 'Semisynthetic ergot alkaloid',
  mechanism: 'Partial agonist at alpha-adrenergic and serotonergic receptors, '
      'producing sustained tetanic uterine contraction. The same receptor '
      'activity causes generalised vasoconstriction, which is why hypertension '
      'is a contraindication rather than a caution.',
  indications: [
    'Active management of the third stage of labour',
    'Prevention and treatment of postpartum haemorrhage from atony',
    'Subinvolution of the uterus',
  ],
  doses: [
    DrugDose(
      indication: 'Postpartum haemorrhage',
      dose: '0.2 mg',
      route: 'Intramuscular',
      frequency: 'Every 2–4 hours as required',
      max: '5 doses',
      notes: 'Intravenous administration causes severe acute hypertension and '
          'is generally avoided; if unavoidable, give 0.2 mg over at least 60 '
          'seconds with blood pressure monitoring.',
    ),
    DrugDose(
      indication: 'Subinvolution',
      dose: '0.125–0.25 mg orally',
      route: 'Oral',
      frequency: 'Three to four times daily for up to 7 days',
    ),
  ],
  preparation: 'Ampoules of 0.2 mg/mL. Protect from light; store below 25 °C.',
  contraindications: [
    'Hypertension of any cause',
    'Pre-eclampsia and eclampsia',
    'Cardiac disease, including ischaemic heart disease',
    'Severe hepatic or renal impairment',
    'Sepsis',
    'Peripheral vascular disease',
    'Retained placenta — it may trap the placenta by causing tetanic '
        'contraction',
  ],
  warnings: [
    'The commonest error is giving this to a woman with pre-eclampsia who is '
        'bleeding. Check the blood pressure before, not after.',
    'Coronary and cerebral vasospasm have been reported.',
    'Prolonged use causes ergotism — peripheral ischaemia, paraesthesia.',
  ],
  adverseEffects: [
    'Hypertension, sometimes severe',
    'Nausea and vomiting — very common',
    'Headache and dizziness',
    'Abdominal pain',
    'Palpitations',
  ],
  interactions: [
    'CYP3A4 inhibitors precipitate ergotism — macrolides such as '
        'erythromycin and clarithromycin, azole antifungals, HIV protease '
        'inhibitors, grapefruit juice.',
    'Other vasoconstrictors and triptans compound the vasospasm.',
    'Beta-blockers may enhance the vasoconstriction.',
  ],
  monitoring: [
    'Blood pressure before every dose',
    'Uterine tone and blood loss',
    'Peripheral perfusion with repeated dosing',
  ],
  pregnancy: DrugSafety(
    summary: 'Not used in a continuing pregnancy — it causes tetanic '
        'contraction and fetal compromise. It is a third-stage and postpartum '
        'drug.',
  ),
  lactation: DrugSafety(
    summary: 'Short courses are generally considered acceptable, but ergot '
        'alkaloids can reduce prolactin and interfere with the establishment '
        'of lactation. Prefer alternatives where prolonged treatment is '
        'needed.',
    points: [
      'Avoid prolonged or repeated courses in the first weeks of '
          'breastfeeding.',
      'Watch the infant for vomiting, diarrhoea and irritability.',
    ],
    source: 'LactMed.',
  ),
  antidote: 'None specific. Treat severe hypertension with a short-acting '
      'agent; nitroglycerine or nitroprusside have been used for ergot-induced '
      'vasospasm.',
  overdose: 'Vasospasm, hypertension, seizures, gangrene of extremities. '
      'Supportive care with vasodilators.',
  references: [
    'RCOG Green-top Guideline 52.',
    'WHO Recommendations for the Prevention and Treatment of Postpartum '
        'Haemorrhage.',
    'FOGSI GCPR — Postpartum Haemorrhage.',
  ],
);

const kTranexamicAcid = Drug(
  id: 'tranexamic-acid',
  generic: 'Tranexamic acid',
  brandNames: ['Cyklokapron', 'Trapic', 'Texakind'],
  drugClass: 'Antifibrinolytic · synthetic lysine analogue',
  mechanism: 'Blocks the lysine binding sites on plasminogen, preventing it '
      'from attaching to fibrin and being converted to plasmin. Clot already '
      'formed is preserved rather than new clot created.',
  indications: [
    'Postpartum haemorrhage — treatment',
    'Heavy menstrual bleeding',
    'Reduction of blood loss at caesarean section',
    'Trauma with significant haemorrhage',
  ],
  doses: [
    DrugDose(
      indication: 'Postpartum haemorrhage',
      dose: '1 g in 10 mL, given intravenously over 10 minutes',
      route: 'Intravenous',
      frequency: 'Repeat once after 30 minutes if bleeding continues, or if it '
          'restarts within 24 hours',
      max: '2 g',
      notes: 'Give within 3 hours of birth. The WOMAN trial found no benefit '
          'beyond that, and a signal of harm.',
    ),
    DrugDose(
      indication: 'Heavy menstrual bleeding',
      dose: '1 g',
      route: 'Oral',
      frequency: 'Three times daily during menstruation',
      max: '4 days per cycle',
    ),
  ],
  preparation: 'Ampoules of 500 mg/5 mL; tablets of 500 mg.',
  administrationRate: 'No faster than 1 mL/minute — rapid injection causes '
      'hypotension.',
  doseAdjustments: [
    'Reduce in renal impairment — it is cleared almost entirely by the kidney.',
    'Creatinine 1.36–2.83 mg/dL: 10 mg/kg twice daily. Above 5.66 mg/dL: '
        '10 mg/kg once daily.',
  ],
  contraindications: [
    'Active intravascular clotting or known thromboembolic disease',
    'History of seizures — relative, and dose-dependent',
    'Subarachnoid haemorrhage — risk of cerebral ischaemia',
    'Severe renal impairment without dose reduction',
  ],
  warnings: [
    'Rapid intravenous injection causes hypotension.',
    'Seizures occur with high doses, particularly in renal impairment or '
        'after cardiac surgery.',
    'Colour vision disturbance with prolonged use — stop if it occurs.',
  ],
  adverseEffects: [
    'Nausea, vomiting, diarrhoea with oral use',
    'Hypotension with rapid injection',
    'Seizures at high dose',
    'Visual disturbance with prolonged use',
  ],
  interactions: [
    'Combined hormonal contraceptives increase thrombotic risk when taken '
        'together — a consideration in heavy menstrual bleeding rather than in '
        'haemorrhage.',
    'Avoid concurrent prothrombin complex concentrate or factor VIIa except on '
        'haematology advice.',
  ],
  monitoring: [
    'Blood pressure during intravenous administration',
    'Renal function where treatment is repeated',
    'Ongoing blood loss',
  ],
  pregnancy: DrugSafety(
    summary: 'Crosses the placenta but is used in pregnancy and at delivery '
        'where bleeding demands it. Large trial data in obstetric haemorrhage '
        'show no excess of thromboembolism in mothers.',
    points: [
      'The WOMAN trial randomised over 20,000 women and found a reduction in '
          'death due to bleeding with no increase in thrombotic events.',
      'Antenatal use for antepartum haemorrhage is less well studied.',
    ],
    source: 'WOMAN Trial Collaborators, Lancet 2017.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. Milk concentrations are about 1% of maternal serum, '
        'and the drug is poorly absorbed orally by the infant.',
    source: 'LactMed.',
  ),
  references: [
    'WOMAN Trial Collaborators. Lancet 2017;389:2105–2116.',
    'WHO Recommendation on Tranexamic Acid for the Treatment of Postpartum '
        'Haemorrhage.',
    'NICE NG88 — Heavy menstrual bleeding.',
    'RCOG Green-top Guideline 52.',
  ],
);
