import '../../models/trial.dart';

const kMagpie = Trial(
  id: 'magpie',
  acronym: 'MAGPIE',
  name: 'Do women with pre-eclampsia, and their babies, benefit from magnesium '
      'sulphate?',
  year: 2002,
  journal: 'The Lancet 2002;359:1877–1890',
  setting: '175 hospitals across 33 countries, most of them low- and '
      'middle-income',
  population: 'Women with pre-eclampsia, before or shortly after delivery',
  sampleSize: '10 141 women',
  inclusion: [
    'Blood pressure ≥ 140/90 on two occasions with proteinuria ≥ 1+',
    'Not yet delivered, or within 24 hours of delivery',
    'Clinician uncertain whether magnesium was indicated',
  ],
  exclusion: [
    'Definite indication for or contraindication to magnesium sulphate',
    'Hypersensitivity, myasthenia gravis, hepatic coma with renal failure',
  ],
  intervention: 'Magnesium sulphate — 4 g loading, then either intramuscular '
      'or intravenous maintenance for 24 hours',
  comparator: 'Placebo',
  primaryOutcome: 'Eclampsia and, for women randomised before delivery, death '
      'of the baby',
  secondaryOutcomes: [
    'Maternal death',
    'Serious maternal morbidity',
    'Mode of delivery',
  ],
  results: [
    'Eclampsia: 0.8% with magnesium versus 1.9% with placebo — a 58% relative '
        'reduction (RR 0.42, 95% CI 0.29–0.60). Absolute reduction 1.1%, '
        'number needed to treat about 91.',
    'In severe pre-eclampsia the absolute benefit was larger — NNT about 63.',
    'Maternal death: 0.2% versus 0.4% (RR 0.55, 95% CI 0.26–1.14) — a '
        'reduction that did not reach significance.',
    'No difference in death of the baby (RR 1.02, 95% CI 0.92–1.14).',
  ],
  adverseEvents: [
    'Side effects, mainly flushing, in 24% with magnesium versus 5% with '
        'placebo',
    'No excess of serious maternal morbidity',
    'A small increase in caesarean section',
  ],
  limitations: [
    'Recruited only where the clinician was uncertain, so women with clear '
        'indications were excluded — the effect in unambiguous severe disease '
        'may be larger.',
    'The overall eclampsia rate was low, so a very large trial was needed to '
        'show the effect at all.',
  ],
  applicability: 'Highly applicable to Indian practice — a large proportion of '
      'recruitment came from low- and middle-income settings, and the '
      'intramuscular regimen used is the one deliverable without infusion '
      'pumps.',
  guidelineImpact: 'Made magnesium sulphate the standard of care for seizure '
      'prophylaxis in pre-eclampsia worldwide. Embedded in WHO, NICE, RCOG, '
      'ACOG and FOGSI guidance.',
  currentRelevance: 'Undiminished. It remains the evidence base for every '
      'magnesium regimen in use.',
  takeaway: 'Magnesium sulphate halves the risk of eclampsia in pre-eclampsia, '
      'and does so in settings without intensive care.',
  category: TrialCategory.hypertension,
);

