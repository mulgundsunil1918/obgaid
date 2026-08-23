import '../../models/drug.dart';

const kLabetalol = Drug(
  id: 'labetalol',
  generic: 'Labetalol',
  brandNames: ['Trandate', 'Lobet'],
  drugClass: 'Combined alpha-1 and non-selective beta blocker',
  mechanism: 'Alpha-1 blockade lowers peripheral resistance while beta '
      'blockade prevents the reflex tachycardia that would otherwise follow. '
      'The ratio favours beta blockade, which is why asthma is a '
      'contraindication.',
  indications: [
    'Severe hypertension in pregnancy',
    'Maintenance treatment of chronic and gestational hypertension',
    'Hypertension in pre-eclampsia',
  ],
  doses: [
    DrugDose(
      indication: 'Severe hypertension — acute',
      dose: '20 mg IV over 2 minutes, then 40 mg, then 80 mg',
      route: 'Intravenous',
      frequency: 'At 10-minute intervals',
      max: '300 mg cumulative',
      notes: 'Target 140–150 / 90–100 mmHg. Do not drop below 130/80 — '
          'placental perfusion is pressure-dependent.',
    ),
    DrugDose(
      indication: 'Severe hypertension — where IV is unavailable',
      dose: '200 mg orally',
      route: 'Oral',
      frequency: 'Repeat after 1 hour if needed',
    ),
    DrugDose(
      indication: 'Maintenance',
      dose: '100–400 mg',
      route: 'Oral',
      frequency: 'Two to three times daily',
      max: '2400 mg daily',
    ),
    DrugDose(
      indication: 'Infusion for resistant hypertension',
      dose: 'Start 20 mg/hour, doubling every 30 minutes',
      route: 'Intravenous infusion',
      max: '160 mg/hour',
    ),
  ],
  preparation: 'Ampoules of 100 mg/20 mL; tablets of 100, 200 and 400 mg.',
  contraindications: [
    'Asthma and reactive airways disease',
    'Second or third degree heart block',
    'Cardiogenic shock',
    'Severe bradycardia',
    'Decompensated heart failure',
    'Severe peripheral arterial disease',
  ],
  warnings: [
    'Neonatal bradycardia and hypoglycaemia after delivery — observe the baby '
        'for 24–48 hours.',
    'Masks the adrenergic warning signs of hypoglycaemia in diabetes.',
    'Rare but serious hepatotoxicity — stop if transaminases rise or she '
        'becomes jaundiced.',
    'Abrupt withdrawal after prolonged use may precipitate rebound '
        'hypertension.',
  ],
  adverseEffects: [
    'Postural hypotension and dizziness',
    'Bradycardia',
    'Scalp tingling — common, harmless and alarming if unwarned',
    'Fatigue and headache',
    'Bronchospasm in susceptible women',
    'Hepatotoxicity (rare)',
  ],
  interactions: [
    'Calcium channel blockers — additive hypotension and bradycardia.',
    'Halothane and other volatile agents — exaggerated hypotension.',
    'Insulin and oral hypoglycaemics — masked hypoglycaemia.',
  ],
  monitoring: [
    'Blood pressure every 15 minutes until controlled, then hourly',
    'Maternal pulse',
    'Liver function with prolonged oral treatment',
    'Neonatal heart rate and blood glucose after delivery',
  ],
  pregnancy: DrugSafety(
    summary: 'One of the best-established antihypertensives in pregnancy and a '
        'first-line choice in most guidelines. It crosses the placenta but has '
        'not been associated with congenital malformation.',
    points: [
      'Beta blockade as a class has been linked with fetal growth restriction, '
          'most strongly with atenolol; labetalol carries less of this signal '
          'but growth surveillance is reasonable.',
      'Neonatal bradycardia and hypoglycaemia are recognised and transient.',
    ],
    source: 'NICE NG133; ACOG Practice Bulletin 222.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. Milk levels are low and adverse effects in breastfed '
        'infants are rarely reported; it is a preferred agent for postpartum '
        'hypertension.',
    points: [
      'Observe a preterm or small infant for bradycardia and poor feeding.',
    ],
    source: 'LactMed.',
  ),
  antidote: 'Atropine for symptomatic bradycardia; glucagon for refractory '
      'beta-blocker toxicity.',
  references: [
    'NICE NG133 — Hypertension in pregnancy.',
    'ACOG Committee Opinion 767 — Emergent Therapy for Acute-Onset Severe '
        'Hypertension.',
    'RCOG Green-top Guideline 10(A).',
    'FOGSI-ICOG GCPR — Hypertensive Disorders of Pregnancy; MoHFW Government '
        'of India maternal health guidelines.',
  ],
);

