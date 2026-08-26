import '../../models/algorithm.dart';

const kRupturedCystAlgorithm = Algorithm(
  id: 'algo-ruptured-cyst',
  name: 'Ruptured ovarian cyst',
  subtitle: 'Most need analgesia. Some need theatre now.',
  callFor: 'Gynaecology registrar for haemodynamic compromise or a falling '
      'haemoglobin. Theatre team if she is unstable.',
  timeTarget: 'A woman with free fluid and a rising pulse is bleeding until '
      'proven otherwise — reassess within 30 minutes, not in the morning.',
  immediate: [
    AlgoStep('Pulse, blood pressure, and look for peritonism', critical: true),
    AlgoStep('PREGNANCY TEST — a ruptured ectopic looks exactly like this',
        critical: true),
    AlgoStep('Large-bore access, full blood count, group and save if there is '
        'any instability'),
    AlgoStep('Transvaginal ultrasound for free fluid and adnexal findings'),
    AlgoStep('Analgesia — do not leave her in pain while deciding'),
    AlgoStep('discharge on the first haemoglobin', avoid: true,
        detail: 'It has not had time to fall. Repeat it, or watch her.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('Sudden unilateral pain, often at mid-cycle or after '
          'intercourse or exercise'),
      AlgoStep('Pain may become generalised as blood irritates the peritoneum'),
      AlgoStep('Shoulder-tip pain indicates diaphragmatic irritation from '
          'significant haemoperitoneum', critical: true),
      AlgoStep('Functional cysts rupture most often; corpus luteum rupture '
          'bleeds most'),
      AlgoStep('Anticoagulated women bleed far more from an ordinary rupture',
          critical: true),
    ]),
    AlgoSection('2 · Assessment and investigations', [
      AlgoStep('Serial pulse and blood pressure — the trend decides, not one '
          'set', critical: true),
      AlgoStep('Serial haemoglobin at intervals'),
      AlgoStep('Quantitative betahCG if the test is positive'),
      AlgoStep('Transvaginal ultrasound: free fluid volume, echogenicity, and '
          'whether a mass remains'),
      AlgoStep('Echogenic free fluid means blood, not physiological fluid',
          critical: true),
      AlgoStep('Coagulation screen and reversal planning if anticoagulated'),
    ]),
    AlgoSection('3 · Differential', [
      AlgoStep('RUPTURED ECTOPIC PREGNANCY — the diagnosis that kills',
          critical: true),
      AlgoStep('Ovarian torsion, which may coexist'),
      AlgoStep('Appendicitis'),
      AlgoStep('Pelvic inflammatory disease and tubo-ovarian abscess'),
      AlgoStep('Endometrioma rupture — intense chemical peritonitis'),
      AlgoStep('Renal colic'),
    ]),
    AlgoSection('4 · Conservative management', [
      AlgoStep('Appropriate for the stable woman with a normal or stable '
          'haemoglobin and limited free fluid'),
      AlgoStep('Analgesia, observation, and repeat haemoglobin'),
      AlgoStep('Most rupture pain settles substantially within 24–48 hours'),
      AlgoStep('Discharge with clear return criteria and a follow-up scan '
          'where a mass persists', critical: true),
      AlgoStep('Consider hormonal suppression to prevent recurrence in a '
          'woman with recurrent functional cysts'),
    ]),
    AlgoSection('5 · When to operate', [
      AlgoStep('Haemodynamic instability not responding to resuscitation',
          critical: true),
      AlgoStep('A falling haemoglobin with ongoing pain', critical: true),
      AlgoStep('Large or increasing haemoperitoneum'),
      AlgoStep('Diagnostic uncertainty where ectopic cannot be excluded'),
      AlgoStep('Laparoscopy is the usual approach; laparotomy where she is '
          'unstable'),
      AlgoStep('Conserve ovarian tissue — cystectomy or haemostasis, not '
          'oophorectomy, in a woman of reproductive age', critical: true),
    ]),
    AlgoSection('6 · Follow-up', [
      AlgoStep('Repeat ultrasound at 6 weeks where a mass persists'),
      AlgoStep('Assess malignancy risk for any complex or persistent mass'),
      AlgoStep('Review anticoagulation with haematology where bleeding was '
          'significant'),
      AlgoStep('Discuss contraception where suppression of ovulation would '
          'prevent recurrence'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 62 — Management of Suspected Ovarian Masses in '
        'Premenopausal Women.',
    'RCOG/BSGE Green-top Guideline 34 — Ovarian Cysts in Postmenopausal '
        'Women.',
    'ACOG Practice Bulletin 174 — Evaluation and Management of Adnexal '
        'Masses.',
    'FOGSI GCPR — Ovarian Cysts and Acute Abdomen in Gynaecology.',
  ],
);

const kSepticAbortionAlgorithm = Algorithm(
  id: 'algo-septic-abortion',
  name: 'Septic abortion',
  subtitle: 'Antibiotics do not work until the uterus is empty',
  callFor: 'Gynaecology consultant, anaesthetist and critical care. This '
      'kills young women fast.',
  timeTarget: 'Antibiotics within the first hour. Evacuation within hours, '
      'not the next day — source control is the treatment.',
  immediate: [
    AlgoStep('Recognise sepsis: fever or hypothermia, tachycardia, '
        'tachypnoea, hypotension, confusion', critical: true),
    AlgoStep('BLOOD CULTURES, then BROAD-SPECTRUM INTRAVENOUS ANTIBIOTICS '
        'within the hour', critical: true),
    AlgoStep('Large-bore access, fluid resuscitation, lactate, cross-match'),
    AlgoStep('Speculum — remove products sitting in the os, and look for '
        'trauma or a foreign body', critical: true),
    AlgoStep('EVACUATE THE UTERUS — antibiotics alone will not control the '
        'source', critical: true),
    AlgoStep('Ask about attempted termination, without judgement, and in '
        'private', critical: true),
    AlgoStep('Tetanus prophylaxis where instrumentation outside a facility is '
        'possible', critical: true),
    AlgoStep('wait for the fever to settle before evacuating', avoid: true,
        detail: 'It will not settle while infected tissue remains. Delay is '
            'the commonest fatal error here.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('Fever, offensive or purulent vaginal discharge, uterine and '
          'adnexal tenderness'),
      AlgoStep('Bleeding, with or without passage of products'),
      AlgoStep('A history of recent pregnancy loss, termination, or '
          'instrumentation — which she may not volunteer', critical: true),
      AlgoStep('In India, unsafe abortion remains a significant contributor '
          'to maternal death; ask in a way that makes disclosure safe',
          critical: true),
      AlgoStep('Watch for the woman who looks well and is profoundly '
          'tachycardic — young women compensate until they crash',
          critical: true),
    ]),
    AlgoSection('2 · Investigations', [
      AlgoStep('Blood cultures before antibiotics, if it does not delay them'),
      AlgoStep('Full blood count, urea and electrolytes, liver function, '
          'coagulation, lactate'),
      AlgoStep('betahCG'),
      AlgoStep('High vaginal and endocervical swabs'),
      AlgoStep('Ultrasound for retained products, fluid collections and '
          'perforation'),
      AlgoStep('Erect chest and abdominal imaging where perforation or gas '
          '-forming infection is suspected', critical: true),
      AlgoStep('Group and cross-match'),
    ]),
    AlgoSection('3 · Antibiotics', [
      AlgoStep('Broad-spectrum cover for Gram-negative, Gram-positive and '
          'anaerobic organisms, per local protocol', critical: true),
      AlgoStep('Cover Clostridium perfringens and Group A streptococcus — '
          'both cause fulminant disease', critical: true),
      AlgoStep('Add clindamycin for toxin suppression in suspected '
          'streptococcal or clostridial sepsis'),
      AlgoStep('Do not narrow until cultures return and she is improving'),
      AlgoStep('Consider tetanus immunoglobulin and toxoid where the history '
          'suggests unsterile instrumentation', critical: true),
    ]),
    AlgoSection('4 · Source control', [
      AlgoStep('Evacuation of retained products under anaesthesia, with '
          'antibiotics already running', critical: true),
      AlgoStep('Use suction rather than sharp curettage — the infected '
          'uterus perforates easily', critical: true),
      AlgoStep('Laparotomy where perforation, bowel injury or pelvic abscess '
          'is suspected'),
      AlgoStep('Hysterectomy is occasionally life-saving in clostridial '
          'myonecrosis or an unresponsive uterus — do not delay it out of '
          'regard for fertility once it is indicated', critical: true),
      AlgoStep('Drain any collection, radiologically or surgically'),
    ]),
    AlgoSection('5 · Supportive care', [
      AlgoStep('Critical care involvement for organ support'),
      AlgoStep('Hourly urine output, and vasopressors for fluid-unresponsive '
          'hypotension'),
      AlgoStep('Watch for disseminated intravascular coagulation and acute '
          'kidney injury', critical: true),
      AlgoStep('Transfuse as required; anaemia is usually severe'),
      AlgoStep('Anti-D where rhesus negative'),
      AlgoStep('Venous thromboembolism prophylaxis once bleeding is '
          'controlled'),
    ]),
    AlgoSection('6 · Afterwards', [
      AlgoStep('Contraception before discharge — she is fertile within two '
          'weeks', critical: true),
      AlgoStep('Counsel on safe, legal abortion services under the MTP Act, '
          'without moralising', critical: true),
      AlgoStep('Discuss Asherman syndrome and future fertility'),
      AlgoStep('Screen and treat for sexually transmitted infection, and '
          'trace contacts'),
      AlgoStep('Report through the maternal death or near-miss review process '
          'where applicable'),
    ]),
  ],
  sources: [
    'WHO — Safe abortion: technical and policy guidance; WHO Abortion Care '
        'Guideline 2022.',
    'RCOG Green-top Guidelines 64a and 64b — Bacterial Sepsis in Pregnancy '
        'and Following Pregnancy.',
    'NICE NG51 — Sepsis.',
    'Medical Termination of Pregnancy Act 1971 as amended 2021, India; MoHFW '
        'Comprehensive Abortion Care training and service delivery '
        'guidelines; FOGSI GCPR on unsafe abortion.',
  ],
);

