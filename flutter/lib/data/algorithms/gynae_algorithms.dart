import '../../models/algorithm.dart';

const kEctopicAlgorithm = Algorithm(
  id: 'algo-ectopic',
  name: 'Ectopic pregnancy',
  subtitle: 'Including ruptured ectopic',
  callFor: 'For a shocked woman: gynaecology registrar, anaesthetist, theatre '
      'and the blood bank, immediately.',
  timeTarget: 'A shocked woman with a positive pregnancy test goes to theatre. '
      'Imaging does not come first.',
  immediate: [
    AlgoStep('Any woman of reproductive age with abdominal pain gets a '
        'pregnancy test', critical: true),
    AlgoStep('If shocked: two large-bore cannulae, crossmatch 4–6 units, '
        'activate the massive haemorrhage protocol', critical: true),
    AlgoStep('Straight to theatre if she is haemodynamically unstable',
        critical: true),
    AlgoStep('If stable: serum hCG, full blood count, group and save, Rhesus '
        'status'),
    AlgoStep('Transvaginal ultrasound'),
    AlgoStep('delay laparotomy or laparoscopy for a scan in a shocked woman',
        avoid: true,
        detail: 'A negative or equivocal scan has never resuscitated anyone.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('Amenorrhoea, abdominal pain and vaginal bleeding — but the '
          'classic triad is present in a minority'),
      AlgoStep('Unilateral pelvic pain, often preceding the bleeding'),
      AlgoStep('Shoulder-tip pain, syncope, or pain on defaecation suggest '
          'haemoperitoneum', critical: true),
      AlgoStep('Collapse, tachycardia and hypotension mean rupture until '
          'proven otherwise', critical: true),
      AlgoStep('Cervical excitation, adnexal tenderness, adnexal mass'),
      AlgoStep('Diarrhoea and vomiting are common and frequently misattributed '
          'to gastroenteritis', critical: true),
    ]),
    AlgoSection('2 · Risk factors', [
      AlgoStep('Previous ectopic pregnancy — the strongest single factor'),
      AlgoStep('Previous tubal surgery, including sterilisation and reversal'),
      AlgoStep('Pelvic inflammatory disease; chlamydial infection'),
      AlgoStep('Assisted reproduction, particularly IVF — which also raises the '
          'risk of heterotopic pregnancy'),
      AlgoStep('Intrauterine device in situ',
          detail: 'A device lowers absolute risk of any pregnancy, but a '
              'pregnancy that occurs with one in place is more likely to be '
              'ectopic.'),
      AlgoStep('Smoking; endometriosis; increasing maternal age'),
      AlgoStep('A third of women have no risk factor at all', critical: true),
    ]),
    AlgoSection('3 · Investigations', [
      AlgoStep('Urine or serum hCG — qualitative first, then quantitative'),
      AlgoStep('Transvaginal ultrasound is the diagnostic test of choice'),
      AlgoStep('Full blood count, group and save, Rhesus status'),
      AlgoStep('Crossmatch where surgery is likely'),
      AlgoStep('Serum progesterone where the location is unknown — a low value '
          'suggests a failing pregnancy'),
    ]),
    AlgoSection('4 · Ultrasound findings', [
      AlgoStep('Empty uterus with an adnexal mass separate from the ovary'),
      AlgoStep('Tubal ring or "bagel" sign; a "blob" sign adjacent to the ovary'),
      AlgoStep('Free fluid in the pouch of Douglas — echogenic fluid suggests '
          'blood', critical: true),
      AlgoStep('Yolk sac or embryo within an extrauterine sac is diagnostic'),
      AlgoStep('A pseudosac is centrally placed and is not a gestational sac',
          detail: 'Do not be reassured by it.'),
      AlgoStep('Discriminatory zone: an intrauterine sac should be visible on '
          'transvaginal scan by an hCG of about 1500–2000 IU/L'),
      AlgoStep('Pregnancy of unknown location means a positive test with no '
          'pregnancy seen anywhere — it needs serial hCG, not reassurance',
          critical: true),
    ]),
    AlgoSection('5 · hCG interpretation', [
      AlgoStep('A viable intrauterine pregnancy typically rises by at least '
          '63–66% in 48 hours'),
      AlgoStep('A suboptimal rise, a plateau, or a slow fall is the pattern of '
          'an ectopic', critical: true),
      AlgoStep('A fall of more than 50% in 48 hours suggests a failing '
          'pregnancy, but does not exclude an ectopic'),
      AlgoStep('hCG level does not indicate ectopic size or rupture risk',
          critical: true,
          detail: 'Tubes rupture at low levels. Treat the woman, not the number.'),
    ]),
    AlgoSection('6 · Expectant management', [
      AlgoStep('Only where she is clinically stable and pain-free'),
      AlgoStep('hCG below about 1000–1500 IU/L and falling'),
      AlgoStep('No fetal cardiac activity; mass under 35 mm; no significant '
          'free fluid'),
      AlgoStep('She must be able to attend for follow-up and understand the '
          'warning signs'),
      AlgoStep('Serial hCG until it is below 20 IU/L'),
    ]),
    AlgoSection('7 · Methotrexate', [
      AlgoStep('50 mg/m² intramuscularly, single dose', critical: true),
      AlgoStep('Criteria: haemodynamically stable, hCG below 5000 IU/L, mass '
          'under 35 mm, no fetal cardiac activity, no significant '
          'haemoperitoneum, able to attend follow-up'),
      AlgoStep('Contraindicated in breastfeeding, immunodeficiency, hepatic or '
          'renal impairment, blood dyscrasia, active pulmonary disease, peptic '
          'ulcer disease', critical: true),
      AlgoStep('Baseline full blood count, liver and renal function'),
      AlgoStep('Measure hCG on days 4 and 7 — expect a fall of at least 15% '
          'between them, otherwise give a second dose', critical: true),
      AlgoStep('Then weekly hCG until below 20 IU/L'),
      AlgoStep('Separation pain around days 3–7 is common; new severe pain or '
          'instability means rupture'),
      AlgoStep('Avoid conception for 3 months; avoid folate supplements, '
          'NSAIDs, alcohol and sun exposure'),
      AlgoStep('give methotrexate where the location is still unknown',
          avoid: true,
          detail: 'You may be treating a wanted intrauterine pregnancy.'),
    ]),
    AlgoSection('8 · Surgical management', [
      AlgoStep('Laparoscopy is preferred over laparotomy where the woman is '
          'stable and the skills are available'),
      AlgoStep('SALPINGECTOMY where the contralateral tube is healthy',
          critical: true),
      AlgoStep('SALPINGOTOMY where the contralateral tube is absent or damaged',
          detail: 'Persistent trophoblast occurs in 5–20% — hCG follow-up is '
              'mandatory afterwards.'),
      AlgoStep('Laparotomy for haemodynamic instability, extensive '
          'haemoperitoneum, or where laparoscopy is not feasible'),
      AlgoStep('Anti-D 250 IU (50 µg) for Rhesus-negative women having surgical '
          'management'),
    ]),
    AlgoSection('9 · Non-tubal and atypical sites', [
      AlgoStep('INTERSTITIAL — in the intramural segment of the tube. Presents '
          'later and bleeds catastrophically', critical: true,
          detail: '"Cornual" is often used loosely for this; strictly, cornual '
              'pregnancy is implantation in the horn of a unicornuate or '
              'bicornuate uterus. Use the precise term.'),
      AlgoStep('CERVICAL — barrel-shaped cervix, sac below the internal os. '
          'High haemorrhage risk; avoid blind curettage', critical: true),
      AlgoStep('CAESAREAN SCAR — implantation in the niche of a previous scar. '
          'Rising incidence; risk of rupture and of morbidly adherent '
          'placenta if it continues'),
      AlgoStep('OVARIAN — usually diagnosed at surgery'),
      AlgoStep('ABDOMINAL — rare, high mortality; the placenta is usually left '
          'in situ'),
      AlgoStep('HETEROTOPIC — a coexisting intrauterine and ectopic pregnancy. '
          'Much commoner after assisted reproduction. Finding an intrauterine '
          'pregnancy does not exclude an ectopic in an IVF pregnancy',
          critical: true),
      AlgoStep('All of these need specialist input and, often, a multi-'
          'disciplinary plan including interventional radiology'),
    ]),
    AlgoSection('10 · Follow-up', [
      AlgoStep('hCG to a non-pregnant level after medical or conservative '
          'surgical management'),
      AlgoStep('Anti-D where indicated'),
      AlgoStep('Contraceptive advice; treat any identified infection and '
          'screen for chlamydia'),
      AlgoStep('Counsel on recurrence — roughly 10–20% — and arrange an early '
          'scan at 6–7 weeks in the next pregnancy', critical: true),
      AlgoStep('Offer emotional support; this is a bereavement as well as an '
          'emergency'),
    ]),
  ],
  sources: [
    'NICE NG126 — Ectopic pregnancy and miscarriage: diagnosis and initial '
        'management.',
    'RCOG Green-top Guideline 21 — Diagnosis and Management of Ectopic '
        'Pregnancy.',
    'ACOG Practice Bulletin 193 — Tubal Ectopic Pregnancy.',
    'FOGSI GCPR — Early Pregnancy Complications.',
  ],
);

