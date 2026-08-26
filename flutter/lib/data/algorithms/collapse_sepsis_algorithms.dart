import '../../models/algorithm.dart';

const kMaternalCollapseAlgorithm = Algorithm(
  id: 'algo-maternal-collapse',
  name: 'Maternal collapse',
  subtitle: 'Cardiac arrest in pregnancy · resuscitative hysterotomy',
  callFor: 'Put out a cardiac arrest call AND a maternal collapse call: '
      'obstetrics, anaesthetics, neonatology, theatre and haematology. Say the '
      'words "pregnant woman" — it changes what the arrest team brings.',
  timeTarget: 'If there is no return of circulation by 4 minutes, start '
      'resuscitative hysterotomy and deliver by 5 minutes. The operation is '
      'for the mother.',
  immediate: [
    AlgoStep('Call the arrest team and state that she is pregnant',
        critical: true),
    AlgoStep('Start chest compressions — 30:2, rate 100–120, depth 5–6 cm',
        detail: 'Hand position slightly higher on the sternum than in a '
            'non-pregnant adult.'),
    AlgoStep('MANUAL LEFT UTERINE DISPLACEMENT', critical: true,
        detail: 'Two hands, push the uterus up and to the left. Preferred over '
            'tilting the table, which degrades compression quality.'),
    AlgoStep('Airway early — she desaturates fast and the airway is difficult'),
    AlgoStep('Defibrillate at standard energy for a shockable rhythm',
        detail: 'Remove fetal monitors first. Energy, drugs and doses are all '
            'unchanged in pregnancy.'),
    AlgoStep('Two large-bore cannulae ABOVE the diaphragm', critical: true),
    AlgoStep('At 4 minutes with no ROSC — resuscitative hysterotomy',
        critical: true),
    AlgoStep('move her to theatre for the hysterotomy', avoid: true,
        detail: 'It is done where she arrests. No transfer, no anaesthetic, no '
            'sterile field, a scalpel is enough.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('An acute event with reduced or absent conscious level and '
          'cardiorespiratory compromise, at any gestation or up to 6 weeks '
          'postpartum'),
      AlgoStep('Check response, airway, breathing and a central pulse for no '
          'more than 10 seconds'),
      AlgoStep('Agonal gasping is not breathing', critical: true),
    ]),
    AlgoSection('2 · Causes — 4 Hs, 4 Ts, and the obstetric ones', [
      AlgoStep('HAEMORRHAGE — the commonest cause. Concealed abruption, '
          'ruptured uterus, ruptured ectopic, splenic or hepatic rupture',
          critical: true),
      AlgoStep('Hypoxia · Hypovolaemia · Hypo/hyperkalaemia and metabolic · '
          'Hypothermia'),
      AlgoStep('Thrombosis — pulmonary embolism and myocardial infarction'),
      AlgoStep('Tension pneumothorax · Tamponade · Toxins'),
      AlgoStep('Amniotic fluid embolism'),
      AlgoStep('Eclampsia and intracranial haemorrhage'),
      AlgoStep('Anaphylaxis'),
      AlgoStep('Drug toxicity — magnesium sulphate, local anaesthetic systemic '
          'toxicity, opioids', critical: true,
          detail: 'Magnesium: calcium gluconate 1 g IV. Local anaesthetic: '
              '20% lipid emulsion. Opioid: naloxone.'),
      AlgoStep('High or total spinal block'),
      AlgoStep('Sepsis'),
      AlgoStep('Cardiac disease — the leading indirect cause of maternal death, '
          'including peripartum cardiomyopathy and aortic dissection'),
    ]),
    AlgoSection('3 · CPR modifications in pregnancy', [
      AlgoStep('Manual left uterine displacement throughout, from 20 weeks or '
          'a uterus at or above the umbilicus', critical: true),
      AlgoStep('If displacement is impossible, tilt 15–30° on a firm wedge — '
          'but tilt worsens compression quality, so displace by hand where you '
          'can'),
      AlgoStep('Hand position slightly higher on the sternum'),
      AlgoStep('Same defibrillation energies; same drugs at the same doses; '
          'same algorithm'),
      AlgoStep('Early intubation by the most experienced person available',
          detail: 'Reduced functional residual capacity, raised oxygen demand, '
              'oedematous airway, high aspiration risk. Use a smaller tube.'),
      AlgoStep('Cricoid pressure until the airway is secured'),
      AlgoStep('IV or IO access above the diaphragm — below it, drugs may not '
          'reach the heart past the gravid uterus', critical: true),
      AlgoStep('delay defibrillation because she is pregnant', avoid: true),
    ]),
    AlgoSection('4 · Resuscitative hysterotomy (perimortem caesarean)', [
      AlgoStep('Indication: cardiac arrest with a uterus at or above the '
          'umbilicus, roughly 20 weeks or more', critical: true),
      AlgoStep('Start at 4 minutes of arrest without ROSC; aim to deliver by '
          '5 minutes', critical: true),
      AlgoStep('It is a MATERNAL resuscitation manoeuvre',
          detail: 'Emptying the uterus relieves aortocaval compression, '
              'restores venous return, and improves the chance of ROSC. Fetal '
              'survival is a secondary benefit.'),
      AlgoStep('Perform it where she arrested. Do not move her.', critical: true),
      AlgoStep('No anaesthetic is needed; no sterile preparation is needed; a '
          'scalpel and a pair of hands are enough'),
      AlgoStep('Classical midline vertical incision is quickest'),
      AlgoStep('Continue CPR throughout the procedure and after delivery',
          critical: true),
      AlgoStep('Neonatal team ready, but do not divert people from the mother'),
      AlgoStep('wait for a scan to confirm fetal viability', avoid: true,
          detail: 'The indication is maternal, and the clock has already '
              'started.'),
    ]),
    AlgoSection('5 · Initial investigations (once resuscitation allows)', [
      AlgoStep('Arterial blood gas with lactate, potassium and glucose'),
      AlgoStep('Full blood count, coagulation, fibrinogen, crossmatch'),
      AlgoStep('Bedside echocardiography — tamponade, right heart strain, '
          'contractility'),
      AlgoStep('Bedside ultrasound for free fluid'),
      AlgoStep('12-lead ECG once there is a rhythm'),
      AlgoStep('Troponin, D-dimer and CT pulmonary angiography where embolism '
          'is suspected',
          detail: 'Do not withhold necessary imaging because she is pregnant.'),
    ]),
    AlgoSection('6 · Post-resuscitation care', [
      AlgoStep('Intensive care admission'),
      AlgoStep('Targeted temperature management as for any adult'),
      AlgoStep('Treat the underlying cause — this is what determines survival'),
      AlgoStep('Uterotonics and haemostasis after hysterotomy'),
      AlgoStep('Antibiotics after a non-sterile procedure'),
      AlgoStep('Thromboprophylaxis once bleeding is controlled'),
    ]),
    AlgoSection('7 · Follow-up', [
      AlgoStep('Debrief the whole team — this is among the most distressing '
          'events in obstetrics'),
      AlgoStep('Structured incident review and, where relevant, referral to '
          'the confidential enquiry'),
      AlgoStep('Explain events fully to the woman and her family'),
      AlgoStep('Cardiology, haematology or genetics follow-up depending on '
          'cause'),
      AlgoStep('Pre-pregnancy counselling before any further pregnancy'),
    ]),
  ],
  sources: [
    'Resuscitation Council UK — Special Circumstances: cardiac arrest in '
        'pregnancy.',
    'AHA Scientific Statement — Cardiac Arrest in Pregnancy. Circulation '
        '2015;132:1747–1773.',
    'RCOG Green-top Guideline 56 — Maternal Collapse in Pregnancy and the '
        'Puerperium.',
    'MBRRACE-UK — Saving Lives, Improving Mothers’ Care.',
    'FOGSI GCPR — Maternal Collapse and Resuscitation; MoHFW Maternal Death '
        'Surveillance and Response.',
  ],
);

