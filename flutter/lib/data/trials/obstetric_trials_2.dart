import '../../models/trial.dart';

const kChips = Trial(
  id: 'chips',
  acronym: 'CHIPS',
  name: 'Less-Tight versus Tight Control of Hypertension in Pregnancy',
  year: 2015,
  journal: 'New England Journal of Medicine 2015;372:407–417',
  setting: '95 sites in 16 countries',
  population: 'Women with non-severe, non-proteinuric chronic or gestational '
      'hypertension at 14 to 33 weeks',
  sampleSize: '987 women',
  inclusion: [
    'Diastolic 90–105 mmHg off treatment, or 85–105 on treatment',
    'Singleton or twin pregnancy, 14+0 to 33+6 weeks',
  ],
  exclusion: [
    'Proteinuria',
    'Severe hypertension',
    'Contraindication to either strategy',
  ],
  intervention: 'Tight control — target diastolic 85 mmHg',
  comparator: 'Less-tight control — target diastolic 100 mmHg',
  primaryOutcome: 'Pregnancy loss, or high-level neonatal care for more than '
      '48 hours, in the first 28 postnatal days',
  secondaryOutcomes: [
    'Serious maternal complications to 6 weeks postpartum',
    'Severe hypertension',
    'Birth weight below the 10th centile',
  ],
  results: [
    'Primary outcome: 30.7% with tight control versus 31.4% with less-tight — '
        'adjusted OR 1.02 (95% CI 0.77–1.35). No difference.',
    'Serious maternal complications: 3.7% versus 2.0% — no significant '
        'difference.',
    'SEVERE HYPERTENSION: 27.5% with tight control versus 40.6% with '
        'less-tight (P < 0.001). This is the finding that changed practice.',
    'No excess of small-for-gestational-age babies with tighter control — the '
        'fear that had justified permissive hypertension.',
  ],
  adverseEvents: [
    'No increase in fetal growth restriction with tight control',
    'No increase in adverse neonatal outcome',
  ],
  limitations: [
    'Not powered for maternal stroke, which is the outcome that most concerns '
        'clinicians.',
    'Excluded proteinuric disease, so it says nothing about pre-eclampsia '
        'management.',
    'Diastolic-targeted, whereas systolic pressure drives haemorrhagic '
        'stroke.',
  ],
  applicability: 'Directly applicable. It removed the main argument for '
      'tolerating moderate hypertension in pregnancy.',
  guidelineImpact: 'NICE lowered its treatment threshold from 150/100 to '
      '140/90 and set a target of 135/85 in NG133 (2019). Many women '
      'previously only monitored are now treated.',
  currentRelevance: 'The evidence base for every current treatment threshold '
      'in non-severe pregnancy hypertension.',
  takeaway: 'Tighter blood pressure control does not harm the baby and halves '
      'progression to severe hypertension.',
  category: TrialCategory.hypertension,
);

const kHypitat = Trial(
  id: 'hypitat',
  acronym: 'HYPITAT',
  name: 'Induction of labour versus expectant monitoring for gestational '
      'hypertension or mild pre-eclampsia after 36 weeks',
  year: 2009,
  journal: 'The Lancet 2009;374:979–988',
  setting: '38 hospitals in the Netherlands',
  population: 'Singleton pregnancies at 36–41 weeks with gestational '
      'hypertension or mild pre-eclampsia',
  sampleSize: '756 women',
  intervention: 'Induction of labour within 24 hours',
  comparator: 'Expectant monitoring until spontaneous labour',
  primaryOutcome: 'Composite poor maternal outcome — maternal mortality, '
      'eclampsia, HELLP, pulmonary oedema, thromboembolic disease, abruption, '
      'progression to severe disease, or major postpartum haemorrhage',
  secondaryOutcomes: ['Caesarean delivery', 'Neonatal outcome'],
  results: [
    'Poor maternal outcome: 31% with induction versus 44% with expectant '
        'monitoring — RR 0.71 (95% CI 0.59–0.86). Absolute reduction 13%.',
    'CAESAREAN DELIVERY: 14% with induction versus 19% expectant — RR 0.75 '
        '(95% CI 0.55–1.04).',
    'No difference in adverse neonatal outcome.',
  ],
  limitations: [
    'Open-label; the composite included subjective components such as '
        '"progression to severe disease".',
    'Dutch population with a strong culture of expectant management, which '
        'may exaggerate the contrast.',
    'Applies only from 36 weeks and to non-severe disease.',
  ],
  applicability: 'Transfers well. The message — that delivering at term for '
      'mild hypertensive disease improves maternal outcome without harming '
      'the baby or raising caesarean rates — holds in any setting able to '
      'induce.',
  guidelineImpact: 'Underpins the recommendation to deliver by 37 weeks in '
      'gestational hypertension and mild pre-eclampsia, in NICE NG133 and '
      'ACOG guidance.',
  takeaway: 'Induce at term for mild hypertensive disease — better maternal '
      'outcomes, no cost to the baby, and fewer caesareans rather than more.',
  category: TrialCategory.hypertension,
);

