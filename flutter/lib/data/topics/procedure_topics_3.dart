import '../../models/topic.dart';

const kOxytocinInfusionTopic = ClinicalTopic(
  id: 'proc-oxytocin',
  name: 'Oxytocin infusion',
  subtitle: 'Augmentation · titration · when to stop',
  headline: 'Oxytocin is the drug most often implicated in intrapartum '
      'hypoxic injury, and almost always because it was increased while the '
      'trace was already changing. Titrate to contractions, not to the clock.',
  keyFacts: [
    ('Target contractions', '3–4 in 10 minutes, each lasting 40–60 seconds'),
    ('Tachysystole', 'More than 5 in 10 minutes — reduce or stop'),
    ('Increase interval', 'No more often than every 30 minutes'),
    ('Monitoring', 'Continuous CTG from the moment it starts'),
    ('Previous caesarean', 'Use only on a consultant decision'),
  ],
  sections: [
    TopicSection('Indications', [
      TopicPoint('Delay in the first stage with inadequate contractions, '
          'after amniotomy where appropriate'),
      TopicPoint('Delay in the second stage with inadequate contractions'),
      TopicPoint('Induction of labour, following cervical ripening and '
          'amniotomy'),
      TopicPoint('Active management of the third stage, as a bolus regimen '
          'that is a different thing entirely'),
    ]),
    TopicSection('Contraindications and cautions', [
      TopicPoint('Obstructed labour or cephalopelvic disproportion',
          critical: true),
      TopicPoint('Malpresentation not suitable for vaginal birth'),
      TopicPoint('A non-reassuring CTG — the drug will make it worse',
          critical: true),
      TopicPoint('Placenta praevia or vasa praevia'),
      TopicPoint('Previous classical caesarean or other high-risk uterine '
          'scar', critical: true),
      TopicPoint('Previous caesarean: significantly increases rupture risk. '
          'Consultant decision, documented.', critical: true),
      TopicPoint('Grand multiparity — the uterus ruptures at lower doses'),
    ]),
    TopicSection('Before starting', [
      TopicPoint('Confirm the diagnosis of delay with a vaginal examination — '
          'do not treat a partogram line without examining her',
          critical: true),
      TopicPoint('Exclude malposition, malpresentation and obstruction'),
      TopicPoint('Consider amniotomy first where membranes are intact'),
      TopicPoint('Confirm adequate analgesia — augmented contractions are '
          'more painful'),
      TopicPoint('Establish continuous CTG and confirm it is normal',
          critical: true),
      TopicPoint('Empty the bladder'),
      TopicPoint('Explain what is being given and why, and obtain consent'),
    ]),
    TopicSection('Regimen and titration', [
      TopicPoint('Use the unit\'s written regimen. Dilution and rate vary and '
          'mixing two regimens is how overdoses happen', critical: true),
      TopicPoint('A common regimen: 5 units in 500 mL of crystalloid, '
          'starting at 1–4 milliunits per minute'),
      TopicPoint('Increase at intervals of no less than 30 minutes — the '
          'plasma level takes that long to reach steady state', critical: true),
      TopicPoint('Titrate against contractions, stopping the increase once '
          '3–4 in 10 are achieved'),
      TopicPoint('Do not exceed the unit maximum without senior review'),
      TopicPoint('increase the rate because progress is slow while '
          'contractions are already adequate', avoid: true,
          detail: 'Slow progress with adequate contractions means '
              'obstruction, malposition, or a fetus that will not fit — more '
              'oxytocin is the wrong answer to all three.'),
    ]),
    TopicSection('Monitoring during the infusion', [
      TopicPoint('Continuous CTG, reviewed systematically and against the '
          'previous hours', critical: true),
      TopicPoint('Contraction frequency and duration recorded every 30 '
          'minutes'),
      TopicPoint('Maternal pulse, blood pressure and temperature'),
      TopicPoint('Fluid balance — oxytocin has antidiuretic activity and '
          'water intoxication is a real complication of prolonged high-dose '
          'infusion', critical: true),
      TopicPoint('Vaginal examination after 4 hours to confirm progress'),
      TopicPoint('Reassess the whole picture if there is no progress after 4 '
          'hours of adequate contractions', critical: true),
    ]),
    TopicSection('When to stop', [
      TopicPoint('Tachysystole — more than 5 contractions in 10 minutes',
          critical: true),
      TopicPoint('Any deterioration in the CTG', critical: true),
      TopicPoint('Suspected uterine rupture — constant pain, scar '
          'tenderness, loss of station, breakthrough pain through a working '
          'epidural', critical: true),
      TopicPoint('Suspected obstruction'),
      TopicPoint('Consider acute tocolysis with terbutaline 250 µg '
          'subcutaneously for tachysystole with fetal compromise'),
    ]),
    TopicSection('Complications', [
      TopicPoint('Uterine hyperstimulation and fetal hypoxia'),
      TopicPoint('Uterine rupture, particularly with a scar or high parity'),
      TopicPoint('Hyponatraemia and water intoxication with prolonged high '
          'doses in dextrose'),
      TopicPoint('Hypotension and tachycardia if given as a rapid bolus',
          critical: true),
      TopicPoint('Postpartum haemorrhage from an oxytocin-fatigued uterus '
          'after long augmentation', critical: true),
      TopicPoint('Neonatal hyperbilirubinaemia'),
    ]),
    TopicSection('Documentation and consent', [
      TopicPoint('Record the indication, the examination findings that '
          'justified it, and who authorised it'),
      TopicPoint('Record every rate change with time and contraction '
          'frequency'),
      TopicPoint('Record the CTG assessment at each change'),
      TopicPoint('Verbal consent, documented, including the reason and the '
          'alternative'),
      TopicPoint('For a woman with a previous caesarean, record the '
          'consultant decision by name', critical: true),
    ]),
  ],
  sources: [
    'NICE NG235 — Intrapartum care.',
    'NICE NG207 — Inducing labour.',
    'RCOG Green-top Guideline 45 — Birth After Previous Caesarean Birth.',
    'WHO recommendations: intrapartum care for a positive childbirth '
        'experience, 2018.',
    'FOGSI GCPR — Induction and Augmentation of Labour; MoHFW Dakshata and '
        'LaQshya labour room guidelines.',
  ],
);

