import '../../models/algorithm.dart';

const kPphAlgorithm = Algorithm(
  id: 'algo-pph',
  name: 'Postpartum haemorrhage',
  subtitle: 'Primary PPH · the 4 Ts',
  callFor: 'Call the obstetric registrar, anaesthetist, senior midwife, '
      'haematology and the blood bank. Assign one person to record times.',
  timeTarget: 'Tranexamic acid within 3 hours of birth — the benefit is lost '
      'after that.',
  immediate: [
    AlgoStep('Call for help and start the clock', critical: true),
    AlgoStep('Uterine massage and bimanual compression',
        detail: 'Rub up a contraction. Atony causes about 70% of PPH.'),
    AlgoStep('Two large-bore cannulae (14–16 G), bloods and crossmatch 4 units',
        critical: true),
    AlgoStep('Oxytocin 10 IU IM, or 5 IU by slow IV injection',
        detail: 'Then an infusion of 40 IU in 500 mL over 4 hours.'),
    AlgoStep('Tranexamic acid 1 g IV over 10 minutes', critical: true),
    AlgoStep('Empty the bladder — catheterise'),
    AlgoStep('High-flow oxygen, lie flat, keep her warm'),
    AlgoStep('give oxytocin as a rapid IV bolus', avoid: true,
        detail: 'It causes profound hypotension. Give it slowly, or IM.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('≥ 500 mL after vaginal birth, or ≥ 1000 mL after caesarean'),
      AlgoStep('ACOG reVITALize: ≥ 1000 mL by any route, OR any blood loss '
          'with signs of hypovolaemia within 24 hours of birth'),
      AlgoStep('Major PPH ≥ 1000 mL · massive PPH ≥ 2000 mL'),
      AlgoStep('Primary PPH is within 24 hours; secondary is from 24 hours to '
          '12 weeks postpartum'),
      AlgoStep('Visual estimation understates loss by 30–50% — use a '
          'calibrated drape', critical: true),
      AlgoStep('A young woman compensates until she does not. Shock index '
          '(HR ÷ SBP) ≥ 0.9 is abnormal in pregnancy', critical: true),
    ]),
    AlgoSection('2 · Immediate assessment', [
      AlgoStep('Airway, breathing, circulation'),
      AlgoStep('Pulse, blood pressure, respiratory rate, oxygen saturation, '
          'conscious level — every 5 minutes'),
      AlgoStep('Palpate the uterus: is it contracted or boggy?'),
      AlgoStep('Inspect the perineum, vagina and cervix under good light'),
      AlgoStep('Check the placenta is complete, membranes included'),
      AlgoStep('Quantify loss with a calibrated drape and weighed swabs'),
    ]),
    AlgoSection('3 · Initial investigations', [
      AlgoStep('Full blood count, coagulation screen, fibrinogen'),
      AlgoStep('Fibrinogen below 2 g/L predicts progression to severe PPH',
          critical: true),
      AlgoStep('Crossmatch 4–6 units; group and save on everyone'),
      AlgoStep('Arterial or venous blood gas with lactate'),
      AlgoStep('Urea, electrolytes, liver function'),
      AlgoStep('Point-of-care viscoelastic testing (ROTEM / TEG) where '
          'available — it turns around far faster than a lab coagulation '
          'screen'),
    ]),
    AlgoSection('4 · Differential — the 4 Ts', [
      AlgoStep('TONE — uterine atony. About 70% of cases.',
          detail: 'Overdistension, prolonged or precipitate labour, high '
              'parity, chorioamnionitis, magnesium sulphate, tocolytics, '
              'retained clot.'),
      AlgoStep('TRAUMA — about 20%.',
          detail: 'Perineal, vaginal or cervical tears, extension at '
              'caesarean, uterine rupture, uterine inversion, broad ligament '
              'haematoma.'),
      AlgoStep('TISSUE — about 10%.',
          detail: 'Retained placenta, retained fragments, morbidly adherent '
              'placenta.'),
      AlgoStep('THROMBIN — about 1%.',
          detail: 'Pre-existing or acquired coagulopathy, abruption, '
              'pre-eclampsia and HELLP, sepsis, amniotic fluid embolism, '
              'dilutional coagulopathy from massive fluid resuscitation.'),
    ]),
    AlgoSection('5 · First-line treatment — uterotonic ladder', [
      AlgoStep('Oxytocin 10 IU IM or 5 IU slow IV, then 40 IU in 500 mL over '
          '4 hours'),
      AlgoStep('Methylergometrine 0.2 mg IM, repeat every 15 minutes to a '
          'maximum of 5 doses',
          detail: 'CONTRAINDICATED in hypertension and pre-eclampsia.',
          critical: true),
      AlgoStep('Carboprost 250 µg IM every 15 minutes, maximum 2 mg '
          '(8 doses)',
          detail: 'CONTRAINDICATED in asthma. Causes diarrhoea, vomiting and '
              'pyrexia.',
          critical: true),
      AlgoStep('Misoprostol 800 µg sublingual',
          detail: 'Where injectables or a cold chain are unavailable.'),
      AlgoStep('Tranexamic acid 1 g IV over 10 minutes; repeat once after 30 '
          'minutes if bleeding continues or restarts within 24 hours'),
    ]),
    AlgoSection('6 · Escalation', [
      AlgoStep('Bimanual uterine compression while preparing the next step'),
      AlgoStep('Intrauterine balloon tamponade',
          detail: 'A condom catheter tied to a Foley and inflated with 250–500 '
              'mL of saline works, is available anywhere, and buys time. '
              'Success is judged in 15 minutes, not an hour.'),
      AlgoStep('Examination under anaesthesia — repair trauma, remove retained '
          'tissue'),
      AlgoStep('Aortic compression as a temporising measure in extremis'),
      AlgoStep('Activate the massive haemorrhage protocol', critical: true),
      AlgoStep('wait to see whether the next uterotonic works before calling '
          'for senior help', avoid: true,
          detail: 'Delay, not the operation, is what kills.'),
    ]),
    AlgoSection('7 · Definitive treatment', [
      AlgoStep('Compression sutures — B-Lynch, Hayman, Cho'),
      AlgoStep('Stepwise uterine devascularisation — uterine, then ovarian, '
          'then internal iliac artery ligation'),
      AlgoStep('Arterial embolisation where interventional radiology is '
          'available and she is stable enough to travel'),
      AlgoStep('Peripartum hysterectomy', critical: true,
          detail: 'Do not defer it in an exsanguinating woman. The commonest '
              'error in maternal death reviews is deciding too late.'),
    ]),
    AlgoSection('8 · Monitoring & massive transfusion', [
      AlgoStep('Transfuse in a 1:1:1 ratio of red cells, fresh frozen plasma '
          'and platelets in massive haemorrhage'),
      AlgoStep('Keep fibrinogen above 2 g/L — give cryoprecipitate or '
          'fibrinogen concentrate below that', critical: true),
      AlgoStep('Keep platelets above 50 × 10⁹/L, prothrombin ratio below 1.5'),
      AlgoStep('Warm all fluids and blood; keep her above 36 °C'),
      AlgoStep('Correct ionised calcium — citrate in stored blood chelates it'),
      AlgoStep('Urine output ≥ 30 mL/hour; consider arterial and central lines'),
      AlgoStep('High-dependency care with continuous observations'),
    ]),
    AlgoSection('9 · Follow-up', [
      AlgoStep('Thromboprophylaxis once bleeding has stopped and coagulopathy '
          'is corrected — she is now at high VTE risk'),
      AlgoStep('Correct anaemia: intravenous iron rather than transfusion '
          'where she is stable'),
      AlgoStep('Debrief the woman and her partner — what happened and why'),
      AlgoStep('Debrief the team; complete an incident review'),
      AlgoStep('Document the estimated loss, the times, the drugs and the '
          'sequence of interventions'),
      AlgoStep('Counsel on recurrence risk and plan the next birth'),
    ]),
    AlgoSection('Secondary PPH (24 hours to 12 weeks)', [
      AlgoStep('Usually endometritis, retained products of conception, or both'),
      AlgoStep('Assess for fever, offensive lochia, uterine tenderness, '
          'subinvolution'),
      AlgoStep('Full blood count, CRP, high vaginal and endocervical swabs, '
          'blood cultures if febrile'),
      AlgoStep('Ultrasound for retained products — interpret with care, as '
          'clot and retained tissue look alike'),
      AlgoStep('Broad-spectrum antibiotics; surgical evacuation if bleeding is '
          'heavy or products are confirmed'),
      AlgoStep('Evacuate a septic uterus without antibiotic cover', avoid: true,
          detail: 'Perforation risk is high in an infected, soft uterus. Cover '
              'first, and let an experienced operator do it.'),
    ]),
  ],
  sources: [
    'Gallos I et al. Randomized Trial of Early Detection and Treatment of '
        'Postpartum Hemorrhage (E-MOTIVE). N Engl J Med 2023;389:11–21.',
    'WOMAN Trial Collaborators. Effect of early tranexamic acid administration '
        'on mortality. Lancet 2017;389:2105–2116.',
    'RCOG Green-top Guideline 52 — Prevention and Management of Postpartum '
        'Haemorrhage.',
    'ACOG Practice Bulletin 183 — Postpartum Hemorrhage; reVITALize definition.',
    'FOGSI GCPR — Prevention and Management of Postpartum Haemorrhage.',
    'WHO Recommendations on the Assessment of Postpartum Blood Loss, 2023.',
  ],
);