const kPelvicSepsisAlgorithm = Algorithm(
  id: 'algo-pelvic-sepsis',
  name: 'Pelvic inflammatory disease and tubo-ovarian abscess',
  subtitle: 'Treat on suspicion. Waiting costs tubes.',
  callFor: 'Gynaecology registrar for a suspected abscess or a systemically '
      'unwell woman. Interventional radiology for drainage.',
  timeTarget: 'Start antibiotics on clinical suspicion, before swab results. '
      'Each day of delay measurably increases infertility risk.',
  immediate: [
    AlgoStep('Pregnancy test — exclude ectopic', critical: true),
    AlgoStep('Observations; look for sepsis'),
    AlgoStep('Bimanual: cervical excitation, uterine and adnexal tenderness',
        critical: true),
    AlgoStep('Endocervical swabs for chlamydia and gonorrhoea, and a high '
        'vaginal swab — but do not wait for them', critical: true),
    AlgoStep('START ANTIBIOTICS on clinical suspicion', critical: true),
    AlgoStep('Transvaginal ultrasound where an abscess is possible'),
    AlgoStep('withhold treatment pending a definitive diagnosis', avoid: true,
        detail: 'The threshold to treat is deliberately low, because the cost '
            'of missing it is tubal infertility and chronic pain.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('Lower abdominal pain, usually bilateral'),
      AlgoStep('Deep dyspareunia, abnormal discharge, intermenstrual or '
          'postcoital bleeding'),
      AlgoStep('Cervical excitation and adnexal tenderness on examination'),
      AlgoStep('Fever suggests more severe disease but is often absent'),
      AlgoStep('Right upper quadrant pain suggests Fitz-Hugh-Curtis '
          'perihepatitis', critical: true),
      AlgoStep('Recent instrumentation, IUD insertion within 3 weeks, or '
          'termination raises the risk'),
    ]),
    AlgoSection('2 · Investigations', [
      AlgoStep('Nucleic acid amplification for chlamydia and gonorrhoea'),
      AlgoStep('HIV and syphilis testing offered', critical: true),
      AlgoStep('Full blood count and CRP — normal values do not exclude it'),
      AlgoStep('Transvaginal ultrasound: tubal thickening, cogwheel sign, '
          'fluid, or a complex adnexal mass'),
      AlgoStep('CT or MRI where an abscess or a surgical differential is '
          'suspected'),
      AlgoStep('Laparoscopy is the reference standard but is not required to '
          'treat'),
    ]),
    AlgoSection('3 · Differential', [
      AlgoStep('ECTOPIC PREGNANCY', critical: true),
      AlgoStep('Appendicitis'),
      AlgoStep('Ovarian torsion or ruptured cyst'),
      AlgoStep('Endometriosis'),
      AlgoStep('Urinary tract infection'),
      AlgoStep('Inflammatory bowel disease'),
      AlgoStep('Functional bowel disorder'),
    ]),
    AlgoSection('4 · Outpatient treatment', [
      AlgoStep('Appropriate where she is systemically well, tolerating oral '
          'intake, and there is no abscess'),
      AlgoStep('A regimen covering gonorrhoea, chlamydia and anaerobes per '
          'local and national protocol', critical: true),
      AlgoStep('Complete 14 days'),
      AlgoStep('Analgesia, and advise against intercourse until she and her '
          'partner have completed treatment'),
      AlgoStep('Review at 72 hours — failure to improve means admission',
          critical: true),
      AlgoStep('Remove an IUD only if there is no improvement, and provide '
          'alternative contraception'),
    ]),
    AlgoSection('5 · Inpatient and abscess management', [
      AlgoStep('Admit for sepsis, pregnancy, an abscess, inability to '
          'tolerate oral therapy, or failed outpatient treatment',
          critical: true),
      AlgoStep('Intravenous antibiotics, stepped down once afebrile for 24 '
          'hours'),
      AlgoStep('Tubo-ovarian abscess: antibiotics plus drainage — image-guided '
          'where possible, laparoscopic where not', critical: true),
      AlgoStep('Abscesses larger than about 7 cm rarely resolve on '
          'antibiotics alone'),
      AlgoStep('Surgery for rupture, peritonitis, or failure to respond',
          critical: true),
      AlgoStep('Conserve tubes and ovaries wherever the disease allows'),
    ]),
    AlgoSection('6 · Partner notification and follow-up', [
      AlgoStep('Contact tracing and partner treatment — without it she will '
          'be reinfected', critical: true),
      AlgoStep('Test of cure where gonorrhoea was identified'),
      AlgoStep('Counsel on the risk of tubal infertility, ectopic pregnancy '
          'and chronic pelvic pain — honestly, and once she is well enough to '
          'take it in', critical: true),
      AlgoStep('Full sexual health screen'),
      AlgoStep('Discuss barrier contraception'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 32 — Management of Acute Pelvic Inflammatory '
        'Disease.',
    'BASHH UK national guideline for the management of pelvic inflammatory '
        'disease.',
    'CDC Sexually Transmitted Infections Treatment Guidelines.',
    'NACO National Guidelines on Prevention, Management and Control of RTI '
        'and STI, India; FOGSI GCPR on pelvic inflammatory disease.',
  ],
);
