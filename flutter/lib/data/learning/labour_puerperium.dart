import '../../models/learning_topic.dart';

const kLabourPuerperiumTopics = <LearningTopic>[
  LearningTopic(
    id: 'lrn-normal-labour',
    title: 'Mechanism and stages of normal labour',
    subtitle: 'The seven cardinal movements, and what each stage means',
    category: LearningCategory.labourPuerperium,
    competency: 'OG 12.1',
    summary: 'Labour is the passage of a passenger through a passage driven '
        'by power. The mechanism is a fixed sequence of movements the fetus '
        'makes to present its smallest diameters to the changing shape of the '
        'pelvis.',
    sections: [
      LearningSection('The three Ps', [
        'POWER — uterine contractions, and maternal effort in the second '
            'stage. Contractions originate in a pacemaker near the cornu and '
            'spread downward with fundal dominance.',
        'PASSAGE — the bony pelvis and the soft tissues. The inlet is widest '
            'transversely; the outlet is widest anteroposteriorly. That '
            'change in orientation is why the head must rotate.',
        'PASSENGER — the fetus, its size, attitude, lie, presentation and '
            'position.',
      ]),
      LearningSection('The seven cardinal movements', [
        'ENGAGEMENT — the widest diameter of the presenting part passes the '
            'pelvic brim.',
        'DESCENT — continuous throughout, driven by contractions and later by '
            'maternal effort.',
        'FLEXION — the chin meets the chest, converting the presenting '
            'diameter from occipitofrontal to the smaller suboccipitobregmatic.',
        'INTERNAL ROTATION — the occiput rotates anteriorly to lie under the '
            'symphysis, aligning with the anteroposterior outlet.',
        'EXTENSION — the head is born by extending around the symphysis as a '
            'fulcrum.',
        'RESTITUTION AND EXTERNAL ROTATION — the head untwists and aligns with '
            'the shoulders.',
        'EXPULSION — anterior shoulder under the symphysis, then posterior '
            'shoulder, then the body.',
      ]),
      LearningSection('First stage', [
        'LATENT PHASE — painful contractions with cervical change up to 5 cm. '
            'It is variable in length and is a poor basis for diagnosing '
            'delay.',
        'ACTIVE PHASE — from 5 cm to full dilatation.',
        'The older teaching of 1 cm per hour from 4 cm has been abandoned: '
            'Zhang and others showed normal labour is slower before 6 cm and '
            'that the old line generated unnecessary intervention.',
        'Assess four-hourly in established labour unless there is an '
            'indication to do so sooner.',
      ]),
      LearningSection('Second stage', [
        'From full dilatation to birth. Passive phase before the urge to '
            'push; active phase once pushing begins.',
        'Conventional limits are about 2 hours active pushing in a '
            'nulliparous woman and 1 hour in a parous woman, extended by '
            'roughly an hour where there is regional analgesia.',
        'Encourage the position she finds most effective; upright and lateral '
            'positions are associated with fewer assisted deliveries than '
            'lithotomy.',
        'Delay in the second stage should prompt reassessment of position, '
            'contractions and station rather than automatic instrumentation.',
      ]),
      LearningSection('Third stage', [
        'From birth of the baby to delivery of the placenta.',
        'Active management shortens it and reduces haemorrhage; expectant '
            'management is an option in a woman at low risk who requests it.',
        'Signs of separation: a gush of blood, lengthening of the cord, and '
            'the uterus becoming globular and rising.',
        'Prolonged beyond 30 minutes with active management, or 60 with '
            'expectant, is retained placenta.',
      ]),
      LearningSection('Common errors', [
        'Diagnosing delay during the latent phase and starting oxytocin.',
        'Using the 1 cm per hour rule, which no longer reflects the evidence.',
        'Confusing restitution with a persistent malposition.',
        'Repeated vaginal examinations without an indication — each carries an '
            'infection cost.',
      ]),
    ],
    keyPoints: [
      'The active first stage begins at 5 cm, not 4.',
      'Flexion converts the presenting diameter to the smaller '
          'suboccipitobregmatic.',
      'Internal rotation exists because the inlet is widest transversely and '
          'the outlet anteroposteriorly.',
      'The 1 cm per hour rule has been abandoned — it caused intervention, not '
          'safety.',
    ],
    related: ['proc-vaginal-exam', 'bishop', 'ctg', 'proc-oxytocin'],
    sources: [
      'WHO recommendations: intrapartum care for a positive childbirth '
          'experience, 2018; WHO Labour Care Guide, 2020.',
      'NICE NG235 — Intrapartum care.',
      'Zhang J et al. Contemporary patterns of spontaneous labor with normal '
          'neonatal outcomes. Obstet Gynecol 2010;116:1281–1287.',
      'National Medical Commission postgraduate curriculum; MoHFW Dakshata '
          'and LaQshya guidelines; FOGSI GCPR — Labour Care.',
    ],
  ),
  LearningTopic(
    id: 'lrn-labour-analgesia',
    title: 'Pain relief in labour',
    subtitle: 'Non-pharmacological, systemic, regional',
    category: LearningCategory.labourPuerperium,
    competency: 'OG 12.4',
    summary: 'Labour pain is real, variable, and hers to judge. The clinical '
        'task is to offer the options that exist in your unit honestly, and '
        'not to promise those that do not.',
    sections: [
      LearningSection('Non-pharmacological', [
        'Continuous one-to-one support reduces the need for analgesia and '
            'improves satisfaction — the most consistently effective single '
            'intervention available.',
        'Freedom of movement and upright positions.',
        'Immersion in water during the first stage.',
        'Breathing techniques, massage, and a calm environment.',
        'These are not lesser options offered when drugs are unavailable; '
            'they change the experience independently.',
      ]),
      LearningSection('Inhalational', [
        'Nitrous oxide 50% with oxygen, self-administered.',
        'Onset within about 30 seconds, so it is started as the contraction '
            'begins rather than at its peak.',
        'Causes light-headedness and nausea; does not accumulate in the '
            'fetus.',
        'Requires scavenging in the room.',
      ]),
      LearningSection('Systemic opioids', [
        'Pethidine and other intramuscular opioids remain widely used and are '
            'modestly effective — they sedate more than they analgese.',
        'Maternal nausea, vomiting and drowsiness are common.',
        'Neonatal respiratory depression and impaired early feeding, '
            'particularly if given within a few hours of birth.',
        'Naloxone must be available where opioids are used.',
      ]),
      LearningSection('Regional analgesia', [
        'Epidural is the most effective analgesia available in labour.',
        'It does not increase the caesarean rate; it is associated with a '
            'longer second stage and more assisted vaginal delivery.',
        'Contraindications: refusal, coagulopathy, local or systemic sepsis, '
            'raised intracranial pressure, uncorrected hypovolaemia.',
        'Complications: hypotension, motor block, urinary retention, dural '
            'puncture headache, and — rarely — vertebral canal haematoma or '
            'abscess.',
        'A fetal bradycardia shortly after an epidural top-up is usually '
            'maternal hypotension: position, fluids and a vasopressor.',
        'Pudendal block for instrumental delivery and perineal repair where '
            'regional analgesia is not in place.',
      ]),
      LearningSection('Practical points and errors', [
        'Ask what she wants rather than assuming, and revisit it as labour '
            'progresses.',
        'Do not promise an epidural where anaesthetic cover cannot deliver '
            'one.',
        'Breakthrough pain through a working epidural is a warning sign, not '
            'a failure of the block — consider uterine rupture.',
        'Bladder care is part of epidural care; covert retention causes '
            'lasting damage.',
      ]),
    ],
    keyPoints: [
      'Continuous one-to-one support is the most reliably effective single '
          'measure.',
      'Epidural is the most effective analgesia and does not raise the '
          'caesarean rate.',
      'Breakthrough pain through a working epidural suggests uterine rupture.',
      'Opioids near delivery cause neonatal respiratory depression and poor '
          'feeding.',
    ],
    related: [
      'algo-uterine-rupture',
      'algo-urinary-retention',
      'couns-labour-preparation',
      'formulary',
    ],
    sources: [
      'NICE NG235 — Intrapartum care.',
      'WHO recommendations: intrapartum care for a positive childbirth '
          'experience, 2018.',
      'Anim-Somuah M et al. Epidural versus non-epidural or no analgesia for '
          'pain management in labour. Cochrane Database Syst Rev 2018.',
      'National Medical Commission postgraduate curriculum; Indian Society of '
          'Anaesthesiologists guidance on labour analgesia; FOGSI GCPR — '
          'Labour Analgesia.',
    ],
  ),
  LearningTopic(
    id: 'lrn-malpresentation',
    title: 'Malpresentation and malposition',
    subtitle: 'Breech, transverse, brow, face, and the occipitoposterior head',
    category: LearningCategory.labourPuerperium,
    competency: 'OG 13.1',
    summary: 'Malpresentation is anything other than a well-flexed vertex; '
        'malposition is a vertex facing the wrong way. The distinction '
        'matters because one is usually a decision before labour and the '
        'other a decision during it.',
    sections: [
      LearningSection('Breech presentation', [
        'About 3–4% at term, higher earlier in pregnancy.',
        'Types: frank (extended legs, commonest), complete (flexed), and '
            'footling — footling carries the highest cord prolapse risk.',
        'Associations: prematurity, uterine anomaly, fibroids, placenta '
            'praevia, polyhydramnios and oligohydramnios, fetal anomaly.',
        'External cephalic version is offered from 36 weeks in nulliparous '
            'and 37 in parous women, with a success rate around half and a '
            'low complication rate.',
        'Contraindications to ECV include recent antepartum haemorrhage, '
            'abnormal CTG, ruptured membranes, multiple pregnancy and major '
            'uterine anomaly.',
        'The Term Breech Trial made planned caesarean the usual '
            'recommendation, though its methodology has been criticised and '
            'vaginal breech birth remains reasonable in selected women with '
            'an experienced attendant.',
      ]),
      LearningSection('Transverse and oblique lie', [
        'Unstable or transverse lie at term risks cord prolapse and '
            'obstructed labour, and cannot deliver vaginally.',
        'Causes: high parity with lax abdominal wall, polyhydramnios, '
            'placenta praevia, uterine anomaly, pelvic mass, prematurity.',
        'Admission from around 37–38 weeks is usual because membrane rupture '
            'with a transverse lie is an emergency.',
        'Neglected transverse lie presents as obstructed labour with a '
            'prolapsed arm — a cause of uterine rupture and maternal death '
            'where access to caesarean is delayed.',
      ]),
      LearningSection('Face and brow', [
        'FACE presentation: complete extension. Mentoanterior can deliver '
            'vaginally; mentoposterior cannot, because the neck cannot extend '
            'further.',
        'BROW presentation: partial extension presenting the '
            'mentovertical diameter, the largest of all. It cannot deliver '
            'vaginally at term unless it converts.',
        'Both are usually diagnosed in labour on vaginal examination.',
        'Avoid instrumental delivery on a brow.',
      ]),
      LearningSection('Occipitoposterior position', [
        'The commonest malposition, around 15–20% in early labour, most of '
            'which rotate spontaneously.',
        'Associated with a longer labour, more backache, early urge to push, '
            'and a higher rate of assisted delivery and perineal trauma.',
        'Persistent OP with delay: reassess contractions, consider '
            'augmentation where appropriate, and get senior assessment before '
            'instrumentation.',
        'Deep transverse arrest is arrest at the level of the ischial spines '
            'with the head in the transverse position — rotational delivery '
            'or caesarean, by someone experienced.',
      ]),
      LearningSection('Common errors', [
        'Missing a transverse lie because the fundal height seems small.',
        'Attempting vaginal delivery of a mentoposterior face or a brow.',
        'Instrumentation without confirming position — the single most '
            'important prerequisite.',
        'Treating an OP labour as obstructed before optimising contractions.',
      ]),
    ],
    keyPoints: [
      'Footling breech carries the highest risk of cord prolapse.',
      'ECV is offered from 36 weeks nulliparous, 37 parous.',
      'Mentoanterior face can deliver vaginally; mentoposterior and brow '
          'cannot.',
      'Confirm position before any instrumental delivery.',
    ],
    related: [
      'term-breech',
      'proc-avd',
      'algo-cord-prolapse',
      'algo-uterine-rupture',
      'caesarean',
    ],
    sources: [
      'RCOG Green-top Guideline 20a — External Cephalic Version and Reducing '
          'the Incidence of Term Breech Presentation; 20b — Management of '
          'Breech Presentation.',
      'Hannah ME et al. Term Breech Trial. Lancet 2000;356:1375–1383.',
      'NICE NG235 — Intrapartum care.',
      'National Medical Commission postgraduate curriculum; FOGSI GCPR — '
          'Malpresentation; MoHFW Dakshata guidelines.',
    ],
  ),
  LearningTopic(
    id: 'lrn-prolonged-labour',
    title: 'Prolonged labour and obstructed labour',
    subtitle: 'Failure to progress, and the point at which it becomes '
        'obstruction',
    category: LearningCategory.labourPuerperium,
    competency: 'OG 13.2',
    summary: 'Slow progress is common and usually benign; obstruction is '
        'uncommon and lethal. Distinguishing them is the whole clinical task, '
        'and the answer lies in the signs of obstruction rather than in the '
        'partograph line.',
    sections: [
      LearningSection('Defining delay', [
        'FIRST STAGE — less than 2 cm in 4 hours in the active phase, or '
            'slowing in a parous woman.',
        'SECOND STAGE — no birth after about 2 hours of active pushing in a '
            'nulliparous woman or 1 hour in a parous woman, extended by about '
            'an hour with regional analgesia.',
        'Delay is a prompt to reassess, not a diagnosis in itself.',
        'The WHO Labour Care Guide replaced the older partograph action line '
            'with reference thresholds that reflect how labour actually '
            'progresses.',
      ]),
      LearningSection('Assess the three Ps again', [
        'POWER — frequency, duration and strength of contractions. Inadequate '
            'contractions are the commonest correctable cause.',
        'PASSENGER — position, attitude, station, caput and moulding, and '
            'estimated size.',
        'PASSAGE — clinical pelvic assessment, and a full bladder or loaded '
            'rectum as reversible contributors.',
        'Also consider maternal exhaustion, dehydration, ketosis, fear and '
            'unrelieved pain.',
      ]),
      LearningSection('Signs that this is obstruction', [
        'Increasing caput and moulding — moulding of grade 3 with poor '
            'progress is obstruction until proven otherwise.',
        'A Bandl ring: a visible, palpable ridge between the thickened upper '
            'segment and the thinned lower segment. This is a pre-rupture '
            'sign.',
        'A tense, tender, continuously contracting uterus.',
        'Maternal tachycardia, dehydration, ketosis and pyrexia.',
        'Blood-stained urine and a poorly draining, oedematous bladder base.',
        'Fetal tachycardia, then decelerations, then death.',
        'Vulval oedema and a foul-smelling discharge in neglected labour.',
      ]),
      LearningSection('Management', [
        'Correct the correctable: empty the bladder, treat dehydration and '
            'ketosis, provide analgesia, and encourage position change.',
        'Amniotomy where membranes are intact and the head is well applied.',
        'Oxytocin augmentation only once obstruction has been excluded, and '
            'never in a woman with a scarred uterus without a consultant '
            'decision.',
        'Continuous fetal monitoring once augmentation begins.',
        'Reassess after 4 hours of adequate contractions.',
        'Where obstruction is present, deliver — caesarean, or an assisted '
            'vaginal delivery only if the conditions are genuinely met.',
      ]),
      LearningSection('Consequences of neglect', [
        'Uterine rupture, which in a primigravida usually means obstruction '
            'rather than a scar.',
        'Obstetric fistula from pressure necrosis of the bladder base — '
            'still a significant problem in parts of India, and almost '
            'entirely a consequence of delayed access to caesarean.',
        'Puerperal sepsis and postpartum haemorrhage from an exhausted '
            'uterus.',
        'Fetal hypoxic injury and stillbirth.',
        'Foot drop from lumbosacral trunk compression.',
      ]),
    ],
    keyPoints: [
      'Slow progress is a prompt to reassess; obstruction is a diagnosis with '
          'its own signs.',
      'Grade 3 moulding with poor progress is obstruction until disproven.',
      'A Bandl ring is a pre-rupture sign — do not augment.',
      'Never augment a scarred uterus without a documented consultant '
          'decision.',
      'Obstetric fistula is a consequence of delay, not of bad luck.',
    ],
    related: [
      'algo-uterine-rupture',
      'proc-oxytocin',
      'proc-avd',
      'caesarean',
      'urogynaecology',
    ],
    sources: [
      'WHO Labour Care Guide, 2020; WHO recommendations on intrapartum care, '
          '2018.',
      'NICE NG235 — Intrapartum care.',
      'RCOG Green-top Guideline 26 — Assisted Vaginal Birth.',
      'National Medical Commission postgraduate curriculum; MoHFW Dakshata '
          'and LaQshya guidelines; MoHFW guidance on obstetric fistula; '
          'FOGSI GCPR — Labour Care.',
    ],
  ),
  LearningTopic(
    id: 'lrn-puerperium',
    title: 'The normal puerperium',
    subtitle: 'Involution, lochia, and the six weeks that get least attention',
    category: LearningCategory.labourPuerperium,
    competency: 'OG 15.1',
    summary: 'The puerperium is the six weeks in which maternal physiology '
        'reverses. It receives the least surveillance of any period in '
        'maternity care and carries a substantial share of maternal deaths.',
    sections: [
      LearningSection('Uterine involution', [
        'Immediately after delivery the fundus is at about the level of the '
            'umbilicus.',
        'It descends roughly a centimetre a day and is no longer palpable '
            'abdominally by about two weeks.',
        'Returns to near pre-pregnancy size by six weeks.',
        'A uterus that is high, boggy and tender is subinvolution — think '
            'retained products or endometritis.',
      ]),
      LearningSection('Lochia', [
        'LOCHIA RUBRA — red, for roughly the first 3–4 days.',
        'LOCHIA SEROSA — pink-brown, to about day 10.',
        'LOCHIA ALBA — white-yellow, for up to about six weeks.',
        'Offensive lochia suggests infection. A return to red bleeding, or '
            'heavy bleeding, suggests retained products.',
      ]),
      LearningSection('Other physiological changes', [
        'A diuresis in the first few days as the plasma volume expansion is '
            'offloaded.',
        'Cardiac output rises immediately after delivery through autotransfusion '
            'from the contracting uterus, then falls over the following weeks '
            '— this is when cardiac disease decompensates.',
        'Coagulation remains prothrombotic for several weeks, which is why '
            'thromboprophylaxis extends beyond discharge.',
        'Ovulation may return from around 4 weeks in a woman who is not '
            'breastfeeding, and can precede the first period.',
      ]),
      LearningSection('Routine postnatal care', [
        'Observations, uterine tone and lochia in the immediate period.',
        'Perineal care and analgesia.',
        'Bladder care: document the time and volume of the first void.',
        'Anti-D where indicated; rubella vaccination if non-immune.',
        'Haemoglobin where there was bleeding, with iron continued for weeks '
            'rather than days.',
        'Breastfeeding support in the first hour and thereafter.',
        'Contraception discussed before discharge.',
        'Postnatal contacts on days 1, 3, 7 and 42 under the Indian '
            'programme, which exists precisely because deaths cluster in this '
            'window.',
      ]),
      LearningSection('What to warn her about', [
        'Heavy bleeding or large clots.',
        'Offensive discharge or fever.',
        'Severe headache or visual disturbance — pre-eclampsia occurs and '
            'worsens after delivery.',
        'Calf pain or swelling, chest pain or breathlessness.',
        'Persistent low mood, or any thought of harming herself or the baby.',
        'Painful, red, wedge-shaped breast with fever.',
      ]),
    ],
    keyPoints: [
      'The fundus descends about a centimetre a day and is impalpable by two '
          'weeks.',
      'A high, boggy, tender uterus means retained products or endometritis.',
      'Cardiac output peaks immediately after delivery — cardiac disease '
          'decompensates here.',
      'Ovulation can precede the first period, so contraception is discussed '
          'before discharge.',
      'Pre-eclampsia can present for the first time after delivery.',
    ],
    related: [
      'couns-postpartum-contraception',
      'algo-sepsis',
      'algo-severe-htn',
      'vte-risk',
      'anaemia',
    ],
    sources: [
      'WHO recommendations on postnatal care of the mother and newborn, 2022.',
      'NICE NG194 — Postnatal care.',
      'RCOG Green-top Guideline 37a — Reducing the Risk of Thrombosis and '
          'Embolism during Pregnancy and the Puerperium.',
      'MoHFW Home Based Postnatal Care and Janani Shishu Suraksha Karyakram '
          'guidelines; National Medical Commission curriculum; FOGSI GCPR — '
          'Postnatal Care.',
    ],
  ),
  LearningTopic(
    id: 'lrn-postnatal-mental-health',
    title: 'Perinatal mental health',
    subtitle: 'Blues, depression, anxiety and puerperal psychosis',
    category: LearningCategory.labourPuerperium,
    competency: 'OG 15.4',
    summary: 'Psychiatric illness is a leading cause of maternal death in the '
        'year after birth, and most of it is missed because nobody asked. '
        'Distinguishing the blues from depression, and both from psychosis, '
        'is a core obstetric skill.',
    sections: [
      LearningSection('Postpartum blues', [
        'Affects more than half of women.',
        'Onset around days 3–5, resolving by about day 10.',
        'Tearfulness, irritability, labile mood, poor sleep.',
        'Needs explanation, support and follow-up — not medication.',
        'Symptoms persisting beyond two weeks are not the blues.',
      ]),
      LearningSection('Perinatal depression', [
        'Affects roughly one in eight women; Indian community studies have '
            'reported higher figures in some settings.',
        'Onset may be in pregnancy — the term perinatal is deliberate.',
        'Low mood, anhedonia, guilt, poor sleep disproportionate to the '
            'baby\'s, poor concentration, and thoughts of self-harm.',
        'Screen with the EPDS, remembering that item 10 on self-harm is '
            'assessed separately from the total, whatever the total is.',
        'Risk factors: previous psychiatric illness, lack of support, '
            'domestic violence, poverty, obstetric complications, and — in '
            'some settings — the sex of the baby.',
        'Management: psychological therapy first line in mild to moderate '
            'illness; SSRIs where indicated, with sertraline commonly '
            'preferred in breastfeeding.',
      ]),
      LearningSection('Perinatal anxiety and OCD', [
        'Frequently coexists with depression and is under-recognised.',
        'Intrusive thoughts about harm coming to the baby are common in '
            'obsessive-compulsive presentations and are ego-dystonic — she '
            'finds them abhorrent.',
        'Distinguish these from the ego-syntonic thoughts of psychosis, where '
            'the belief is held as true. The distinction changes urgency '
            'completely.',
      ]),
      LearningSection('Puerperal psychosis', [
        'A psychiatric emergency, affecting about 1–2 per 1000 births.',
        'Onset is usually rapid, within the first two weeks.',
        'Confusion, mania, delusions often concerning the baby, '
            'hallucinations, and a fluctuating presentation.',
        'Highest risk in women with bipolar disorder or a previous episode of '
            'puerperal psychosis — ask at booking, and plan.',
        'Requires urgent psychiatric assessment and usually admission, ideally '
            'with the baby where a mother and baby unit exists.',
        'Risk of suicide and, rarely, of infanticide.',
      ]),
      LearningSection('Practical points', [
        'Ask directly about mood at booking and at postnatal contacts.',
        'Ask directly about thoughts of self-harm. Asking does not plant the '
            'idea.',
        'Any thought of harming herself or the baby is an emergency referral.',
        'Explain that most psychotropic drugs are compatible with '
            'breastfeeding — stopping medication abruptly is a common and '
            'dangerous response to pregnancy.',
        'Involve the family, but see her alone at least once.',
      ]),
    ],
    keyPoints: [
      'Blues resolve by about day 10; anything persisting beyond two weeks is '
          'not the blues.',
      'EPDS item 10 is assessed on its own, whatever the total score.',
      'Intrusive thoughts she finds abhorrent are obsessional; beliefs she '
          'holds as true are psychotic.',
      'Puerperal psychosis is an emergency, usually within two weeks.',
      'Psychiatric illness is a leading cause of maternal death in the year '
          'after birth.',
    ],
    related: ['epds', 'score-epds', 'couns-breastfeeding', 'formulary'],
    sources: [
      'NICE CG192 — Antenatal and postnatal mental health.',
      'MBRRACE-UK — Saving Lives, Improving Mothers\' Care, maternal mental '
          'health chapters.',
      'Cox JL, Holden JM, Sagovsky R. Edinburgh Postnatal Depression Scale. '
          'Br J Psychiatry 1987;150:782–786.',
      'MoHFW National Mental Health Programme; Indian Psychiatric Society '
          'clinical practice guidelines on perinatal mental health; FOGSI '
          'position statement on maternal mental health.',
    ],
  ),
  LearningTopic(
    id: 'lrn-lactation',
    title: 'Lactation and its problems',
    subtitle: 'Physiology, positioning, and the conditions that stop it',
    category: LearningCategory.labourPuerperium,
    competency: 'OG 15.3',
    summary: 'Most breastfeeding failure is a positioning and attachment '
        'problem presenting as a milk-supply problem. Recognising the small '
        'number of genuine pathologies matters as much as not inventing them.',
    sections: [
      LearningSection('Physiology', [
        'Oestrogen and progesterone prepare the breast in pregnancy but '
            'inhibit lactogenesis.',
        'Delivery of the placenta withdraws that inhibition — this is the '
            'trigger for lactogenesis II, at around 30–72 hours.',
        'PROLACTIN drives milk production; suckling maintains it.',
        'OXYTOCIN drives ejection — the let-down reflex — and is inhibited by '
            'pain, anxiety and embarrassment.',
        'Supply is demand-led. Frequent effective removal of milk is the only '
            'reliable galactagogue.',
      ]),
      LearningSection('Establishing feeding', [
        'Skin-to-skin contact within the first hour, uninterrupted.',
        'Colostrum is small in volume and sufficient — the newborn stomach '
            'holds very little on day one.',
        'Feed on demand, without restricting duration.',
        'Check positioning and attachment at every contact: chin to breast, '
            'wide gape, more areola visible above than below, and no pain '
            'after the first few seconds.',
        'Avoid supplementary feeds and teats unless medically indicated — '
            'they undermine establishment.',
        'Baby-friendly hospital practices exist because they measurably '
            'improve continuation.',
      ]),
      LearningSection('Common problems', [
        'SORE OR CRACKED NIPPLES — almost always attachment. Correct the '
            'latch; do not stop feeding.',
        'ENGORGEMENT — around days 3–5. Continue feeding, express for comfort, '
            'cold compresses between feeds.',
        'BLOCKED DUCT — a tender lump without systemic symptoms. Continue '
            'feeding, vary position, and massage toward the nipple.',
        'MASTITIS — a wedge-shaped, red, painful area with fever and flu-like '
            'symptoms. CONTINUE FEEDING; add antistaphylococcal antibiotics '
            'if not improving within 12–24 hours.',
        'BREAST ABSCESS — a fluctuant mass. Needs drainage, preferably by '
            'needle aspiration under ultrasound; feeding usually continues.',
        'INSUFFICIENT SUPPLY — usually perceived rather than real. Assess '
            'weight, output and attachment before accepting the diagnosis.',
        'TONGUE-TIE — consider where attachment fails despite good '
            'technique.',
      ]),
      LearningSection('When feeding is genuinely contraindicated', [
        'Maternal HIV where replacement feeding is acceptable, feasible, '
            'affordable, sustainable and safe — in India the national '
            'programme supports exclusive breastfeeding with maternal '
            'antiretroviral therapy, so follow the national guidance rather '
            'than assuming.',
        'Galactosaemia in the infant.',
        'Active untreated tuberculosis — separate until treated, but express '
            'and give the milk.',
        'A small number of maternal drugs; check rather than assume, as most '
            'are compatible.',
      ]),
      LearningSection('Sheehan syndrome', [
        'Pituitary infarction following major postpartum haemorrhage.',
        'Failure of lactation is often the first sign.',
        'Followed by amenorrhoea, fatigue, hypothyroidism and adrenal '
            'insufficiency.',
        'Consider it in any woman who bled heavily and cannot lactate.',
      ]),
    ],
    keyPoints: [
      'Lactogenesis II is triggered by delivery of the placenta, at 30–72 '
          'hours.',
      'Supply is demand-led; effective milk removal is the only reliable '
          'galactagogue.',
      'Continue feeding through mastitis — stopping makes it worse.',
      'Failure of lactation after major haemorrhage suggests Sheehan '
          'syndrome.',
    ],
    related: ['couns-breastfeeding', 'couns-pph', 'algo-pph', 'formulary'],
    sources: [
      'WHO/UNICEF Baby-friendly Hospital Initiative, 2018 revision; WHO '
          'guideline on protecting, promoting and supporting breastfeeding.',
      'NICE NG194 — Postnatal care.',
      'Academy of Breastfeeding Medicine clinical protocols on mastitis and '
          'supplementation.',
      'MoHFW MAA (Mothers\' Absolute Affection) programme and Infant and '
          'Young Child Feeding guidelines; NACO guidelines on HIV and infant '
          'feeding; Indian Academy of Pediatrics infant feeding guidelines.',
    ],
  ),
];
