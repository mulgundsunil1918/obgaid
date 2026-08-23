import '../../models/algorithm.dart';

const kShoulderDystociaAlgorithm = Algorithm(
  id: 'algo-shoulder-dystocia',
  name: 'Shoulder dystocia',
  subtitle: 'HELPERR · the manoeuvres in order',
  callFor: 'Call the obstetric registrar, an experienced midwife, the '
      'anaesthetist and the neonatal team. Assign someone to record the time '
      'and every manoeuvre as it happens.',
  timeTarget: 'Head-to-body delivery within 5 minutes. Move through the '
      'manoeuvres in 30-second steps rather than repeating one that has failed.',
  immediate: [
    AlgoStep('Call for help and start the clock', critical: true),
    AlgoStep('Tell her to STOP PUSHING', critical: true),
    AlgoStep('Lie her flat and bring her buttocks to the edge of the bed'),
    AlgoStep('McROBERTS — hyperflex both hips onto the abdomen',
        detail: 'Resolves 40–50% on its own. One assistant per leg.'),
    AlgoStep('SUPRAPUBIC PRESSURE from behind the anterior shoulder',
        detail: 'CPR-style hand, 30 seconds of continuous then 30 seconds of '
            'rocking pressure.'),
    AlgoStep('apply FUNDAL pressure', avoid: true,
        detail: 'It worsens the impaction and risks uterine rupture.'),
    AlgoStep('apply strong lateral or downward traction on the head',
        avoid: true,
        detail: 'This is what causes brachial plexus injury.'),
    AlgoStep('pivot or twist the head', avoid: true),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('The head delivers but the shoulders do not follow with routine '
          'axial traction'),
      AlgoStep('The "turtle sign" — the head retracts against the perineum'),
      AlgoStep('Difficulty delivering the face and chin'),
      AlgoStep('Failure of restitution'),
      AlgoStep('It is a bony impaction, not soft-tissue resistance',
          critical: true),
    ]),
    AlgoSection('2 · HELPERR in order', [
      AlgoStep('H — call for HELP, and note the time'),
      AlgoStep('E — EVALUATE for episiotomy',
          detail: 'An episiotomy does not relieve a bony impaction. Cut only '
              'if you need room for internal manoeuvres.'),
      AlgoStep('L — LEGS: McRoberts. Hyperflex and abduct the hips',
          critical: true),
      AlgoStep('P — suprapubic PRESSURE, from the fetal back towards the '
          'chest, to adduct and rotate the anterior shoulder'),
      AlgoStep('E — ENTER: internal rotational manoeuvres',
          detail: 'Rubin II — press behind the anterior shoulder to adduct it. '
              'Woods screw — press in front of the posterior shoulder to '
              'rotate. Reverse Woods if that fails.'),
      AlgoStep('R — REMOVE the posterior arm', critical: true,
          detail: 'The highest success rate of any single manoeuvre. Follow '
              'the arm to the elbow, flex it, and sweep it across the chest.'),
      AlgoStep('R — ROLL onto all fours (Gaskin manoeuvre)',
          detail: 'Increases the true pelvic diameter, and the posterior '
              'shoulder — now uppermost — is often easy to deliver.'),
    ]),
    AlgoSection('3 · Last-resort manoeuvres', [
      AlgoStep('Repeat the sequence from the beginning with a more senior '
          'operator before moving to these'),
      AlgoStep('Cleidotomy — deliberate division of the clavicle'),
      AlgoStep('Zavanelli manoeuvre — replace the head and deliver by '
          'caesarean'),
      AlgoStep('Symphysiotomy — division of the symphyseal ligament',
          detail: 'Retains a role where caesarean is genuinely unavailable; '
              'high maternal morbidity.'),
      AlgoStep('Abdominal rescue with hysterotomy and internal rotation'),
    ]),
    AlgoSection('4 · Risk factors', [
      AlgoStep('Previous shoulder dystocia — recurrence roughly 10%',
          critical: true),
      AlgoStep('Macrosomia — but most dystocias occur in normally grown babies, '
          'so prediction is poor', critical: true),
      AlgoStep('Maternal diabetes, including gestational'),
      AlgoStep('Maternal obesity and excessive weight gain'),
      AlgoStep('Prolonged second stage; oxytocin augmentation'),
      AlgoStep('Instrumental delivery, particularly mid-cavity'),
      AlgoStep('Two-thirds of cases have no risk factor at all — every '
          'delivery room must be ready for it', critical: true),
    ]),
    AlgoSection('5 · Neonatal assessment', [
      AlgoStep('Paediatric or neonatal attendance at delivery'),
      AlgoStep('Send paired cord gases'),
      AlgoStep('Examine for brachial plexus injury — Erb palsy (C5–C6), '
          'Klumpke palsy (C8–T1)'),
      AlgoStep('Examine for clavicular and humeral fracture'),
      AlgoStep('Assess for hypoxic-ischaemic encephalopathy where the interval '
          'was prolonged'),
      AlgoStep('Most brachial plexus injuries resolve; refer early to '
          'physiotherapy and to a specialist service if not improving by '
          '4 weeks'),
    ]),
    AlgoSection('6 · Maternal assessment', [
      AlgoStep('Postpartum haemorrhage — the risk is high, so anticipate it '
          'rather than react to it', critical: true),
      AlgoStep('Inspect for third and fourth degree tears; repair in theatre '
          'with adequate anaesthesia'),
      AlgoStep('Examine for vaginal and cervical lacerations'),
      AlgoStep('Consider symphyseal separation and lateral femoral cutaneous '
          'neuropathy after prolonged McRoberts'),
      AlgoStep('Urinary retention — monitor voiding'),
    ]),
    AlgoSection('7 · Documentation', [
      AlgoStep('This is the most litigated event in obstetrics. Contemporaneous '
          'records matter as much as the manoeuvres.', critical: true),
      AlgoStep('Time of delivery of the head, and time of delivery of the body'),
      AlgoStep('Which shoulder was anterior'),
      AlgoStep('Every manoeuvre, in the order performed, with who performed it '
          'and for how long'),
      AlgoStep('Who was present and when each person arrived'),
      AlgoStep('Whether an episiotomy was performed'),
      AlgoStep('Condition of the baby, Apgar scores, cord gases'),
      AlgoStep('Explanation given to the parents, and by whom'),
    ]),
    AlgoSection('8 · Follow-up', [
      AlgoStep('Debrief the woman and her partner — this is frightening to '
          'witness'),
      AlgoStep('Team debrief and incident review'),
      AlgoStep('Counsel about the next pregnancy: recurrence risk, and that '
          'elective caesarean is a reasonable choice after a severe episode '
          'with neonatal injury'),
      AlgoStep('Screen for diabetes if not already done'),
      AlgoStep('Regular skills drills — units that practise have better '
          'outcomes than units that do not'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 42 — Shoulder Dystocia.',
    'ACOG Practice Bulletin 178 — Shoulder Dystocia.',
    'PROMPT (PRactical Obstetric Multi-Professional Training) course materials.',
    'Draycott TJ et al. Improving neonatal outcome through practical shoulder '
        'dystocia training. Obstet Gynecol 2008;112:14–20.',
    'FOGSI GCPR — Intrapartum Care; MoHFW Dakshata intrapartum skills '
        'programme.',
  ],
);

const kCordProlapseAlgorithm = Algorithm(
  id: 'algo-cord-prolapse',
  name: 'Cord prolapse',
  subtitle: 'Relieve compression · deliver',
  callFor: 'Pull the emergency buzzer. Obstetric registrar, anaesthetist, '
      'theatre team, neonatal team, porters. Declare a category 1 caesarean.',
  timeTarget: 'Decision to delivery within 30 minutes for a category 1 '
      'caesarean, and faster where the fetal heart is abnormal.',
  immediate: [
    AlgoStep('Call for help and note the time', critical: true),
    AlgoStep('ELEVATE the presenting part with a vaginal hand and keep it '
        'there until delivery', critical: true,
        detail: 'The hand that finds the cord does not come out. Someone else '
            'moves the bed.'),
    AlgoStep('Position: knee-chest, or exaggerated Sims — left lateral, head '
        'down, pillow under the hip'),
    AlgoStep('Stop any oxytocin infusion'),
    AlgoStep('Fill the bladder with 500–750 mL of warm saline and clamp the '
        'catheter',
        detail: 'Especially useful where transfer to theatre will take time. '
            'Empty it before the uterine incision.'),
    AlgoStep('Tocolysis if delivery will be delayed — terbutaline 250 µg '
        'subcutaneously'),
    AlgoStep('Prepare for immediate delivery, usually category 1 caesarean'),
    AlgoStep('handle the cord more than you must', avoid: true,
        detail: 'Handling and cold both cause vasospasm. Do not attempt to '
            'replace it.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('The cord is palpable or visible below the presenting part with '
          'ruptured membranes'),
      AlgoStep('Overt prolapse — the cord is past the presenting part. Occult — '
          'alongside it, and not palpable', critical: true),
      AlgoStep('Suspect it in any sudden fetal bradycardia or new variable '
          'decelerations, particularly within minutes of membrane rupture',
          critical: true),
      AlgoStep('Perform a vaginal examination after every spontaneous or '
          'artificial rupture where the presenting part is high, or where the '
          'fetal heart changes'),
    ]),
    AlgoSection('2 · Risk factors', [
      AlgoStep('High or unengaged presenting part'),
      AlgoStep('Malpresentation — breech, especially footling, and transverse '
          'lie'),
      AlgoStep('Polyhydramnios'),
      AlgoStep('Prematurity and low birth weight'),
      AlgoStep('Multiple pregnancy, particularly the second twin'),
      AlgoStep('Multiparity'),
      AlgoStep('Artificial rupture of membranes with a high presenting part — '
          'the commonest iatrogenic cause', critical: true,
          detail: 'Avoid amniotomy when the head is high. If it must be done, '
              'do it in a place where an immediate caesarean is possible.'),
      AlgoStep('Placenta praevia and low-lying placenta'),
      AlgoStep('Long umbilical cord'),
    ]),
    AlgoSection('3 · Immediate assessment', [
      AlgoStep('Confirm fetal viability and gestation before anything '
          'irreversible', critical: true),
      AlgoStep('Assess cervical dilatation and station'),
      AlgoStep('Continuous fetal heart rate monitoring'),
      AlgoStep('Feel the cord for pulsation, but handle it minimally'),
      AlgoStep('Maternal observations and IV access'),
    ]),
    AlgoSection('4 · Relieving compression', [
      AlgoStep('Manual elevation of the presenting part — the single most '
          'effective measure', critical: true),
      AlgoStep('Knee-chest position, or exaggerated Sims with head-down tilt'),
      AlgoStep('Bladder filling with 500–750 mL warm saline where transfer is '
          'prolonged or in a community setting'),
      AlgoStep('Tocolysis to abolish contractions if delivery is delayed'),
      AlgoStep('Keep the cord warm and inside the vagina where it has '
          'prolapsed externally; handle it as little as possible'),
      AlgoStep('attempt to replace the cord into the uterus', avoid: true),
    ]),
    AlgoSection('5 · Delivery', [
      AlgoStep('Category 1 caesarean is the usual route', critical: true),
      AlgoStep('Vaginal delivery is appropriate only where the cervix is fully '
          'dilated, the presenting part is low, and delivery will clearly be '
          'quicker and safe'),
      AlgoStep('Instrumental delivery at full dilatation by an experienced '
          'operator where conditions are met'),
      AlgoStep('Breech extraction for a second twin at full dilatation'),
      AlgoStep('Regional anaesthesia is acceptable if already sited and '
          'working; otherwise general anaesthesia is faster'),
      AlgoStep('Empty the bladder before the uterine incision if it was filled',
          critical: true),
    ]),
    AlgoSection('6 · Community and transfer setting', [
      AlgoStep('Call an emergency ambulance and pre-alert the receiving unit'),
      AlgoStep('Maintain manual elevation throughout transfer'),
      AlgoStep('Fill the bladder — it maintains elevation when a hand cannot'),
      AlgoStep('Transport in the knee-chest or exaggerated Sims position'),
      AlgoStep('Give tocolysis if contractions continue'),
    ]),
    AlgoSection('7 · Neonatal care', [
      AlgoStep('Neonatal team present at delivery'),
      AlgoStep('Paired cord gases'),
      AlgoStep('Assess for hypoxic-ischaemic encephalopathy; consider '
          'therapeutic cooling where criteria are met'),
      AlgoStep('Outcome is usually good where the interval is short — most '
          'morbidity comes from delay, not from the prolapse itself'),
    ]),
    AlgoSection('8 · Documentation & follow-up', [
      AlgoStep('Time of diagnosis, time of delivery, and the interval'),
      AlgoStep('Every manoeuvre and who performed it; time each person arrived'),
      AlgoStep('Fetal heart rate throughout'),
      AlgoStep('Debrief the woman — she will have experienced a sudden, '
          'frightening emergency and often an uncomfortable position and '
          'general anaesthetic'),
      AlgoStep('Team debrief and incident review; regular drills'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 50 — Umbilical Cord Prolapse.',
    'PROMPT course materials — cord prolapse drill.',
    'FOGSI GCPR — Intrapartum Care; MoHFW Dakshata and LaQshya labour room '
        'standards.',
  ],
);
