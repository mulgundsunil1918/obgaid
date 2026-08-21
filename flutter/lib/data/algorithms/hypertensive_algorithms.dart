import '../../models/algorithm.dart';

const kEclampsiaAlgorithm = Algorithm(
  id: 'algo-eclampsia',
  name: 'Eclampsia',
  subtitle: 'Seizure in pregnancy or postpartum',
  callFor: 'Call the obstetric registrar, anaesthetist, senior midwife and '
      'neonatal team. Note the time the seizure started.',
  timeTarget: 'Magnesium sulphate is the priority, not delivery. Stabilise the '
      'mother first — delivering a fitting, hypertensive woman kills her.',
  immediate: [
    AlgoStep('Left lateral position; protect her from injury', critical: true),
    AlgoStep('Airway and high-flow oxygen 15 L via a reservoir mask'),
    AlgoStep('Magnesium sulphate loading dose', critical: true,
        detail: 'Pritchard: 4 g IV over 3–5 min plus 10 g IM (5 g into each '
            'buttock). Zuspan: 4 g IV over 15–20 min, then 1 g/hour.'),
    AlgoStep('IV access, bloods, catheterise'),
    AlgoStep('Control severe hypertension — labetalol, nifedipine or '
        'hydralazine'),
    AlgoStep('Restrict fluid to 80 mL/hour total', critical: true,
        detail: 'Pulmonary oedema, not the seizure, is what most often kills '
            'these women.'),
    AlgoStep('restrain her or force anything into her mouth', avoid: true),
    AlgoStep('rush to caesarean during the seizure', avoid: true,
        detail: 'Fetal bradycardia during a fit is expected and usually '
            'recovers within minutes once the mother is oxygenated.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('A generalised tonic-clonic seizure in pregnancy or the '
          'puerperium, in a woman with pre-eclampsia'),
      AlgoStep('It can occur without hypertension or proteinuria — up to 15% '
          'of cases have neither beforehand', critical: true),
      AlgoStep('About a third of cases occur postpartum, and can present up to '
          'four weeks after birth', critical: true),
      AlgoStep('Prodrome, where present: headache, visual disturbance, '
          'right upper quadrant or epigastric pain, hyperreflexia, clonus, '
          'restlessness'),
    ]),
    AlgoSection('2 · Immediate assessment', [
      AlgoStep('Airway, breathing, circulation; conscious level'),
      AlgoStep('Blood pressure, pulse, respiratory rate, oxygen saturation'),
      AlgoStep('Reflexes and clonus'),
      AlgoStep('Fundal height, uterine tone, per vaginam loss — exclude '
          'abruption, which frequently coexists'),
      AlgoStep('Fetal heart rate once the mother is stable, not during the fit'),
    ]),
    AlgoSection('3 · Initial investigations', [
      AlgoStep('Full blood count with platelets, coagulation screen'),
      AlgoStep('Liver function, LDH — for HELLP'),
      AlgoStep('Urea, electrolytes, creatinine, urate'),
      AlgoStep('Urine protein:creatinine ratio'),
      AlgoStep('Group and save; crossmatch if delivery is likely'),
      AlgoStep('Blood glucose and sodium — to exclude a metabolic cause'),
      AlgoStep('Imaging is not routine. Consider CT or MRI where seizures are '
          'focal, recurrent despite magnesium, or consciousness does not '
          'recover'),
    ]),
    AlgoSection('4 · Differential diagnosis', [
      AlgoStep('Epilepsy — known or new'),
      AlgoStep('Cerebral venous sinus thrombosis'),
      AlgoStep('Intracranial haemorrhage or infarct'),
      AlgoStep('Posterior reversible encephalopathy syndrome'),
      AlgoStep('Hypoglycaemia, hyponatraemia'),
      AlgoStep('Meningitis or encephalitis'),
      AlgoStep('Local anaesthetic toxicity; amniotic fluid embolism'),
      AlgoStep('Treat as eclampsia until proven otherwise — it is the '
          'diagnosis that kills fastest if missed', critical: true),
    ]),
    AlgoSection('5 · Magnesium sulphate', [
      AlgoStep('PRITCHARD — 4 g IV over 3–5 min plus 10 g IM, then 5 g IM '
          'every 4 hours, alternating buttocks',
          detail: 'Needs no infusion pump, which is why it remains the Indian '
              'standard.'),
      AlgoStep('ZUSPAN — 4 g IV over 15–20 min, then 1 g/hour by infusion'),
      AlgoStep('SIBAI — 6 g IV loading, then 2–3 g/hour by infusion'),
      AlgoStep('Continue for 24 hours after delivery, or 24 hours after the '
          'last seizure, whichever is later', critical: true),
      AlgoStep('Magnesium roughly halves the risk of a further seizure and '
          'reduces maternal death (Magpie)'),
      AlgoStep('use diazepam or phenytoin as first-line', avoid: true,
          detail: 'Magnesium is superior to both for eclampsia.'),
    ]),
    AlgoSection('6 · Recurrent seizures', [
      AlgoStep('A further 2 g magnesium IV over 5 minutes (4 g if she is over '
          '70 kg)'),
      AlgoStep('If seizures continue, involve the anaesthetist — consider '
          'intubation and ventilation'),
      AlgoStep('Reconsider the differential: imaging for haemorrhage, '
          'thrombosis or PRES', critical: true),
      AlgoStep('Check a magnesium level if available; toxicity and '
          'under-dosing look different'),
    ]),
    AlgoSection('7 · Blood pressure management', [
      AlgoStep('Treat sustained systolic ≥ 160 or diastolic ≥ 110 mmHg'),
      AlgoStep('Labetalol 20 mg IV over 2 min, then 40 mg, then 80 mg at '
          '10-minute intervals, maximum 300 mg'),
      AlgoStep('Nifedipine 10 mg orally, repeated at 20 minutes, maximum 3 '
          'doses',
          detail: 'Oral immediate-release. Never sublingual — the fall is '
              'uncontrolled.'),
      AlgoStep('Hydralazine 5 mg IV over 5 min, repeated at 20 minutes, '
          'maximum 20 mg'),
      AlgoStep('Target 140–150 / 90–100 mmHg', critical: true,
          detail: 'Do not drop below 130/80. Placental perfusion is pressure-'
              'dependent and a rapid fall causes fetal distress.'),
    ]),
    AlgoSection('8 · Fluid management', [
      AlgoStep('Total fluid 80 mL/hour, including drug infusions', critical: true),
      AlgoStep('Catheterise; measure hourly urine output'),
      AlgoStep('Oliguria alone is not an indication to fluid-load',
          detail: 'These women are vasoconstricted and leaky, not dry.'),
      AlgoStep('Watch oxygen saturation continuously for pulmonary oedema'),
      AlgoStep('give a fluid challenge for oliguria', avoid: true),
    ]),
    AlgoSection('9 · Magnesium toxicity', [
      AlgoStep('Check before every maintenance dose: patellar reflex present, '
          'respiratory rate ≥ 12–16/min, urine output ≥ 100 mL in 4 hours'),
      AlgoStep('Therapeutic level 4.8–8.4 mg/dL (2–4 mmol/L)'),
      AlgoStep('Loss of patellar reflex 9–12 · respiratory depression 12–18 · '
          'cardiac arrest above 25–30 mg/dL'),
      AlgoStep('ANTIDOTE — calcium gluconate 1 g (10 mL of 10%) IV slowly over '
          '10 minutes', critical: true),
      AlgoStep('Halve or omit maintenance in renal impairment; give the '
          'loading dose in full'),
    ]),
    AlgoSection('10 · Delivery & postpartum', [
      AlgoStep('Deliver once she is stable — seizures controlled, blood '
          'pressure controlled, coagulopathy assessed', critical: true),
      AlgoStep('Mode of delivery by obstetric factors; eclampsia is not itself '
          'an indication for caesarean'),
      AlgoStep('Regional anaesthesia is acceptable if platelets are adequate '
          'and coagulation is normal'),
      AlgoStep('Continue magnesium 24 hours postpartum; continue '
          'antihypertensives, often for weeks'),
      AlgoStep('Warn her that eclampsia can occur for the first time after '
          'discharge — headache, visual change or fits mean immediate return',
          critical: true),
      AlgoStep('Postnatal review at 6 weeks; screen for persistent '
          'hypertension and proteinuria'),
      AlgoStep('Counsel on recurrence and on aspirin 150 mg from before 16 '
          'weeks in the next pregnancy'),
    ]),
  ],
  sources: [
    'The Magpie Trial Collaborative Group. Do women with pre-eclampsia benefit '
        'from magnesium sulphate? Lancet 2002;359:1877–1890.',
    'RCOG Green-top Guideline 10(A) — Management of Severe Pre-eclampsia and '
        'Eclampsia.',
    'NICE NG133 — Hypertension in pregnancy: diagnosis and management.',
    'ACOG Practice Bulletin 222 — Gestational Hypertension and Preeclampsia.',
    'FOGSI–ICOG GCPR — Hypertensive Disorders of Pregnancy.',
    'WHO Recommendations for Prevention and Treatment of Pre-eclampsia and '
        'Eclampsia.',
  ],
);

