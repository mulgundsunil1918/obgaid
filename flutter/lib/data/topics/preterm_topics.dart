import '../../models/topic.dart';

const kPpromTopic = ClinicalTopic(
  id: 'pprom',
  name: 'PPROM',
  subtitle: 'Preterm prelabour rupture of membranes',
  headline: 'The management problem is a trade: every week gained in utero '
      'reduces prematurity, and every week gained raises the risk of '
      'chorioamnionitis. Surveillance is what lets you hold the balance, and '
      'infection is what ends the argument.',
  keyFacts: [
    ('Definition', 'Rupture before 37 weeks and before labour'),
    ('Antibiotic', 'Erythromycin 250 mg four times daily for 10 days'),
    ('Corticosteroids', '24 – 34 weeks (consider to 36)'),
    ('MgSO₄ neuroprotection', 'Below 30 – 32 weeks'),
    ('Expectant management to', '37 weeks, if no infection'),
    ('Latency', '~50% deliver within 7 days'),
  ],
  sections: [
    TopicSection('Diagnosis', [
      TopicPoint('Sterile speculum examination — look for pooling of liquor in '
          'the posterior fornix', critical: true),
      TopicPoint('perform a digital vaginal examination', avoid: true,
          detail: 'It introduces infection and shortens latency without adding '
              'information a speculum cannot give.'),
      TopicPoint('Where the speculum is equivocal, use IGFBP-1 or PAMG-1 '
          'testing'),
      TopicPoint('Nitrazine and ferning are less reliable — blood, semen and '
          'infection all confound them'),
      TopicPoint('Ultrasound showing oligohydramnios supports the diagnosis '
          'but does not make it'),
    ]),
    TopicSection('Initial assessment', [
      TopicPoint('Maternal temperature, pulse, blood pressure, respiratory rate'),
      TopicPoint('Abdominal palpation for uterine tenderness'),
      TopicPoint('Assess the colour and odour of the liquor'),
      TopicPoint('Cardiotocography — fetal tachycardia may be the first sign '
          'of chorioamnionitis', critical: true),
      TopicPoint('Ultrasound for presentation, liquor volume and estimated '
          'fetal weight'),
      TopicPoint('Full blood count, CRP, high vaginal swab, midstream urine'),
      TopicPoint('Neither CRP nor white cell count is sensitive enough to '
          'exclude chorioamnionitis on its own', critical: true),
    ]),
    TopicSection('Antibiotics', [
      TopicPoint('Erythromycin 250 mg four times daily for 10 days, or until '
          'labour establishes', critical: true),
      TopicPoint('ORACLE I showed erythromycin prolongs pregnancy and reduces '
          'neonatal morbidity'),
      TopicPoint('give co-amoxiclav', avoid: true,
          detail: 'ORACLE I found a significant increase in neonatal '
              'necrotising enterocolitis.'),
      TopicPoint('Group B streptococcus prophylaxis in labour where indicated'),
    ]),
    TopicSection('Corticosteroids and neuroprotection', [
      TopicPoint('Betamethasone 12 mg intramuscularly, two doses 24 hours '
          'apart; or dexamethasone 6 mg intramuscularly, four doses 12 hours '
          'apart'),
      TopicPoint('Offer between 24 and 34 weeks; consider up to 36 weeks where '
          'delivery is imminent'),
      TopicPoint('Maximum benefit between 24 hours and 7 days after the '
          'course'),
      TopicPoint('A single repeat course only if the first was more than 7 '
          'days ago, gestation is still under 34 weeks, and delivery is likely '
          'within a week'),
      TopicPoint('Magnesium sulphate for fetal neuroprotection below 30 weeks '
          '— 4 g intravenously over 15 minutes, then 1 g/hour until birth or '
          'for 24 hours', critical: true),
      TopicPoint('Ruptured membranes are not a contraindication to steroids'),
    ]),
    TopicSection('Expectant management and surveillance', [
      TopicPoint('Admit at least initially; outpatient management only with a '
          'clear protocol and reliable access'),
      TopicPoint('Observations four-hourly; daily fetal heart auscultation or '
          'CTG'),
      TopicPoint('Weekly ultrasound for growth and liquor'),
      TopicPoint('Serial CRP and white cell count as a trend rather than a '
          'threshold'),
      TopicPoint('Teach her the warning signs — fever, abdominal pain, '
          'offensive or coloured discharge, reduced fetal movement',
          critical: true),
      TopicPoint('The PPROMT trial found expectant management to 37 weeks '
          'reduced neonatal respiratory morbidity but increased maternal '
          'infection. Discuss the trade explicitly.'),
      TopicPoint('use tocolysis to prolong pregnancy in PPROM', avoid: true,
          detail: 'It does not improve outcome and may mask developing '
              'infection.'),
    ]),
    TopicSection('When to deliver', [
      TopicPoint('Chorioamnionitis — deliver, whatever the gestation',
          critical: true),
      TopicPoint('Abruption, cord prolapse, or a non-reassuring CTG'),
      TopicPoint('Established labour'),
      TopicPoint('37 weeks reached'),
      TopicPoint('Mode of delivery on obstetric grounds; PPROM alone is not an '
          'indication for caesarean'),
      TopicPoint('In utero transfer to a unit with the right level of neonatal '
          'care, before delivery rather than after', critical: true),
    ]),
    TopicSection('Chorioamnionitis — recognising it', [
      TopicPoint('Maternal pyrexia above 38 °C'),
      TopicPoint('Maternal tachycardia above 100'),
      TopicPoint('Fetal tachycardia above 160'),
      TopicPoint('Uterine tenderness'),
      TopicPoint('Offensive or purulent vaginal discharge'),
      TopicPoint('Rising white cell count and CRP'),
      TopicPoint('Delivery is the source control. Broad-spectrum antibiotics '
          'alongside, not instead.', critical: true),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 73 — Care of Women Presenting with Preterm '
        'Prelabour Rupture of Membranes.',
    'NICE NG25 — Preterm labour and birth.',
    'Kenyon SL et al. ORACLE I trial. Lancet 2001;357:979–988.',
    'Morris JM et al. PPROMT trial. Lancet 2016;387:444–452.',
    'FOGSI GCPR — Preterm Birth.',
  ],
);

const kPretermLabourTopic = ClinicalTopic(
  id: 'preterm-labour',
  name: 'Preterm labour',
  subtitle: 'Diagnosis · steroids · neuroprotection · tocolysis',
  headline: 'Tocolysis buys 48 hours. That is its entire purpose — time for '
      'corticosteroids to work and for in utero transfer to happen. It is not '
      'a treatment for prematurity, and using it as one delays the decisions '
      'that matter.',
  keyFacts: [
    ('Definition', 'Labour before 37+0 weeks'),
    ('Corticosteroids', '24 – 34 weeks; consider from 22 with active care'),
    ('MgSO₄ neuroprotection', 'Offer 24 – 29+6; consider 30 – 33+6'),
    ('Tocolysis window', '48 hours — for steroids and transfer'),
    ('Fetal fibronectin', 'Below 50 ng/mL — very low risk'),
    ('Cervical length', 'Above 15 mm — low risk in symptomatic women'),
    ('Progesterone', 'Vaginal 200 mg for cervix ≤ 25 mm'),
  ],
  sections: [
    TopicSection('Who is at risk', [
      TopicPoint('Previous spontaneous preterm birth — the strongest predictor',
          critical: true),
      TopicPoint('Short cervix on transvaginal scan'),
      TopicPoint('Multiple pregnancy'),
      TopicPoint('Previous cervical surgery — LLETZ, cone biopsy'),
      TopicPoint('Uterine anomaly'),
      TopicPoint('PPROM, antepartum haemorrhage, polyhydramnios'),
      TopicPoint('Infection — bacterial vaginosis, urinary tract infection, '
          'periodontal disease'),
      TopicPoint('Short interpregnancy interval, low BMI, smoking, '
          'socioeconomic deprivation'),
    ]),
    TopicSection('Diagnosis', [
      TopicPoint('Regular contractions with cervical change before 37 weeks'),
      TopicPoint('Most women with threatened preterm labour do not deliver '
          'preterm — the clinical diagnosis alone is poor', critical: true),
      TopicPoint('Fetal fibronectin: a negative result below 50 ng/mL has a '
          'high negative predictive value and safely avoids admission'),
      TopicPoint('Transvaginal cervical length: above 15 mm makes delivery '
          'within 7 days unlikely'),
      TopicPoint('take fetal fibronectin after a digital examination, '
          'intercourse or bleeding', avoid: true,
          detail: 'All three cause false positives.'),
    ]),
    TopicSection('Corticosteroids', [
      TopicPoint('Betamethasone 12 mg intramuscularly, two doses 24 hours '
          'apart; or dexamethasone 6 mg, four doses 12 hours apart'),
      TopicPoint('Offer between 24 and 34 weeks where preterm birth is likely '
          'within 7 days', critical: true),
      TopicPoint('Consider from 22 weeks where active neonatal care is planned, '
          'after discussion with neonatology and the parents'),
      TopicPoint('Reduces respiratory distress syndrome, intraventricular '
          'haemorrhage, necrotising enterocolitis and neonatal death'),
      TopicPoint('Monitor glucose in diabetic women — steroids will '
          'destabilise control for 24–48 hours', critical: true),
      TopicPoint('give repeated courses routinely', avoid: true,
          detail: 'Repeated exposure is associated with reduced birth weight '
              'and head circumference.'),
    ]),
    TopicSection('Magnesium sulphate for neuroprotection', [
      TopicPoint('4 g intravenously over 15 minutes, then 1 g/hour until birth '
          'or for 24 hours, whichever is sooner'),
      TopicPoint('Offer between 24+0 and 29+6 weeks; consider between 30+0 and '
          '33+6', critical: true),
      TopicPoint('Reduces cerebral palsy — number needed to treat around 63 '
          'below 34 weeks'),
      TopicPoint('This is a different indication, and a different regimen, '
          'from magnesium given for eclampsia prophylaxis', critical: true),
      TopicPoint('Monitor for toxicity as for any magnesium infusion — '
          'reflexes, respiratory rate, urine output'),
    ]),
    TopicSection('Tocolysis', [
      TopicPoint('Purpose: 48 hours for corticosteroids and for in utero '
          'transfer. Nothing more.', critical: true),
      TopicPoint('NIFEDIPINE — 20 mg orally, then 10–20 mg every 6–8 hours. '
          'First line in most units.'),
      TopicPoint('ATOSIBAN — oxytocin receptor antagonist; fewer maternal '
          'side effects, higher cost.'),
      TopicPoint('Contraindicated where there is chorioamnionitis, significant '
          'bleeding, a non-reassuring CTG, severe pre-eclampsia, or fetal '
          'death', critical: true),
      TopicPoint('use tocolysis to prolong pregnancy beyond 48 hours',
          avoid: true),
      TopicPoint('use ritodrine or other beta-agonists', avoid: true,
          detail: 'Maternal cardiovascular side effects, including pulmonary '
              'oedema, outweigh any benefit.'),
    ]),
    TopicSection('Antibiotics', [
      TopicPoint('Do not give prophylactic antibiotics for preterm labour with '
          'INTACT membranes', critical: true),
      TopicPoint('ORACLE II found no benefit, and long-term follow-up showed '
          'an increase in cerebral palsy at seven years among children exposed '
          'to erythromycin or co-amoxiclav.'),
      TopicPoint('Group B streptococcus prophylaxis in labour is a separate '
          'and appropriate indication'),
      TopicPoint('Treat identified infection — urinary tract, bacterial '
          'vaginosis — on its own merits'),
    ]),
    TopicSection('Prevention in a subsequent pregnancy', [
      TopicPoint('Vaginal progesterone 200 mg nightly from 16–24 weeks where '
          'the cervix is 25 mm or less'),
      TopicPoint('Cervical cerclage where there is a history of spontaneous '
          'preterm birth or mid-trimester loss together with a short cervix'),
      TopicPoint('Rescue cerclage for a dilated cervix with exposed membranes, '
          'in the absence of infection or bleeding'),
      TopicPoint('Serial cervical length surveillance from 16 weeks in '
          'high-risk women'),
      TopicPoint('Preconception counselling; treat modifiable factors'),
    ]),
    TopicSection('Delivery and neonatal preparation', [
      TopicPoint('In utero transfer beats postnatal transfer', critical: true),
      TopicPoint('Alert the neonatal team early and involve them in the '
          'counselling'),
      TopicPoint('Continuous fetal monitoring — the preterm fetus tolerates '
          'labour less well'),
      TopicPoint('Caesarean is not routinely indicated for prematurity alone'),
      TopicPoint('Deferred cord clamping for at least 60 seconds where the '
          'baby is stable'),
      TopicPoint('Thermal care from the moment of birth — plastic wrap, hat, '
          'warm room'),
    ]),
  ],
  sources: [
    'NICE NG25 — Preterm labour and birth.',
    'NICE NG25 — Preterm labour and birth (RCOG Green-top 1b on tocolytic drugs is archived).',
    'Kenyon SL et al. ORACLE II trial. Lancet 2001;357:989–994, and 7-year '
        'follow-up, Lancet 2008;372:1319–1327.',
    'Doyle LW et al. Magnesium sulphate for fetal neuroprotection. Cochrane '
        'Database Syst Rev 2009.',
    'Roberts D et al. Antenatal corticosteroids. Cochrane Database Syst Rev '
        '2017.',
    'FOGSI GCPR — Preterm Labour.',
  ],
);

const kRhTopic = ClinicalTopic(
  id: 'rh-negative',
  name: 'Rh-negative pregnancy',
  subtitle: 'Anti-D prophylaxis · alloimmunisation',
  headline: 'Anti-D prevents sensitisation. It does nothing once a woman is '
      'already sensitised — at that point the pregnancy is managed by antibody '
      'titre and middle cerebral artery Doppler, not by more anti-D.',
  keyFacts: [
    ('Routine antenatal prophylaxis', '1500 IU at 28 weeks (or 500 IU at 28 and 34)'),
    ('Postnatal', 'Within 72 hours if the baby is RhD positive'),
    ('Sensitising event before 20 weeks', '250 IU (50 µg)'),
    ('Sensitising event after 20 weeks', '500 IU + Kleihauer'),
    ('Extra anti-D', '500 IU per additional 4 mL of fetal red cells'),
    ('Critical antibody titre', '1:16 for anti-D (refer anti-K at any titre)'),
    ('MCA-PSV threshold', 'Above 1.5 multiples of the median'),
  ],
  sections: [
    TopicSection('Booking', [
      TopicPoint('ABO and RhD typing, and an antibody screen, at booking'),
      TopicPoint('Repeat the antibody screen at 28 weeks'),
      TopicPoint('Cell-free fetal DNA can determine fetal RhD type from '
          'maternal blood from about 11–16 weeks', critical: true,
          detail: 'Where available it avoids giving anti-D to the roughly 40% '
              'of RhD-negative women carrying an RhD-negative fetus.'),
      TopicPoint('Record the partner\'s blood group where he is available and '
          'paternity is not in question — it informs, but never replaces, '
          'testing.'),
    ]),
    TopicSection('Routine antenatal prophylaxis', [
      TopicPoint('Single dose 1500 IU (300 µg) at 28 weeks, OR 500 IU at both '
          '28 and 34 weeks'),
      TopicPoint('Take the 28-week antibody screen BEFORE giving anti-D',
          critical: true,
          detail: 'Otherwise passive anti-D is indistinguishable from immune '
              'anti-D on the later screen.'),
      TopicPoint('Prophylaxis is still given even if a sensitising event was '
          'already covered earlier in the pregnancy'),
      TopicPoint('withhold routine prophylaxis because the woman intends '
          'sterilisation or this is her last pregnancy', avoid: true,
          detail: 'Sensitisation affects any future transfusion as well as any '
              'future pregnancy.'),
    ]),
    TopicSection('Sensitising events', [
      TopicPoint('Miscarriage after 12 weeks, or surgical management at any '
          'gestation'),
      TopicPoint('Threatened miscarriage after 12 weeks — repeat at 6-weekly '
          'intervals if bleeding continues'),
      TopicPoint('Ectopic pregnancy'),
      TopicPoint('Termination of pregnancy, medical or surgical'),
      TopicPoint('Invasive procedures — amniocentesis, chorionic villus '
          'sampling, fetal blood sampling'),
      TopicPoint('Antepartum haemorrhage'),
      TopicPoint('External cephalic version'),
      TopicPoint('Abdominal trauma, including road traffic collision and '
          'domestic violence', critical: true),
      TopicPoint('Intrauterine death'),
      TopicPoint('Delivery of an RhD-positive infant'),
      TopicPoint('Give anti-D within 72 hours. If missed, it retains some '
          'value up to 10 days — give it rather than omitting it.',
          critical: true),
    ]),
    TopicSection('Quantifying fetomaternal haemorrhage', [
      TopicPoint('Kleihauer–Betke test after any sensitising event beyond 20 '
          'weeks, and after delivery', critical: true),
      TopicPoint('Flow cytometry is more accurate where available'),
      TopicPoint('The standard dose covers about 4 mL of fetal red cells; give '
          'a further 500 IU for each additional 4 mL'),
      TopicPoint('Repeat the Kleihauer at 48 hours after a large bleed to '
          'confirm clearance'),
      TopicPoint('A large fetomaternal haemorrhage may itself present as '
          'reduced fetal movements or a sinusoidal CTG', critical: true),
    ]),
    TopicSection('Already alloimmunised', [
      TopicPoint('Anti-D no longer has any role', critical: true),
      TopicPoint('Clinically significant antibodies: anti-D, anti-c and '
          'anti-K are the ones that cause severe disease'),
      TopicPoint('Anti-K causes anaemia by suppressing erythropoiesis, so the '
          'titre correlates poorly with severity — refer at any titre',
          critical: true),
      TopicPoint('Critical titre for anti-D is usually 1:16 — refer to fetal '
          'medicine at or above it'),
      TopicPoint('Determine the fetal genotype by cell-free DNA, or the '
          'paternal genotype and zygosity'),
      TopicPoint('Titres are checked four-weekly to 28 weeks, then two-weekly'),
    ]),
    TopicSection('Fetal anaemia — surveillance and treatment', [
      TopicPoint('Middle cerebral artery peak systolic velocity above 1.5 '
          'multiples of the median predicts moderate or severe anaemia',
          critical: true),
      TopicPoint('Measure at the proximal MCA, angle of insonation close to '
          'zero, without fetal breathing or movement'),
      TopicPoint('MCA-PSV has replaced serial amniocentesis for '
          'delta-OD450 — it is non-invasive and at least as accurate'),
      TopicPoint('Weekly from 18 weeks in an affected pregnancy'),
      TopicPoint('Hydrops indicates severe anaemia and is a late sign',
          critical: true),
      TopicPoint('Intrauterine transfusion at a fetal medicine centre where '
          'MCA-PSV exceeds threshold or hydrops is present'),
      TopicPoint('Delivery usually at 37–38 weeks; earlier where transfusions '
          'have been needed'),
    ]),
    TopicSection('At delivery and afterwards', [
      TopicPoint('Cord blood for group, direct antiglobulin test, haemoglobin '
          'and bilirubin'),
      TopicPoint('Maternal Kleihauer'),
      TopicPoint('Anti-D within 72 hours if the baby is RhD positive'),
      TopicPoint('Neonatal monitoring for haemolytic disease — jaundice, '
          'anaemia, and late anaemia at 4–6 weeks'),
      TopicPoint('Counsel about future pregnancies before she leaves',
          critical: true),
    ]),
  ],
  sources: [
    'Qureshi H et al. BSH guideline for the use of anti-D immunoglobulin. '
        'Transfus Med 2014;24:8-20. RCOG Green-top 22 is archived and points '
        'here.',
    'RCOG Green-top Guideline 65 — The Management of Women with Red Cell '
        'Antibodies during Pregnancy.',
    'NICE TA156 — Routine antenatal anti-D prophylaxis for women who are '
        'rhesus D negative.',
    'Mari G et al. Noninvasive diagnosis by Doppler ultrasonography of fetal '
        'anemia. N Engl J Med 2000;342:9–14.',
    'FOGSI GCPR — Rh Negative Pregnancy.',
  ],
);