const kHapo = Trial(
  id: 'hapo',
  acronym: 'HAPO',
  name: 'Hyperglycemia and Adverse Pregnancy Outcomes',
  year: 2008,
  journal: 'New England Journal of Medicine 2008;358:1991–2002',
  setting: '15 centres in 9 countries',
  population: 'Pregnant women without overt diabetes',
  sampleSize: '25 505 women',
  intervention: 'Observational — blinded 75 g oral glucose tolerance test at '
      '24–32 weeks',
  comparator: 'None. This was a cohort study designed to find a threshold.',
  primaryOutcome: 'Birth weight above the 90th centile, primary caesarean '
      'delivery, clinical neonatal hypoglycaemia, and cord C-peptide above the '
      '90th centile',
  results: [
    'A CONTINUOUS, graded association between maternal glucose and every '
        'adverse outcome, extending well below the levels then considered '
        'diabetic.',
    'No threshold at which risk began. The relationship was linear across the '
        'whole range.',
    'Fasting glucose, 1-hour and 2-hour values each contributed '
        'independently.',
  ],
  limitations: [
    'Observational — it establishes association, not that treating the '
        'glucose alters the outcome. ACHOIS and the MFMU mild GDM trial '
        'supplied that.',
    'Because there is no natural threshold, any diagnostic cut-off is a '
        'consensus decision rather than a biological one.',
    'IADPSG derived its criteria from an odds ratio of 1.75, which is a '
        'choice, not a discovery.',
  ],
  applicability: 'Its central finding — that risk is continuous — is what '
      'makes the DIPSI versus IADPSG debate a policy question rather than a '
      'scientific one. Neither criterion is "correct"; they draw the line in '
      'different places for different reasons.',
  guidelineImpact: 'Generated the IADPSG criteria, adopted by WHO and by many '
      'national bodies. India retained DIPSI on operational grounds.',
  currentRelevance: 'The reason no one can settle the GDM threshold argument '
      'by appeal to data alone.',
  takeaway: 'The relationship between maternal glucose and harm is continuous '
      'with no threshold — so every diagnostic cut-off is a judgement about '
      'where to intervene.',
  category: TrialCategory.diabetes,
);

const kTermProm = Trial(
  id: 'term-prom',
  acronym: 'TermPROM',
  name: 'Induction of labor compared with expectant management for prelabor '
      'rupture of the membranes at term',
  year: 1996,
  journal: 'New England Journal of Medicine 1996;334:1005–1010',
  setting: '72 centres in 6 countries',
  population: 'Women with prelabour rupture of membranes at term',
  sampleSize: '5 041 women',
  intervention: 'Immediate induction with oxytocin, or with prostaglandin E2',
  comparator: 'Expectant management for up to four days, then induction',
  primaryOutcome: 'Neonatal infection',
  secondaryOutcomes: [
    'Caesarean delivery',
    'Chorioamnionitis and postpartum fever',
    "Women's views of their care",
  ],
  results: [
    'Neonatal infection: no significant difference between any of the four '
        'arms — 2.0% to 2.8%.',
    'Chorioamnionitis: 4.0% with oxytocin induction versus 8.6% with '
        'expectant management (P < 0.001).',
    'Postpartum fever: 1.9% versus 3.6%.',
    'No difference in caesarean rates.',
    'Women rated induction more favourably than expectant management.',
  ],
  limitations: [
    'Predates current group B streptococcus prophylaxis practice.',
    'The number of vaginal examinations, rather than the ruptured membranes '
        'themselves, may drive much of the infection risk.',
  ],
  applicability: 'Directly applicable. The finding that induction reduces '
      'maternal infection without raising caesarean rates settled a long '
      'argument.',
  guidelineImpact: 'Established that induction should be offered at term '
      'PROM, in NICE NG207 and ACOG guidance.',
  takeaway: 'At term PROM, inducing reduces chorioamnionitis without '
      'increasing caesarean delivery, and women prefer it.',
  category: TrialCategory.labour,
);

