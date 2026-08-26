import '../../models/algorithm.dart';

const kBartholinAlgorithm = Algorithm(
  id: 'algo-bartholin',
  name: 'Bartholin abscess',
  subtitle: 'Incision alone recurs. Make a permanent opening.',
  callFor: 'Gynaecology registrar where she is septic, where the abscess is '
      'very large, or where she is over 40 and biopsy is needed.',
  timeTarget: 'Drain an abscess when it points. A woman in this much pain '
      'should not be waiting for an elective list.',
  immediate: [
    AlgoStep('Distinguish a CYST from an ABSCESS — a painless cyst needs no '
        'treatment', critical: true),
    AlgoStep('Assess for cellulitis, sepsis and necrotising infection',
        critical: true),
    AlgoStep('Adequate analgesia before any examination'),
    AlgoStep('Swab the cavity at drainage — including for gonorrhoea and '
        'chlamydia'),
    AlgoStep('perform simple incision and drainage alone', avoid: true,
        detail: 'Recurrence is high because the tract closes. Marsupialise, '
            'or place a Word catheter.'),
    AlgoStep('In a woman over 40 with a new Bartholin mass, BIOPSY the wall — '
        'carcinoma presents this way', critical: true),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('Unilateral swelling at the posterior introitus, at 4 or 8 '
          'o\'clock'),
      AlgoStep('A cyst is fluctuant and painless; an abscess is exquisitely '
          'tender, hot, and may point'),
      AlgoStep('Difficulty sitting, walking and having intercourse'),
      AlgoStep('Fever and cellulitis indicate spreading infection',
          critical: true),
      AlgoStep('Rapidly spreading erythema, crepitus, pain out of proportion '
          'or skin necrosis suggest necrotising fasciitis — a surgical '
          'emergency', critical: true),
    ]),
    AlgoSection('2 · Investigations', [
      AlgoStep('Swab of pus at drainage, for aerobes, anaerobes and '
          'gonorrhoea'),
      AlgoStep('Full sexual health screen offered'),
      AlgoStep('Blood glucose — recurrent or severe abscess may unmask '
          'diabetes', critical: true),
      AlgoStep('Histology of the cyst wall in any woman over 40, or where the '
          'lesion is solid, irregular or fixed', critical: true),
      AlgoStep('Imaging is not usually required'),
    ]),
    AlgoSection('3 · Differential', [
      AlgoStep('Bartholin cyst without infection'),
      AlgoStep('Skene duct cyst — anterior, beside the urethra'),
      AlgoStep('Vulval abscess or infected sebaceous cyst'),
      AlgoStep('Hidradenitis suppurativa'),
      AlgoStep('Vaginal wall cyst — Gartner duct'),
      AlgoStep('BARTHOLIN GLAND CARCINOMA — rare, and the reason for the age '
          'rule', critical: true),
      AlgoStep('Perineal Crohn disease'),
    ]),
    AlgoSection('4 · Procedure', [
      AlgoStep('WORD CATHETER: a small stab incision inside the hymenal ring, '
          'the balloon inflated with 2–3 mL, left in place for 4–6 weeks to '
          'epithelialise a tract', critical: true),
      AlgoStep('MARSUPIALISATION: incise, evacuate, break loculi, then suture '
          'the cyst wall to the vaginal epithelium, creating a permanent '
          'opening', critical: true),
      AlgoStep('Incise on the mucosal surface inside the hymenal ring, never '
          'on the skin', critical: true),
      AlgoStep('Send the wall for histology where indicated'),
      AlgoStep('Silver nitrate and alcohol sclerotherapy are alternatives '
          'with more pain and scarring'),
      AlgoStep('Excision of the gland is reserved for repeated recurrence or '
          'suspected malignancy — it bleeds and scars', critical: true),
    ]),
    AlgoSection('5 · Antibiotics and aftercare', [
      AlgoStep('Antibiotics are not needed for a simple drained abscess in a '
          'well woman'),
      AlgoStep('Give antibiotics for surrounding cellulitis, systemic '
          'features, immunosuppression, diabetes, pregnancy, or recurrent '
          'disease', critical: true),
      AlgoStep('Cover MRSA where locally prevalent, and treat gonorrhoea if '
          'identified'),
      AlgoStep('Sitz baths, analgesia, and advice to expect discharge around '
          'the catheter'),
      AlgoStep('Explain that the catheter must stay in for weeks — early '
          'removal is the commonest cause of recurrence', critical: true),
      AlgoStep('Review at 4–6 weeks for removal'),
    ]),
    AlgoSection('6 · Recurrence and follow-up', [
      AlgoStep('Recurrence after simple incision is common; after '
          'marsupialisation or a Word catheter it is much less so'),
      AlgoStep('Investigate for diabetes and immunosuppression after repeated '
          'episodes'),
      AlgoStep('Confirm the histology result and act on it', critical: true),
      AlgoStep('Partner notification where a sexually transmitted organism '
          'was found'),
      AlgoStep('Warn about dyspareunia and scarring after excision'),
    ]),
  ],
  sources: [
    'British Association of Dermatologists and BSSVD guidelines on vulval skin disorders (RCOG Green-top 58 is archived).',
    'Wechter ME et al. Management of Bartholin duct cysts and abscesses. '
        'Obstet Gynecol Surv 2009;64:395–404.',
    'ACOG Practice Bulletin 224 — Diagnosis and Management of Vulvar Skin '
        'Disorders.',
    'NACO National Guidelines on RTI/STI management; FOGSI GCPR — Vulval '
        'Disorders.',
  ],
);