const kAbruptionAlgorithm = Algorithm(
  id: 'algo-abruption',
  name: 'Placental abruption',
  subtitle: 'Including concealed haemorrhage and DIC',
  callFor: 'Call the obstetric registrar, anaesthetist, neonatal team, blood '
      'bank and haematology.',
  immediate: [
    AlgoStep('Assume the visible loss is a fraction of the real loss',
        critical: true,
        detail: 'Up to 20% of abruptions are concealed. Resuscitate to the '
            'woman, never to the pad.'),
    AlgoStep('Two large-bore cannulae, bloods, crossmatch 4 units'),
    AlgoStep('Send fibrinogen with the first set of bloods', critical: true,
        detail: 'It falls first and falls early in abruption.'),
    AlgoStep('Continuous CTG if the fetus is viable'),
    AlgoStep('Catheterise and monitor hourly urine output'),
    AlgoStep('Activate the massive haemorrhage protocol if she is unstable'),
    AlgoStep('Kleihauer and anti-D if she is Rhesus negative'),
    AlgoStep('estimate blood loss from what you can see', avoid: true),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('Abdominal pain, vaginal bleeding, uterine tenderness'),
      AlgoStep('A "woody", hard, tonically contracted uterus that does not relax'),
      AlgoStep('Fetal distress, or absent fetal heart'),
      AlgoStep('Concealed abruption: pain and shock out of proportion to the '
          'visible loss, with a rising fundal height', critical: true),
      AlgoStep('Frequent low-amplitude contractions on the tocograph'),
    ]),
    AlgoSection('2 · Immediate assessment', [
      AlgoStep('Airway, breathing, circulation; pulse, BP, respiratory rate'),
      AlgoStep('Assess uterine tone and tenderness; measure fundal height and '
          'mark it'),
      AlgoStep('Confirm gestation and fetal viability'),
      AlgoStep('Speculum examination once placenta praevia is excluded'),
      AlgoStep('perform a digital vaginal examination before excluding '
          'praevia by ultrasound', avoid: true),
    ]),
    AlgoSection('3 · Initial investigations', [
      AlgoStep('Full blood count, coagulation screen, fibrinogen'),
      AlgoStep('Urea, electrolytes, liver function, urate — pre-eclampsia '
          'coexists often'),
      AlgoStep('Group and save, crossmatch 4 units'),
      AlgoStep('Kleihauer–Betke in Rhesus-negative women, to size the anti-D dose'),
      AlgoStep('Ultrasound is for placental site and fetal viability, not to '
          'exclude abruption', critical: true,
          detail: 'Ultrasound misses more than half of abruptions. A normal '
              'scan does not rule it out — this is a clinical diagnosis.'),
    ]),
    AlgoSection('4 · Differential diagnosis', [
      AlgoStep('Placenta praevia — classically painless bleeding with a soft '
          'uterus'),
      AlgoStep('Uterine rupture — especially with a scarred uterus'),
      AlgoStep('Vasa praevia — bleeding at membrane rupture with rapid fetal '
          'compromise'),
      AlgoStep('Local causes — cervical ectropion, polyp, cervicitis, carcinoma'),
      AlgoStep('Preterm labour, chorioamnionitis'),
      AlgoStep('Non-obstetric — appendicitis, renal colic, torsion of a fibroid'),
    ]),
    AlgoSection('5 · Risk factors', [
      AlgoStep('Previous abruption — recurrence 5–15%, and higher after two'),
      AlgoStep('Hypertension and pre-eclampsia'),
      AlgoStep('Abdominal trauma, including road traffic collision and '
          'domestic violence', critical: true,
          detail: 'Ask about domestic violence privately. Trauma-related '
              'abruption can present hours after the event.'),
      AlgoStep('Smoking and cocaine use'),
      AlgoStep('Preterm prelabour rupture of membranes'),
      AlgoStep('Sudden uterine decompression — polyhydramnios, delivery of a '
          'first twin'),
      AlgoStep('Thrombophilia, advanced maternal age, multiple pregnancy'),
    ]),
    AlgoSection('6 · Maternal stabilisation', [
      AlgoStep('Crystalloid resuscitation, then blood — do not over-fill with '
          'clear fluid'),
      AlgoStep('Transfuse red cells, fresh frozen plasma and platelets 1:1:1 '
          'in massive haemorrhage'),
      AlgoStep('Cryoprecipitate or fibrinogen concentrate for fibrinogen '
          'below 2 g/L', critical: true),
      AlgoStep('DIC complicates about 10% of severe abruptions, and up to 30% '
          'where the fetus has died', critical: true),
      AlgoStep('Keep her warm; correct calcium; recheck coagulation every '
          '30–60 minutes while bleeding'),
    ]),
    AlgoSection('7 · Delivery', [
      AlgoStep('Fetal distress with a viable fetus — immediate caesarean',
          critical: true),
      AlgoStep('Fetal death, mother stable — aim for vaginal delivery',
          detail: 'Amniotomy and oxytocin. This avoids laparotomy in a woman '
              'who is becoming coagulopathic.'),
      AlgoStep('Mother unstable — deliver regardless of fetal status'),
      AlgoStep('Mild abruption, preterm, stable, reassuring CTG — conservative '
          'management with steroids and close surveillance'),
      AlgoStep('Correct coagulopathy before regional anaesthesia; general '
          'anaesthesia is often the safer choice'),
      AlgoStep('A Couvelaire uterus is not by itself an indication for '
          'hysterectomy',
          detail: 'Blood extravasates into the myometrium and it looks '
              'alarming, but it usually still contracts.'),
    ]),
    AlgoSection('8 · Monitoring', [
      AlgoStep('High-dependency care; hourly urine output'),
      AlgoStep('Serial full blood count, coagulation and fibrinogen'),
      AlgoStep('Watch for acute kidney injury and pulmonary oedema'),
      AlgoStep('Anticipate postpartum haemorrhage — atony plus coagulopathy',
          critical: true),
    ]),
    AlgoSection('9 · Follow-up', [
      AlgoStep('Anti-D within 72 hours for Rhesus-negative women, dose guided '
          'by the Kleihauer'),
      AlgoStep('Thromboprophylaxis once coagulopathy is corrected'),
      AlgoStep('Bereavement support and postmortem discussion where the fetus '
          'has died'),
      AlgoStep('Placental histology'),
      AlgoStep('Counsel on recurrence; consider aspirin and closer '
          'surveillance in the next pregnancy'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 63 — Antepartum Haemorrhage.',
    'ACOG Practice Bulletin 229 — Antepartum Fetal Surveillance; abruption '
        'management principles.',
    'FOGSI GCPR — Antepartum Haemorrhage.',
    'Oyelese Y, Ananth CV. Placental abruption. Obstet Gynecol 2006;108:1005–1016.',
  ],
);

const kUterineRuptureAlgorithm = Algorithm(
  id: 'algo-uterine-rupture',
  name: 'Uterine rupture',
  subtitle: 'Recognition and emergency laparotomy',
  callFor: 'Call the consultant obstetrician, anaesthetist, neonatal team, '
      'theatre and the blood bank. This is a category 1 emergency.',
  timeTarget: 'Fetal survival falls sharply after 10–18 minutes of sustained '
      'bradycardia. Move to theatre while you are still assembling the team.',
  immediate: [
    AlgoStep('Stop oxytocin immediately', critical: true),
    AlgoStep('Call for help and transfer to theatre for laparotomy',
        critical: true),
    AlgoStep('Two large-bore cannulae, crossmatch 6 units, activate the '
        'massive haemorrhage protocol'),
    AlgoStep('High-flow oxygen, left lateral tilt, fluid resuscitation'),
    AlgoStep('Catheterise — haematuria suggests bladder involvement'),
    AlgoStep('delay laparotomy for imaging in an unstable woman', avoid: true,
        detail: 'The diagnosis is made in theatre, not on a scan.'),
  ],
  sections: [
    AlgoSection('1 · Recognition — warning signs', [
      AlgoStep('An abnormal CTG is the commonest and earliest sign',
          critical: true,
          detail: 'Prolonged fetal bradycardia, or recurrent variable and late '
              'decelerations building over time.'),
      AlgoStep('Constant abdominal pain between contractions, or scar '
          'tenderness'),
      AlgoStep('Sudden cessation of contractions'),
      AlgoStep('Loss of station — the presenting part recedes on examination'),
      AlgoStep('Fresh vaginal bleeding, or haematuria'),
      AlgoStep('Maternal tachycardia, hypotension, shoulder-tip pain'),
      AlgoStep('Easily palpable fetal parts through the abdominal wall'),
      AlgoStep('Breakthrough pain in a woman with a working epidural',
          critical: true,
          detail: 'An epidural that suddenly stops working is a warning, not a '
              'technical problem to be topped up.'),
    ]),
    AlgoSection('2 · Risk factors', [
      AlgoStep('Previous caesarean — about 0.5% in trial of labour after one '
          'low transverse scar'),
      AlgoStep('Previous classical or inverted-T incision — far higher, and a '
          'contraindication to labour'),
      AlgoStep('Previous myomectomy, particularly where the cavity was breached'),
      AlgoStep('Induction or augmentation, especially with prostaglandins',
          critical: true),
      AlgoStep('Short inter-delivery interval — under 18–24 months'),
      AlgoStep('Grand multiparity'),
      AlgoStep('Obstructed labour — the commonest cause of rupture of an '
          'unscarred uterus, and still a major cause of maternal death in low '
          'and middle-income settings'),
      AlgoStep('Trauma; congenital uterine anomaly'),
    ]),
    AlgoSection('3 · Immediate assessment', [
      AlgoStep('Airway, breathing, circulation; degree of shock'),
      AlgoStep('Fetal heart rate — continuous monitoring'),
      AlgoStep('Abdominal palpation for tenderness, contour and fetal parts'),
      AlgoStep('Vaginal examination for station and bleeding'),
      AlgoStep('spend time confirming the diagnosis before moving',
          avoid: true),
    ]),
    AlgoSection('4 · Investigations', [
      AlgoStep('Full blood count, coagulation, fibrinogen, crossmatch 6 units'),
      AlgoStep('Blood gas with lactate'),
      AlgoStep('Investigations run alongside transfer to theatre, never '
          'instead of it', critical: true),
    ]),
    AlgoSection('5 · Differential diagnosis', [
      AlgoStep('Placental abruption'),
      AlgoStep('Placenta praevia or vasa praevia'),
      AlgoStep('Amniotic fluid embolism'),
      AlgoStep('Broad ligament haematoma'),
      AlgoStep('Intra-abdominal bleeding from another source'),
    ]),
    AlgoSection('6 · Definitive treatment — laparotomy', [
      AlgoStep('Deliver the fetus immediately', critical: true),
      AlgoStep('Control haemorrhage; identify the extent of the defect'),
      AlgoStep('Inspect the bladder, ureters and broad ligament'),
      AlgoStep('REPAIR where the edges are clean, bleeding is controlled, she '
          'is stable, and future fertility matters'),
      AlgoStep('HYSTERECTOMY where there is extension into the broad ligament '
          'or cervix, uncontrolled haemorrhage, or she is unstable',
          critical: true),
      AlgoStep('persist with repair in an exsanguinating woman', avoid: true,
          detail: 'Deciding late is the error that recurs in maternal death '
              'reviews.'),
    ]),
    AlgoSection('7 · Monitoring', [
      AlgoStep('High-dependency or intensive care'),
      AlgoStep('Serial haemoglobin, coagulation and fibrinogen'),
      AlgoStep('Watch for acute kidney injury and ongoing bleeding'),
      AlgoStep('Neonatal team to assess for hypoxic-ischaemic encephalopathy; '
          'send cord gases'),
    ]),
    AlgoSection('8 · Follow-up & counselling', [
      AlgoStep('Elective caesarean before labour in any future pregnancy — no '
          'trial of labour', critical: true),
      AlgoStep('Recurrence risk roughly 5–15%, higher for a fundal or '
          'classical defect'),
      AlgoStep('Discuss completed family size and contraception'),
      AlgoStep('Full documentation and incident review; debrief the woman '
          'and the team'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 45 — Birth After Previous Caesarean Birth.',
    'ACOG Practice Bulletin 205 — Vaginal Birth After Cesarean Delivery.',
    'FOGSI GCPR — Vaginal Birth After Caesarean.',
    'WHO recommendations on obstructed labour and uterine rupture prevention.',
  ],
);
