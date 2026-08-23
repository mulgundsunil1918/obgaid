import '../../models/topic.dart';

const kCtgTopic = ClinicalTopic(
  id: 'ctg',
  name: 'CTG interpretation',
  subtitle: 'DR C BRaVADO · NICE and FIGO, kept apart',
  headline: 'A cardiotocograph has a high false-positive rate for fetal '
      'compromise. It is good at telling you the fetus is well and poor at '
      'telling you it is not — which is why the response to an abnormal trace '
      'is conservative measures and reassessment, not reflex delivery.',
  keyFacts: [
    ('Normal baseline', '110 – 160 bpm'),
    ('Normal variability', '5 – 25 bpm'),
    ('Acceleration (≥ 32 weeks)', '≥ 15 bpm for ≥ 15 seconds'),
    ('Acceleration (< 32 weeks)', '≥ 10 bpm for ≥ 10 seconds'),
    ('Prolonged deceleration', '≥ 2 minutes'),
    ('Tachysystole', '> 5 contractions in 10 min, averaged over 30 min'),
    ('Fetal blood sample — normal pH', '≥ 7.25'),
    ('Fetal blood sample — abnormal pH', '≤ 7.20'),
  ],
  sections: [
    TopicSection('Systematic reading — DR C BRaVADO', [
      TopicPoint('DR — Define Risk',
          detail: 'Antenatal and intrapartum risk factors. The same trace '
              'means something different in a growth-restricted preterm fetus '
              'than in a healthy term one.'),
      TopicPoint('C — Contractions',
          detail: 'Frequency in 10 minutes, and duration. The tocograph does '
              'not measure strength.'),
      TopicPoint('BRa — Baseline Rate',
          detail: 'Mean level over 10 minutes, excluding accelerations and '
              'decelerations.'),
      TopicPoint('V — Variability',
          detail: 'Bandwidth amplitude of the baseline.'),
      TopicPoint('A — Accelerations'),
      TopicPoint('D — Decelerations',
          detail: 'Type, depth, duration, and their relationship to '
              'contractions.'),
      TopicPoint('O — Overall impression', critical: true,
          detail: 'And, above all, the trend. A single ten-minute window tells '
              'you far less than the direction of travel over an hour.'),
    ]),
    TopicSection('Baseline', [
      TopicPoint('Normal 110 – 160 bpm'),
      TopicPoint('Bradycardia below 110 bpm',
          detail: 'Causes: post-maturity, occipito-posterior position, fetal '
              'heart block, maternal beta-blockade, hypothermia. Below 100 is '
              'concerning.'),
      TopicPoint('Tachycardia above 160 bpm',
          detail: 'Causes: maternal pyrexia and chorioamnionitis, fetal '
              'infection, hypoxia, maternal dehydration, anxiety, '
              'beta-agonists, fetal arrhythmia, prematurity.'),
      TopicPoint('A rising baseline over hours matters even inside the normal '
          'range', critical: true,
          detail: 'It is often the first sign of developing chorioamnionitis '
              'or hypoxia.'),
    ]),
    TopicSection('Variability', [
      TopicPoint('Normal 5 – 25 bpm'),
      TopicPoint('Reduced below 5 bpm',
          detail: 'Fetal sleep cycle (usually under 40 minutes), prematurity, '
              'maternal opioids or magnesium, fetal tachycardia, and — the one '
              'that matters — hypoxia and acidaemia.'),
      TopicPoint('Reduced variability for more than 50 minutes is a '
          'non-reassuring feature; more than 90 minutes is abnormal',
          critical: true),
      TopicPoint('Increased above 25 bpm (saltatory) for more than 10 minutes '
          'is abnormal',
          detail: 'It suggests rapidly evolving hypoxia and is often missed '
              'because the trace looks busy rather than flat.'),
      TopicPoint('Absent variability with no accelerations and recurrent '
          'decelerations is a pre-terminal pattern', critical: true),
    ]),
    TopicSection('Decelerations — telling them apart', [
      TopicPoint('EARLY — uniform, mirrors the contraction, nadir with the '
          'peak, recovers with it',
          detail: 'Head compression. Physiological. Not associated with '
              'hypoxia.'),
      TopicPoint('VARIABLE — rapid onset within 30 seconds, variable shape and '
          'timing, rapid recovery',
          detail: 'Cord compression. Common and usually well tolerated. '
              'Concerning features: lasting over 60 seconds, dropping more '
              'than 60 bpm, loss of shouldering, slow recovery, biphasic W '
              'shape, overshoot, reduced variability within the deceleration.'),
      TopicPoint('LATE — onset after the contraction begins, nadir after its '
          'peak, recovery after it ends', critical: true,
          detail: 'Uteroplacental insufficiency. The most ominous repetitive '
              'pattern, particularly with reduced variability.'),
      TopicPoint('PROLONGED — 2 minutes or longer', critical: true,
          detail: 'Beyond 3 minutes, treat as an acute emergency.'),
      TopicPoint('SINUSOIDAL — smooth regular sine wave, 3–5 cycles per '
          'minute, amplitude 5–15 bpm, for 30 minutes or more, with no '
          'variability and no accelerations', critical: true,
          detail: 'Pathological by definition. Think fetal anaemia — '
              'fetomaternal haemorrhage, alloimmunisation, vasa praevia, '
              'parvovirus. Requires urgent assessment, not observation.'),
    ]),
    TopicSection('NICE NG229 categorisation', [
      TopicPoint('NICE classifies each feature as reassuring, non-reassuring '
          'or abnormal, then the trace overall as normal, suspicious, '
          'pathological, or needing urgent intervention.'),
      TopicPoint('NORMAL — all three features reassuring. Continue.'),
      TopicPoint('SUSPICIOUS — one non-reassuring feature, two reassuring. '
          'Correct any reversible cause; conservative measures; inform the '
          'coordinator.'),
      TopicPoint('PATHOLOGICAL — one abnormal feature, or two non-reassuring. '
          'Obstetric review, conservative measures, consider fetal blood '
          'sampling or delivery.', critical: true),
      TopicPoint('NEED FOR URGENT INTERVENTION — acute bradycardia or a '
          'prolonged deceleration of 3 minutes or more. Prepare for immediate '
          'delivery.', critical: true),
      TopicPoint('Do not quote a category without naming the system it came '
          'from', critical: true,
          detail: 'NICE and FIGO use overlapping words for different '
              'thresholds. "Pathological" is not the same call in both.'),
    ]),
    TopicSection('FIGO 2015 — a separate system', [
      TopicPoint('FIGO classifies traces as normal, suspicious or '
          'pathological, using its own criteria.'),
      TopicPoint('NORMAL — baseline 110–160, variability 5–25, no repetitive '
          'decelerations.'),
      TopicPoint('SUSPICIOUS — lacking at least one normal characteristic, but '
          'with no pathological feature.'),
      TopicPoint('PATHOLOGICAL — baseline below 100; reduced or increased '
          'variability; sinusoidal pattern; repetitive late or prolonged '
          'decelerations for over 30 minutes (or 20 with reduced '
          'variability); or a deceleration exceeding 5 minutes.'),
      TopicPoint('mix FIGO and NICE criteria within one assessment',
          avoid: true),
    ]),
    TopicSection('Conservative measures', [
      TopicPoint('Change position — left lateral first'),
      TopicPoint('Intravenous fluid bolus if she is hypotensive or dehydrated'),
      TopicPoint('Stop or reduce oxytocin', critical: true),
      TopicPoint('Remove a prostaglandin pessary if one is in situ'),
      TopicPoint('Correct hypotension after regional anaesthesia — fluids and '
          'a vasopressor'),
      TopicPoint('Exclude cord prolapse, uterine rupture and abruption by '
          'examination', critical: true),
      TopicPoint('Treat maternal pyrexia; consider chorioamnionitis'),
      TopicPoint('Consider acute tocolysis — terbutaline 250 µg '
          'subcutaneously — for tachysystole'),
      TopicPoint('give routine maternal oxygen', avoid: true,
          detail: 'There is no evidence of benefit for a non-reassuring trace '
              'in a woman who is not hypoxic, and some evidence of harm.'),
    ]),
    TopicSection('Fetal blood sampling', [
      TopicPoint('pH ≥ 7.25 normal · 7.21 – 7.24 borderline · ≤ 7.20 abnormal'),
      TopicPoint('Lactate ≤ 4.1 normal · 4.2 – 4.8 borderline · ≥ 4.9 '
          'abnormal'),
      TopicPoint('Normal result — repeat in an hour if the trace remains '
          'pathological'),
      TopicPoint('Borderline — repeat in 30 minutes'),
      TopicPoint('Abnormal — deliver', critical: true),
      TopicPoint('Contraindicated in suspected fetal bleeding disorder, '
          'maternal blood-borne infection, and before 34 weeks'),
      TopicPoint('delay delivery for a sample when the trace already demands '
          'immediate delivery', avoid: true),
    ]),
    TopicSection('Acute bradycardia — the three-minute rule', [
      TopicPoint('0–3 minutes: call for help, conservative measures, exclude '
          'cord prolapse, rupture and abruption', critical: true),
      TopicPoint('3–6 minutes: senior obstetrician and anaesthetist at the '
          'bedside; move towards theatre'),
      TopicPoint('6–9 minutes: transfer to theatre; prepare for delivery'),
      TopicPoint('9–12 minutes: deliver', critical: true),
      TopicPoint('Roughly half of prolonged bradycardias recover. Prepare '
          'fully while you wait — do not stand still, and do not commit before '
          'you must.'),
    ]),
  ],
  sources: [
    'NICE NG229 — Fetal monitoring in labour (2022).',
    'Ayres-de-Campos D et al. FIGO consensus guidelines on intrapartum fetal '
        'monitoring: cardiotocography. Int J Gynecol Obstet 2015;131:13–24.',
    'RCOG — Each Baby Counts.',
    'Fetal blood sampling thresholds per NICE NG229.',
    'FOGSI-ICOG GCPR — Intrapartum Fetal Surveillance; MoHFW Dakshata '
        'intrapartum monitoring standards.',
  ],
);