const kAspre = Trial(
  id: 'aspre',
  acronym: 'ASPRE',
  name: 'Aspirin versus Placebo in Pregnancies at High Risk for Preterm '
      'Preeclampsia',
  year: 2017,
  journal: 'New England Journal of Medicine 2017;377:613–622',
  setting: '13 maternity hospitals across Europe and Israel',
  population: 'Women screened as high risk for preterm pre-eclampsia by a '
      'first-trimester algorithm',
  sampleSize: '1 776 women randomised, from 26 941 screened',
  inclusion: [
    'Singleton pregnancy',
    'High risk on the FMF combined algorithm — maternal factors, mean '
        'arterial pressure, uterine artery PI and PlGF',
    'Randomised between 11+0 and 14+1 weeks',
  ],
  exclusion: [
    'Unconscious or severely ill women',
    'Major fetal abnormality',
    'Regular aspirin use within 28 days',
    'Bleeding disorder or peptic ulceration',
  ],
  intervention: 'Aspirin 150 mg nightly from 11–14 weeks to 36 weeks',
  comparator: 'Placebo',
  primaryOutcome: 'Preterm pre-eclampsia — delivery with pre-eclampsia before '
      '37 weeks',
  secondaryOutcomes: [
    'Pre-eclampsia at any gestation',
    'Neonatal intensive care admission',
    'Composite adverse neonatal outcome',
  ],
  results: [
    'Preterm pre-eclampsia: 1.6% with aspirin versus 4.3% with placebo — odds '
        'ratio 0.38 (95% CI 0.20–0.74). A 62% relative reduction, and 2.7% '
        'absolute, giving a number needed to treat of about 37.',
    'Preterm pre-eclampsia before 34 weeks: 82% reduction.',
    'No significant reduction in term pre-eclampsia (OR 0.95).',
  ],
  adverseEvents: [
    'No significant excess of antepartum, intrapartum or postpartum '
        'haemorrhage',
    'No excess of neonatal bleeding or of other adverse events',
  ],
  limitations: [
    'Screening used an algorithm requiring PlGF and uterine artery Doppler, '
        'which are not universally available.',
    'Adherence above 90% was required for the full effect; real-world '
        'adherence is lower.',
    'European population — performance of the algorithm in South Asian women '
        'requires local validation.',
  ],
  applicability: 'The 150 mg night-time dose and the before-16-weeks window '
      'transfer directly. Where the screening algorithm is unavailable, '
      'risk-factor-based selection is the pragmatic substitute used by NICE.',
  guidelineImpact: 'Established 150 mg as the dose and before 16 weeks as the '
      'window. Adopted by NICE, ACOG, FIGO and FOGSI.',
  currentRelevance: 'The dominant trial in pre-eclampsia prevention. It also '
      'shifted the field from term to preterm pre-eclampsia as the target.',
  takeaway: 'Aspirin 150 mg at night, started before 16 weeks, cuts preterm '
      'pre-eclampsia by around 60%.',
  category: TrialCategory.hypertension,
);

const kWoman = Trial(
  id: 'woman',
  acronym: 'WOMAN',
  name: 'Effect of early tranexamic acid administration on mortality, '
      'hysterectomy and other morbidities in women with post-partum '
      'haemorrhage',
  year: 2017,
  journal: 'The Lancet 2017;389:2105–2116',
  setting: '193 hospitals across 21 countries, predominantly Africa and Asia',
  population: 'Women with clinically diagnosed postpartum haemorrhage',
  sampleSize: '20 060 women',
  inclusion: [
    'Clinical diagnosis of postpartum haemorrhage after vaginal or caesarean '
        'birth',
    'Clinician uncertain whether tranexamic acid was indicated',
  ],
  exclusion: ['Clear indication for or contraindication to tranexamic acid'],
  intervention: 'Tranexamic acid 1 g intravenously, repeated once if bleeding '
      'continued',
  comparator: 'Placebo',
  primaryOutcome: 'Composite of death from all causes or hysterectomy within '
      '42 days',
  secondaryOutcomes: [
    'Death due to bleeding',
    'Surgical intervention',
    'Thromboembolic events',
  ],
  results: [
    'Death due to bleeding: 1.5% versus 1.9% — RR 0.81 (95% CI 0.65–1.00). '
        'Absolute reduction 0.4%.',
    'Given within 3 hours of birth: RR 0.69 (95% CI 0.52–0.91). Beyond 3 '
        'hours, no benefit.',
    'The composite primary outcome was not significantly reduced, because '
        'hysterectomy was often decided before the drug could act.',
    'No reduction in hysterectomy.',
  ],
  adverseEvents: [
    'No increase in thromboembolic events — venous or arterial',
    'No excess of adverse effects in mothers or babies',
  ],
  limitations: [
    'The primary composite was diluted by hysterectomy, a decision frequently '
        'taken at the moment of randomisation.',
    'Clinical rather than quantified diagnosis of haemorrhage.',
  ],
  applicability: 'Directly applicable — the trial was conducted largely in the '
      'settings where postpartum haemorrhage kills.',
  guidelineImpact: 'WHO now recommends tranexamic acid for all postpartum '
      'haemorrhage, given within 3 hours. Adopted by RCOG, ACOG and FOGSI.',
  currentRelevance: 'The three-hour window is the operative fact, and the one '
      'most often missed in practice.',
  takeaway: 'Tranexamic acid within 3 hours of birth reduces death from '
      'bleeding by about a fifth; after 3 hours it does not.',
  category: TrialCategory.pph,
);

