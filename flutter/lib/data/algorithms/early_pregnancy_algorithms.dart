import '../../models/algorithm.dart';

const kMiscarriageAlgorithm = Algorithm(
  id: 'algo-miscarriage',
  name: 'Miscarriage',
  subtitle: 'Bleeding in early pregnancy',
  callFor: 'Gynaecology registrar for haemodynamic compromise or suspected '
      'septic miscarriage. Early pregnancy unit for everything else.',
  timeTarget: 'Cervical shock from products in the os reverses within '
      'minutes of removing them — do not wait for theatre.',
  immediate: [
    AlgoStep('Assess for shock. Heavy bleeding in early pregnancy can '
        'exsanguinate', critical: true),
    AlgoStep('SPECULUM — if products are sitting in the cervical os, remove '
        'them with sponge forceps. This reverses cervical shock immediately.',
        critical: true),
    AlgoStep('Large-bore access, full blood count, group and save'),
    AlgoStep('Quantitative betahCG'),
    AlgoStep('Determine rhesus status — anti-D where indicated',
        critical: true),
    AlgoStep('Transvaginal ultrasound'),
    AlgoStep('EXCLUDE ECTOPIC before calling any bleeding a miscarriage',
        critical: true),
    AlgoStep('use the word "abortion" to her', avoid: true,
        detail: 'It is the correct medical term and the wrong human one. Say '
            'miscarriage, or pregnancy loss.'),
  ],
  sections: [
    AlgoSection('1 · Naming the diagnosis precisely', [
      AlgoStep('THREATENED: bleeding, closed cervix, viable intrauterine '
          'pregnancy'),
      AlgoStep('INEVITABLE: bleeding, open cervix, pregnancy still in utero'),
      AlgoStep('INCOMPLETE: some products passed, some retained'),
      AlgoStep('COMPLETE: all products passed, empty uterus, and a previously '
          'confirmed intrauterine pregnancy', critical: true),
      AlgoStep('MISSED: no fetal heart or an empty sac, without bleeding'),
      AlgoStep('SEPTIC: any of the above with infection', critical: true),
      AlgoStep('An empty uterus without a previously confirmed intrauterine '
          'pregnancy is a pregnancy of UNKNOWN LOCATION, not a complete '
          'miscarriage', critical: true),
    ]),
    AlgoSection('2 · Ultrasound criteria for non-viability', [
      AlgoStep('Crown-rump length 7 mm or more with no fetal heartbeat'),
      AlgoStep('Mean sac diameter 25 mm or more with no fetal pole'),
      AlgoStep('Below these thresholds, repeat in at least 7 days rather than '
          'diagnosing', critical: true),
      AlgoStep('Where there is any doubt, a second opinion and a repeat scan '
          'cost a week; a wrong diagnosis costs a wanted pregnancy',
          critical: true),
    ]),
    AlgoSection('3 · Pregnancy of unknown location', [
      AlgoStep('Repeat betahCG at 48 hours'),
      AlgoStep('A rise of 63% or more suggests a viable intrauterine '
          'pregnancy — rescan when appropriate'),
      AlgoStep('A fall of 50% or more suggests a failing pregnancy — repeat '
          'until below 20 IU/L'),
      AlgoStep('Anything between is suspicious of ectopic — review in person',
          critical: true),
      AlgoStep('Serum progesterone may help but does not localise'),
    ]),
    AlgoSection('4 · Expectant management', [
      AlgoStep('Offer first line for 7–14 days where she is stable and there '
          'is no infection'),
      AlgoStep('Around 80% will complete without intervention'),
      AlgoStep('Repeat pregnancy test at 3 weeks'),
      AlgoStep('Give explicit criteria for returning: heavy bleeding, pain, '
          'fever, offensive discharge', critical: true),
      AlgoStep('Not appropriate in septic miscarriage, heavy bleeding, or '
          'where she has bled before and is frightened'),
    ]),
    AlgoSection('5 · Medical management', [
      AlgoStep('Misoprostol, vaginal or oral, per local protocol'),
      AlgoStep('Mifepristone before misoprostol improves success in missed '
          'miscarriage (MifeMiso)'),
      AlgoStep('Warn her to expect pain and bleeding heavier than a period'),
      AlgoStep('Provide analgesia and antiemetics'),
      AlgoStep('Repeat pregnancy test at 3 weeks'),
    ]),
    AlgoSection('6 · Surgical management', [
      AlgoStep('Manual vacuum aspiration under local anaesthesia, or suction '
          'curettage under general'),
      AlgoStep('Indicated for heavy bleeding, haemodynamic instability, '
          'infection, or by her choice', critical: true),
      AlgoStep('Anti-D for rhesus-negative women having surgical management',
          critical: true),
      AlgoStep('Send products for histology where molar pregnancy is possible',
          critical: true),
      AlgoStep('use sharp curettage as the default', avoid: true,
          detail: 'Vacuum aspiration causes less Asherman syndrome and less '
              'perforation.'),
    ]),
    AlgoSection('7 · Septic miscarriage', [
      AlgoStep('Fever, offensive discharge, uterine tenderness, tachycardia',
          critical: true),
      AlgoStep('Blood cultures and broad-spectrum intravenous antibiotics '
          'within the first hour', critical: true),
      AlgoStep('Evacuate the uterus — antibiotics alone will not control the '
          'source', critical: true),
      AlgoStep('In India, consider unsafe abortion in the history, and ask '
          'without judgement — she may not volunteer it', critical: true),
      AlgoStep('Watch for Clostridium and for tetanus in that setting'),
    ]),
    AlgoSection('8 · Afterwards', [
      AlgoStep('Anti-D where rhesus negative and indicated'),
      AlgoStep('Investigate after three consecutive losses, or earlier if she '
          'is older or the losses were second trimester'),
      AlgoStep('Antiphospholipid screen, karyotype of both partners, and '
          'uterine imaging in recurrent loss'),
      AlgoStep('Folic acid before the next pregnancy'),
      AlgoStep('Offer bereavement support, and say plainly that it was not '
          'her fault and nothing she did caused it', critical: true),
    ]),
  ],
  sources: [
    'NICE NG126 — Ectopic pregnancy and miscarriage: diagnosis and initial '
        'management.',
    'RCOG Green-top Guideline 17 — Recurrent Miscarriage.',
    'Chu JJ et al. MifeMiso. Lancet 2020;396:770–778.',
    'FOGSI GCPR — Early Pregnancy Loss; MoHFW Comprehensive Abortion Care '
        'training manual; MTP Act 1971 as amended 2021.',
  ],
);