const kVaginalForeignBodyAlgorithm = Algorithm(
  id: 'algo-vaginal-foreign-body',
  name: 'Vaginal foreign body',
  subtitle: 'The discharge that will not settle',
  callFor: 'Gynaecology registrar for retained objects that cannot be removed '
      'in clinic. SAFEGUARDING lead for any child, and for any adult where '
      'coercion is suspected.',
  timeTarget: 'A retained tampon causing systemic upset needs removal now — '
      'staphylococcal toxic shock progresses within hours.',
  immediate: [
    AlgoStep('Assess for TOXIC SHOCK SYNDROME: fever, hypotension, diffuse '
        'macular rash, vomiting, confusion', critical: true),
    AlgoStep('If toxic shock is suspected, REMOVE THE OBJECT, take cultures, '
        'give fluids and antibiotics, and call critical care',
        critical: true),
    AlgoStep('Speculum examination with good light'),
    AlgoStep('Swab and, where the object has been retained, treat infection'),
    AlgoStep('In a CHILD, do not examine digitally or with an adult speculum '
        '— examine under anaesthesia, and involve paediatrics and '
        'safeguarding', critical: true),
    AlgoStep('assume it was accidental without asking how it got there',
        avoid: true),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('Persistent offensive vaginal discharge, often blood-stained, '
          'that has not responded to treatment', critical: true),
      AlgoStep('The commonest object in adults is a retained tampon; also '
          'pessaries, condoms, and contraceptive rings'),
      AlgoStep('In children, small objects such as toilet tissue or beads — '
          'and offensive bloody discharge in a child is a foreign body until '
          'proven otherwise', critical: true),
      AlgoStep('Pelvic pain, dysuria, or urinary retention from pressure'),
      AlgoStep('A long-neglected pessary may erode into bladder or rectum',
          critical: true),
    ]),
    AlgoSection('2 · Assessment', [
      AlgoStep('Ask directly and privately how long it has been there'),
      AlgoStep('Speculum with good light; a retained tampon is often high in '
          'a fornix'),
      AlgoStep('Ultrasound where the history suggests an object that is not '
          'visible'),
      AlgoStep('Imaging with X-ray or CT for radio-opaque objects or '
          'suspected erosion'),
      AlgoStep('Assess for fistula where the object has been present for a '
          'long time', critical: true),
    ]),
    AlgoSection('3 · Safeguarding', [
      AlgoStep('In a prepubertal child, consider sexual abuse and follow the '
          'local child protection pathway', critical: true),
      AlgoStep('Examination in a child is under anaesthesia, by someone '
          'trained, with forensic considerations addressed first',
          critical: true),
      AlgoStep('In an adult, consider coercion, exploitation, and concealed '
          'drug carriage'),
      AlgoStep('Offer to see her alone, and ask about safety at home',
          critical: true),
      AlgoStep('Consider capacity and vulnerability in an adult who cannot '
          'explain the object'),
      AlgoStep('Document factually and without inference'),
    ]),
    AlgoSection('4 · Removal', [
      AlgoStep('Most objects come out in clinic with sponge forceps and '
          'analgesia'),
      AlgoStep('Examination under anaesthesia for a child, for an impacted '
          'object, or where she cannot tolerate examination'),
      AlgoStep('Irrigate the vagina after removal'),
      AlgoStep('Inspect the vaginal walls carefully for laceration, '
          'granulation and fistula', critical: true),
      AlgoStep('Cystoscopy or proctoscopy where erosion is suspected'),
      AlgoStep('Repair injury at the same procedure where possible'),
    ]),
    AlgoSection('5 · Infection', [
      AlgoStep('Treat bacterial vaginosis or secondary infection guided by '
          'the swab'),
      AlgoStep('Toxic shock syndrome: intravenous fluids, antistaphylococcal '
          'antibiotics with clindamycin for toxin suppression, and critical '
          'care', critical: true),
      AlgoStep('Tetanus prophylaxis where there is dirty penetrating injury'),
      AlgoStep('Offer a full sexual health screen in adults'),
    ]),
    AlgoSection('6 · Afterwards', [
      AlgoStep('Review at 2 weeks to confirm the discharge has settled'),
      AlgoStep('Persistent discharge means a second object, a fistula, or '
          'another diagnosis', critical: true),
      AlgoStep('Advise on tampon and ring use, and set a reminder system '
          'where forgetting is the pattern'),
      AlgoStep('Arrange regular pessary review — a schedule, not "come if '
          'there is a problem"', critical: true),
      AlgoStep('Complete safeguarding referrals and document the outcome'),
    ]),
  ],
  sources: [
    'British Association of Dermatologists and BSSVD guidance on vulval skin '
        'disorders; RCOG guidance on paediatric and adolescent gynaecology. '
        'RCOG Green-top 58 is archived.',
    'British Society for Paediatric and Adolescent Gynaecology — guidance on '
        'vaginal discharge and foreign bodies in children.',
    'CDC and UK guidance on staphylococcal toxic shock syndrome.',
    'Protection of Children from Sexual Offences (POCSO) Act 2012, India; '
        'MoHFW Guidelines and Protocols for Medico-legal Care for Survivors '
        'of Sexual Violence; FOGSI adolescent gynaecology recommendations.',
  ],
);