const kUterineExplorationTopic = ClinicalTopic(
  id: 'proc-uterine-exploration',
  name: 'Uterine exploration',
  subtitle: 'After delivery · retained tissue · suspected rupture',
  headline: 'Exploration is done for a reason that should be stated before '
      'the hand goes in: to find retained tissue, to find a defect, or to '
      'find the source of bleeding. Exploring without a question is how '
      'perforations happen.',
  keyFacts: [
    ('Anaesthesia', 'Required — this is not a bedside procedure'),
    ('Antibiotics', 'Prophylaxis before instrumentation'),
    ('Commonest finding', 'Retained placental tissue or membranes'),
    ('Rupture after VBAC', 'Explore only if clinically indicated'),
    ('Perforation risk', 'Highest with a soft postpartum or infected uterus'),
  ],
  sections: [
    TopicSection('Indications', [
      TopicPoint('Postpartum haemorrhage not responding to uterotonics',
          critical: true),
      TopicPoint('Incomplete placenta or ragged membranes on inspection'),
      TopicPoint('Suspected uterine rupture or dehiscence after vaginal birth '
          'with a scar'),
      TopicPoint('Secondary postpartum haemorrhage with retained products on '
          'imaging'),
      TopicPoint('Persistent bleeding after manual removal of the placenta'),
      TopicPoint('explore routinely after every vaginal birth after '
          'caesarean', avoid: true,
          detail: 'Routine exploration of an asymptomatic scar causes harm '
              'and finds nothing that changes management.'),
    ]),
    TopicSection('Contraindications and cautions', [
      TopicPoint('An unstable woman who has not been resuscitated — '
          'resuscitate in parallel, do not delay for perfection',
          critical: true),
      TopicPoint('Suspected placenta accreta spectrum — piecemeal removal '
          'causes catastrophic bleeding. Stop and get help.', critical: true),
      TopicPoint('Active genital infection, unless the exploration is the '
          'source control'),
      TopicPoint('No consent and no emergency — an emergency permits '
          'proceeding in her best interests, documented'),
    ]),
    TopicSection('Preparation and equipment', [
      TopicPoint('Two large-bore cannulae, cross-match, and blood available',
          critical: true),
      TopicPoint('Anaesthetist present; regional or general anaesthesia'),
      TopicPoint('Theatre, lithotomy position, bladder catheterised'),
      TopicPoint('Antibiotic prophylaxis'),
      TopicPoint('Sponge-holding forceps, ring forceps, a large blunt '
          'curette, retractors and a good light'),
      TopicPoint('Uterotonics drawn up and labelled'),
      TopicPoint('Ultrasound available where the question is retained tissue'),
    ]),
    TopicSection('Technique', [
      TopicPoint('Examine the vulva, vagina and cervix first — the bleeding '
          'is often there and no exploration is needed', critical: true),
      TopicPoint('Insert one hand into the uterine cavity while the other '
          'steadies the fundus abdominally', critical: true),
      TopicPoint('Sweep the cavity systematically, fundus to lower segment, '
          'front and back'),
      TopicPoint('Feel the whole circumference of any scar for a defect'),
      TopicPoint('Remove tissue with the fingers or sponge forceps in '
          'preference to sharp curettage', critical: true),
      TopicPoint('Where a curette is used, use a large blunt one and stop at '
          'the gritty sensation'),
      TopicPoint('use sharp curettage on a soft postpartum uterus', avoid: true,
          detail: 'Perforation and Asherman syndrome both follow, and neither '
              'is necessary.'),
      TopicPoint('Give uterotonics and confirm the uterus contracts before '
          'withdrawing'),
    ]),
    TopicSection('Complications', [
      TopicPoint('Uterine perforation — the soft postpartum uterus is easily '
          'perforated', critical: true),
      TopicPoint('Bowel or bladder injury through a perforation',
          critical: true),
      TopicPoint('Haemorrhage'),
      TopicPoint('Infection and endometritis'),
      TopicPoint('Intrauterine adhesions, particularly after sharp curettage'),
      TopicPoint('Cervical trauma'),
    ]),
    TopicSection('If perforation is suspected', [
      TopicPoint('Stop instrumenting immediately', critical: true),
      TopicPoint('Give uterotonics and antibiotics'),
      TopicPoint('Observe closely where the woman is stable and the '
          'instrument was blunt'),
      TopicPoint('Laparoscopy or laparotomy where she is unstable, where a '
          'sharp instrument or suction was used, or where bowel injury is '
          'possible', critical: true),
      TopicPoint('Involve a surgeon early rather than watching and hoping'),
    ]),
    TopicSection('Afterwards', [
      TopicPoint('Send any tissue for histology — molar pregnancy presents '
          'this way', critical: true),
      TopicPoint('Observations hourly initially, watching for continued '
          'bleeding'),
      TopicPoint('Antibiotics where infection was present'),
      TopicPoint('Anti-D if rhesus negative and the pregnancy was not term'),
      TopicPoint('Check haemoglobin and treat anaemia properly'),
      TopicPoint('Document the indication, the findings, whether the cavity '
          'was felt to be empty, and the estimated loss'),
      TopicPoint('Explain what was found and what it means for a future '
          'pregnancy'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 52 — Prevention and Management of Postpartum '
        'Haemorrhage.',
    'RCOG Green-top Guideline 27a — Placenta Praevia and Placenta Accreta.',
    'NICE NG126 — Ectopic pregnancy and miscarriage.',
    'WHO recommendations on prevention and treatment of postpartum '
        'haemorrhage.',
    'FOGSI GCPR — Postpartum Haemorrhage; MoHFW Comprehensive Abortion Care '
        'training manual.',
  ],
);

const kVaginalSurgeryTopic = ClinicalTopic(
  id: 'proc-vaginal-surgery',
  name: 'Vaginal surgery',
  subtitle: 'Vaginal hysterectomy · pelvic floor repair',
  headline: 'The vaginal route has the shortest recovery, the least pain and '
      'the lowest cost of any hysterectomy, and it remains the '
      'under-performed option. Choosing it well starts with the examination, '
      'not the theatre list.',
  keyFacts: [
    ('Preferred route', 'Vaginal, where descent and uterine size allow'),
    ('Uterine size limit', 'Guided by descent and mobility, not size alone'),
    ('Antibiotic prophylaxis', 'Single dose at induction'),
    ('Thromboprophylaxis', 'Risk-assessed for every case'),
    ('Mesh for prolapse', 'Transvaginal mesh restricted in most '
        'jurisdictions'),
  ],
  sections: [
    TopicSection('Selecting the vaginal route', [
      TopicPoint('Adequate uterine descent on examination', critical: true),
      TopicPoint('A mobile uterus of a size the vagina will deliver'),
      TopicPoint('Adequate vaginal capacity and a reachable subpubic arch'),
      TopicPoint('No suspicion of malignancy', critical: true),
      TopicPoint('No large adnexal mass requiring assessment'),
      TopicPoint('Previous caesarean is not a contraindication'),
      TopicPoint('Where descent is poor but the uterus is otherwise suitable, '
          'laparoscopic assistance is preferable to an abdominal incision'),
    ]),
    TopicSection('Contraindications', [
      TopicPoint('Suspected or confirmed gynaecological malignancy',
          critical: true),
      TopicPoint('A uterus too large or too fixed to descend'),
      TopicPoint('Severe endometriosis or known dense adhesions'),
      TopicPoint('Adnexal pathology requiring inspection'),
      TopicPoint('A narrow pubic arch or an undescended immobile uterus'),
    ]),
    TopicSection('Preparation', [
      TopicPoint('Confirm cervical screening is current, and investigate any '
          'abnormal bleeding before operating', critical: true),
      TopicPoint('Treat anaemia before the list, not on it', critical: true),
      TopicPoint('Antibiotic prophylaxis at induction'),
      TopicPoint('VTE risk assessment and thromboprophylaxis'),
      TopicPoint('Bladder catheterised'),
      TopicPoint('Lithotomy with careful attention to hip and knee position — '
          'common peroneal and femoral nerve injuries come from here',
          critical: true),
      TopicPoint('Examination under anaesthesia before starting, to confirm '
          'the route'),
    ]),
    TopicSection('Vaginal hysterectomy — key steps', [
      TopicPoint('Infiltrate for haemostasis and hydrodissection'),
      TopicPoint('Circumferential incision at the cervicovaginal junction'),
      TopicPoint('Open the pouch of Douglas posteriorly, and the '
          'vesicouterine fold anteriorly — pushing the bladder up before '
          'clamping is the step that protects it', critical: true),
      TopicPoint('Clamp, cut and ligate the uterosacral and cardinal '
          'ligaments, staying close to the uterus'),
      TopicPoint('Secure the uterine vessels, remembering the ureter runs '
          'close by', critical: true),
      TopicPoint('Deliver the uterus, using morcellation or bisection for '
          'size where the pathology is benign and confirmed'),
      TopicPoint('Secure the cornual pedicles'),
      TopicPoint('Attach the uterosacral ligaments to the vault to prevent '
          'later vault prolapse', critical: true),
      TopicPoint('Check haemostasis on every pedicle before closing'),
    ]),
    TopicSection('Pelvic floor repair', [
      TopicPoint('Anterior repair for a cystocele; posterior repair for a '
          'rectocele'),
      TopicPoint('Repair addresses the symptom, not the compartment seen on '
          'examination alone — treat what troubles her', critical: true),
      TopicPoint('Native tissue repair is first line'),
      TopicPoint('use transvaginal mesh for primary prolapse repair',
          avoid: true,
          detail: 'Restricted or suspended in most jurisdictions following '
              'unacceptable rates of erosion, pain and reoperation.'),
      TopicPoint('Avoid over-narrowing the introitus — dyspareunia is a '
          'common and avoidable outcome', critical: true),
      TopicPoint('Consider a pessary and physiotherapy first; many women '
          'never need surgery'),
      TopicPoint('Discuss continence separately — prolapse repair can unmask '
          'stress incontinence', critical: true),
    ]),
    TopicSection('Complications', [
      TopicPoint('Haemorrhage, including a delayed pedicle bleed'),
      TopicPoint('Bladder injury, most often at the vesicouterine fold',
          critical: true),
      TopicPoint('Ureteric injury near the uterine vessels', critical: true),
      TopicPoint('Bowel injury, particularly on opening the pouch of Douglas'),
      TopicPoint('Vault haematoma and infection'),
      TopicPoint('Vault prolapse later, if the uterosacrals were not '
          'reattached'),
      TopicPoint('Vaginal shortening and dyspareunia'),
      TopicPoint('Nerve injury from the lithotomy position'),
      TopicPoint('VTE'),
    ]),
    TopicSection('Post-procedure care and documentation', [
      TopicPoint('Remove the catheter and pack according to protocol, and '
          'confirm she voids'),
      TopicPoint('Watch for retention after prolapse repair'),
      TopicPoint('Early mobilisation and thromboprophylaxis'),
      TopicPoint('Advise no heavy lifting and no intercourse for six weeks'),
      TopicPoint('Send the specimen for histology in every case',
          critical: true),
      TopicPoint('Document the route and why it was chosen, the findings, '
          'the pedicles secured, blood loss, and whether the vault was '
          'suspended'),
      TopicPoint('Consent must cover conversion to an abdominal approach, '
          'injury to bladder, ureter and bowel, bleeding, infection, VTE, '
          'and the effect on continence and sexual function',
          critical: true),
    ]),
  ],
  sources: [
    'NICE NG123 — Urinary incontinence and pelvic organ prolapse in women.',
    'RCOG Green-top Guideline 46 — Post-Hysterectomy Vaginal Vault Prolapse; RCOG/BSUG joint guidance.',
    'AAGL position statement on route of hysterectomy for benign disease.',
    'Cochrane review — Surgical approach to hysterectomy for benign '
        'gynaecological disease.',
    'FOGSI GCPR — Hysterectomy; MoHFW National Guidelines to Prevent '
        'Unnecessary Hysterectomies; Urogynaecological Society of India '
        'guidance on prolapse surgery.',
  ],
);