const kSepsisAlgorithm = Algorithm(
  id: 'algo-sepsis',
  name: 'Obstetric sepsis',
  subtitle: 'Sepsis Six · source control',
  callFor: 'Call the obstetric registrar and the anaesthetist or critical care '
      'outreach. Escalate to consultant level early — these women deteriorate '
      'faster than their observations suggest.',
  timeTarget: 'All six elements of the Sepsis Six within one hour of '
      'recognition.',
  immediate: [
    AlgoStep('High-flow oxygen to keep saturations above 94%', critical: true),
    AlgoStep('Blood cultures — plus urine, high vaginal, wound, throat and '
        'placental swabs',
        detail: 'Take them before antibiotics only if that causes no delay.'),
    AlgoStep('IV broad-spectrum antibiotics within one hour', critical: true),
    AlgoStep('IV fluids — 500 mL crystalloid bolus, reassess, up to 30 mL/kg'),
    AlgoStep('Serum lactate and full blood count'),
    AlgoStep('Catheterise and measure hourly urine output'),
    AlgoStep('Continuous CTG if the fetus is viable'),
    AlgoStep('wait for a fever before treating', avoid: true,
        detail: 'Hypothermia is more ominous than pyrexia, and a woman with '
            'Group A streptococcal sepsis can be afebrile hours before she '
            'arrests.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('Temperature above 38 °C or below 36 °C'),
      AlgoStep('Heart rate above 100 — treat above 110 as a red flag in '
          'pregnancy'),
      AlgoStep('Respiratory rate above 20 — above 24 is a red flag',
          critical: true,
          detail: 'A rising respiratory rate is the earliest and most often '
              'ignored sign.'),
      AlgoStep('Systolic pressure below 90, or a fall of more than 40 from her '
          'baseline'),
      AlgoStep('Altered mental state, or a partner saying she is "not herself"'),
      AlgoStep('White cell count above 12 or below 4 × 10⁹/L'),
      AlgoStep('Reduced urine output; non-blanching rash; severe pain out of '
          'proportion to findings'),
      AlgoStep('Use MEOWS. Pregnancy masks sepsis — young women compensate and '
          'then crash without a gradual decline', critical: true),
    ]),
    AlgoSection('2 · Immediate assessment', [
      AlgoStep('Full set of observations, including respiratory rate, and plot '
          'them on MEOWS'),
      AlgoStep('Look for the source: uterus, wound, breasts, chest, urinary '
          'tract, throat, skin, IV sites, spine'),
      AlgoStep('Abdominal and vaginal examination; assess lochia for odour'),
      AlgoStep('Examine the whole skin surface for cellulitis or necrotising '
          'infection'),
      AlgoStep('Fetal assessment once maternal resuscitation is under way'),
    ]),
    AlgoSection('3 · Sources', [
      AlgoStep('Chorioamnionitis — the uterus is both source and, once '
          'delivered, the cure', critical: true),
      AlgoStep('Endometritis — postpartum, offensive lochia, tender bulky uterus'),
      AlgoStep('Septic abortion or retained products of conception'),
      AlgoStep('Wound infection — perineal or caesarean'),
      AlgoStep('Mastitis and breast abscess'),
      AlgoStep('Urinary tract infection and pyelonephritis'),
      AlgoStep('Pneumonia and influenza; COVID-19'),
      AlgoStep('Necrotising fasciitis — severe pain, rapidly spreading '
          'erythema, crepitus. Surgical emergency', critical: true),
      AlgoStep('Group A Streptococcus is the leading cause of maternal '
          'sepsis death — sore throat in the household is a clue',
          critical: true),
    ]),
    AlgoSection('4 · Investigations', [
      AlgoStep('Blood cultures — two sets from separate sites'),
      AlgoStep('Serum lactate; repeat at 2–4 hours if raised'),
      AlgoStep('Full blood count, CRP, urea, electrolytes, liver function, '
          'coagulation'),
      AlgoStep('Arterial blood gas'),
      AlgoStep('Midstream urine; high vaginal and endocervical swabs; throat '
          'swab; wound swab'),
      AlgoStep('Placental swabs and histology where relevant'),
      AlgoStep('Imaging for source — pelvic ultrasound, chest radiograph, CT '
          'abdomen where indicated',
          detail: 'A necessary radiograph or CT is not withheld because she is '
              'pregnant.'),
    ]),
    AlgoSection('5 · Differential diagnosis', [
      AlgoStep('Pulmonary embolism'),
      AlgoStep('Haemorrhage with hypovolaemic shock'),
      AlgoStep('Amniotic fluid embolism'),
      AlgoStep('Severe pre-eclampsia and HELLP'),
      AlgoStep('Acute fatty liver of pregnancy'),
      AlgoStep('Diabetic ketoacidosis; thyroid storm'),
      AlgoStep('Anaphylaxis; transfusion reaction'),
    ]),
    AlgoSection('6 · Antibiotics', [
      AlgoStep('Broad-spectrum, intravenous, within one hour — follow local '
          'microbiology policy', critical: true),
      AlgoStep('Typical regimens: piperacillin-tazobactam; or a carbapenem in '
          'severe sepsis; or co-amoxiclav with gentamicin and metronidazole'),
      AlgoStep('ADD CLINDAMYCIN where Group A streptococcal or staphylococcal '
          'toxic shock is suspected', critical: true,
          detail: 'It suppresses exotoxin production, which beta-lactams do '
              'not.'),
      AlgoStep('Consider intravenous immunoglobulin in streptococcal or '
          'staphylococcal toxic shock'),
      AlgoStep('Review at 48–72 hours against culture results and de-escalate'),
      AlgoStep('narrow the spectrum before cultures are back in a deteriorating '
          'woman', avoid: true),
    ]),
    AlgoSection('7 · Fluids, vasopressors and escalation', [
      AlgoStep('Crystalloid 500 mL bolus, reassess, up to 30 mL/kg in the '
          'first hours'),
      AlgoStep('Reassess after every bolus — pregnant women develop pulmonary '
          'oedema readily, particularly with coexisting pre-eclampsia',
          critical: true),
      AlgoStep('Noradrenaline if mean arterial pressure stays below 65 mmHg '
          'after adequate fluid'),
      AlgoStep('Central and arterial access; critical care admission'),
      AlgoStep('Consider hydrocortisone in vasopressor-dependent shock'),
    ]),
    AlgoSection('8 · Source control', [
      AlgoStep('Achieve source control within 6–12 hours of recognition',
          critical: true),
      AlgoStep('Evacuate retained products; drain an abscess; debride '
          'necrotising infection'),
      AlgoStep('Remove infected lines'),
      AlgoStep('In chorioamnionitis, delivery is the source control',
          critical: true),
      AlgoStep('Hysterectomy for an infected, unresponsive uterus — rare, but '
          'do not delay it once decided'),
    ]),
    AlgoSection('9 · Fetal considerations & delivery', [
      AlgoStep('Continuous CTG once the fetus is viable'),
      AlgoStep('Fetal tachycardia may be the first sign of chorioamnionitis'),
      AlgoStep('Resuscitating the mother is how you resuscitate the fetus',
          critical: true),
      AlgoStep('deliver for a fetal indication in an unstable, unresuscitated '
          'mother', avoid: true,
          detail: 'Unless the uterus is the source — then delivery is the '
              'treatment for both.'),
      AlgoStep('Corticosteroids for fetal lung maturity are not contraindicated '
          'by sepsis, but do not delay delivery for them'),
      AlgoStep('Neonatal team to attend, and to be told about maternal '
          'antibiotics and organism'),
    ]),
    AlgoSection('10 · Monitoring & follow-up', [
      AlgoStep('Hourly observations and urine output; repeat lactate'),
      AlgoStep('Daily bloods; watch for acute kidney injury and DIC'),
      AlgoStep('Thromboprophylaxis — sepsis is strongly prothrombotic'),
      AlgoStep('Screen and treat household contacts for Group A Streptococcus'),
      AlgoStep('Debrief; incident review; explain events to the woman'),
    ]),
  ],
  sources: [
    'Lissauer D et al. Identification and Management of Maternal Sepsis '
        'During and Following Pregnancy: RCOG Green-top Guideline 64. BJOG '
        '2025;132:e61-e85. This replaces the archived 64a and 64b.',
    'Surviving Sepsis Campaign — International Guidelines for Management of '
        'Sepsis and Septic Shock 2021.',
    'NICE NG51 — Sepsis: recognition, diagnosis and early management.',
    'MBRRACE-UK — Saving Lives, Improving Mothers’ Care.',
    'FOGSI GCPR — Maternal Sepsis.',
  ],
);