const kEmotive = Trial(
  id: 'emotive',
  acronym: 'E-MOTIVE',
  name: 'Randomized Trial of Early Detection and Treatment of Postpartum '
      'Hemorrhage',
  year: 2023,
  journal: 'New England Journal of Medicine 2023;389:11–21',
  setting: '80 secondary-level hospitals across Kenya, Nigeria, South Africa '
      'and Tanzania',
  population: 'Women having vaginal delivery',
  sampleSize: '210 132 women, cluster-randomised',
  intervention: 'A bundle: calibrated drape for early detection, then uterine '
      'massage, oxytocic drugs, tranexamic acid, intravenous fluids, '
      'examination and escalation — all triggered together',
  comparator: 'Usual care',
  primaryOutcome: 'Composite of severe postpartum haemorrhage (≥ 1000 mL), '
      'laparotomy for bleeding, or maternal death from bleeding',
  secondaryOutcomes: [
    'Detection of postpartum haemorrhage',
    'Adherence to the treatment bundle',
    'Blood transfusion',
  ],
  results: [
    'Primary outcome: 1.6% with the bundle versus 4.3% with usual care — RR '
        '0.40 (95% CI 0.32–0.50). A 60% relative reduction.',
    'Detection of haemorrhage: 93.1% versus 51.1% — RR 1.58.',
    'Bundle adherence: 91.2% versus 19.4%.',
    'Laparotomy for bleeding: RR 0.53.',
  ],
  limitations: [
    'Cluster design, so contamination and secular trends are possible.',
    'Conducted in African secondary hospitals; generalisability to '
        'high-resource or to Indian settings is inferred rather than tested.',
    'The bundle effect cannot be separated into its components.',
  ],
  applicability: 'The calibrated drape and the "treat all at once" principle '
      'transfer readily to Indian district hospitals, and cost little.',
  guidelineImpact: 'WHO issued a 2023 recommendation on objective measurement '
      'of blood loss. The bundle approach is now embedded in postpartum '
      'haemorrhage guidance internationally.',
  currentRelevance: 'The most important postpartum haemorrhage trial of the '
      'decade, and the reason drapes are replacing visual estimation.',
  takeaway: 'Measure the blood loss objectively and give the whole bundle at '
      'once — not sequentially — and severe haemorrhage falls by 60%.',
  category: TrialCategory.pph,
);

const kTruffle = Trial(
  id: 'truffle',
  acronym: 'TRUFFLE',
  name: 'Trial of Umbilical and Fetal Flow in Europe — 2-year neurodevelopmental '
      'outcome after ductus venosus and cardiotocography monitoring',
  year: 2015,
  journal: 'The Lancet 2015;385:2162–2172',
  setting: '20 European centres',
  population: 'Singleton pregnancies with early fetal growth restriction, '
      '26–32 weeks, with raised umbilical artery Doppler',
  sampleSize: '503 women; 2-year follow-up on 381 infants',
  intervention: 'Delivery timed by ductus venosus Doppler — either p95 or '
      'absent/reversed a-wave',
  comparator: 'Delivery timed by reduced short-term variation on computerised '
      'cardiotocography',
  primaryOutcome: 'Survival without neuroimpairment at 2 years',
  results: [
    'Survival without neuroimpairment: 95% in the late ductus venosus group '
        'versus 85% in the cardiotocography group among surviving infants.',
    'No significant difference in overall perinatal or infant death.',
    'Delivery was later in the ductus venosus groups without an increase in '
        'death.',
  ],
  limitations: [
    'The primary outcome was not significant for the full comparison; the '
        'benefit appeared in the surviving-infant analysis.',
    'Requires expertise in ductus venosus Doppler and access to computerised '
        'cardiotocography.',
    'European tertiary centres only.',
  ],
  applicability: 'Applies where fetal medicine expertise exists. In units '
      'without ductus venosus capability, umbilical artery Doppler thresholds '
      'remain the practical guide.',
  guidelineImpact: 'Underpins ductus venosus-based timing of delivery in early '
      'fetal growth restriction in ISUOG and RCOG guidance.',
  takeaway: 'In early growth restriction, timing delivery by the ductus '
      'venosus rather than by cardiotocography alone improves two-year '
      'neurological outcome.',
  category: TrialCategory.fetalMedicine,
);

