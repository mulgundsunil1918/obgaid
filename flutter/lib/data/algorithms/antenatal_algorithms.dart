import '../../models/algorithm.dart';

const kRfmAlgorithm = Algorithm(
  id: 'algo-rfm',
  name: 'Reduced fetal movements',
  subtitle: 'The commonest reason a stillbirth was preventable',
  callFor: 'Assess in person. This is not a telephone consultation.',
  timeTarget: 'See her within 2 hours of the call. CTG within 30 minutes of '
      'arrival if she is 28 weeks or beyond.',
  immediate: [
    AlgoStep('Bring her in — never advise waiting until morning',
        critical: true),
    AlgoStep('Confirm gestation and check the notes for growth restriction, '
        'hypertension, diabetes, smoking or a previous stillbirth'),
    AlgoStep('Auscultate to confirm fetal heart present'),
    AlgoStep('CTG for at least 20 minutes if 28 weeks or beyond',
        critical: true),
    AlgoStep('Measure symphysis-fundal height and palpate'),
    AlgoStep('Blood pressure and urinalysis — pre-eclampsia presents this way'),
    AlgoStep('use a handheld Doppler as reassurance and send her home',
        avoid: true,
        detail: 'A present heart rate excludes death, not compromise. It is '
            'the single most common false reassurance in this presentation.'),
    AlgoStep('recommend formal kick counting', avoid: true,
        detail: 'It has not been shown to reduce stillbirth and delays '
            'presentation while she counts.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('A subjective reduction, or a change in the pattern, that '
          'concerns her — there is no numerical definition', critical: true),
      AlgoStep('Most women are aware of movements by 20 weeks; the pattern '
          'becomes established by 28'),
      AlgoStep('Movements do NOT reduce in late pregnancy — a woman told they '
          'do has been misinformed', critical: true),
      AlgoStep('Recurrent presentations carry a substantially higher risk than '
          'a single episode'),
    ]),
    AlgoSection('2 · Immediate assessment', [
      AlgoStep('History: onset, duration, whether movements have now returned'),
      AlgoStep('Risk factors: growth restriction, hypertensive disease, '
          'diabetes, smoking, obesity, advanced maternal age, previous '
          'stillbirth, antepartum haemorrhage'),
      AlgoStep('Abdominal palpation for size, lie and liquor'),
      AlgoStep('Cardiotocograph from 28 weeks; auscultation alone before that'),
      AlgoStep('Blood pressure and urinalysis'),
    ]),
    AlgoSection('3 · Investigations', [
      AlgoStep('Ultrasound within 24 hours where the CTG is normal but risk '
          'factors are present, or where this is a recurrent presentation',
          critical: true),
      AlgoStep('Assess growth, liquor volume and umbilical artery Doppler'),
      AlgoStep('Kleihauer where a large fetomaternal haemorrhage is possible — '
          'a sinusoidal trace, or movements that stopped abruptly',
          critical: true),
      AlgoStep('Full blood count, and pre-eclampsia bloods if the blood '
          'pressure is raised'),
    ]),
    AlgoSection('4 · Differential', [
      AlgoStep('Placental insufficiency and fetal growth restriction'),
      AlgoStep('Fetomaternal haemorrhage'),
      AlgoStep('Oligohydramnios'),
      AlgoStep('Fetal anomaly, particularly neurological or neuromuscular'),
      AlgoStep('Maternal sedatives, alcohol, or corticosteroids given in the '
          'preceding 48 hours'),
      AlgoStep('Anterior placenta and maternal obesity reduce perception '
          'without reducing movement'),
      AlgoStep('Fetal death'),
    ]),
    AlgoSection('5 · Management', [
      AlgoStep('Normal CTG, normal scan, no risk factors: reassure, and give '
          'explicit instructions to return immediately if it happens again'),
      AlgoStep('Abnormal CTG: manage as a non-reassuring trace and consider '
          'delivery', critical: true),
      AlgoStep('Growth restriction or abnormal Doppler: manage as fetal growth '
          'restriction, with delivery timed accordingly'),
      AlgoStep('Recurrent episodes: lower the threshold for delivery at term',
          critical: true),
      AlgoStep('At or beyond 39 weeks with recurrent episodes, offer '
          'induction'),
    ]),
    AlgoSection('6 · Before she leaves', [
      AlgoStep('Tell her plainly that if it happens again she should ring '
          'immediately, at any hour, and that she will not be wasting anyone\'s '
          'time', critical: true),
      AlgoStep('Give the labour ward number and check she can get there'),
      AlgoStep('Document that this advice was given'),
      AlgoStep('Arrange follow-up where risk factors exist'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 57 — Reduced Fetal Movements.',
    'Saving Babies\' Lives Care Bundle — element on reduced fetal movement.',
    'MBRRACE-UK perinatal confidential enquiries.',
    'FOGSI GCPR — Antenatal Fetal Surveillance; MoHFW Pradhan Mantri '
        'Surakshit Matritva Abhiyan.',
  ],
);

const kCtgAlgorithm = Algorithm(
  id: 'algo-ctg',
  name: 'Non-reassuring CTG',
  subtitle: 'Conservative measures, then decide',
  callFor: 'Inform the labour ward coordinator and the obstetric registrar. '
      'For a prolonged deceleration, put out the emergency call.',
  timeTarget: 'A bradycardia not recovered by 3 minutes starts the clock: '
      'senior at the bedside by 6, in theatre by 9, delivered by 12.',
  immediate: [
    AlgoStep('Turn her into the LEFT LATERAL position', critical: true),
    AlgoStep('STOP the oxytocin infusion', critical: true),
    AlgoStep('Vaginal examination — exclude cord prolapse, and assess '
        'progress', critical: true),
    AlgoStep('Intravenous fluid bolus if she is hypotensive, especially after '
        'a recent epidural top-up'),
    AlgoStep('Remove any prostaglandin pessary'),
    AlgoStep('Consider acute tocolysis — terbutaline 250 µg subcutaneously — '
        'for tachysystole'),
    AlgoStep('Exclude uterine rupture and abruption', critical: true),
    AlgoStep('give routine maternal oxygen', avoid: true,
        detail: 'No benefit in a woman who is not hypoxic, and some evidence '
            'of harm.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('Read systematically — DR C BRaVADO — rather than reacting to '
          'one feature'),
      AlgoStep('Name the classification system you are using. NICE and FIGO '
          'use overlapping words for different thresholds.', critical: true),
      AlgoStep('The TREND over an hour matters more than any ten-minute '
          'window', critical: true),
      AlgoStep('A rising baseline within the normal range is often the first '
          'sign of chorioamnionitis or evolving hypoxia'),
    ]),
    AlgoSection('2 · Correct the reversible cause first', [
      AlgoStep('Maternal position — aortocaval compression'),
      AlgoStep('Hypotension after regional anaesthesia — fluids and a '
          'vasopressor'),
      AlgoStep('Tachysystole from oxytocin or prostaglandin'),
      AlgoStep('Maternal pyrexia — treat it, and consider chorioamnionitis'),
      AlgoStep('Maternal dehydration and ketosis'),
      AlgoStep('Most non-reassuring traces improve once one of these is '
          'corrected. Reassess after 20–30 minutes before escalating further.',
          critical: true),
    ]),
    AlgoSection('3 · Exclude the acute catastrophes', [
      AlgoStep('CORD PROLAPSE — vaginal examination, every time',
          critical: true),
      AlgoStep('UTERINE RUPTURE — scar tenderness, constant pain, loss of '
          'station, breakthrough pain through a working epidural',
          critical: true),
      AlgoStep('ABRUPTION — pain, a hard tonic uterus, bleeding that may be '
          'concealed'),
      AlgoStep('VASA PRAEVIA — bleeding at membrane rupture with rapid fetal '
          'compromise'),
      AlgoStep('Maternal collapse of any cause'),
    ]),
    AlgoSection('4 · Fetal blood sampling', [
      AlgoStep('Where available, and where delivery is not already indicated'),
      AlgoStep('pH 7.25 or above normal · 7.21–7.24 borderline · 7.20 or below '
          'abnormal'),
      AlgoStep('Lactate 4.1 or below normal · 4.2–4.8 borderline · 4.9 or '
          'above abnormal'),
      AlgoStep('Abnormal result — deliver', critical: true),
      AlgoStep('Contraindicated below 34 weeks, in maternal blood-borne '
          'infection, and in suspected fetal bleeding disorder'),
      AlgoStep('delay an indicated delivery in order to obtain a sample',
          avoid: true),
    ]),
    AlgoSection('5 · Acute bradycardia — the three-minute rule', [
      AlgoStep('0–3 min: conservative measures, exclude prolapse, rupture and '
          'abruption', critical: true),
      AlgoStep('3–6 min: senior obstetrician and anaesthetist at the bedside; '
          'move towards theatre'),
      AlgoStep('6–9 min: transfer to theatre, prepare for delivery'),
      AlgoStep('9–12 min: deliver', critical: true),
      AlgoStep('About half recover. Prepare fully while you wait — do not '
          'stand still, and do not commit before you must.'),
    ]),
    AlgoSection('6 · Delivery', [
      AlgoStep('Category 1 caesarean for a sustained bradycardia or an '
          'abnormal fetal blood sample'),
      AlgoStep('Assisted vaginal delivery where the cervix is fully dilated '
          'and conditions are met'),
      AlgoStep('Alert the neonatal team, and say why'),
      AlgoStep('Paired cord gases in every case', critical: true),
    ]),
    AlgoSection('7 · Afterwards', [
      AlgoStep('Keep the trace with the notes and ensure it is labelled'),
      AlgoStep('Document the classification, the measures taken, and the times'),
      AlgoStep('Debrief the woman — an emergency delivery for a trace she '
          'never saw is frightening and poorly understood'),
      AlgoStep('Where the outcome was poor, review the trace as a team'),
    ]),
  ],
  sources: [
    'NICE NG229 — Fetal monitoring in labour.',
    'Ayres-de-Campos D et al. FIGO consensus guidelines on intrapartum fetal '
        'monitoring. Int J Gynecol Obstet 2015;131:13–24.',
    'RCOG — Each Baby Counts.',
    'FOGSI-ICOG GCPR — Intrapartum Fetal Surveillance; MoHFW Dakshata.',
  ],
);