const kOvarianTorsionAlgorithm = Algorithm(
  id: 'algo-ovarian-torsion',
  name: 'Ovarian torsion',
  subtitle: 'A clinical and surgical diagnosis',
  callFor: 'Gynaecology registrar and theatre. Involve a senior early — the '
      'decision to operate is time-critical and is often deferred by junior '
      'staff waiting for imaging.',
  timeTarget: 'Ovarian salvage falls with every hour of delay. Aim for theatre '
      'within hours, not the following list.',
  immediate: [
    AlgoStep('Pregnancy test in every woman of reproductive age',
        critical: true),
    AlgoStep('Analgesia — do not withhold opiates for fear of masking signs'),
    AlgoStep('IV access, keep her nil by mouth, antiemetic'),
    AlgoStep('Urgent transvaginal or transabdominal ultrasound with Doppler'),
    AlgoStep('Urgent senior gynaecology review with a view to laparoscopy',
        critical: true),
    AlgoStep('exclude torsion because Doppler flow is present', avoid: true,
        detail: 'The ovary has a dual blood supply from the ovarian and '
            'uterine arteries. Flow persists in up to 60% of confirmed '
            'torsions. This is the single commonest reason the diagnosis is '
            'missed.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('Sudden-onset severe unilateral pelvic pain, often colicky and '
          'radiating to the flank or thigh'),
      AlgoStep('Nausea and vomiting in about 70%', critical: true),
      AlgoStep('A palpable or sonographic adnexal mass'),
      AlgoStep('Intermittent pain over days or weeks suggests torsion and '
          'spontaneous detorsion — it is not reassurance', critical: true),
      AlgoStep('Low-grade fever and a mild leucocytosis are common and suggest '
          'necrosis rather than infection'),
      AlgoStep('Peritonism is a late sign'),
    ]),
    AlgoSection('2 · Risk factors', [
      AlgoStep('An ovarian cyst or mass, especially above 5 cm — dermoids are '
          'classic'),
      AlgoStep('Ovulation induction and ovarian hyperstimulation syndrome',
          critical: true),
      AlgoStep('Pregnancy — particularly the first trimester and after assisted '
          'conception'),
      AlgoStep('Previous torsion — recurrence is significant'),
      AlgoStep('Previous tubal ligation'),
      AlgoStep('A long utero-ovarian ligament, which is why it also occurs in '
          'children with normal ovaries'),
      AlgoStep('Malignancy makes torsion LESS likely — malignant masses adhere '
          'rather than twist'),
    ]),
    AlgoSection('3 · Investigations', [
      AlgoStep('Pregnancy test — always'),
      AlgoStep('Full blood count, CRP, urea and electrolytes, group and save'),
      AlgoStep('Urinalysis — to look for an alternative diagnosis'),
      AlgoStep('Ultrasound with Doppler'),
      AlgoStep('Tumour markers only if a mass will be removed and malignancy is '
          'a genuine concern — never let them delay theatre'),
    ]),
    AlgoSection('4 · Ultrasound findings', [
      AlgoStep('Unilaterally enlarged, oedematous ovary — the most consistent '
          'finding', critical: true),
      AlgoStep('Peripherally displaced follicles — the "string of pearls" sign'),
      AlgoStep('Whirlpool sign of the twisted vascular pedicle — highly '
          'specific where seen'),
      AlgoStep('Free pelvic fluid'),
      AlgoStep('An underlying cyst or mass'),
      AlgoStep('NORMAL DOPPLER FLOW DOES NOT EXCLUDE TORSION', critical: true),
      AlgoStep('Absent venous flow with preserved arterial flow is an early '
          'finding — veins collapse first'),
    ]),
    AlgoSection('5 · Differential diagnosis', [
      AlgoStep('Ectopic pregnancy — exclude with a pregnancy test first'),
      AlgoStep('Ruptured or haemorrhagic ovarian cyst'),
      AlgoStep('Appendicitis — the commonest misdiagnosis in right-sided pain'),
      AlgoStep('Pelvic inflammatory disease and tubo-ovarian abscess'),
      AlgoStep('Renal or ureteric colic'),
      AlgoStep('Degenerating or torted fibroid'),
      AlgoStep('Diverticulitis; inflammatory bowel disease'),
      AlgoStep('Tubal torsion — same management'),
    ]),
    AlgoSection('6 · Definitive treatment', [
      AlgoStep('Emergency laparoscopy — diagnostic and therapeutic',
          critical: true),
      AlgoStep('DETORSION AND CONSERVATION, not oophorectomy', critical: true,
          detail: 'Even a black, dusky, apparently necrotic ovary usually '
              'recovers function. Untwist it and look again.'),
      AlgoStep('The historical fear that detorsion causes thromboembolism is '
          'not supported by evidence, and has cost a great many ovaries',
          critical: true),
      AlgoStep('Cystectomy at the same operation where a cyst is present and '
          'the tissue planes allow; otherwise plan an interval procedure once '
          'the oedema settles'),
      AlgoStep('Oophorectomy only for a frankly necrotic, non-viable ovary, or '
          'a mass suspicious for malignancy in a postmenopausal woman'),
      AlgoStep('Oophoropexy — consider after recurrent torsion, or torsion of a '
          'normal ovary, particularly in children'),
      AlgoStep('perform oophorectomy on appearance alone in a young woman',
          avoid: true),
    ]),
    AlgoSection('7 · Torsion in pregnancy', [
      AlgoStep('Commonest in the first trimester and after ovulation induction'),
      AlgoStep('Laparoscopy is safe in pregnancy in experienced hands, at any '
          'trimester'),
      AlgoStep('Open-entry technique and adjusted port placement for the gravid '
          'uterus'),
      AlgoStep('Give tocolysis and corticosteroids as gestation dictates'),
      AlgoStep('Delaying surgery risks the pregnancy more than operating does',
          critical: true),
    ]),
    AlgoSection('8 · Follow-up', [
      AlgoStep('Histology on anything removed'),
      AlgoStep('Ultrasound at 6–12 weeks to confirm ovarian recovery'),
      AlgoStep('Counsel on recurrence and on the warning symptoms'),
      AlgoStep('Fertility reassurance — a conserved ovary usually regains '
          'function, and the contralateral ovary compensates'),
      AlgoStep('Review ovulation induction protocols where torsion followed '
          'stimulation'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 62 — Management of Suspected Ovarian Masses in '
        'Premenopausal Women.',
    'ACOG Committee Opinion 783 — Adnexal Torsion in Adolescents.',
    'ESHRE / ESGE guidance on management of adnexal torsion.',
    'Huang C et al. Adnexal torsion: diagnosis and conservative management. '
        'Best Pract Res Clin Obstet Gynaecol.',
  ],
);

const kAfeAlgorithm = Algorithm(
  id: 'algo-afe',
  name: 'Amniotic fluid embolism',
  subtitle: 'Sudden collapse · DIC · a diagnosis of exclusion',
  callFor: 'Cardiac arrest call, obstetrics, anaesthetics, intensive care, '
      'haematology, blood bank and neonatology. Declare a massive haemorrhage '
      'call at the same time.',
  timeTarget: 'The coagulopathy arrives within minutes of the collapse. Ask '
      'for blood products before the results come back.',
  immediate: [
    AlgoStep('Call for help; start resuscitation', critical: true),
    AlgoStep('Airway, high-flow oxygen, early intubation'),
    AlgoStep('Manual left uterine displacement if she is still pregnant',
        critical: true),
    AlgoStep('Two large-bore cannulae above the diaphragm; crossmatch 6 units'),
    AlgoStep('Activate the massive haemorrhage protocol before the coagulation '
        'results return', critical: true,
        detail: 'DIC follows the collapse within minutes in most cases.'),
    AlgoStep('Resuscitative hysterotomy at 4 minutes if there is no return of '
        'circulation', critical: true),
    AlgoStep('wait for a confirmatory test', avoid: true,
        detail: 'There is none. This is a clinical diagnosis of exclusion, '
            'made and treated at the same moment.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('Sudden cardiovascular collapse, usually during labour, at '
          'delivery, or within 30 minutes of birth', critical: true),
      AlgoStep('Acute hypoxia — dyspnoea, cyanosis, respiratory arrest'),
      AlgoStep('Hypotension out of proportion to any blood loss'),
      AlgoStep('Disseminated intravascular coagulation, often the dominant '
          'feature', critical: true),
      AlgoStep('Seizures in up to half of cases; agitation, a sense of '
          'impending doom'),
      AlgoStep('Fetal bradycardia'),
      AlgoStep('It may present as coagulopathy first, with bleeding that will '
          'not stop and no obvious surgical cause', critical: true),
    ]),
    AlgoSection('2 · Differential diagnosis', [
      AlgoStep('Pulmonary embolism'),
      AlgoStep('Haemorrhage with hypovolaemic shock — usually the first thing '
          'to exclude'),
      AlgoStep('Eclampsia'),
      AlgoStep('Anaphylaxis'),
      AlgoStep('Total spinal or high regional block'),
      AlgoStep('Local anaesthetic systemic toxicity'),
      AlgoStep('Myocardial infarction; aortic dissection; peripartum '
          'cardiomyopathy'),
      AlgoStep('Sepsis'),
      AlgoStep('Air or fat embolism; transfusion reaction'),
      AlgoStep('Diagnosis is clinical and by exclusion. Fetal squames in the '
          'maternal circulation are neither sensitive nor specific and have no '
          'role in acute management', critical: true),
    ]),
    AlgoSection('3 · Resuscitation', [
      AlgoStep('Standard adult advanced life support, with the pregnancy '
          'modifications'),
      AlgoStep('Early intubation and ventilation with high FiO₂'),
      AlgoStep('Manual left uterine displacement until delivered'),
      AlgoStep('Resuscitative hysterotomy by 5 minutes if no ROSC',
          critical: true),
      AlgoStep('Vasopressors and inotropes — noradrenaline, and dobutamine or '
          'milrinone for right ventricular failure'),
      AlgoStep('Bedside echocardiography — right ventricular failure dominates '
          'the early phase', critical: true),
      AlgoStep('Avoid fluid overload; the failing right ventricle will not '
          'tolerate it', critical: true),
      AlgoStep('Consider extracorporeal membrane oxygenation where available'),
    ]),
    AlgoSection('4 · Coagulopathy and transfusion', [
      AlgoStep('Give red cells, fresh frozen plasma and platelets in a 1:1:1 '
          'ratio, early and empirically', critical: true),
      AlgoStep('Cryoprecipitate or fibrinogen concentrate for fibrinogen below '
          '2 g/L — expect it to be very low'),
      AlgoStep('Tranexamic acid 1 g IV'),
      AlgoStep('Point-of-care viscoelastic testing to guide further products '
          'where available'),
      AlgoStep('Recombinant factor VIIa only as a last resort, after '
          'haematology discussion — it carries a significant thrombotic risk'),
      AlgoStep('Uterine atony is usual; treat it with the full uterotonic '
          'ladder and escalate early to tamponade and surgery'),
    ]),
    AlgoSection('5 · Multidisciplinary response', [
      AlgoStep('One person leads and is not doing procedures'),
      AlgoStep('A dedicated scribe records times, drugs and products'),
      AlgoStep('A runner for the blood bank; a named contact in haematology'),
      AlgoStep('Neonatal team for the baby; a separate person to look after '
          'the partner'),
      AlgoStep('Early intensive care involvement and transfer'),
    ]),
    AlgoSection('6 · Post-resuscitation & follow-up', [
      AlgoStep('Intensive care; anticipate acute kidney injury, ARDS and '
          'hypoxic brain injury'),
      AlgoStep('Thromboprophylaxis once the coagulopathy is corrected'),
      AlgoStep('Full team debrief — mortality remains high and the event is '
          'traumatic for everyone present'),
      AlgoStep('Report to the national registry or confidential enquiry'),
      AlgoStep('Explain events to the woman or her family; offer psychological '
          'support'),
      AlgoStep('Recurrence in a future pregnancy has been reported but is '
          'rare; counsel with a specialist'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 56 — Maternal Collapse in Pregnancy and the '
        'Puerperium.',
    'SMFM Clinical Guideline 9 — Amniotic fluid embolism: diagnosis and '
        'management. Am J Obstet Gynecol 2016;215:B16–B24.',
    'UK Obstetric Surveillance System (UKOSS) amniotic fluid embolism study.',
    'MBRRACE-UK — Saving Lives, Improving Mothers’ Care.',
  ],
);