const kUrinaryRetentionAlgorithm = Algorithm(
  id: 'algo-urinary-retention',
  name: 'Acute urinary retention',
  subtitle: 'Decompress, then find out why',
  callFor: 'Gynaecology registrar. Urology where catheterisation fails or '
      'the retention recurs.',
  timeTarget: 'Catheterise now. A distended bladder for hours causes lasting '
      'detrusor damage.',
  immediate: [
    AlgoStep('CATHETERISE — relief first, diagnosis second', critical: true),
    AlgoStep('Record the residual volume drained; it is the most useful '
        'single number', critical: true),
    AlgoStep('PREGNANCY TEST — a retroverted gravid uterus at 12–14 weeks is '
        'a classic and reversible cause', critical: true),
    AlgoStep('Urea, electrolytes and creatinine — exclude obstructive '
        'nephropathy'),
    AlgoStep('Urine dipstick and culture'),
    AlgoStep('Examine the abdomen, vulva and vagina, and check perineal '
        'sensation and anal tone', critical: true),
    AlgoStep('clamp the catheter intermittently to decompress slowly',
        avoid: true,
        detail: 'It gives no benefit and delays relief. Drain freely and '
            'monitor for post-obstructive diuresis.'),
  ],
  sections: [
    AlgoSection('1 · Causes specific to women', [
      AlgoStep('POSTPARTUM RETENTION — after prolonged labour, instrumental '
          'delivery, epidural, or extensive perineal trauma', critical: true),
      AlgoStep('Retroverted incarcerated gravid uterus in the early second '
          'trimester', critical: true),
      AlgoStep('After pelvic or continence surgery — including obstruction '
          'from a sling that is too tight', critical: true),
      AlgoStep('Large fibroid, ovarian mass or advanced prolapse pressing on '
          'the urethra'),
      AlgoStep('Haematocolpos in an adolescent with an imperforate hymen — '
          'ask about primary amenorrhoea and cyclical pain', critical: true),
      AlgoStep('Vulval or genital herpes — retention from pain and sacral '
          'radiculopathy'),
      AlgoStep('Pelvic haematoma or abscess'),
    ]),
    AlgoSection('2 · Causes not specific to women', [
      AlgoStep('Constipation and faecal impaction — common and easily '
          'corrected'),
      AlgoStep('Urinary tract infection'),
      AlgoStep('Drugs: anticholinergics, opioids, tricyclics, '
          'antihistamines, alpha agonists'),
      AlgoStep('Neurological disease: multiple sclerosis, diabetic '
          'neuropathy, spinal cord lesion'),
      AlgoStep('CAUDA EQUINA SYNDROME — retention with saddle anaesthesia, '
          'back pain, leg weakness or altered anal tone is a surgical '
          'emergency requiring urgent MRI', critical: true),
      AlgoStep('Postoperative retention after any anaesthetic'),
    ]),
    AlgoSection('3 · Assessment after decompression', [
      AlgoStep('Volume drained: over 400–500 mL confirms significant '
          'retention'),
      AlgoStep('Bladder scan to confirm residuals after trial of void'),
      AlgoStep('Neurological examination including perineal sensation and '
          'anal tone', critical: true),
      AlgoStep('Pelvic examination for mass, prolapse and haematocolpos'),
      AlgoStep('Review the drug chart line by line'),
      AlgoStep('Ultrasound of the pelvis and renal tract'),
      AlgoStep('MRI spine urgently where cauda equina is possible',
          critical: true),
    ]),
    AlgoSection('4 · Management', [
      AlgoStep('Indwelling catheter for 24–48 hours in most cases, then trial '
          'of void'),
      AlgoStep('Clean intermittent self-catheterisation where retention '
          'persists — it preserves the bladder and her independence',
          critical: true),
      AlgoStep('Treat the cause: relieve constipation, treat infection, stop '
          'the offending drug'),
      AlgoStep('Retroverted gravid uterus: catheterise, and manual '
          'anteversion in the knee-chest position; most resolve as the '
          'uterus grows out of the pelvis', critical: true),
      AlgoStep('Postpartum: catheterise, treat any perineal haematoma, and '
          'address the pain that is preventing voiding'),
      AlgoStep('Surgical release for obstruction after a continence '
          'procedure'),
      AlgoStep('Watch for post-obstructive diuresis and replace fluids',
          critical: true),
    ]),
    AlgoSection('5 · Preventing postpartum retention', [
      AlgoStep('Document the time and volume of the first void after every '
          'birth', critical: true),
      AlgoStep('Catheterise if she has not voided within 6 hours'),
      AlgoStep('Measure the post-void residual after instrumental delivery '
          'or epidural'),
      AlgoStep('Encourage voiding before the bladder becomes overdistended, '
          'and offer privacy and analgesia — the two things most often '
          'missing'),
      AlgoStep('Covert retention after birth is common, painless, and causes '
          'permanent damage if missed', critical: true),
    ]),
    AlgoSection('6 · Follow-up', [
      AlgoStep('Repeat trial of void, and refer to urogynaecology if it fails '
          'again'),
      AlgoStep('Urodynamics for recurrent or unexplained retention'),
      AlgoStep('Teach and support intermittent self-catheterisation'),
      AlgoStep('Reassess renal function where obstruction was prolonged'),
      AlgoStep('Review the medication list at every subsequent visit'),
    ]),
  ],
  sources: [
    'NICE NG123 — Urinary incontinence and pelvic organ prolapse in women.',
    'RCOG Green-top Guideline 29 — Third- and Fourth-degree Perineal Tears; '
        'RCOG guidance on postpartum bladder care.',
    'European Association of Urology guidelines on non-neurogenic female '
        'lower urinary tract symptoms.',
    'Urogynecological Society of India guidance on postpartum bladder care; '
        'FOGSI GCPR — Postnatal Care.',
  ],
);