const kLigginsHowie = Trial(
  id: 'liggins-howie',
  acronym: 'Liggins & Howie',
  name: 'A controlled trial of antepartum glucocorticoid treatment for '
      'prevention of the respiratory distress syndrome in premature infants',
  year: 1972,
  journal: 'Pediatrics 1972;50:515–525',
  setting: 'National Women\'s Hospital, Auckland, New Zealand',
  population: 'Women in threatened or planned preterm labour before 37 weeks',
  sampleSize: '282 women',
  intervention: 'Betamethasone 12 mg intramuscularly, two doses',
  comparator: 'Cortisone acetate placebo',
  primaryOutcome: 'Respiratory distress syndrome',
  results: [
    'Respiratory distress syndrome in babies born before 32 weeks: 9.0% with '
        'betamethasone versus 25.8% with placebo.',
    'Early neonatal mortality: 3.2% versus 15.0%.',
    'Benefit was confined to babies delivered more than 24 hours and less '
        'than 7 days after the first dose — the window still quoted today.',
  ],
  limitations: [
    'Small by modern standards, and single-centre.',
    'Predates surfactant, modern ventilation and neonatal intensive care, so '
        'the absolute effect sizes are not those of today.',
  ],
  applicability: 'Universal. Antenatal corticosteroids are among the cheapest '
      'and most effective interventions in all of medicine.',
  guidelineImpact: 'Eventually became standard of care everywhere, and the '
      'foundation of every preterm birth guideline. The Cochrane review '
      'confirmed reductions in RDS, intraventricular haemorrhage, '
      'necrotising enterocolitis and neonatal death.',
  currentRelevance: 'It took more than twenty years for this result to be '
      'widely adopted, and that delay is the founding story of the evidence-'
      'based medicine movement — the Cochrane Collaboration logo is a forest '
      'plot of the corticosteroid trials.',
  takeaway: 'Two doses of an inexpensive steroid before preterm birth halve '
      'respiratory distress and neonatal death — and the world took twenty '
      'years to act on it.',
  category: TrialCategory.pretermBirth,
);

const kActoMgso4 = Trial(
  id: 'actomgso4',
  acronym: 'ACTOMgSO4',
  name: 'Effect of magnesium sulfate given for neuroprotection before preterm '
      'birth',
  year: 2003,
  journal: 'JAMA 2003;290:2669–2676',
  setting: '16 centres in Australia and New Zealand',
  population: 'Women at risk of preterm birth before 30 weeks',
  sampleSize: '1 062 women, 1 255 infants',
  intervention: 'Magnesium sulphate 4 g intravenous loading, then 1 g/hour to '
      'a maximum of 24 hours',
  comparator: 'Placebo',
  primaryOutcome: 'Death or cerebral palsy at 2 years corrected age',
  results: [
    'Death or cerebral palsy: 19.8% versus 24.0% — RR 0.83 (95% CI '
        '0.66–1.03). Not statistically significant on its own.',
    'Cerebral palsy among survivors: 6.8% versus 8.2% — RR 0.83.',
    'SUBSTANTIAL GROSS MOTOR DYSFUNCTION: 3.4% versus 6.6% — RR 0.51 (95% CI '
        '0.29–0.91). Significant.',
    'Subsequent Cochrane meta-analysis: cerebral palsy RR 0.68, number needed '
        'to treat about 63.',
  ],
  adverseEvents: [
    'More maternal side effects — flushing, nausea',
    'No increase in serious maternal morbidity',
  ],
  limitations: [
    'The primary outcome did not reach significance; the case rests on the '
        'secondary outcome and on the later meta-analysis.',
    'Optimal dose, duration and repeat dosing remain uncertain.',
  ],
  applicability: 'Widely applicable and inexpensive. Magnesium is already on '
      'every labour ward for eclampsia.',
  guidelineImpact: 'Magnesium for fetal neuroprotection below 30–32 weeks is '
      'now recommended by NICE, RCOG, ACOG and WHO. It is a separate '
      'indication and a separate regimen from eclampsia prophylaxis.',
  takeaway: 'Magnesium before very preterm birth reduces cerebral palsy — a '
      'different indication, and a different regimen, from the one used in '
      'pre-eclampsia.',
  category: TrialCategory.pretermBirth,
);