const kNifedipine = Drug(
  id: 'nifedipine',
  generic: 'Nifedipine',
  brandNames: ['Adalat', 'Nifedine'],
  drugClass: 'Dihydropyridine calcium channel blocker',
  mechanism: 'Blocks L-type calcium channels in vascular smooth muscle, '
      'causing arteriolar dilatation. The same action on the myometrium is '
      'what makes it an effective tocolytic.',
  indications: [
    'Severe hypertension in pregnancy',
    'Maintenance antihypertensive treatment',
    'Tocolysis in preterm labour',
  ],
  doses: [
    DrugDose(
      indication: 'Severe hypertension — acute',
      dose: '10 mg immediate-release capsule, swallowed',
      route: 'Oral',
      frequency: 'Repeat every 20 minutes',
      max: '3 doses (30 mg)',
      notes: 'NEVER sublingual. The fall is uncontrolled and causes fetal '
          'distress.',
    ),
    DrugDose(
      indication: 'Maintenance',
      dose: '10–40 mg modified-release',
      route: 'Oral',
      frequency: 'Twice daily',
      max: '80 mg daily',
    ),
    DrugDose(
      indication: 'Tocolysis',
      dose: '20 mg orally, then 10–20 mg',
      route: 'Oral',
      frequency: 'Every 6–8 hours',
      notes: 'For 48 hours only — long enough for corticosteroids and in utero '
          'transfer, and no longer.',
    ),
  ],
  preparation: 'Immediate-release capsules 5 and 10 mg; modified-release '
      'tablets 10, 20, 30 and 60 mg.',
  contraindications: [
    'Cardiogenic shock',
    'Significant aortic stenosis',
    'Within one month of myocardial infarction',
    'Unstable angina',
  ],
  warnings: [
    'Never give sublingually or by biting the capsule for hypertension — the '
        'abrupt fall compromises placental perfusion.',
    'Concurrent magnesium sulphate may cause exaggerated hypotension and '
        'neuromuscular blockade. The evidence is weak and co-administration is '
        'routine, but monitor rather than assume.',
    'Do not confuse the tocolytic and antihypertensive regimens.',
  ],
  adverseEffects: [
    'Headache — common and often dose-limiting',
    'Flushing and palpitations',
    'Peripheral oedema',
    'Hypotension',
    'Constipation',
  ],
  interactions: [
    'Magnesium sulphate — potential additive hypotension and neuromuscular '
        'weakness.',
    'CYP3A4 inhibitors — macrolides, azoles, grapefruit juice — raise levels.',
    'Rifampicin and other inducers reduce efficacy substantially.',
    'Beta blockers — additive hypotension.',
  ],
  monitoring: [
    'Blood pressure and pulse',
    'Fetal heart rate after acute dosing',
    'Symptoms of hypotension',
  ],
  pregnancy: DrugSafety(
    summary: 'Widely used across all trimesters for hypertension and for '
        'tocolysis. No consistent evidence of teratogenicity.',
    points: [
      'First-line alongside labetalol in most guidelines, and the preferred '
          'agent where beta blockade is contraindicated.',
      'As a tocolytic it has largely replaced beta-agonists on grounds of '
          'maternal safety.',
    ],
    source: 'NICE NG133; NICE NG25.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. Milk levels are low, and it has been used '
        'therapeutically in breastfeeding women for nipple vasospasm.',
    source: 'LactMed.',
  ),
  references: [
    'NICE NG133 — Hypertension in pregnancy.',
    'NICE NG25 — Preterm labour and birth.',
    'RCOG Green-top Guideline 1B — Tocolysis for Women in Preterm Labour.',
    'FOGSI GCPR — Hypertensive Disorders of Pregnancy and Preterm Birth.',
  ],
);