const kSevereHypertensionAlgorithm = Algorithm(
  id: 'algo-severe-htn',
  name: 'Severe hypertension',
  subtitle: 'Systolic ≥ 160 or diastolic ≥ 110 mmHg',
  callFor: 'Inform the obstetric registrar. Involve the anaesthetist if she '
      'needs intravenous treatment or delivery.',
  timeTarget: 'Treat within 30–60 minutes of confirmation. Stroke is the '
      'leading cause of death in severe pre-eclampsia, and systolic pressure '
      'drives it.',
  immediate: [
    AlgoStep('Repeat the blood pressure after 15 minutes to confirm',
        detail: 'Unless it is ≥ 180/120, or she has symptoms — then treat '
            'straight away.'),
    AlgoStep('Correct cuff size and technique; use the arm with the higher '
        'reading'),
    AlgoStep('IV access and bloods'),
    AlgoStep('Give the first antihypertensive within 30–60 minutes',
        critical: true),
    AlgoStep('Assess for severe features and imminent eclampsia',
        detail: 'Headache, visual disturbance, epigastric or right upper '
            'quadrant pain, clonus, brisk reflexes, oliguria, breathlessness.'),
    AlgoStep('Magnesium sulphate if severe features are present',
        critical: true),
    AlgoStep('treat the diastolic alone and ignore a high systolic',
        avoid: true,
        detail: 'Systolic pressure is what causes haemorrhagic stroke.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('Severe range: systolic ≥ 160 mmHg or diastolic ≥ 110 mmHg'),
      AlgoStep('Persistent means on two readings 15 minutes apart — but do '
          'not wait if she is symptomatic or ≥ 180/120', critical: true),
      AlgoStep('Hypertensive emergency where there is end-organ damage: '
          'pulmonary oedema, renal impairment, HELLP, neurological signs'),
      AlgoStep('Measure with the correct cuff, arm at heart level, Korotkoff V '
          'for diastolic'),
    ]),
    AlgoSection('2 · Immediate assessment', [
      AlgoStep('Symptoms of imminent eclampsia — headache, visual disturbance, '
          'epigastric pain'),
      AlgoStep('Reflexes and clonus'),
      AlgoStep('Oxygen saturation and chest auscultation for pulmonary oedema'),
      AlgoStep('Fundal height, uterine tone, fetal heart rate'),
      AlgoStep('Urine output and urinalysis'),
    ]),
    AlgoSection('3 · Initial investigations', [
      AlgoStep('Full blood count with platelets — falling platelets signal HELLP'),
      AlgoStep('Liver function and LDH'),
      AlgoStep('Urea, electrolytes, creatinine, urate'),
      AlgoStep('Urine protein:creatinine ratio — ≥ 30 mg/mmol is significant '
          'proteinuria'),
      AlgoStep('Coagulation screen if platelets are low or delivery is planned'),
      AlgoStep('Group and save'),
      AlgoStep('CTG, and ultrasound for growth, liquor and umbilical artery '
          'Doppler'),
      AlgoStep('Absence of proteinuria does not exclude pre-eclampsia',
          critical: true,
          detail: 'Hypertension with any severe feature — thrombocytopenia, '
              'renal or liver involvement, pulmonary oedema, neurological or '
              'visual symptoms — is pre-eclampsia.'),
    ]),
    AlgoSection('4 · Differential diagnosis', [
      AlgoStep('Chronic hypertension, with or without superimposed '
          'pre-eclampsia'),
      AlgoStep('Gestational hypertension'),
      AlgoStep('White-coat hypertension — confirm with repeat or ambulatory '
          'readings only where she is well'),
      AlgoStep('Phaeochromocytoma, renal artery stenosis, coarctation, '
          'thyrotoxicosis — rare, but consider in resistant or very early '
          'hypertension'),
      AlgoStep('Drug causes — sympathomimetics, cocaine, NSAIDs'),
    ]),
    AlgoSection('5 · First-line treatment', [
      AlgoStep('LABETALOL 20 mg IV over 2 min → 40 mg → 80 mg at 10-minute '
          'intervals, maximum 300 mg',
          detail: 'Avoid in asthma, heart block and decompensated cardiac '
              'failure. Oral labetalol 200 mg where IV is unavailable.'),
      AlgoStep('NIFEDIPINE 10 mg orally, immediate-release, repeat at 20 '
          'minutes, maximum 3 doses',
          detail: 'Never sublingual — the fall is uncontrolled and causes '
              'fetal distress.'),
      AlgoStep('HYDRALAZINE 5 mg IV over 5 min, repeat at 20 minutes, maximum '
          '20 mg',
          detail: 'Pre-load with 200–300 mL crystalloid to blunt the '
              'hypotension, but respect the overall fluid restriction.'),
      AlgoStep('Target 140–150 / 90–100 mmHg', critical: true),
      AlgoStep('drop the pressure below 130/80', avoid: true,
          detail: 'Placental perfusion depends on maternal pressure.'),
    ]),
    AlgoSection('6 · Magnesium sulphate — indications', [
      AlgoStep('Eclampsia — treatment and prevention of further seizures'),
      AlgoStep('Severe pre-eclampsia with severe features'),
      AlgoStep('Imminent eclampsia — headache, visual disturbance, epigastric '
          'pain, clonus, brisk reflexes'),
      AlgoStep('Consider when delivering a woman with severe pre-eclampsia'),
      AlgoStep('Also for fetal neuroprotection below 32 weeks where preterm '
          'delivery is planned'),
      AlgoStep('Magnesium does not lower blood pressure', critical: true,
          detail: 'It prevents seizures. She still needs an antihypertensive.'),
    ]),
    AlgoSection('7 · Escalation', [
      AlgoStep('No response to two agents — involve the consultant and the '
          'anaesthetist'),
      AlgoStep('Consider a labetalol infusion, or intensive care for invasive '
          'monitoring'),
      AlgoStep('Pulmonary oedema — sit her up, oxygen, furosemide, restrict '
          'fluid, involve intensive care', critical: true),
      AlgoStep('Falling platelets, rising transaminases or haemolysis means '
          'HELLP — plan delivery'),
    ]),
    AlgoSection('8 · Delivery decisions', [
      AlgoStep('37 weeks or beyond — deliver'),
      AlgoStep('34 to 37 weeks — deliver if severe features, otherwise '
          'individualise'),
      AlgoStep('Below 34 weeks — corticosteroids, magnesium for '
          'neuroprotection below 32 weeks, expectant management only in a '
          'unit able to watch her closely'),
      AlgoStep('Deliver at any gestation for: uncontrollable hypertension, '
          'eclampsia, pulmonary oedema, abruption, HELLP with deterioration, '
          'non-reassuring fetal status', critical: true),
      AlgoStep('Stabilise before delivering, not after', critical: true),
    ]),
    AlgoSection('9 · Monitoring & follow-up', [
      AlgoStep('Blood pressure every 15 minutes until controlled, then hourly'),
      AlgoStep('Repeat bloods every 12–24 hours, more often if deteriorating'),
      AlgoStep('Hypertension often worsens on days 3–5 postpartum',
          critical: true),
      AlgoStep('Avoid NSAIDs postpartum where there is renal impairment or '
          'poorly controlled hypertension'),
      AlgoStep('Postnatal review at 6 weeks; investigate persistent '
          'hypertension or proteinuria'),
      AlgoStep('Counsel on lifelong cardiovascular risk and on aspirin '
          '150 mg from before 16 weeks in the next pregnancy'),
    ]),
  ],
  sources: [
    'NICE NG133 — Hypertension in pregnancy: diagnosis and management.',
    'ACOG Practice Bulletin 222 — Gestational Hypertension and Preeclampsia; '
        'Committee Opinion 767 — Emergent Therapy for Acute-Onset Severe '
        'Hypertension.',
    'RCOG Green-top Guideline 10(A).',
    'FOGSI–ICOG GCPR — Hypertensive Disorders of Pregnancy.',
    'Rolnik DL et al. ASPRE trial — aspirin for preterm pre-eclampsia. '
        'N Engl J Med 2017;377:613–622.',
  ],
);
