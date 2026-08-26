import '../../models/learning_topic.dart';

const kHistoryExamTopics = <LearningTopic>[
  LearningTopic(
    id: 'lrn-obs-history',
    title: 'The obstetric history',
    subtitle: 'Structure, and the questions that change management',
    category: LearningCategory.historyExamination,
    competency: 'OG 1.1',
    summary: 'A structured obstetric history establishes gestation, risk and '
        'the reason she is here — in that order. Dating comes first because '
        'almost every subsequent decision is indexed to it.',
    sections: [
      LearningSection('Opening', [
        'Introduce yourself, confirm her name and age, and say what you are '
            'going to do.',
        'Establish parity in the standard notation — gravidity, then parity as '
            'births beyond 24 weeks and losses before it.',
        'Ask the presenting complaint in her own words before imposing a '
            'structure on it.',
      ]),
      LearningSection('This pregnancy', [
        'Last menstrual period, cycle regularity, and any hormonal '
            'contraception in the preceding three months.',
        'Whether an early scan was performed, and whether it agreed with the '
            'menstrual dates. Scan dating supersedes menstrual dating where '
            'they disagree beyond the accepted margin.',
        'Conception spontaneous or assisted.',
        'Booking bloods, blood group and antibody status.',
        'Screening performed and results — aneuploidy, anomaly scan, '
            'gestational diabetes.',
        'Fetal movements: when first felt, and the current pattern.',
        'Symptoms of pre-eclampsia, and any bleeding or leaking.',
      ]),
      LearningSection('Previous pregnancies', [
        'Each pregnancy in order: year, gestation at delivery, mode of '
            'delivery, birth weight, and the outcome for the baby.',
        'Complications: hypertensive disease, gestational diabetes, growth '
            'restriction, preterm birth, haemorrhage, retained placenta, '
            'perineal trauma.',
        'For a caesarean, the indication and — where it matters — the type of '
            'uterine incision.',
        'Losses, terminations and ectopic pregnancies, asked without '
            'assumption and, where possible, without family present.',
      ]),
      LearningSection('The rest of the history', [
        'Medical and surgical history, with particular attention to cardiac, '
            'renal, thyroid, epilepsy and autoimmune disease.',
        'Drug history including over-the-counter, traditional and herbal '
            'preparations, which are commonly taken and rarely volunteered.',
        'Allergies.',
        'Family history of hypertensive disease, diabetes, thromboembolism, '
            'and congenital or inherited conditions.',
        'Social history: occupation, support at home, who makes decisions, '
            'tobacco in any form, alcohol, and the distance to the facility '
            'where she plans to deliver.',
        'Ask about domestic violence in a private setting, using a routine '
            'enquiry framing rather than an accusatory one.',
      ]),
      LearningSection('Common errors', [
        'Accepting menstrual dates without asking whether an early scan was '
            'done.',
        'Recording "previous LSCS" without the indication, which is what '
            'decides the plan this time.',
        'Taking the history with the husband or mother-in-law answering. Offer '
            'to see her alone at least once.',
        'Omitting the transport question in a woman planning a facility birth '
            'far from home.',
      ]),
    ],
    keyPoints: [
      'Dating first. Nearly every later decision is indexed to gestational '
          'age.',
      'Parity notation must distinguish births beyond 24 weeks from losses '
          'before it.',
      'A previous caesarean needs its indication recorded, not just its '
          'existence.',
      'See her alone at least once, in every antenatal history.',
    ],
    related: ['dating', 'vbac', 'couns-antenatal-care'],
    sources: [
      'National Medical Commission — Competency-Based Postgraduate Curriculum '
          'for MD Obstetrics and Gynaecology.',
      'WHO recommendations on antenatal care for a positive pregnancy '
          'experience, 2016.',
      'NICE NG201 — Antenatal care.',
      'MoHFW Maternal and Child Protection Card and PMSMA operational '
          'guidelines; FOGSI GCPR — Antenatal Care.',
    ],
  ),
  LearningTopic(
    id: 'lrn-gyn-history',
    title: 'The gynaecological history',
    subtitle: 'Menstrual, sexual and reproductive, asked properly',
    category: LearningCategory.historyExamination,
    competency: 'OG 1.2',
    summary: 'The gynaecological history is where the most sensitive material '
        'in medicine is routinely collected in the least private conditions. '
        'Structure protects both accuracy and dignity.',
    sections: [
      LearningSection('Menstrual history', [
        'Age at menarche.',
        'Describe the cycle by the four FIGO parameters — frequency, '
            'regularity, duration and volume — rather than the older Greek '
            'terms.',
        'Define heavy bleeding by its effect on her life, not by millilitres.',
        'Intermenstrual, postcoital and postmenopausal bleeding, each asked '
            'directly.',
        'Dysmenorrhoea: timing relative to bleeding, severity, and whether it '
            'stops her working or studying.',
        'Date of the last menstrual period, and whether it was normal.',
      ]),
      LearningSection('Sexual and reproductive history', [
        'Ask permission before starting, and explain why the questions '
            'matter.',
        'Current contraception, satisfaction with it, and adherence.',
        'Dyspareunia — superficial or deep, and whether it is new.',
        'Subfertility: duration of trying, and whether the partner has been '
            'assessed.',
        'Sexual history where infection is possible: number and gender of '
            'partners, condom use, and symptoms in partners.',
        'Ask about coercion and safety. Offer to see her alone.',
      ]),
      LearningSection('Cervical screening and past gynaecology', [
        'Date and result of the last cervical screen, and any treatment.',
        'Previous gynaecological surgery, including the approach used.',
        'Previous pelvic infection or ectopic pregnancy.',
        'Obstetric history, which is part of the gynaecological picture — '
            'parity, mode of delivery, and perineal trauma.',
      ]),
      LearningSection('Systems that overlap', [
        'Urinary: frequency, urgency, incontinence, and whether it is '
            'stress-related or urge-related.',
        'Bowel: constipation, straining, incomplete evacuation, and cyclical '
            'symptoms.',
        'Prolapse symptoms: a dragging sensation, a lump, or the need to '
            'reduce it to void or defaecate.',
        'Vasomotor and genitourinary symptoms in the perimenopausal woman.',
      ]),
      LearningSection('Common errors', [
        'Using the older terms — menorrhagia, metrorrhagia — which mean '
            'different things to different clinicians.',
        'Assuming heterosexuality, or a partner at all.',
        'Not asking about postcoital bleeding, which is the symptom cervical '
            'cancer most often announces itself with.',
        'Taking a sexual history in an open bay.',
      ]),
    ],
    keyPoints: [
      'Describe cycles by frequency, regularity, duration and volume.',
      'Heavy is defined by its effect on her life, not by a measured volume.',
      'Postcoital and postmenopausal bleeding are each asked directly, not '
          'waited for.',
      'Privacy is a clinical requirement here, not a courtesy.',
    ],
    related: ['aub', 'algo-aub', 'algo-pmb', 'contraception'],
    sources: [
      'Munro MG et al. FIGO classification system for causes of abnormal '
          'uterine bleeding. Int J Gynaecol Obstet 2011;113:3–13; revision '
          '2018;143:393–408.',
      'NICE NG88 — Heavy menstrual bleeding; NICE NG12 — Suspected cancer.',
      'National Medical Commission — Competency-Based Postgraduate Curriculum '
          'for MD Obstetrics and Gynaecology.',
      'NACO National Guidelines on Prevention, Management and Control of RTI '
          'and STI; FOGSI GCPR — Abnormal Uterine Bleeding.',
    ],
  ),
  LearningTopic(
    id: 'lrn-abdominal-exam',
    title: 'Obstetric abdominal examination',
    subtitle: 'Inspection, fundal height, lie, presentation, engagement',
    category: LearningCategory.historyExamination,
    competency: 'OG 1.3',
    summary: 'A systematic abdominal examination gives size, lie, '
        'presentation and engagement without any equipment, and remains the '
        'first-line assessment wherever ultrasound is not immediately '
        'available.',
    sections: [
      LearningSection('Preparation', [
        'Explain, obtain consent, and offer a chaperone — record who was '
            'present.',
        'Empty bladder; semi-recumbent with a left lateral tilt beyond 20 '
            'weeks to avoid aortocaval compression.',
        'Expose from xiphisternum to symphysis, and no further than needed.',
        'Warm hands.',
      ]),
      LearningSection('Inspection', [
        'Distension consistent with gestation.',
        'Fetal movements visible.',
        'Surgical scars — look specifically low, where a Pfannenstiel scar '
            'hides in the skin crease.',
        'Striae, linea nigra, and any rash.',
      ]),
      LearningSection('Symphysis-fundal height', [
        'Measure from the upper border of the symphysis pubis to the fundus, '
            'with the tape reversed so the number is not seen while '
            'measuring.',
        'From about 24 weeks the measurement in centimetres approximates the '
            'gestation in weeks, conventionally within 2 cm.',
        'Plot serially on a chart — the trajectory carries more information '
            'than any single value.',
        'A measurement outside the expected range is an indication for '
            'ultrasound, not for reassurance or for delivery on its own.',
      ]),
      LearningSection('Leopold manoeuvres', [
        'FIRST — fundal grip: what occupies the fundus. Breech is broad, '
            'firm and less ballotable; head is hard, round and ballotable.',
        'SECOND — lateral grip: the back on one side as a firm continuous '
            'resistance, limbs on the other as irregular knobs. This gives '
            'the lie.',
        'THIRD — Pawlik grip: grasp the presenting part above the symphysis '
            'to confirm presentation and whether it is mobile.',
        'FOURTH — pelvic grip, facing her feet: how much of the head remains '
            'palpable above the brim, expressed in fifths.',
      ]),
      LearningSection('Engagement and auscultation', [
        'Engagement is described in fifths palpable abdominally. Two fifths '
            'or fewer palpable is conventionally taken as engaged.',
        'Auscultate over the anterior shoulder — below the umbilicus on the '
            'side of the back in a cephalic presentation.',
        'Distinguish the fetal heart from the maternal pulse by palpating her '
            'radial pulse at the same time. This is the single commonest '
            'error in this examination, and it has led to attempted '
            'resuscitation of a fetus already dead.',
      ]),
      LearningSection('Common errors', [
        'Measuring fundal height with the centimetre side visible, which '
            'biases the reading.',
        'Not tilting the woman, then attributing her faintness to anxiety.',
        'Recording "cephalic" without stating fifths palpable.',
        'Missing a low transverse scar.',
      ]),
    ],
    keyPoints: [
      'Fundal height in centimetres approximates gestation in weeks from '
          'about 24 weeks, conventionally within 2 cm.',
      'Serial plotting beats any single measurement.',
      'Engagement is recorded in fifths palpable, not as a yes or no.',
      'Always confirm the maternal pulse while auscultating the fetal heart.',
    ],
    related: ['efw', 'biometry', 'algo-fgr', 'anat-abdominal-wall'],
    sources: [
      'NICE NG201 — Antenatal care.',
      'RCOG Green-top Guideline 31 — Investigation and Care of a '
          'Small-for-Gestational-Age Fetus and a Growth Restricted Fetus '
          '(Morris RK et al. BJOG 2024;131:e31–e80).',
      'WHO recommendations on antenatal care, 2016.',
      'National Medical Commission postgraduate curriculum; MoHFW Dakshata '
          'guidelines; Dutta DC. Textbook of Obstetrics.',
    ],
  ),
  LearningTopic(
    id: 'lrn-pelvic-exam',
    title: 'Pelvic examination',
    subtitle: 'Speculum and bimanual, with consent as a running requirement',
    category: LearningCategory.historyExamination,
    competency: 'OG 1.4',
    summary: 'Pelvic examination is diagnostic, intimate and easy to perform '
        'badly. Consent is obtained for each examination, not once for the '
        'episode, and a chaperone is offered every time.',
    sections: [
      LearningSection('Consent and chaperone', [
        'Explain what will be done, why, and what she will feel.',
        'Obtain explicit consent for each examination.',
        'Offer a chaperone regardless of the gender of the examiner, and '
            'record the offer, the response, and the chaperone\'s name.',
        'Stop if she asks you to stop, at any point.',
        'Ask about previous sexual violence where the history suggests it — '
            'examination can be re-traumatising, and knowing beforehand '
            'changes how you proceed.',
      ]),
      LearningSection('Inspection', [
        'Vulva: skin changes, atrophy, lesions, discharge, excoriation, '
            'architectural loss.',
        'Look at the perineum and perianal skin — vulval dermatoses extend '
            'there and are missed if you do not look.',
        'Ask her to cough or bear down to demonstrate prolapse or stress '
            'leakage.',
      ]),
      LearningSection('Speculum examination', [
        'Warm the speculum and use lubricant, except where it would interfere '
            'with a sample.',
        'Cusco bivalve for visualising the cervix; Sims with the woman in the '
            'left lateral position for assessing prolapse and fistula.',
        'Inspect the cervix for ectropion, polyp, contact bleeding, and any '
            'irregular or friable lesion.',
        'A visible abnormal cervix requires referral and biopsy. A normal '
            'smear does not exclude cancer in a cervix that looks wrong.',
        'Take samples in the correct order where several are needed.',
      ]),
      LearningSection('Bimanual examination', [
        'Two fingers in the vagina, the other hand on the abdomen.',
        'Cervix: consistency, and excitation tenderness.',
        'Uterus: size against a gestational equivalent, position, mobility, '
            'and tenderness. A fixed retroverted uterus suggests endometriosis '
            'or adhesions.',
        'Adnexae: mass, tenderness, or fullness in each fornix.',
        'Pouch of Douglas: nodularity suggests deep endometriosis.',
      ]),
      LearningSection('When not to examine', [
        'Digital examination in suspected preterm prelabour rupture of '
            'membranes — use a sterile speculum.',
        'Digital examination in antepartum haemorrhage until placenta praevia '
            'has been excluded.',
        'Any examination without consent.',
        'Speculum examination in a prepubertal child — that is an examination '
            'under anaesthesia, with safeguarding involved.',
      ]),
    ],
    keyPoints: [
      'Consent is per examination, not per episode.',
      'Offer a chaperone every time and document it.',
      'Exclude praevia before any digital examination in antepartum '
          'haemorrhage.',
      'Use a speculum, never a finger, in suspected PPROM.',
      'A cervix that looks abnormal is biopsied whatever the smear says.',
    ],
    related: [
      'proc-vaginal-exam',
      'proc-pap',
      'vulval-disorders',
      'algo-pprom',
      'popq',
    ],
    sources: [
      'RCOG — Obtaining Valid Consent, Clinical Governance Advice 6; RCOG '
          'guidance on the use of chaperones.',
      'GMC — Intimate examinations and chaperones, 2013.',
      'NICE NG12 — Suspected cancer: recognition and referral.',
      'National Medical Commission postgraduate curriculum; MoHFW Guidelines '
          'and Protocols for Medico-legal Care for Survivors of Sexual '
          'Violence; FOGSI GCPR — Cervical Cancer Screening.',
    ],
  ),
];