const kHydralazine = Drug(
  id: 'hydralazine',
  generic: 'Hydralazine',
  brandNames: ['Apresoline', 'Nepresol'],
  drugClass: 'Direct-acting arteriolar vasodilator',
  mechanism: 'Relaxes arteriolar smooth muscle directly, lowering peripheral '
      'resistance. Venous capacitance is largely unaffected, so reflex '
      'tachycardia and fluid retention follow.',
  indications: [
    'Severe hypertension in pregnancy, particularly where labetalol is '
        'contraindicated',
    'Hypertensive emergency in pre-eclampsia',
  ],
  doses: [
    DrugDose(
      indication: 'Severe hypertension — acute',
      dose: '5 mg IV over 5 minutes',
      route: 'Intravenous',
      frequency: 'Repeat every 20 minutes',
      max: '20 mg cumulative',
      notes: 'Pre-load with 200–300 mL of crystalloid to blunt the '
          'hypotension — while respecting the overall 80 mL/hour restriction '
          'in pre-eclampsia.',
    ),
    DrugDose(
      indication: 'Infusion',
      dose: '2–20 mg/hour, titrated',
      route: 'Intravenous infusion',
    ),
  ],
  preparation: 'Ampoules of 20 mg powder for reconstitution.',
  contraindications: [
    'Idiopathic systemic lupus erythematosus',
    'Severe tachycardia and high-output heart failure',
    'Dissecting aortic aneurysm',
    'Cor pulmonale',
  ],
  warnings: [
    'Maternal hypotension can be abrupt and profound, and causes fetal '
        'distress — this is the main reason it now sits behind labetalol and '
        'nifedipine.',
    'Reflex tachycardia may be marked.',
    'Drug-induced lupus with prolonged oral use.',
  ],
  adverseEffects: [
    'Headache, flushing and palpitations',
    'Hypotension',
    'Nausea and vomiting',
    'Fluid retention',
    'Lupus-like syndrome with long-term use',
  ],
  interactions: [
    'Additive with other antihypertensives.',
    'NSAIDs blunt the antihypertensive effect.',
  ],
  monitoring: [
    'Blood pressure every 5 minutes after each dose',
    'Maternal pulse',
    'Continuous fetal monitoring — hypotension is the fetal risk',
  ],
  pregnancy: DrugSafety(
    summary: 'Long-standing use in pregnancy with no teratogenic signal. Its '
        'position has slipped to third line because of maternal hypotension '
        'and the associated fetal heart rate changes, not because of fetal '
        'toxicity.',
    source: 'NICE NG133; ACOG Committee Opinion 767.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. Milk levels are low and no adverse effects have been '
        'reported in breastfed infants.',
    source: 'LactMed.',
  ),
  references: [
    'NICE NG133 — Hypertension in pregnancy.',
    'ACOG Committee Opinion 767.',
    'RCOG Green-top Guideline 10(A).',
    'MoHFW Government of India — guidelines on management of severe '
        'pre-eclampsia and eclampsia at first referral units.',
  ],
);