const kPpromAlgorithm = Algorithm(
  id: 'algo-pprom',
  name: 'PPROM',
  subtitle: 'Preterm prelabour rupture of membranes',
  callFor: 'Obstetric registrar and, if delivery looks likely, the neonatal '
      'team. Arrange in utero transfer before delivery, not after.',
  timeTarget: 'Corticosteroids work best between 24 hours and 7 days after '
      'the first dose — give them early rather than perfectly.',
  immediate: [
    AlgoStep('STERILE SPECULUM examination — look for pooling', critical: true),
    AlgoStep('perform a digital vaginal examination', avoid: true,
        detail: 'It introduces infection and shortens latency without adding '
            'anything a speculum cannot give.'),
    AlgoStep('Observations: temperature, pulse, blood pressure, respiratory '
        'rate'),
    AlgoStep('CTG — fetal tachycardia may be the first sign of '
        'chorioamnionitis', critical: true),
    AlgoStep('Corticosteroids if 24–34 weeks (consider to 36)',
        critical: true),
    AlgoStep('Erythromycin 250 mg four times daily for 10 days',
        critical: true),
    AlgoStep('give co-amoxiclav', avoid: true,
        detail: 'ORACLE I found a significant excess of neonatal necrotising '
            'enterocolitis.'),
    AlgoStep('Magnesium sulphate for neuroprotection below 30 weeks'),
  ],
  sections: [
    AlgoSection('1 · Confirming the diagnosis', [
      AlgoStep('Pooling of liquor in the posterior fornix on speculum is '
          'diagnostic'),
      AlgoStep('IGFBP-1 or PAMG-1 testing where the speculum is equivocal'),
      AlgoStep('Nitrazine and ferning are confounded by blood, semen and '
          'infection'),
      AlgoStep('Oligohydramnios on ultrasound supports the diagnosis but does '
          'not make it'),
    ]),
    AlgoSection('2 · Initial investigations', [
      AlgoStep('Full blood count and CRP — as a trend, not a threshold',
          critical: true),
      AlgoStep('High vaginal swab and midstream urine'),
      AlgoStep('Ultrasound for presentation, liquor and estimated weight'),
      AlgoStep('Group B streptococcus status where known'),
    ]),
    AlgoSection('3 · Differential', [
      AlgoStep('Urinary incontinence'),
      AlgoStep('Physiological or infective vaginal discharge'),
      AlgoStep('Loss of the operculum'),
      AlgoStep('Semen'),
    ]),
    AlgoSection('4 · Expectant management', [
      AlgoStep('Admit at least initially; outpatient care only with a clear '
          'protocol and reliable access'),
      AlgoStep('Four-hourly observations; daily CTG'),
      AlgoStep('Weekly growth and liquor assessment'),
      AlgoStep('Serial CRP and white cell count as a trend'),
      AlgoStep('Teach the warning signs — fever, abdominal pain, offensive or '
          'coloured discharge, reduced movements', critical: true),
      AlgoStep('use tocolysis to prolong the pregnancy', avoid: true,
          detail: 'It does not improve outcome and may mask developing '
              'infection.'),
    ]),
    AlgoSection('5 · Recognising chorioamnionitis', [
      AlgoStep('Maternal pyrexia above 38 °C'),
      AlgoStep('Maternal tachycardia above 100'),
      AlgoStep('Fetal tachycardia above 160', critical: true),
      AlgoStep('Uterine tenderness'),
      AlgoStep('Offensive or purulent discharge'),
      AlgoStep('Rising white cell count and CRP'),
      AlgoStep('No single marker is sensitive enough to exclude it — the '
          'picture as a whole decides', critical: true),
    ]),
    AlgoSection('6 · When to deliver', [
      AlgoStep('Chorioamnionitis — deliver, at any gestation. Delivery is the '
          'source control.', critical: true),
      AlgoStep('Abruption, cord prolapse or a non-reassuring CTG'),
      AlgoStep('Established labour'),
      AlgoStep('37 weeks reached'),
      AlgoStep('Between 34 and 37 weeks, discuss the trade: expectant '
          'management to 37 weeks reduces neonatal respiratory morbidity and '
          'increases maternal infection (PPROMT).'),
      AlgoStep('Mode of delivery on obstetric grounds — PPROM alone is not an '
          'indication for caesarean'),
    ]),
    AlgoSection('7 · Follow-up', [
      AlgoStep('Placental histology'),
      AlgoStep('Neonatal team informed of the antibiotic and organism'),
      AlgoStep('Counsel on recurrence — roughly 1 in 5 in a future pregnancy'),
      AlgoStep('Consider progesterone and cervical surveillance next time'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 73 — Preterm Prelabour Rupture of Membranes.',
    'NICE NG25 — Preterm labour and birth.',
    'Kenyon SL et al. ORACLE I. Lancet 2001;357:979–988.',
    'Morris JM et al. PPROMT. Lancet 2016;387:444–452.',
    'FOGSI GCPR — Preterm Birth; MoHFW India Newborn Action Plan.',
  ],
);

const kFgrAlgorithm = Algorithm(
  id: 'algo-fgr',
  name: 'Fetal growth restriction',
  subtitle: 'Surveillance and timing of delivery',
  callFor: 'Fetal medicine input for early FGR, and the neonatal team before '
      'any preterm delivery.',
  timeTarget: 'Serial growth scans no closer than 2 weeks apart — below that, '
      'measurement error exceeds real growth.',
  immediate: [
    AlgoStep('Confirm the dating before calling anything small',
        critical: true),
    AlgoStep('Estimated fetal weight and abdominal circumference with '
        'centiles'),
    AlgoStep('Umbilical artery Doppler', critical: true),
    AlgoStep('Amniotic fluid — deepest vertical pocket'),
    AlgoStep('Blood pressure and urinalysis — pre-eclampsia coexists often'),
    AlgoStep('Middle cerebral artery Doppler and cerebroplacental ratio, '
        'especially at or beyond 32 weeks'),
    AlgoStep('deliver on a single small measurement', avoid: true,
        detail: 'A trajectory across scans is what matters. Most small '
            'fetuses are constitutionally small.'),
  ],
  sections: [
    AlgoSection('1 · Recognition and definition', [
      AlgoStep('SGA is a size statement; FGR is a failure to reach potential',
          critical: true),
      AlgoStep('EARLY FGR, before 32 weeks: AC or EFW below the 3rd centile, '
          'or absent umbilical artery end-diastolic flow; or below the 10th '
          'with an abnormal uterine or umbilical artery PI'),
      AlgoStep('LATE FGR, 32 weeks and after: below the 3rd centile; or two '
          'of — below the 10th, crossing more than two quartiles, or '
          'cerebroplacental ratio below the 5th centile'),
      AlgoStep('A falling centile across serial scans is more important than '
          'any single value', critical: true),
    ]),
    AlgoSection('2 · Investigations', [
      AlgoStep('Detailed anatomy survey — FGR with anomaly suggests aneuploidy '
          'or infection', critical: true),
      AlgoStep('Consider invasive testing where restriction is early, '
          'symmetrical, or associated with anomaly'),
      AlgoStep('Screen for congenital infection — CMV, toxoplasmosis, syphilis '
          '— where indicated'),
      AlgoStep('Uterine artery Doppler in the second trimester'),
      AlgoStep('Maternal assessment: blood pressure, proteinuria, and review '
          'for autoimmune or renal disease'),
    ]),
    AlgoSection('3 · Distinguishing the small but healthy fetus', [
      AlgoStep('Normal Doppler throughout'),
      AlgoStep('Growth following a consistent centile rather than falling '
          'across them'),
      AlgoStep('Normal liquor volume'),
      AlgoStep('Proportionate biometry'),
      AlgoStep('Parental size accounted for; a customised chart may reclassify'),
      AlgoStep('This distinction matters because intervening in a healthy '
          'small fetus causes iatrogenic prematurity for no gain.',
          critical: true),
    ]),
    AlgoSection('4 · Surveillance intervals', [
      AlgoStep('Normal umbilical artery Doppler: growth every 2–3 weeks, '
          'Doppler every 1–2 weeks'),
      AlgoStep('Raised umbilical artery PI with end-diastolic flow present: '
          'Doppler twice weekly'),
      AlgoStep('Absent end-diastolic flow: daily monitoring, corticosteroids, '
          'and add ductus venosus', critical: true),
      AlgoStep('Reversed end-diastolic flow: inpatient, at least daily, and '
          'plan delivery', critical: true),
      AlgoStep('Add computerised CTG short-term variation where available'),
    ]),
    AlgoSection('5 · Timing of delivery — early FGR', [
      AlgoStep('Raised PI with flow present — deliver by 37 weeks'),
      AlgoStep('Absent end-diastolic flow — deliver by 34 weeks',
          critical: true),
      AlgoStep('Reversed end-diastolic flow — deliver by 30–32 weeks',
          critical: true),
      AlgoStep('Abnormal ductus venosus a-wave, or short-term variation below '
          'threshold — deliver, usually 26–30 weeks with steroids'),
      AlgoStep('Magnesium sulphate for neuroprotection below 32 weeks'),
      AlgoStep('Caesarean is usual below 32 weeks with abnormal Doppler — '
          'these fetuses tolerate labour poorly', critical: true),
    ]),
    AlgoSection('6 · Timing of delivery — late FGR', [
      AlgoStep('Abnormal umbilical artery Doppler — deliver by 37 weeks'),
      AlgoStep('Abnormal cerebroplacental ratio — deliver by 37–38 weeks'),
      AlgoStep('SGA with normal Doppler — deliver by 39 weeks'),
      AlgoStep('Continuous monitoring in labour, whatever the route',
          critical: true),
    ]),
    AlgoSection('7 · Follow-up', [
      AlgoStep('Placental histology'),
      AlgoStep('Aspirin 150 mg from before 16 weeks in the next pregnancy '
          'where the cause was placental', critical: true),
      AlgoStep('Counsel on recurrence and plan earlier surveillance'),
      AlgoStep('Neonatal follow-up — these babies are at risk of '
          'hypoglycaemia, hypothermia and polycythaemia'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 31 — The Small-for-Gestational-Age Fetus.',
    'Gordijn SJ et al. Delphi consensus definition of FGR. Ultrasound Obstet '
        'Gynecol 2016;48:333–339.',
    'Lees CC et al. TRUFFLE. Lancet 2015;385:2162–2172.',
    'ISUOG Practice Guidelines; FOGSI-ICOG GCPR — Fetal Growth Restriction.',
  ],
);