const kFgrTopic = ClinicalTopic(
  id: 'fgr',
  name: 'Fetal growth restriction',
  subtitle: 'SGA versus FGR · Doppler-based timing',
  headline: 'Small for gestational age is a statement about size. Growth '
      'restriction is a statement about failure to reach potential. Most SGA '
      'fetuses are constitutionally small and healthy; the ones that are not '
      'are identified by Doppler and by trajectory, not by a single '
      'measurement.',
  keyFacts: [
    ('SGA', 'EFW or AC below the 10th centile'),
    ('Severe SGA', 'Below the 3rd centile'),
    ('Early FGR', 'Before 32 weeks'),
    ('Late FGR', '32 weeks and after'),
    ('Umbilical artery PI', 'Abnormal above the 95th centile'),
    ('Cerebroplacental ratio', 'Abnormal below the 5th centile'),
    ('MCA-PSV for anaemia', 'Above 1.5 multiples of the median'),
    ('Minimum scan interval', '2 weeks — shorter, and error dominates'),
  ],
  sections: [
    TopicSection('Definitions — Delphi consensus', [
      TopicPoint('EARLY FGR, before 32 weeks, with no congenital anomaly:'),
      TopicPoint('AC or EFW below the 3rd centile, OR absent end-diastolic '
          'flow in the umbilical artery', critical: true),
      TopicPoint('OR AC/EFW below the 10th centile combined with a uterine '
          'artery PI above the 95th centile, or an umbilical artery PI above '
          'the 95th centile'),
      TopicPoint('LATE FGR, 32 weeks and after:'),
      TopicPoint('AC or EFW below the 3rd centile'),
      TopicPoint('OR at least two of: AC/EFW below the 10th centile; AC/EFW '
          'crossing more than two quartiles on serial growth centiles; '
          'cerebroplacental ratio below the 5th centile or umbilical artery PI '
          'above the 95th centile'),
    ]),
    TopicSection('Distinguishing the constitutionally small fetus', [
      TopicPoint('Normal Doppler indices throughout'),
      TopicPoint('Growth following a consistent centile rather than falling '
          'across them', critical: true),
      TopicPoint('Normal liquor volume'),
      TopicPoint('Proportionate biometry — head and abdomen tracking together'),
      TopicPoint('Parental size accounted for; customised charts may reclassify'),
      TopicPoint('The distinction matters because intervening in a healthy '
          'small fetus causes iatrogenic prematurity for no gain.'),
    ]),
    TopicSection('Causes', [
      TopicPoint('PLACENTAL — pre-eclampsia, placental insufficiency, '
          'abruption, confined placental mosaicism. The commonest group.'),
      TopicPoint('MATERNAL — hypertension, renal disease, autoimmune disease, '
          'thrombophilia, cyanotic cardiac disease, malnutrition, anaemia, '
          'smoking, alcohol, cocaine.'),
      TopicPoint('FETAL — aneuploidy, structural anomaly, congenital '
          'infection (CMV, toxoplasmosis, rubella, syphilis), multiple '
          'pregnancy.'),
      TopicPoint('Early, symmetrical restriction with normal Doppler should '
          'prompt a search for aneuploidy and infection rather than serial '
          'growth scans', critical: true),
    ]),
    TopicSection('Doppler surveillance', [
      TopicPoint('UMBILICAL ARTERY — the first vessel to change. Rising PI '
          'reflects rising placental resistance.'),
      TopicPoint('Absent end-diastolic flow, then reversed, is a deteriorating '
          'sequence measured in days to weeks', critical: true),
      TopicPoint('MIDDLE CEREBRAL ARTERY — falling PI indicates brain sparing, '
          'a compensation rather than a reassurance.'),
      TopicPoint('CEREBROPLACENTAL RATIO — MCA PI divided by UA PI. Below the '
          '5th centile, or below 1, indicates redistribution. More sensitive '
          'than either vessel alone in late FGR.'),
      TopicPoint('DUCTUS VENOSUS — a reduced, absent or reversed a-wave is a '
          'late sign of cardiac decompensation and usually prompts delivery.',
          critical: true),
      TopicPoint('UTERINE ARTERY — a screening tool in the first and second '
          'trimesters rather than a surveillance tool.'),
    ]),
    TopicSection('Timing of delivery — early FGR', [
      TopicPoint('Raised UA PI with end-diastolic flow present — deliver by 37 '
          'weeks'),
      TopicPoint('Absent end-diastolic flow — corticosteroids, daily '
          'monitoring, deliver by 34 weeks', critical: true),
      TopicPoint('Reversed end-diastolic flow — deliver by 30–32 weeks',
          critical: true),
      TopicPoint('Abnormal ductus venosus a-wave, or a computerised CTG with '
          'short-term variation below threshold — deliver, usually between 26 '
          'and 30 weeks with steroids'),
      TopicPoint('Magnesium sulphate for neuroprotection below 32 weeks'),
      TopicPoint('Caesarean is usual below 32 weeks with abnormal Doppler — '
          'these fetuses tolerate labour poorly'),
      TopicPoint('The TRUFFLE trial found that using the ductus venosus to '
          'time delivery improved two-year neurological outcome compared with '
          'CTG short-term variation alone.'),
    ]),
    TopicSection('Timing of delivery — late FGR', [
      TopicPoint('Abnormal umbilical artery Doppler — deliver by 37 weeks'),
      TopicPoint('Normal Doppler with SGA — deliver by 39 weeks'),
      TopicPoint('Abnormal cerebroplacental ratio — deliver by 37–38 weeks'),
      TopicPoint('Induction is reasonable where the Doppler is normal; the '
          'DIGITAT trial found no difference in adverse outcome between '
          'induction and expectant monitoring at term.'),
      TopicPoint('Continuous monitoring in labour, whatever the route',
          critical: true),
    ]),
    TopicSection('Investigation and management', [
      TopicPoint('Detailed anatomy scan; consider invasive testing where '
          'restriction is early or associated with anomaly'),
      TopicPoint('Screen for congenital infection where indicated'),
      TopicPoint('Review maternal blood pressure and urinalysis at every '
          'visit — pre-eclampsia frequently follows'),
      TopicPoint('Serial growth every 2–3 weeks; Doppler more often, as '
          'severity dictates'),
      TopicPoint('Corticosteroids where preterm delivery is anticipated'),
      TopicPoint('Aspirin 150 mg from before 16 weeks in a subsequent '
          'pregnancy where the cause was placental'),
      TopicPoint('repeat growth scans at intervals shorter than two weeks',
          avoid: true,
          detail: 'Measurement error then exceeds real growth, and the '
              'apparent change is noise.'),
    ]),
  ],
  sources: [
    'Gordijn SJ et al. Consensus definition of fetal growth restriction: a '
        'Delphi procedure. Ultrasound Obstet Gynecol 2016;48:333–339.',
    'RCOG Green-top Guideline 31 — The Investigation and Management of the '
        'Small-for-Gestational-Age Fetus.',
    'Lees CC et al. TRUFFLE study. Lancet 2015;385:2162–2172.',
    'Boers KE et al. DIGITAT trial. BMJ 2010;341:c7087.',
    'ISUOG Practice Guidelines — diagnosis and management of small-for-'
        'gestational-age fetus and fetal growth restriction.',
    'FOGSI GCPR — Fetal Growth Restriction.',
  ],
);