const kMagnesiumSulphate = Drug(
  id: 'magnesium-sulphate',
  generic: 'Magnesium sulphate',
  drugClass: 'Anticonvulsant · divalent cation',
  mechanism: 'Antagonises calcium at the neuromuscular junction and blocks '
      'NMDA receptors; also causes cerebral vasodilatation. The '
      'anticonvulsant action in eclampsia is central, not simply a matter of '
      'muscle relaxation.',
  indications: [
    'Treatment of eclampsia',
    'Seizure prophylaxis in severe pre-eclampsia',
    'Fetal neuroprotection below 32 weeks',
  ],
  doses: [
    DrugDose(
      indication: 'Eclampsia — Pritchard regimen',
      dose: '4 g IV over 3–5 min PLUS 10 g IM (5 g into each buttock), then '
          '5 g IM every 4 hours',
      route: 'Intravenous and intramuscular',
      frequency: 'Maintenance every 4 hours, alternating buttocks',
      notes: 'Requires no infusion pump, which is why it remains the standard '
          'across much of India.',
    ),
    DrugDose(
      indication: 'Eclampsia — Zuspan regimen',
      dose: '4 g IV over 15–20 min, then 1 g/hour',
      route: 'Intravenous infusion',
    ),
    DrugDose(
      indication: 'Eclampsia — Sibai regimen',
      dose: '6 g IV loading, then 2–3 g/hour',
      route: 'Intravenous infusion',
    ),
    DrugDose(
      indication: 'Recurrent seizure',
      dose: 'A further 2 g IV over 5 minutes (4 g if above 70 kg)',
      route: 'Intravenous',
    ),
    DrugDose(
      indication: 'Fetal neuroprotection',
      dose: '4 g IV over 15 minutes, then 1 g/hour',
      route: 'Intravenous infusion',
      max: 'Until birth or 24 hours, whichever is sooner',
      notes: 'A different indication and a different regimen from eclampsia '
          'prophylaxis. Do not conflate them.',
    ),
  ],
  preparation: '50% solution contains 500 mg/mL. A 20% solution for the IV '
      'loading dose is made by diluting.',
  doseAdjustments: [
    'Renal impairment: give the loading dose in full, then halve or omit '
        'maintenance and monitor levels. Magnesium is cleared entirely by the '
        'kidney.',
    'Oliguria under 100 mL in 4 hours: withhold the next maintenance dose.',
  ],
  contraindications: [
    'Myasthenia gravis',
    'Heart block',
    'Significant myocardial disease — relative',
    'Anuria',
  ],
  warnings: [
    'Check patellar reflex, respiratory rate and urine output before EVERY '
        'maintenance dose.',
    'Accumulation, not the loading dose, is what causes toxicity.',
    'Magnesium is not an antihypertensive. Severe hypertension needs its own '
        'treatment alongside.',
    'It relaxes the uterus and increases the risk of postpartum atony.',
  ],
  adverseEffects: [
    'Flushing, warmth and nausea during the loading dose — expected',
    'Loss of patellar reflexes',
    'Respiratory depression',
    'Pulmonary oedema',
    'Cardiac arrest at extreme levels',
  ],
  interactions: [
    'Calcium channel blockers — potential additive hypotension and '
        'neuromuscular blockade.',
    'Neuromuscular blocking agents — markedly potentiated. Tell the '
        'anaesthetist.',
    'Aminoglycosides compound neuromuscular weakness.',
  ],
  monitoring: [
    'Patellar reflex before every dose',
    'Respiratory rate — at least 12–16 per minute',
    'Urine output — at least 100 mL in the preceding 4 hours',
    'Oxygen saturation',
    'Serum magnesium where available: therapeutic 4.8–8.4 mg/dL',
  ],
  pregnancy: DrugSafety(
    summary: 'Given deliberately in pregnancy. The Magpie trial established '
        'that it halves the risk of eclampsia and reduces maternal death, and '
        'follow-up found no adverse effect on children at 18 months.',
    points: [
      'Prolonged antenatal use beyond 5–7 days has been associated with fetal '
          'bone demineralisation — a concern for tocolysis, not for the short '
          'courses used here.',
      'Neonatal hypotonia and respiratory depression may follow delivery soon '
          'after loading; alert the neonatal team.',
    ],
    source: 'Magpie Trial, Lancet 2002.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. Milk magnesium rises only slightly and infant '
        'absorption is poor. Breastfeeding need not be delayed.',
    points: [
      'A sedated mother may need help positioning the baby.',
    ],
    source: 'LactMed.',
  ),
  antidote: 'Calcium gluconate 1 g (10 mL of 10%) intravenously over 10 '
      'minutes.',
  overdose: 'Loss of patellar reflex at 9–12 mg/dL, respiratory depression at '
      '12–18, respiratory paralysis at 15–17, cardiac arrest above 25–30. '
      'Stop the infusion, give calcium gluconate, support ventilation.',
  references: [
    'The Magpie Trial Collaborative Group. Lancet 2002;359:1877–1890.',
    'Doyle LW et al. Magnesium sulphate for fetal neuroprotection. Cochrane '
        'Database Syst Rev 2009.',
    'RCOG Green-top Guideline 10(A).',
    'FOGSI–ICOG GCPR — Hypertensive Disorders of Pregnancy.',
  ],
);
