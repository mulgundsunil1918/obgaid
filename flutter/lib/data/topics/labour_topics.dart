import '../../models/topic.dart';

const kInductionTopic = ClinicalTopic(
  id: 'induction',
  name: 'Induction of labour',
  subtitle: 'Methods · oxytocin · tachysystole',
  headline: 'The Bishop score decides the method, not whether to induce. An '
      'unfavourable cervix needs ripening first; going straight to amniotomy '
      'and oxytocin on a closed cervix is how inductions fail.',
  keyFacts: [
    ('Favourable cervix', 'Bishop ≥ 8'),
    ('Needs ripening', 'Bishop ≤ 6'),
    ('Dinoprostone pessary', '10 mg controlled-release over 24 hours'),
    ('Misoprostol', '25 µg vaginally 4-hourly, or 25 µg orally 2-hourly'),
    ('Foley balloon', '30 – 60 mL, up to 12 – 24 hours'),
    ('Oxytocin start', '1 – 2 mU/min, increase every 30 minutes'),
    ('Target contractions', '4 – 5 in 10 minutes'),
    ('Tachysystole', '> 5 in 10 minutes over 30 minutes'),
  ],
  sections: [
    TopicSection('Indications', [
      TopicPoint('Prolonged pregnancy — offer between 41+0 and 42+0 weeks'),
      TopicPoint('Prelabour rupture of membranes at term'),
      TopicPoint('Hypertensive disease and pre-eclampsia'),
      TopicPoint('Diabetes — pre-existing or gestational'),
      TopicPoint('Fetal growth restriction, with the timing set by Doppler'),
      TopicPoint('Reduced fetal movements with other concern'),
      TopicPoint('Obstetric cholestasis'),
      TopicPoint('Twin pregnancy at term'),
      TopicPoint('Intrauterine death'),
      TopicPoint('Maternal request, after counselling about the trade-offs'),
      TopicPoint('The ARRIVE trial found elective induction at 39 weeks in '
          'low-risk nulliparous women reduced caesarean rates without '
          'increasing adverse perinatal outcome.'),
    ]),
    TopicSection('Contraindications', [
      TopicPoint('Placenta praevia or vasa praevia', critical: true),
      TopicPoint('Transverse or oblique lie'),
      TopicPoint('Cord prolapse or cord presentation'),
      TopicPoint('Previous classical or inverted-T caesarean incision',
          critical: true),
      TopicPoint('Previous uterine rupture'),
      TopicPoint('Active primary genital herpes'),
      TopicPoint('Invasive cervical carcinoma'),
      TopicPoint('Any other contraindication to vaginal birth'),
    ]),
    TopicSection('Membrane sweep', [
      TopicPoint('Offer at the 40-week visit for nulliparous women and at 41 '
          'weeks for parous women'),
      TopicPoint('Reduces the need for formal induction'),
      TopicPoint('Warn about discomfort and light bleeding'),
      TopicPoint('Not a form of induction — it is an adjunct offered before one'),
    ]),
    TopicSection('Pharmacological ripening', [
      TopicPoint('DINOPROSTONE (PGE2) — vaginal gel 1–2 mg, or a 10 mg '
          'controlled-release pessary over 24 hours'),
      TopicPoint('MISOPROSTOL (PGE1) — 25 µg vaginally every 4 hours, or 25 µg '
          'orally every 2 hours',
          detail: 'Cheaper, heat-stable and effective, which is why it is the '
              'mainstay in much of India. Higher doses cause tachysystole.'),
      TopicPoint('use prostaglandins for induction after a previous '
          'caesarean', avoid: true,
          detail: 'They raise the risk of uterine rupture two- to threefold.'),
      TopicPoint('Continuous or intermittent CTG after insertion, per local '
          'protocol'),
      TopicPoint('Remove the pessary if tachysystole or a non-reassuring trace '
          'develops', critical: true),
    ]),
    TopicSection('Mechanical methods', [
      TopicPoint('Foley catheter with the balloon inflated to 30–60 mL above '
          'the internal os, left up to 12–24 hours'),
      TopicPoint('Double-balloon catheters are an alternative'),
      TopicPoint('Lower risk of tachysystole than prostaglandins',
          critical: true),
      TopicPoint('Preferred method where there is a previous caesarean scar',
          critical: true),
      TopicPoint('Can be used as an outpatient in selected women'),
      TopicPoint('Contraindicated with ruptured membranes, low-lying placenta '
          'or active infection'),
    ]),
    TopicSection('Amniotomy and oxytocin', [
      TopicPoint('Amniotomy once the cervix is favourable'),
      TopicPoint('perform amniotomy with a high presenting part', avoid: true,
          detail: 'It is the commonest iatrogenic cause of cord prolapse.'),
      TopicPoint('Start oxytocin at 1–2 mU/min and increase every 30 minutes'),
      TopicPoint('Maximum 20 mU/min in most protocols; some allow up to 32'),
      TopicPoint('Aim for 4–5 contractions in 10 minutes, each lasting 40–60 '
          'seconds'),
      TopicPoint('Continuous electronic fetal monitoring throughout',
          critical: true),
      TopicPoint('Reassess before increasing — a woman contracting adequately '
          'does not need more oxytocin'),
    ]),
    TopicSection('Tachysystole and hyperstimulation', [
      TopicPoint('Tachysystole: more than 5 contractions in 10 minutes '
          'averaged over 30 minutes'),
      TopicPoint('Hyperstimulation: tachysystole with a non-reassuring fetal '
          'heart rate', critical: true),
      TopicPoint('Stop or halve the oxytocin infusion'),
      TopicPoint('Remove the prostaglandin pessary'),
      TopicPoint('Turn her into the left lateral position; give intravenous '
          'fluid'),
      TopicPoint('Acute tocolysis — terbutaline 250 µg subcutaneously'),
      TopicPoint('Exclude abruption and uterine rupture', critical: true),
    ]),
    TopicSection('Failed induction and complications', [
      TopicPoint('Define failure before starting, and document the plan'),
      TopicPoint('Reassess after a full ripening cycle; a second cycle is '
          'often reasonable'),
      TopicPoint('Uterine rupture — the risk that dominates in a scarred '
          'uterus', critical: true),
      TopicPoint('Cord prolapse at amniotomy'),
      TopicPoint('Chorioamnionitis with prolonged rupture'),
      TopicPoint('Postpartum haemorrhage — a long induction fatigues the '
          'myometrium', critical: true),
      TopicPoint('Higher rates of instrumental delivery and of maternal '
          'dissatisfaction; counsel about both beforehand'),
    ]),
  ],
  sources: [
    'NICE NG207 — Inducing labour (2021).',
    'ACOG Practice Bulletin 107 — Induction of Labor.',
    'WHO recommendations: induction of labour at or beyond term.',
    'Grobman WA et al. ARRIVE trial. N Engl J Med 2018;379:513–523.',
    'FOGSI GCPR — Induction of Labour.',
  ],
);