const kArrive = Trial(
  id: 'arrive',
  acronym: 'ARRIVE',
  name: 'Labor Induction versus Expectant Management in Low-Risk Nulliparous '
      'Women',
  year: 2018,
  journal: 'New England Journal of Medicine 2018;379:513–523',
  setting: '41 hospitals in the United States',
  population: 'Low-risk nulliparous women at 38 weeks',
  sampleSize: '6 106 women',
  inclusion: [
    'Nulliparous, singleton, cephalic',
    'No maternal or fetal indication for delivery before 40+5',
  ],
  exclusion: ['Any indication for earlier delivery', 'Prior uterine surgery'],
  intervention: 'Elective induction of labour at 39+0 to 39+4 weeks',
  comparator: 'Expectant management to at least 40+5 weeks',
  primaryOutcome: 'Composite of perinatal death or severe neonatal '
      'complications',
  secondaryOutcomes: ['Caesarean delivery', 'Hypertensive disorders'],
  results: [
    'Primary perinatal composite: 4.3% versus 5.4% — RR 0.80 (95% CI '
        '0.64–1.00), not statistically significant.',
    'CAESAREAN DELIVERY: 18.6% versus 22.2% — RR 0.84 (95% CI 0.76–0.93). '
        'Absolute reduction 3.6%.',
    'Hypertensive disorders: 9.1% versus 14.1% — RR 0.64.',
  ],
  limitations: [
    'Only about a quarter of eligible women agreed to randomisation, raising '
        'questions about generalisability.',
    'Conducted in units with high induction expertise and 24-hour anaesthetic '
        'cover.',
    'Expectant management arm was managed to 40+5, later than many units '
        'practise.',
    'Resource implications of universal 39-week induction are considerable.',
  ],
  applicability: 'Contested for Indian practice — a policy of universal '
      '39-week induction would place substantial strain on labour ward '
      'capacity, and the benefit is caesarean reduction rather than perinatal.',
  guidelineImpact: 'ACOG accepted that elective induction at 39 weeks is '
      'reasonable in low-risk nulliparous women. NICE did not adopt a routine '
      'policy.',
  currentRelevance: 'Still debated. The finding that induction does not raise '
      'caesarean rates overturned decades of teaching.',
  takeaway: 'Elective induction at 39 weeks in low-risk nulliparas lowers '
      'caesarean rates rather than raising them — but the perinatal benefit '
      'was not significant.',
  category: TrialCategory.labour,
);

const kTermBreech = Trial(
  id: 'term-breech',
  acronym: 'Term Breech Trial',
  name: 'Planned caesarean section versus planned vaginal birth for breech '
      'presentation at term',
  year: 2000,
  journal: 'The Lancet 2000;356:1375–1383',
  setting: '121 centres in 26 countries',
  population: 'Singleton fetus in frank or complete breech presentation at '
      'term',
  sampleSize: '2 088 women',
  intervention: 'Planned caesarean section',
  comparator: 'Planned vaginal breech birth',
  primaryOutcome: 'Perinatal or neonatal death, or serious neonatal morbidity',
  results: [
    'Primary outcome: 1.6% with planned caesarean versus 5.0% with planned '
        'vaginal birth — RR 0.33 (95% CI 0.19–0.56). Absolute reduction 3.4%.',
    'Perinatal or neonatal death: 0.3% versus 1.3%.',
    'No significant difference in maternal death or serious maternal '
        'morbidity.',
    'At 2-year follow-up, no difference in death or neurodevelopmental delay.',
  ],
  limitations: [
    'Considerable protocol violation and variable operator experience in the '
        'vaginal arm.',
    'Included centres with widely differing standards of intrapartum care.',
    'The 2-year follow-up showing no difference is often overlooked.',
    'Criticised for effectively ending the training pathway that produced '
        'competent vaginal breech operators.',
  ],
  applicability: 'Its greatest legacy in India and elsewhere is the loss of '
      'vaginal breech skill, which now makes selected vaginal breech birth '
      'harder to offer safely even where it is appropriate.',
  guidelineImpact: 'Caesarean became the default for term breech worldwide '
      'almost immediately. Later guidance restored selected vaginal breech '
      'birth as a reasonable option with an experienced operator.',
  currentRelevance: 'A cautionary example of a single trial changing practice '
      'faster than the evidence justified.',
  takeaway: 'Planned caesarean reduced short-term neonatal morbidity in term '
      'breech — but the two-year outcomes were equivalent, and the trial cost '
      'a generation of vaginal breech skill.',
  category: TrialCategory.labour,
);