const kGrit = Trial(
  id: 'grit',
  acronym: 'GRIT',
  name: 'Growth Restriction Intervention Trial — infant wellbeing at 2 years',
  year: 2004,
  journal: 'The Lancet 2004;364:513–520',
  setting: '69 hospitals in 13 European countries',
  population: 'Pregnancies between 24 and 36 weeks with a compromised fetus, '
      'where the obstetrician was uncertain whether to deliver',
  sampleSize: '548 women',
  intervention: 'Immediate delivery',
  comparator: 'Delayed delivery until the obstetrician was no longer uncertain',
  primaryOutcome: 'Death or disability at 2 years corrected age',
  results: [
    'Death or disability at 2 years: 55 of 290 with immediate delivery versus '
        '44 of 283 with delay — OR 1.1 (95% CI 0.7–1.8). No overall '
        'difference.',
    'Median delay in the deferred group was 4 days.',
    'Among babies delivered before 31 weeks, DISABILITY was more common with '
        'immediate delivery: 13% versus 5%.',
    'More stillbirths in the delayed group, offset by fewer neonatal deaths — '
        'the trade was between where the death occurred, not how many.',
  ],
  limitations: [
    'Randomisation depended on clinical uncertainty, so the extremes of the '
        'spectrum were excluded.',
    'Delay averaged only four days.',
    'Predates routine ductus venosus surveillance, which TRUFFLE later '
        'addressed.',
  ],
  applicability: 'The clinical lesson — that where you are genuinely '
      'uncertain, waiting is not harmful and may help the very preterm — '
      'transfers directly.',
  guidelineImpact: 'Supports deferring delivery in early growth restriction '
      'while surveillance remains reassuring, and set the scene for TRUFFLE.',
  takeaway: 'Where you are uncertain whether to deliver a growth-restricted '
      'preterm fetus, waiting does no harm overall and may reduce disability '
      'below 31 weeks.',
  category: TrialCategory.fetalMedicine,
);

const kChampion = Trial(
  id: 'champion',
  acronym: 'CHAMPION',
  name: 'Heat-Stable Carbetocin versus Oxytocin to Prevent Hemorrhage after '
      'Vaginal Birth',
  year: 2018,
  journal: 'New England Journal of Medicine 2018;379:743–752',
  setting: '23 sites in 10 countries, predominantly low- and middle-income',
  population: 'Women having vaginal birth',
  sampleSize: '29 645 women',
  intervention: 'Heat-stable carbetocin 100 µg intramuscularly',
  comparator: 'Oxytocin 10 IU intramuscularly',
  primaryOutcome: 'Blood loss of 500 mL or more, or use of additional '
      'uterotonics',
  results: [
    'Blood loss ≥ 500 mL or additional uterotonics: 14.5% with carbetocin '
        'versus 14.4% with oxytocin — non-inferior.',
    'Blood loss ≥ 1000 mL: 1.51% versus 1.45% — similar, though the '
        'non-inferiority margin was not formally met for this secondary '
        'outcome.',
    'No difference in adverse effects.',
  ],
  limitations: [
    'Oxytocin in the trial was stored correctly under controlled conditions — '
        'the real-world comparison in a hot clinic without refrigeration '
        'would likely favour carbetocin more strongly.',
    'Cost remains a barrier in the settings that would benefit most.',
  ],
  applicability: 'Highly relevant to India and to any setting where the cold '
      'chain is unreliable. Degraded oxytocin is a recognised and largely '
      'invisible cause of preventable haemorrhage.',
  guidelineImpact: 'WHO added heat-stable carbetocin as a recommended option '
      'for prevention of postpartum haemorrhage where oxytocin quality cannot '
      'be guaranteed.',
  takeaway: 'Heat-stable carbetocin works as well as oxytocin and does not '
      'need refrigeration — which matters most exactly where haemorrhage '
      'kills.',
  category: TrialCategory.pph,
);