const kPretermLabourAlgorithm = Algorithm(
  id: 'algo-preterm-labour',
  name: 'Preterm labour',
  subtitle: 'Steroids, magnesium, and the right cot',
  callFor: 'Obstetric registrar and the neonatal team. Arrange in utero '
      'transfer BEFORE delivery — the baby travels better inside.',
  timeTarget: 'The first steroid dose is the single most valuable '
      'intervention. Give it as soon as preterm birth is likely.',
  immediate: [
    AlgoStep('Confirm gestation from the earliest reliable dating',
        critical: true),
    AlgoStep('CORTICOSTEROIDS if 24–34 weeks and birth is likely within 7 '
        'days', critical: true),
    AlgoStep('MAGNESIUM SULPHATE for fetal neuroprotection below 30 weeks, '
        'and consider to 34', critical: true),
    AlgoStep('Speculum to assess the cervix and exclude ruptured membranes'),
    AlgoStep('CTG and observations'),
    AlgoStep('Group B streptococcus prophylaxis in established preterm labour',
        critical: true),
    AlgoStep('Arrange in utero transfer if the unit cannot care for the '
        'gestation', critical: true),
    AlgoStep('give tocolysis in order to prolong pregnancy for its own sake',
        avoid: true,
        detail: 'Tocolysis buys time for steroids and transfer. It does not '
            'improve neonatal outcome by itself.'),
  ],
  sections: [
    AlgoSection('1 · Deciding whether this is really labour', [
      AlgoStep('Most women with threatened preterm labour do not deliver '
          'preterm', critical: true),
      AlgoStep('Below 30 weeks, clinical assessment alone is enough to treat '
          '— do not delay steroids for a test', critical: true),
      AlgoStep('At 30 weeks and above, transvaginal cervical length: 15 mm or '
          'less makes preterm birth likely'),
      AlgoStep('Fetal fibronectin, where cervical length is unavailable — its '
          'value is a strong NEGATIVE predictive value', critical: true),
      AlgoStep('Neither test should stop you giving steroids where the '
          'clinical picture is convincing'),
    ]),
    AlgoSection('2 · Corticosteroids', [
      AlgoStep('Betamethasone 12 mg intramuscularly, two doses 24 hours apart'),
      AlgoStep('Or dexamethasone 6 mg intramuscularly, four doses 12 hours '
          'apart — widely used in India and equally effective'),
      AlgoStep('Maximum benefit between 24 hours and 7 days after the first '
          'dose', critical: true),
      AlgoStep('An incomplete course still helps — give the first dose'),
      AlgoStep('Monitor glucose in women with diabetes', critical: true),
      AlgoStep('Repeat courses only after careful consideration; multiple '
          'courses reduce birth weight and head circumference',
          critical: true),
      AlgoStep('give steroids where infection is established without also '
          'treating and delivering', avoid: true),
    ]),
    AlgoSection('3 · Magnesium sulphate for neuroprotection', [
      AlgoStep('4 g loading dose over 15–30 minutes, then 1 g per hour until '
          'birth or for 24 hours', critical: true),
      AlgoStep('Reduces cerebral palsy — number needed to treat about 63 '
          '(Crowther, ACTOMgSO4; Doyle Cochrane)'),
      AlgoStep('Monitor reflexes, respiratory rate and urine output'),
      AlgoStep('Calcium gluconate available for toxicity'),
      AlgoStep('Reduce the dose in renal impairment', critical: true),
    ]),
    AlgoSection('4 · Tocolysis', [
      AlgoStep('Nifedipine is first line in most settings'),
      AlgoStep('Atosiban where nifedipine is contraindicated'),
      AlgoStep('Use for up to 48 hours, to allow steroids and transfer'),
      AlgoStep('Contraindicated in chorioamnionitis, abruption, severe '
          'pre-eclampsia, a non-reassuring CTG, and fetal death',
          critical: true),
      AlgoStep('use ritodrine or other betamimetics', avoid: true,
          detail: 'Maternal cardiovascular side effects, including pulmonary '
              'oedema and death.'),
      AlgoStep('use nifedipine and magnesium sulphate together without care',
          avoid: true, detail: 'Additive hypotension and neuromuscular '
              'blockade.'),
    ]),
    AlgoSection('5 · Antibiotics', [
      AlgoStep('Group B streptococcus prophylaxis — benzylpenicillin — in '
          'established preterm labour', critical: true),
      AlgoStep('Erythromycin where membranes have ruptured'),
      AlgoStep('do not give antibiotics for intact-membrane preterm labour '
          'without infection', avoid: true,
          detail: 'ORACLE II showed no benefit and a signal of harm in '
              'childhood outcomes with co-amoxiclav.'),
    ]),
    AlgoSection('6 · Delivery', [
      AlgoStep('Mode on obstetric grounds — prematurity alone is not an '
          'indication for caesarean', critical: true),
      AlgoStep('Continuous fetal monitoring where the gestation is viable and '
          'intervention is intended'),
      AlgoStep('Fetal blood sampling is contraindicated below 34 weeks'),
      AlgoStep('DEFERRED CORD CLAMPING for at least 60 seconds where the baby '
          'is stable', critical: true),
      AlgoStep('Neonatal team present, thermal care ready, plastic bag or '
          'wrap for the very preterm', critical: true),
    ]),
    AlgoSection('7 · At the limits of viability', [
      AlgoStep('Discuss with senior obstetric and neonatal staff together, '
          'and with the parents', critical: true),
      AlgoStep('Local outcome data, not textbook figures, should inform the '
          'conversation'),
      AlgoStep('Agree and document a plan for resuscitation before delivery',
          critical: true),
      AlgoStep('Revisit the plan if the picture changes'),
    ]),
    AlgoSection('8 · Preventing the next one', [
      AlgoStep('Vaginal progesterone for a short cervix'),
      AlgoStep('Cervical cerclage for a history of mid-trimester loss or '
          'preterm birth with a short cervix'),
      AlgoStep('Cervical length surveillance from 16 weeks'),
      AlgoStep('Treat asymptomatic bacteriuria'),
      AlgoStep('Smoking cessation'),
    ]),
  ],
  sources: [
    'NICE NG25 — Preterm labour and birth.',
    'RCOG Green-top Guideline 1B — Tocolysis for Women in Preterm Labour.',
    'Crowther CA et al. ACTOMgSO4. JAMA 2003;290:2669–2676.',
    'Doyle LW et al. Magnesium sulphate for neuroprotection. Cochrane 2009.',
    'Kenyon SL et al. ORACLE II. Lancet 2001;357:989–994.',
    'FOGSI GCPR — Preterm Birth; MoHFW India Newborn Action Plan; '
        'Antenatal corticosteroid guidance, Government of India.',
  ],
);