const kVbacTopic = ClinicalTopic(
  id: 'vbac',
  name: 'VBAC / TOLAC',
  subtitle: 'Eligibility · success · rupture risk',
  headline: 'Roughly three in four women who attempt vaginal birth after one '
      'caesarean achieve it. The counselling that matters is not the success '
      'rate but the absolute rupture risk — about 1 in 200 in spontaneous '
      'labour — and the fact that a unit must be able to deliver her within '
      'minutes if it happens.',
  keyFacts: [
    ('Overall success', '60 – 80%'),
    ('After a previous vaginal birth', 'Up to 85 – 90%'),
    ('Uterine rupture, spontaneous labour', '~0.5% (1 in 200)'),
    ('Uterine rupture, induced labour', '2 – 3 times higher'),
    ('Rupture with elective repeat caesarean', '~0.02%'),
    ('Perinatal death in TOLAC', '~0.04%'),
    ('Hypoxic-ischaemic encephalopathy', '~0.08%'),
  ],
  sections: [
    TopicSection('Who may attempt it', [
      TopicPoint('One previous low transverse caesarean, with a singleton '
          'cephalic pregnancy at term'),
      TopicPoint('Two previous caesareans — possible after careful counselling '
          'in an appropriate unit'),
      TopicPoint('Previous caesarean with an unknown scar type is usually '
          'acceptable unless a classical incision is likely'),
      TopicPoint('Twin pregnancy with a cephalic leading twin — reasonable in '
          'selected women'),
    ]),
    TopicSection('Contraindications', [
      TopicPoint('Previous classical or inverted-T uterine incision',
          critical: true),
      TopicPoint('Previous uterine rupture', critical: true),
      TopicPoint('Previous extensive transfundal surgery, such as myomectomy '
          'breaching the cavity'),
      TopicPoint('Any other contraindication to vaginal birth — praevia, '
          'transverse lie'),
      TopicPoint('Three or more previous caesareans — a relative '
          'contraindication'),
      TopicPoint('A unit unable to provide immediate caesarean, continuous '
          'monitoring and blood', critical: true),
    ]),
    TopicSection('Predictors of success', [
      TopicPoint('A previous vaginal birth, and especially a previous '
          'successful VBAC', critical: true),
      TopicPoint('Spontaneous onset of labour'),
      TopicPoint('A favourable cervix on admission'),
      TopicPoint('A non-recurrent indication for the previous caesarean — '
          'breech, fetal distress'),
      TopicPoint('Maternal age under 40'),
      TopicPoint('BMI below 30'),
    ]),
    TopicSection('Predictors of failure', [
      TopicPoint('Induction of labour'),
      TopicPoint('No previous vaginal birth'),
      TopicPoint('Previous caesarean for dystocia or failure to progress'),
      TopicPoint('BMI above 30'),
      TopicPoint('Maternal age above 40'),
      TopicPoint('Gestation beyond 40 weeks'),
      TopicPoint('Estimated fetal weight above 4000 g'),
      TopicPoint('Short interdelivery interval — under 12–24 months'),
    ]),
    TopicSection('Recognising rupture', [
      TopicPoint('An abnormal CTG is the commonest and earliest sign — usually '
          'a prolonged bradycardia', critical: true),
      TopicPoint('Constant abdominal pain between contractions, or scar '
          'tenderness'),
      TopicPoint('Breakthrough pain in a woman with a working epidural',
          critical: true),
      TopicPoint('Cessation of contractions'),
      TopicPoint('Loss of station — the presenting part recedes'),
      TopicPoint('Fresh vaginal bleeding or haematuria'),
      TopicPoint('Maternal tachycardia and hypotension'),
    ]),
    TopicSection('Conducting the labour', [
      TopicPoint('Deliver in a unit with immediate access to caesarean and to '
          'blood', critical: true),
      TopicPoint('Continuous electronic fetal monitoring from the onset of '
          'established labour', critical: true),
      TopicPoint('Intravenous access and a group and save on admission'),
      TopicPoint('Epidural analgesia is not contraindicated — it does not mask '
          'rupture, and breakthrough pain through a working epidural is itself '
          'a warning sign'),
      TopicPoint('Oxytocin augmentation is permissible but raises rupture '
          'risk; use it cautiously and with senior involvement',
          critical: true),
      TopicPoint('Have a low threshold for reassessment where progress is slow'),
    ]),
    TopicSection('Induction in a scarred uterus', [
      TopicPoint('Mechanical methods — Foley catheter — are preferred',
          critical: true),
      TopicPoint('use prostaglandins, and misoprostol in particular',
          avoid: true,
          detail: 'Prostaglandin induction raises rupture risk two- to '
              'threefold; misoprostol is the highest risk of all.'),
      TopicPoint('Amniotomy with cautious oxytocin where the cervix is '
          'favourable'),
      TopicPoint('Counsel explicitly that induction lowers the chance of '
          'success and raises the chance of rupture', critical: true),
    ]),
    TopicSection('Counselling', [
      TopicPoint('Present absolute numbers, not relative risks'),
      TopicPoint('Cover the benefits of VBAC: shorter recovery, fewer '
          'complications in future pregnancies, avoidance of surgical risk'),
      TopicPoint('Cover the benefits of elective repeat caesarean: near-'
          'elimination of rupture risk, planned timing, and no risk of an '
          'emergency caesarean in labour, which carries the highest morbidity '
          'of the three routes'),
      TopicPoint('Cover the risks of accumulating caesareans — placenta '
          'praevia, accreta spectrum, adhesions, hysterectomy',
          critical: true),
      TopicPoint('Document the discussion and the decision, and revisit it if '
          'circumstances change'),
      TopicPoint('Her choice is decisive. Support a woman who declines VBAC, '
          'and support one who wants it against the odds — with an honest '
          'account of what her unit can and cannot provide.'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 45 — Birth After Previous Caesarean Birth.',
    'ACOG Practice Bulletin 205 — Vaginal Birth After Cesarean Delivery.',
    'NICE NG192 — Caesarean birth.',
    'Landon MB et al. Maternal and perinatal outcomes associated with a trial '
        'of labor after prior cesarean delivery. N Engl J Med '
        '2004;351:2581–2589.',
    'FOGSI GCPR — Vaginal Birth After Caesarean.',
  ],
);

const kCaesareanTopic = ClinicalTopic(
  id: 'caesarean',
  name: 'Caesarean section',
  subtitle: 'Urgency categories · technique · complications',
  headline: 'Antibiotics before skin incision, not after cord clamping. That '
      'single change halves maternal infectious morbidity, and it is still the '
      'most commonly omitted step in the checklist.',
  keyFacts: [
    ('Category 1', 'Immediate threat to life — deliver within 30 minutes'),
    ('Category 2', 'Compromise, not immediately life-threatening — 75 minutes'),
    ('Category 3', 'Needs early delivery, no compromise'),
    ('Category 4', 'Elective, at a time to suit'),
    ('Elective timing', '39 weeks or later'),
    ('Antibiotic prophylaxis', 'Cefazolin 2 g before skin incision'),
    ('Bladder injury', '~0.1%'),
    ('Ureteric injury', '~0.03%'),
  ],
  sections: [
    TopicSection('Classification of urgency', [
      TopicPoint('CATEGORY 1 — immediate threat to the life of the woman or '
          'fetus. Decision-to-delivery within 30 minutes.', critical: true,
          detail: 'Cord prolapse, uterine rupture, prolonged bradycardia, '
              'scalp pH below 7.20, major abruption.'),
      TopicPoint('CATEGORY 2 — maternal or fetal compromise that is not '
          'immediately life-threatening. Within 75 minutes.'),
      TopicPoint('CATEGORY 3 — needs early delivery but no compromise.'),
      TopicPoint('CATEGORY 4 — elective, at a time to suit the woman and the '
          'team.'),
      TopicPoint('The interval is an audit standard, not a target to be met at '
          'the cost of safe anaesthesia', critical: true),
      TopicPoint('Record the Robson group for every caesarean — it is what '
          'makes rates comparable between units'),
    ]),
    TopicSection('Preoperative preparation', [
      TopicPoint('Antibiotic prophylaxis BEFORE skin incision', critical: true,
          detail: 'Cefazolin 2 g (3 g above 120 kg). Add azithromycin 500 mg '
              'for non-elective caesarean. Giving it after cord clamping is '
              'the older practice and is inferior.'),
      TopicPoint('Aspiration prophylaxis — H2 antagonist or proton pump '
          'inhibitor, with metoclopramide'),
      TopicPoint('VTE risk assessment; graduated compression stockings; '
          'low-molecular-weight heparin postoperatively'),
      TopicPoint('Group and save; crossmatch where praevia, accreta or anaemia '
          'is present'),
      TopicPoint('Elective caesarean at 39 weeks or later', critical: true,
          detail: 'Earlier delivery increases neonatal respiratory morbidity. '
              'Give corticosteroids if delivering before 39 weeks for a '
              'clinical reason.'),
      TopicPoint('WHO surgical safety checklist, with the obstetric additions'),
      TopicPoint('Confirm presentation with ultrasound in theatre before '
          'starting'),
    ]),
    TopicSection('Anaesthesia', [
      TopicPoint('Regional anaesthesia is preferred — spinal, epidural top-up '
          'or combined', critical: true,
          detail: 'It avoids the risks of general anaesthesia and lets her be '
              'awake for the birth.'),
      TopicPoint('General anaesthesia for extreme urgency, failed regional, '
          'maternal refusal, coagulopathy, or haemodynamic instability'),
      TopicPoint('Left lateral tilt or wedge until delivery'),
      TopicPoint('Prophylactic phenylephrine infusion to prevent spinal '
          'hypotension'),
      TopicPoint('Anticipate a difficult airway in every obstetric general '
          'anaesthetic', critical: true),
    ]),
    TopicSection('Surgical technique', [
      TopicPoint('Joel-Cohen incision is preferred over Pfannenstiel',
          detail: 'Shorter operating time, less blood loss, less postoperative '
              'pain and analgesia requirement.'),
      TopicPoint('Blunt extension of the uterine incision reduces blood loss'),
      TopicPoint('Deliver the placenta by controlled cord traction, not manual '
          'removal', critical: true,
          detail: 'Manual removal increases endometritis and blood loss.'),
      TopicPoint('Oxytocin 5 IU by slow intravenous injection after delivery'),
      TopicPoint('Double-layer uterine closure where future pregnancy is '
          'likely',
          detail: 'It may reduce the risk of scar dehiscence, though the '
              'CAESAR and CORONIS trials found no short-term difference.'),
      TopicPoint('close the visceral or parietal peritoneum routinely',
          avoid: true,
          detail: 'It lengthens the operation without benefit.'),
      TopicPoint('Close the subcutaneous layer where the depth exceeds 2 cm — '
          'it reduces wound breakdown'),
      TopicPoint('Deferred cord clamping for at least 60 seconds where the '
          'baby is well'),
    ]),
    TopicSection('The difficult caesarean', [
      TopicPoint('DEEPLY IMPACTED HEAD — the commonest difficulty at full '
          'dilatation', critical: true,
          detail: 'Options: an assistant pushing the head up vaginally; the '
              'reverse breech extraction (pull-through) technique; a '
              'Patwardhan approach; a fetal pillow. Extending the uterine '
              'incision late, under force, is what tears into the broad '
              'ligament.'),
      TopicPoint('FLOATING HEAD — consider a vertical uterine incision or '
              'internal podalic version'),
      TopicPoint('ADHESIONS — commonest after repeat caesarean. Sharp '
          'dissection, identify the bladder before opening.'),
      TopicPoint('PLACENTA ACCRETA SPECTRUM — suspect it with praevia plus a '
          'previous caesarean', critical: true,
          detail: 'Risk rises with each caesarean. Plan delivery at 34–36 '
              'weeks with a multidisciplinary team, interventional radiology '
              'where available, and consent for hysterectomy. Do not attempt '
              'to remove an adherent placenta.'),
      TopicPoint('force the placenta off in suspected accreta', avoid: true),
    ]),
    TopicSection('Complications', [
      TopicPoint('Haemorrhage — the commonest'),
      TopicPoint('Bladder injury, about 0.1%; higher with repeat caesarean '
          'and adhesions'),
      TopicPoint('Ureteric injury, about 0.03%; usually at the level of the '
          'uterine artery or with a broad ligament tear', critical: true),
      TopicPoint('Bowel injury'),
      TopicPoint('Infection — endometritis, wound, urinary tract'),
      TopicPoint('Venous thromboembolism'),
      TopicPoint('Adhesions, increasing with each operation'),
      TopicPoint('Neonatal — transient tachypnoea, and laceration in about 1–2%'),
      TopicPoint('Future pregnancy — praevia, accreta spectrum, rupture, '
          'stillbirth', critical: true),
    ]),
    TopicSection('Postoperative care', [
      TopicPoint('Early mobilisation, early oral intake, early catheter '
          'removal — the ERAS principles'),
      TopicPoint('Regular paracetamol and non-steroidal analgesia, sparing '
          'opioids'),
      TopicPoint('Low-molecular-weight heparin from 6–12 hours after surgery, '
          'timed around any epidural catheter', critical: true),
      TopicPoint('Observations hourly initially; watch for concealed '
          'intra-abdominal bleeding'),
      TopicPoint('Support breastfeeding — position matters more than usual '
          'after abdominal surgery'),
      TopicPoint('Wound review; warn about the signs of infection and of VTE '
          'before discharge'),
      TopicPoint('Debrief about the indication, and discuss the mode of '
          'delivery for a future pregnancy', critical: true),
    ]),
  ],
  sources: [
    'NICE NG192 — Caesarean birth (2021).',
    'RCOG Green-top Guideline 27a — Placenta Praevia and Placenta Accreta; '
        '27b — Vasa Praevia.',
    'ACOG Committee Opinion 761 — Cesarean Delivery on Maternal Request; '
        'Practice Bulletin 199 — Use of Prophylactic Antibiotics in Labor and '
        'Delivery.',
    'CORONIS Collaborative Group. Lancet 2013;382:234–248.',
    'Robson MS. Classification of caesarean sections. Fetal Matern Med Rev '
        '2001;12:23–39.',
    'FOGSI GCPR — Caesarean Section.',
  ],
);
