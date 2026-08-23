import '../../models/topic.dart';

const kAvdTopic = ClinicalTopic(
  id: 'proc-avd',
  name: 'Assisted vaginal delivery',
  subtitle: 'Forceps and vacuum · prerequisites and limits',
  headline: 'Set the limits before you start: three pulls, three '
      'contractions, and a decision. Sequential use of two instruments '
      'multiplies neonatal morbidity, and the commonest failure is not '
      'technical — it is continuing past the point where you should have '
      'stopped.',
  keyFacts: [
    ('Prerequisites', 'Remember FORCEPS — every letter, every time'),
    ('Maximum pulls', '3 with descent; abandon if no descent with the first'),
    ('Vacuum — time limit', '15 – 20 minutes, or 3 cup detachments'),
    ('Sequential instruments', 'Avoid — multiplies neonatal morbidity'),
    ('Station required', 'At or below the ischial spines, fully engaged'),
    ('Trial in theatre if', 'Mid-cavity, rotational, or any doubt'),
  ],
  sections: [
    TopicSection('Indications', [
      TopicPoint('Delay in the second stage — inadequate progress despite '
          'adequate contractions and maternal effort'),
      TopicPoint('Presumed fetal compromise in the second stage'),
      TopicPoint('Maternal condition requiring a shortened second stage — '
          'cardiac disease, severe hypertension, myasthenia, previous '
          'cerebrovascular event'),
      TopicPoint('Maternal exhaustion'),
    ]),
    TopicSection('Prerequisites — FORCEPS', [
      TopicPoint('F — Fully dilated cervix, and membranes ruptured',
          critical: true),
      TopicPoint('O — Obstruction excluded; the head must be engaged with no '
          'more than one-fifth palpable abdominally'),
      TopicPoint('R — Ruptured membranes'),
      TopicPoint('C — Cephalic presentation, and the position determined with '
          'certainty', critical: true,
          detail: 'Getting the position wrong is the commonest cause of '
              'failure. Use ultrasound if there is any doubt.'),
      TopicPoint('E — Explain the procedure and obtain consent; Empty bladder'),
      TopicPoint('P — Pain relief adequate — regional for mid-cavity, at '
          'least a pudendal block for outlet'),
      TopicPoint('S — Sphincter (anal) considered, and Support present: an '
          'assistant, a neonatal team and, for anything above outlet, theatre '
          'available'),
      TopicPoint('attempt without knowing the exact position and station',
          avoid: true),
    ]),
    TopicSection('Choosing the instrument', [
      TopicPoint('VACUUM — lower maternal genital tract trauma, less need for '
          'anaesthesia, but more cephalohaematoma, retinal haemorrhage and '
          'failure.'),
      TopicPoint('FORCEPS — higher success rate, but more third and fourth '
          'degree tears and more maternal trauma.'),
      TopicPoint('Vacuum is contraindicated below about 34 weeks, in face '
          'presentation, and where a fetal bleeding disorder or a recent '
          'fetal blood sample is suspected.', critical: true),
      TopicPoint('Rotational delivery: Kielland forceps or rotational vacuum, '
          'by an experienced operator only, and in theatre.'),
    ]),
    TopicSection('Technique — vacuum', [
      TopicPoint('Place the cup over the flexion point — 3 cm anterior to the '
          'posterior fontanelle, in the sagittal suture', critical: true,
          detail: 'A cup placed too anteriorly deflexes the head and the '
              'delivery fails.'),
      TopicPoint('Sweep a finger around the cup to exclude maternal tissue '
          'before applying suction'),
      TopicPoint('Traction along the pelvic axis, with contractions and '
          'maternal effort only'),
      TopicPoint('Abandon after 3 cup detachments, 15–20 minutes, or no '
          'descent with the first two pulls', critical: true),
    ]),
    TopicSection('Technique — forceps', [
      TopicPoint('Assemble the blades outside the perineum first to confirm '
          'they articulate and the intended application is correct'),
      TopicPoint('Insert the left blade first, then the right; they should '
          'articulate without force', critical: true,
          detail: 'If they will not articulate easily, the application is '
              'wrong. Remove and reassess rather than forcing.'),
      TopicPoint('Check the application: sagittal suture perpendicular to the '
          'shanks, posterior fontanelle one fingerbreadth above the shanks, '
          'no more than a fingertip of fenestration palpable'),
      TopicPoint('Traction with contractions, along the pelvic curve'),
      TopicPoint('Consider episiotomy at crowning'),
    ]),
    TopicSection('When to stop', [
      TopicPoint('No descent with the first pull — reassess, do not repeat',
          critical: true),
      TopicPoint('No delivery after three pulls with descent'),
      TopicPoint('Three cup detachments'),
      TopicPoint('Exceeding the time limit'),
      TopicPoint('use a second instrument after the first has failed',
          avoid: true,
          detail: 'Sequential instrumentation substantially increases '
              'neonatal trauma. Where the first instrument fails, caesarean is '
              'usually the right answer.'),
    ]),
    TopicSection('Complications', [
      TopicPoint('MATERNAL — third and fourth degree tears, vaginal and '
          'cervical lacerations, postpartum haemorrhage, urinary retention, '
          'haematoma.'),
      TopicPoint('NEONATAL — cephalohaematoma, subgaleal haemorrhage, facial '
          'nerve palsy, skull fracture, retinal haemorrhage, scalp '
          'lacerations.'),
      TopicPoint('SUBGALEAL HAEMORRHAGE after vacuum is rare and potentially '
          'fatal — a boggy, shifting swelling crossing suture lines, with '
          'shock disproportionate to the visible bleeding', critical: true,
          detail: 'Tell the neonatal team every vacuum delivery, and ask them '
              'to observe.'),
      TopicPoint('Anticipate postpartum haemorrhage and examine the genital '
          'tract systematically afterwards.'),
    ]),
    TopicSection('Aftercare and documentation', [
      TopicPoint('Rectal examination after every assisted delivery to exclude '
          'an unrecognised sphincter injury', critical: true),
      TopicPoint('Paired cord gases'),
      TopicPoint('Bladder care — document the first void and the volume; '
          'retention is common'),
      TopicPoint('Thromboprophylaxis assessment'),
      TopicPoint('Record: indication, position and station, instrument, '
          'number of pulls, whether an episiotomy was performed, time from '
          'decision to delivery, and who performed it'),
      TopicPoint('Debrief the woman before discharge, and discuss the next '
          'birth — most subsequent deliveries are spontaneous'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 26 — Assisted Vaginal Birth.',
    'ACOG Practice Bulletin 219 — Operative Vaginal Birth.',
    'FOGSI GCPR — Operative Vaginal Delivery; MoHFW Dakshata intrapartum '
        'skills programme.',
    'NICE NG235 — Intrapartum care.',
  ],
);

const kPerinealRepairTopic = ClinicalTopic(
  id: 'proc-perineal-repair',
  name: 'Perineal and OASIS repair',
  subtitle: 'Classification, technique, aftercare',
  headline: 'Examine every woman rectally before you suture. The internal '
      'anal sphincter is pale and looks like fascia, and a 3c repaired as a 3b '
      'is the commonest reason for a poor long-term functional result.',
  keyFacts: [
    ('First degree', 'Skin and vaginal mucosa only'),
    ('Second degree', 'Perineal muscles, sphincter intact'),
    ('3a', '< 50% of external sphincter thickness'),
    ('3b', '> 50% of external sphincter thickness'),
    ('3c', 'Internal sphincter also torn'),
    ('Fourth degree', 'Anal epithelium torn'),
    ('OASIS incidence', '~3% nulliparous, ~0.5% multiparous'),
  ],
  sections: [
    TopicSection('Before you suture', [
      TopicPoint('Examine the perineum, vagina and cervix under good light',
          critical: true),
      TopicPoint('PERFORM A RECTAL EXAMINATION on every woman after vaginal '
          'birth, before suturing', critical: true,
          detail: 'This is the step that finds the tears that are otherwise '
              'missed.'),
      TopicPoint('Classify the tear explicitly and record the classification'),
      TopicPoint('repair an OASIS in the delivery room', avoid: true,
          detail: 'Inadequate light, anaesthesia and assistance produce a poor '
              'repair. Move to theatre.'),
    ]),
    TopicSection('Preparation and equipment', [
      TopicPoint('Theatre, with regional or general anaesthesia, for any third '
          'or fourth degree tear'),
      TopicPoint('Good lighting, lithotomy position, an assistant'),
      TopicPoint('Absorbable sutures: 3-0 polyglactin for muscle and mucosa; '
          '3-0 polydioxanone for the external sphincter'),
      TopicPoint('Allis forceps to retrieve retracted sphincter ends'),
      TopicPoint('Single dose of broad-spectrum antibiotic at the time of '
          'repair'),
      TopicPoint('Count swabs and needles before and after', critical: true),
    ]),
    TopicSection('Technique — second degree', [
      TopicPoint('Continuous non-locking suture to the vaginal wall, starting '
          'above the apex'),
      TopicPoint('Interrupted or continuous sutures to the perineal muscles'),
      TopicPoint('Subcuticular continuous suture to the skin — less pain than '
          'interrupted transcutaneous sutures'),
      TopicPoint('Check no suture has passed through the rectal mucosa'),
    ]),
    TopicSection('Technique — OASIS', [
      TopicPoint('Identify and repair the ANAL EPITHELIUM first if torn, with '
          'fine absorbable sutures, knots in the lumen', critical: true),
      TopicPoint('Repair the INTERNAL sphincter separately, end-to-end, with '
          'interrupted sutures. It is the pale layer.', critical: true),
      TopicPoint('Repair the EXTERNAL sphincter with 3-0 polydioxanone'),
      TopicPoint('End-to-end for a 3a or partial 3b; overlap or end-to-end for '
          'full-thickness — the evidence does not clearly favour either at 12 '
          'months'),
      TopicPoint('overlap a partially torn external sphincter', avoid: true,
          detail: 'It can worsen function.'),
      TopicPoint('Confirm by rectal examination that no suture is in the anal '
          'lumen'),
    ]),
    TopicSection('Episiotomy', [
      TopicPoint('MEDIOLATERAL, angled 60 degrees from the midline at '
          'crowning', critical: true,
          detail: 'The angle measured at crowning becomes about 45 degrees '
              'once the perineum retracts. A midline episiotomy extends into '
              'the sphincter far more often.'),
      TopicPoint('Not routine — restrictive use has better outcomes'),
      TopicPoint('Reasonable at assisted delivery, and where a tear appears '
          'imminent'),
      TopicPoint('Adequate analgesia before cutting'),
      TopicPoint('Repair in the same three layers as a second degree tear'),
    ]),
    TopicSection('Aftercare', [
      TopicPoint('Broad-spectrum antibiotics after OASIS repair'),
      TopicPoint('Laxatives for 10–14 days — lactulose, avoiding constipating '
          'agents', critical: true),
      TopicPoint('Analgesia, avoiding constipating opioids where possible'),
      TopicPoint('Pelvic floor physiotherapy referral'),
      TopicPoint('Ice packs and perineal hygiene advice'),
      TopicPoint('Follow up at 6–12 weeks with a clinician who can assess '
          'continence'),
    ]),
    TopicSection('Documentation and future births', [
      TopicPoint('Classification, the layers repaired, suture materials, and '
          'who performed the repair'),
      TopicPoint('That a rectal examination was performed before and after'),
      TopicPoint('Swab and needle counts'),
      TopicPoint('Counsel about the next birth: elective caesarean if she is '
          'symptomatic, or if endoanal ultrasound or manometry is abnormal',
          critical: true),
      TopicPoint('Explain that most women are continent after a good repair, '
          'and that symptoms should be reported rather than tolerated'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 29 — Third and Fourth Degree Perineal Tears.',
    'NICE NG235 — Intrapartum care.',
    'FOGSI GCPR — Perineal Trauma and OASIS Repair.',
    'Sultan AH et al. Obstetric perineal injury and anal incontinence.',
  ],
);

const kManualRemovalTopic = ClinicalTopic(
  id: 'proc-manual-removal',
  name: 'Manual removal of placenta',
  subtitle: 'Retained placenta · uterine exploration',
  headline: 'If the placenta will not separate and there is no plane, stop. '
      'That is placenta accreta, and continuing to dig is how a manageable '
      'situation becomes a hysterectomy.',
  keyFacts: [
    ('Retained placenta', '> 30 min with active management, > 60 min without'),
    ('Anaesthesia', 'Regional or general — never without'),
    ('Antibiotics', 'Single dose broad-spectrum at the procedure'),
    ('Incidence', '~2 – 3% of vaginal births'),
    ('No cleavage plane', 'Stop — this is accreta'),
  ],
  sections: [
    TopicSection('Indications', [
      TopicPoint('Placenta undelivered 30 minutes after birth with active '
          'management of the third stage'),
      TopicPoint('Placenta undelivered 60 minutes with physiological '
          'management'),
      TopicPoint('Postpartum haemorrhage with a retained placenta — do not '
          'wait for the interval', critical: true),
      TopicPoint('Suspected retained placental fragments after delivery'),
    ]),
    TopicSection('Contraindications and cautions', [
      TopicPoint('Suspected placenta accreta spectrum — praevia with a '
          'previous caesarean should prompt planning, not manual removal',
          critical: true),
      TopicPoint('Absence of adequate anaesthesia'),
      TopicPoint('Absence of intravenous access and blood availability'),
    ]),
    TopicSection('Preparation', [
      TopicPoint('Intravenous access, group and save, crossmatch if bleeding'),
      TopicPoint('Regional or general anaesthesia — an adequately relaxed '
          'uterus and a comfortable woman', critical: true),
      TopicPoint('Empty the bladder'),
      TopicPoint('Single dose broad-spectrum antibiotic'),
      TopicPoint('Theatre, with the team and blood available'),
      TopicPoint('attempt manual removal on the labour ward with entonox '
          'alone', avoid: true),
    ]),
    TopicSection('Technique', [
      TopicPoint('Follow the cord to the placental edge with one hand while '
          'the other steadies the fundus abdominally'),
      TopicPoint('Find the cleavage plane and separate with the ulnar border '
          'of the hand in a sweeping motion'),
      TopicPoint('IF THERE IS NO PLANE, STOP', critical: true,
          detail: 'A placenta that will not separate is adherent. Stop, leave '
              'it, call for senior help, and prepare for possible '
              'hysterectomy or a conservative accreta pathway.'),
      TopicPoint('Once separated, deliver the placenta and check it is '
          'complete'),
      TopicPoint('Explore the cavity for fragments'),
      TopicPoint('Give oxytocin and start an infusion'),
      TopicPoint('Examine the genital tract for trauma before finishing'),
    ]),
    TopicSection('Complications', [
      TopicPoint('Postpartum haemorrhage', critical: true),
      TopicPoint('Uterine perforation, particularly with an atonic or '
          'infected uterus'),
      TopicPoint('Endometritis'),
      TopicPoint('Uterine inversion — recognise it immediately and replace it '
          'at once, before the ring contracts', critical: true),
      TopicPoint('Asherman syndrome after vigorous curettage'),
      TopicPoint('Unrecognised placenta accreta with catastrophic haemorrhage'),
    ]),
    TopicSection('Aftercare and documentation', [
      TopicPoint('Oxytocin infusion; monitor tone and loss closely'),
      TopicPoint('Observations hourly initially'),
      TopicPoint('Anti-D if Rhesus negative and indicated'),
      TopicPoint('Thromboprophylaxis once bleeding is controlled'),
      TopicPoint('Document the interval to removal, whether a plane was '
          'found, completeness of the placenta, and estimated blood loss'),
      TopicPoint('Counsel about recurrence — retained placenta recurs in about '
          '20% of subsequent births'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 52 — Prevention and Management of Postpartum '
        'Haemorrhage.',
    'RCOG Green-top Guideline 27a — Placenta Praevia and Placenta Accreta.',
    'FOGSI GCPR — Third Stage of Labour and Retained Placenta; MoHFW Dakshata '
        'skills programme.',
    'WHO recommendations for the prevention and treatment of postpartum '
        'haemorrhage.',
  ],
);

const kVaginalExamTopic = ClinicalTopic(
  id: 'proc-vaginal-exam',
  name: 'Vaginal examination in labour',
  subtitle: 'Cervical assessment · amniotomy · membrane sweep',
  headline: 'Every examination carries an infection cost and a dignity cost. '
      'Four-hourly in established labour is the standard, and each extra one '
      'needs a reason you could state aloud.',
  keyFacts: [
    ('Frequency in established labour', '4-hourly, unless indicated sooner'),
    ('Active phase begins at', '5 cm — not 4'),
    ('Membrane sweep offered', '40 weeks nulliparous, 41 weeks parous'),
    ('Amniotomy with a high head', 'Cord prolapse risk — avoid'),
    ('Consent', 'Verbal, for every single examination'),
  ],
  sections: [
    TopicSection('Before every examination', [
      TopicPoint('Explain what you are doing and why, and obtain consent each '
          'time — consent is not given once for the labour', critical: true),
      TopicPoint('Offer a chaperone and record who was present'),
      TopicPoint('Exclude placenta praevia before any digital examination in '
          'a woman who has bled', critical: true),
      TopicPoint('Ensure the bladder is empty'),
      TopicPoint('Abdominal palpation FIRST — lie, presentation, engagement '
          'and fifths palpable'),
      TopicPoint('perform a digital examination in suspected PPROM',
          avoid: true,
          detail: 'It introduces infection and shortens latency. Use a sterile '
              'speculum.'),
    ]),
    TopicSection('What to assess and record', [
      TopicPoint('Cervical dilatation in centimetres'),
      TopicPoint('Effacement, length and consistency'),
      TopicPoint('Position of the cervix — posterior, mid or anterior'),
      TopicPoint('Station of the presenting part relative to the ischial '
          'spines'),
      TopicPoint('Position of the presenting part, by the sutures and '
          'fontanelles'),
      TopicPoint('Caput and moulding — increasing moulding with poor progress '
          'suggests obstruction', critical: true),
      TopicPoint('Membranes intact or ruptured, and the colour of the liquor'),
      TopicPoint('Presence of a cord — exclude prolapse after every membrane '
          'rupture with a high head', critical: true),
    ]),
    TopicSection('Membrane sweep', [
      TopicPoint('Offer at the 40-week visit for nulliparous women and 41 '
          'weeks for parous women'),
      TopicPoint('Insert a finger through the internal os and sweep '
          'circumferentially to separate the membranes from the lower segment'),
      TopicPoint('Where the os is closed, cervical massage is an alternative '
          'of uncertain benefit'),
      TopicPoint('Warn about discomfort, cramping and light bleeding'),
      TopicPoint('Reduces the need for formal induction; it is an adjunct '
          'rather than an induction itself'),
    ]),
    TopicSection('Amniotomy', [
      TopicPoint('Only with a well-applied presenting part and no more than '
          'one-fifth palpable abdominally', critical: true),
      TopicPoint('Auscultate the fetal heart before and immediately after'),
      TopicPoint('Feel for a cord before and after rupture', critical: true),
      TopicPoint('Note the colour and volume of liquor'),
      TopicPoint('perform amniotomy with a high or unengaged presenting part',
          avoid: true,
          detail: 'This is the commonest iatrogenic cause of cord prolapse.'),
      TopicPoint('Where it must be done with a high head, do it in a place '
          'where an immediate caesarean is possible'),
    ]),
    TopicSection('Minimising harm', [
      TopicPoint('Each examination raises the risk of chorioamnionitis, '
          'particularly with ruptured membranes'),
      TopicPoint('Four-hourly is the standard; more often needs an indication'),
      TopicPoint('Aseptic technique throughout'),
      TopicPoint('Be alert to a woman who has experienced sexual violence — '
          'examinations can be re-traumatising, and asking beforehand costs '
          'nothing', critical: true),
      TopicPoint('Stop if she withdraws consent, at any point'),
    ]),
  ],
  sources: [
    'NICE NG235 — Intrapartum care; NG207 — Inducing labour.',
    'WHO Labour Care Guide, 2020.',
    'FOGSI GCPR — Intrapartum Care; MoHFW Dakshata and LaQshya labour room '
        'standards.',
    'RCOG Green-top Guideline 50 — Umbilical Cord Prolapse.',
  ],
);