const kPostopHaemorrhageAlgorithm = Algorithm(
  id: 'algo-postop-haemorrhage',
  name: 'Postoperative haemorrhage',
  subtitle: 'After gynaecological surgery',
  callFor: 'The operating surgeon, a consultant, the anaesthetist and the '
      'blood bank. Interventional radiology where available.',
  timeTarget: 'A young woman maintains her blood pressure until she is '
      'profoundly hypovolaemic. Act on the pulse, not on the pressure.',
  immediate: [
    AlgoStep('ABC. Two large-bore cannulae, cross-match six units, and '
        'activate the major haemorrhage protocol if she is unstable',
        critical: true),
    AlgoStep('Full blood count, coagulation, fibrinogen, lactate, and '
        'point-of-care testing where available'),
    AlgoStep('Tranexamic acid 1 g intravenously', critical: true),
    AlgoStep('Warm the patient and warm the fluids — hypothermia worsens '
        'coagulopathy', critical: true),
    AlgoStep('CALL THE ORIGINAL SURGEON', critical: true),
    AlgoStep('Examine the vault or vaginal cuff with a speculum — the '
        'bleeding is often visible and controllable there', critical: true),
    AlgoStep('be reassured by a normal blood pressure', avoid: true,
        detail: 'Compensation is preserved until it collapses suddenly. Use '
            'the shock index — pulse divided by systolic — and act above '
            '0.9.'),
  ],
  sections: [
    AlgoSection('1 · Recognition', [
      AlgoStep('Rising pulse, narrowing pulse pressure, cool peripheries, '
          'oliguria', critical: true),
      AlgoStep('Pain out of proportion, abdominal distension, or a rigid '
          'abdomen'),
      AlgoStep('Vaginal bleeding after hysterectomy — a vault bleed'),
      AlgoStep('Blood in the drain, though an empty drain never excludes '
          'bleeding', critical: true),
      AlgoStep('Falling haemoglobin, though the first result lags reality',
          critical: true),
      AlgoStep('Shoulder-tip pain from haemoperitoneum'),
      AlgoStep('Restlessness and agitation are hypoxia until proven '
          'otherwise', critical: true),
    ]),
    AlgoSection('2 · Where the bleeding comes from', [
      AlgoStep('Vault or vaginal cuff after hysterectomy'),
      AlgoStep('A slipped pedicle — uterine or ovarian vessels',
          critical: true),
      AlgoStep('Port site vessels after laparoscopy, especially the inferior '
          'epigastric artery', critical: true),
      AlgoStep('Rectus sheath haematoma'),
      AlgoStep('Broad ligament haematoma, which may be concealed'),
      AlgoStep('Diffuse oozing from coagulopathy rather than a single '
          'vessel', critical: true),
      AlgoStep('Retroperitoneal bleeding, which hides a large volume with '
          'little to see'),
    ]),
    AlgoSection('3 · Investigations, without delaying treatment', [
      AlgoStep('Serial haemoglobin, coagulation and fibrinogen'),
      AlgoStep('Fibrinogen below 2 g/L predicts continued bleeding — replace '
          'it', critical: true),
      AlgoStep('Ultrasound at the bedside for free fluid'),
      AlgoStep('CT angiography where she is stable and the site is unclear'),
      AlgoStep('Do not send an unstable woman to the scanner', critical: true),
    ]),
    AlgoSection('4 · Resuscitation', [
      AlgoStep('Activate the major haemorrhage protocol early rather than '
          'late', critical: true),
      AlgoStep('Balanced transfusion of red cells, plasma and platelets per '
          'protocol'),
      AlgoStep('Cryoprecipitate or fibrinogen concentrate for fibrinogen '
          'below 2 g/L'),
      AlgoStep('Correct calcium — massive transfusion causes hypocalcaemia',
          critical: true),
      AlgoStep('Avoid excessive crystalloid, which dilutes clotting factors'),
      AlgoStep('Reverse anticoagulants where relevant'),
      AlgoStep('Keep her warm, and monitor temperature actively'),
    ]),
    AlgoSection('5 · Definitive control', [
      AlgoStep('Vault bleeding: examination under anaesthesia and suture — '
          'often all that is needed', critical: true),
      AlgoStep('Return to theatre for laparoscopy or laparotomy where the '
          'source is intra-abdominal', critical: true),
      AlgoStep('Interventional radiology and embolisation where available and '
          'she is stable enough'),
      AlgoStep('Do not delay reopening in an unstable woman in the hope she '
          'settles', critical: true),
      AlgoStep('Damage control — pack, close, and return later — where '
          'coagulopathy, acidosis and hypothermia have set in',
          critical: true),
      AlgoStep('Involve vascular or general surgery early for '
          'retroperitoneal or large-vessel bleeding'),
    ]),
    AlgoSection('6 · Afterwards', [
      AlgoStep('Critical care for organ support and rewarming'),
      AlgoStep('Restart thromboprophylaxis once haemostasis is secure — she '
          'is now at high thrombotic risk', critical: true),
      AlgoStep('Treat the anaemia properly, with intravenous iron where '
          'appropriate'),
      AlgoStep('Explain to her what happened, in plain words, before '
          'discharge', critical: true),
      AlgoStep('Duty of candour and incident review'),
      AlgoStep('Team debrief, including the staff who were present'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 47 — Blood Transfusion in Obstetrics; RCOG '
        'consent advice on gynaecological surgery.',
    'British Society for Haematology — Guidelines on the management of major '
        'haemorrhage.',
    'NICE NG24 — Blood transfusion.',
    'AAGL practice guidance on laparoscopic entry and vascular injury.',
    'National Blood Transfusion Council of India — Standards for Blood Banks '
        'and Transfusion Services; FOGSI GCPR on surgical safety in '
        'gynaecology.',
  ],
);
