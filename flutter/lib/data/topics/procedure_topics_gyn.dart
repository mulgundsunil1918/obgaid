import '../../models/topic.dart';

const kPapSmearTopic = ClinicalTopic(
  id: 'proc-pap',
  name: 'Cervical screening',
  subtitle: 'Pap smear · HPV · VIA',
  headline: 'India screens with HPV testing and visual inspection with acetic '
      'acid, not cytology at scale — because a single HPV test performs better '
      'than several cytology rounds and can be done where no cytopathologist '
      'exists.',
  keyFacts: [
    ('WHO 2021 recommendation', 'HPV DNA testing as the primary test'),
    ('Screening interval, HPV-based', 'Every 5 – 10 years from age 30'),
    ('India national programme', 'VIA every 5 years, ages 30 – 65'),
    ('Cytology interval where used', '3-yearly, ages 21 – 65'),
    ('Unsatisfactory smear', 'Repeat — it is not a negative'),
    ('Avoid sampling', 'During menstruation, or within 48 h of intercourse'),
  ],
  sections: [
    TopicSection('Indications and interval', [
      TopicPoint('WHO recommends HPV DNA testing as the primary screening '
          'test, from age 30, every 5 to 10 years', critical: true),
      TopicPoint("India's national programme uses visual inspection with "
          'acetic acid every 5 years for women aged 30 to 65, delivered '
          'through health and wellness centres', critical: true),
      TopicPoint('Cytology, where used, 3-yearly from 21 to 65'),
      TopicPoint('Women living with HIV: screen from the start of sexual '
          'activity and more frequently'),
      TopicPoint('Screening is for asymptomatic women. A symptomatic woman or '
          'a suspicious-looking cervix needs colposcopy and biopsy, not a '
          'smear.', critical: true),
    ]),
    TopicSection('Preparation', [
      TopicPoint('Avoid during menstruation'),
      TopicPoint('No intercourse, douching or vaginal preparations for 48 '
          'hours'),
      TopicPoint('Explain the procedure; offer a chaperone and record who was '
          'present'),
      TopicPoint('Speculum without lubricant, or with a minimal water-based '
          'film — excessive gel obscures cytology'),
      TopicPoint('Correct speculum size, good light, and the woman positioned '
          'comfortably'),
    ]),
    TopicSection('Technique — liquid-based cytology', [
      TopicPoint('Visualise the whole cervix and the transformation zone',
          critical: true),
      TopicPoint('Insert the central bristles of the broom into the '
          'endocervical canal, with the outer bristles against the ectocervix'),
      TopicPoint('Rotate five times in the same direction'),
      TopicPoint('Rinse or detach the head into the preservative vial '
          'immediately'),
      TopicPoint('Label at the bedside, and record the last menstrual period '
          'and any hormonal treatment on the request'),
      TopicPoint('take the sample after a bimanual examination', avoid: true,
          detail: 'Lubricant and disturbed cells reduce adequacy.'),
    ]),
    TopicSection('Technique — VIA', [
      TopicPoint('Apply 3–5% acetic acid to the cervix and wait one full '
          'minute'),
      TopicPoint('A well-defined, dense acetowhite lesion touching the '
          'squamocolumnar junction is positive'),
      TopicPoint('Faint, patchy or distant acetowhitening is not positive'),
      TopicPoint('VIA is only valid where the squamocolumnar junction is '
          'visible — it is unreliable after menopause', critical: true),
      TopicPoint('Positive VIA leads to colposcopy, or to thermal ablation '
          'under a screen-and-treat protocol where follow-up is unreliable'),
    ]),
    TopicSection('Result handling', [
      TopicPoint('NILM — routine recall'),
      TopicPoint('ASC-US — reflex HPV; colposcopy if high-risk HPV positive'),
      TopicPoint('ASC-H, LSIL, HSIL, AGC, AIS — colposcopy', critical: true),
      TopicPoint('UNSATISFACTORY — repeat. An unsatisfactory sample is not a '
          'negative one.', critical: true),
      TopicPoint('Have a fail-safe system for results. A screening programme '
          'without result follow-up harms rather than helps.',
          critical: true),
    ]),
    TopicSection('Documentation and consent', [
      TopicPoint('Verbal consent, and the chaperone named'),
      TopicPoint('Appearance of the cervix — a suspicious cervix needs '
          'referral whatever the cytology says', critical: true),
      TopicPoint('Date of last menstrual period, contraception, hormone use, '
          'previous abnormal results'),
      TopicPoint('When and how she will get the result, and what happens if '
          'she does not hear'),
    ]),
  ],
  sources: [
    'WHO guideline for screening and treatment of cervical pre-cancer '
        'lesions for cervical cancer prevention, 2nd edition, 2021.',
    'MoHFW Government of India — Operational Framework for Management of '
        'Common Cancers; VIA-based screening through Health and Wellness '
        'Centres.',
    'National Cancer Grid of India — cervical cancer screening guidelines.',
    'Nayar R, Wilbur DC. The Bethesda System, 3rd edition, 2015.',
  ],
);

const kColposcopyTopic = ClinicalTopic(
  id: 'proc-colposcopy',
  name: 'Colposcopy',
  subtitle: 'Assessment, biopsy, see-and-treat',
  headline: 'An unsatisfactory colposcopy — one where the squamocolumnar '
      'junction cannot be seen — does not exclude disease. It means the lesion '
      'may be in the canal, and needs excision rather than reassurance.',
  keyFacts: [
    ('Acetic acid', '3 – 5%, wait a full minute'),
    ('Satisfactory colposcopy', 'Entire squamocolumnar junction visible'),
    ('Excision depth', 'Keep under 10 – 15 mm where fertility matters'),
    ('See-and-treat', 'Reasonable for HSIL where default risk is high'),
    ('In pregnancy', 'Colposcopy yes; excision only for suspected invasion'),
  ],
  sections: [
    TopicSection('Indications', [
      TopicPoint('ASC-H, LSIL, HSIL, AGC or AIS on cytology'),
      TopicPoint('Persistent high-risk HPV positivity'),
      TopicPoint('Positive VIA'),
      TopicPoint('A clinically suspicious cervix, whatever the cytology',
          critical: true),
      TopicPoint('Postcoital or unexplained intermenstrual bleeding'),
      TopicPoint('Follow-up after treatment of intraepithelial neoplasia'),
    ]),
    TopicSection('Technique', [
      TopicPoint('Inspect with white light, then with the green filter for '
          'vascular patterns'),
      TopicPoint('Apply 3–5% acetic acid and wait a full minute — the change '
          'is slow', critical: true),
      TopicPoint('Assess acetowhiteness, margins, vascular pattern (punctation '
          'and mosaicism), and lesion size'),
      TopicPoint("Lugol's iodine: normal squamous epithelium stains mahogany "
          'brown; dysplastic and columnar epithelium does not'),
      TopicPoint('Record whether the squamocolumnar junction was fully seen',
          critical: true),
      TopicPoint('Use the Swede score or IFCPC terminology, and record which'),
      TopicPoint('Punch biopsy the most abnormal area'),
    ]),
    TopicSection('Unsatisfactory colposcopy', [
      TopicPoint('The squamocolumnar junction is not fully visible — common '
          'after menopause and after previous treatment'),
      TopicPoint('It does NOT exclude disease. The lesion may be entirely '
          'endocervical.', critical: true),
      TopicPoint('Options: topical oestrogen and repeat, endocervical '
          'curettage, or diagnostic excision'),
      TopicPoint('For high-grade cytology with an unsatisfactory colposcopy, '
          'excision is usually required', critical: true),
    ]),
    TopicSection('Treatment', [
      TopicPoint('ABLATION — cryotherapy or thermal ablation. Only where the '
          'whole lesion and the junction are visible, the lesion is small, and '
          'invasion is excluded.'),
      TopicPoint('EXCISION — LLETZ or cold knife cone. Required for glandular '
          'disease, suspected invasion, or unsatisfactory colposcopy.',
          critical: true),
      TopicPoint('SEE-AND-TREAT at the first visit is reasonable for '
          'high-grade cytology with a matching colposcopic lesion, '
          'particularly where the woman may not return'),
      TopicPoint('over-treat a young woman with CIN 1', avoid: true,
          detail: 'Most regress. Excision costs cervical length and raises '
              'preterm birth risk.'),
    ]),
    TopicSection('Excision and preterm birth', [
      TopicPoint('Excision depth above 10–15 mm raises the risk of subsequent '
          'preterm birth, and the risk rises with depth and with repeat '
          'procedures', critical: true),
      TopicPoint('Take what is needed and no more, especially in a young '
          'woman'),
      TopicPoint('Record the depth and dimensions of the specimen'),
      TopicPoint('Counsel about the preterm birth risk before treating, and '
          'flag it in her obstetric notes for the future'),
    ]),
    TopicSection('In pregnancy', [
      TopicPoint('Colposcopy is safe and appropriate; the aim is to exclude '
          'invasion', critical: true),
      TopicPoint('Biopsy only where invasion is suspected — bleeding is '
          'heavier'),
      TopicPoint('DO NOT perform excision unless invasion is suspected — '
          'haemorrhage and pregnancy loss', critical: true),
      TopicPoint('Endocervical curettage is contraindicated'),
      TopicPoint('Reassess colposcopically at least 8 weeks postpartum'),
    ]),
    TopicSection('Aftercare and documentation', [
      TopicPoint('Warn about discharge and light bleeding for up to four '
          'weeks; nothing per vaginam during that time'),
      TopicPoint('Record: indication, adequacy, whether the junction was '
          'seen, findings, biopsies taken and from where, and the treatment '
          'performed'),
      TopicPoint('A fail-safe pathway for histology results', critical: true),
      TopicPoint('Test of cure at 6 months with HPV testing'),
    ]),
  ],
  sources: [
    'IFCPC 2011 colposcopic terminology; BSCCP colposcopy standards.',
    'WHO guideline for screening and treatment of cervical pre-cancer, 2021.',
    'National Cancer Grid of India; MoHFW Operational Framework for '
        'Management of Common Cancers.',
    'Kyrgiou M et al. Adverse obstetric outcomes after local treatment for '
        'cervical intraepithelial neoplasia. BMJ 2016;354:i3633.',
  ],
);

const kHysteroscopyTopic = ClinicalTopic(
  id: 'proc-hysteroscopy',
  name: 'Hysteroscopy',
  subtitle: 'Distension media and the fluid deficit',
  headline: 'The fluid deficit is the number that ends the operation. With '
      'hypotonic media the ceiling is 1000 mL, and it is lower in an older or '
      'comorbid woman — glycine absorption causes hyponatraemia, cerebral '
      'oedema and death.',
  keyFacts: [
    ('Hypotonic media deficit limit', '1000 mL — lower if older or comorbid'),
    ('Isotonic saline deficit limit', '2500 mL'),
    ('Best timing', 'Early follicular phase'),
    ('Uterine perforation', '~1%'),
    ('Diagnostic, outpatient', 'Usually needs no anaesthesia'),
  ],
  sections: [
    TopicSection('Indications', [
      TopicPoint('Abnormal uterine bleeding, and postmenopausal bleeding with '
          'a thickened endometrium'),
      TopicPoint('Suspected endometrial polyp or submucosal fibroid'),
      TopicPoint('Retained products of conception'),
      TopicPoint('Intrauterine adhesions and Asherman syndrome'),
      TopicPoint('Recurrent implantation failure or recurrent miscarriage'),
      TopicPoint('Lost intrauterine device'),
      TopicPoint('Resection of a uterine septum'),
    ]),
    TopicSection('Contraindications', [
      TopicPoint('Pregnancy', critical: true),
      TopicPoint('Active pelvic infection'),
      TopicPoint('Known cervical or endometrial carcinoma — relative, because '
          'of theoretical peritoneal dissemination'),
      TopicPoint('Heavy bleeding, which obscures the view'),
    ]),
    TopicSection('Preparation and equipment', [
      TopicPoint('Schedule in the early follicular phase — thin endometrium, '
          'best view'),
      TopicPoint('Exclude pregnancy'),
      TopicPoint('Misoprostol 400 µg vaginally 3 hours before, for cervical '
          'priming in selected women'),
      TopicPoint('Choose the medium deliberately: isotonic saline for '
          'diagnostic and bipolar work; hypotonic glycine or sorbitol only '
          'where monopolar energy requires it', critical: true),
      TopicPoint('Set up automated fluid management, or assign one person to '
          'measure deficit continuously', critical: true),
      TopicPoint('Vaginoscopic ("no-touch") approach for outpatient '
          'diagnostic work — no speculum, no tenaculum, markedly less pain'),
    ]),
    TopicSection('Fluid deficit — the operative limit', [
      TopicPoint('HYPOTONIC media (glycine 1.5%, sorbitol): stop at a deficit '
          'of 1000 mL', critical: true),
      TopicPoint('Lower the threshold to 750 mL, or less, in older women and '
          'those with cardiac or renal disease', critical: true),
      TopicPoint('ISOTONIC saline: stop at 2500 mL'),
      TopicPoint('Measure deficit every 10 minutes and announce it aloud'),
      TopicPoint('Glycine absorption causes hyponatraemia, hypo-osmolality, '
          'cerebral oedema, seizures and death — this is the complication that '
          'kills in hysteroscopy', critical: true),
      TopicPoint('continue operating past the deficit limit to finish the '
          'case', avoid: true,
          detail: 'Stage the procedure instead. A second operation is always '
              'preferable to hyponatraemic encephalopathy.'),
    ]),
    TopicSection('Complications', [
      TopicPoint('Uterine perforation, about 1% — higher during dilatation and '
          'with a retroverted uterus'),
      TopicPoint('Fluid overload and hyponatraemia', critical: true),
      TopicPoint('Bleeding'),
      TopicPoint('Infection'),
      TopicPoint('Air or gas embolism — rare, and reduced by purging tubing '
          'and avoiding steep Trendelenburg', critical: true),
      TopicPoint('Cervical laceration'),
      TopicPoint('Intrauterine adhesions after extensive resection'),
    ]),
    TopicSection('If perforation occurs', [
      TopicPoint('Stop, and note whether energy was in use at the time',
          critical: true),
      TopicPoint('A blunt perforation with no energy and no bleeding: observe, '
          'give antibiotics'),
      TopicPoint('Perforation with active energy, or with any suspicion of '
          'bowel injury: laparoscopy to inspect', critical: true),
      TopicPoint('Document the site, the instrument, and whether energy was '
          'active'),
    ]),
    TopicSection('Aftercare and documentation', [
      TopicPoint('Most outpatient procedures need no formal recovery'),
      TopicPoint('Warn about cramping and light bleeding for a few days'),
      TopicPoint('Record: medium used, total instilled, total recovered, '
          'DEFICIT, findings, specimens, and complications', critical: true),
      TopicPoint('Fail-safe pathway for histology'),
    ]),
  ],
  sources: [
    'RCOG / BSGE Green-top Guideline 59 — Best Practice in Outpatient '
        'Hysteroscopy.',
    'AAGL Practice Guidelines on the management of hysteroscopic distending '
        'media.',
    'NICE NG88 — Heavy menstrual bleeding.',
    'FOGSI GCPR — Hysteroscopy and Abnormal Uterine Bleeding.',
  ],
);

const kLaparoscopyTopic = ClinicalTopic(
  id: 'proc-laparoscopy',
  name: 'Diagnostic laparoscopy',
  subtitle: 'Entry technique and the injuries that follow it',
  headline: 'Most serious laparoscopic injuries happen during entry, before '
      'anything has been looked at. Half of bowel injuries are not recognised '
      'at the time — and that delay, not the injury, is what kills.',
  keyFacts: [
    ('Palmer point', '3 cm below the left costal margin, mid-clavicular'),
    ('Insufflation pressure for entry', '20 – 25 mmHg, then reduce to 12 – 15'),
    ('Bowel injury', '~0.4 per 1000; half unrecognised at the time'),
    ('Vascular injury', '~0.2 per 1000'),
    ('Port site closure', 'Sheath closure for ports 10 mm and above'),
  ],
  sections: [
    TopicSection('Indications', [
      TopicPoint('Chronic pelvic pain, and suspected endometriosis'),
      TopicPoint('Infertility, with tubal patency testing'),
      TopicPoint('Suspected ectopic pregnancy'),
      TopicPoint('Adnexal mass assessment and management'),
      TopicPoint('Suspected ovarian torsion', critical: true),
      TopicPoint('Acute pelvic pain of uncertain cause'),
    ]),
    TopicSection('Contraindications', [
      TopicPoint('Haemodynamic instability — relative, and a reason for '
          'laparotomy in most hands', critical: true),
      TopicPoint('Extensive adhesions from previous surgery — a reason to '
          'change entry site, not necessarily to avoid laparoscopy'),
      TopicPoint('Large abdominal mass'),
      TopicPoint('Uncorrected coagulopathy'),
      TopicPoint('Cardiorespiratory disease that will not tolerate '
          'pneumoperitoneum'),
    ]),
    TopicSection('Preparation', [
      TopicPoint('Catheterise, and empty the stomach with an orogastric tube '
          'where the case will be long', critical: true),
      TopicPoint('Examine under anaesthesia before entry'),
      TopicPoint('Table horizontal for entry — Trendelenburg AFTER entry, not '
          'before', critical: true),
      TopicPoint('WHO surgical safety checklist'),
      TopicPoint('Antibiotic and VTE prophylaxis per local policy'),
    ]),
    TopicSection('Entry technique', [
      TopicPoint('VERESS NEEDLE at the umbilicus: elevate the abdominal wall, '
          'insert at 45 degrees in a normal-weight woman and closer to 90 in '
          'obesity'),
      TopicPoint('Confirm placement by the opening pressure — under 8 mmHg is '
          'the reliable test', critical: true,
          detail: 'The saline drop test and aspiration tests are unreliable. '
              'Opening pressure is the one that works.'),
      TopicPoint('Insufflate to 20–25 mmHg before the primary trocar, then '
          'reduce to 12–15 for the case'),
      TopicPoint('OPEN (Hasson) entry as an alternative, and the preferred '
          'route in some hands'),
      TopicPoint('PALMER POINT entry — 3 cm below the left costal margin in '
          'the mid-clavicular line — where periumbilical adhesions are likely',
          critical: true,
          detail: 'Exclude splenomegaly and a gastric bubble first.'),
      TopicPoint('Inspect the entry site immediately after the camera goes in, '
          'and again in retroflexion at the end', critical: true),
      TopicPoint('place lateral ports without seeing the inferior epigastric '
          'vessels', avoid: true),
    ]),
    TopicSection('Complications', [
      TopicPoint('BOWEL INJURY — about 0.4 per 1000, and half are not '
          'recognised at operation', critical: true,
          detail: 'Postoperative pain out of proportion, tachycardia, fever, '
              'or failure to progress is bowel injury until proven otherwise. '
              'Do not attribute it to gas pain.'),
      TopicPoint('VASCULAR INJURY at entry — leave the trocar in place to '
          'tamponade and convert immediately', critical: true),
      TopicPoint('Bladder injury, particularly after previous caesarean'),
      TopicPoint('Inferior epigastric vessel injury at lateral ports'),
      TopicPoint('Port site hernia — close the sheath for ports 10 mm and '
          'above'),
      TopicPoint('Surgical emphysema, gas embolism, shoulder tip pain'),
    ]),
    TopicSection('Aftercare and documentation', [
      TopicPoint('Warn about shoulder tip pain from residual gas'),
      TopicPoint('Clear instructions on what warrants urgent return: '
          'worsening pain, fever, vomiting, abdominal distension',
          critical: true),
      TopicPoint('Record: entry method and site, opening pressure, number and '
          'size of ports, findings, adhesiolysis performed, and closure'),
      TopicPoint('A patient who is not right after a laparoscopy should be '
          'seen by the operating surgeon, not reassured by telephone',
          critical: true),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 49 — Preventing Entry-Related Gynaecological '
        'Laparoscopic Injuries.',
    'BSGE / AAGL guidance on laparoscopic entry.',
    'FOGSI GCPR — Gynaecological Endoscopy.',
    'NICE interventional procedures guidance on laparoscopic surgery.',
  ],
);

const kSurgicalMiscarriageTopic = ClinicalTopic(
  id: 'proc-surgical-miscarriage',
  name: 'Surgical management of miscarriage',
  subtitle: 'MVA and suction evacuation — not sharp curettage',
  headline: 'Manual vacuum aspiration has replaced sharp curettage. It is '
      'safer, can be done under local anaesthesia in an outpatient setting, '
      'and does not scar the cavity the way a curette does.',
  keyFacts: [
    ('Preferred method', 'Vacuum aspiration — manual or electric'),
    ('MVA suitable to', '~12 weeks'),
    ('Cervical priming', 'Misoprostol 400 µg vaginally 3 h before'),
    ('Perforation risk', '~1 per 1000'),
    ('Anti-D', 'Required for Rhesus-negative women'),
  ],
  sections: [
    TopicSection('Indications', [
      TopicPoint('Missed or incomplete miscarriage where she chooses surgical '
          'management'),
      TopicPoint('Heavy or persistent bleeding'),
      TopicPoint('Signs of infection with retained tissue', critical: true),
      TopicPoint('Failed medical or expectant management'),
      TopicPoint('Haemodynamic instability — urgent evacuation',
          critical: true),
      TopicPoint('Gestational trophoblastic disease'),
    ]),
    TopicSection('Preparation', [
      TopicPoint('Confirm the diagnosis on ultrasound, with a second opinion '
          'where criteria are borderline', critical: true),
      TopicPoint('Blood group and antibody screen; full blood count'),
      TopicPoint('Cervical priming with misoprostol 400 µg vaginally 3 hours '
          'before, particularly in nulliparous women'),
      TopicPoint('Antibiotic prophylaxis'),
      TopicPoint('Discuss all three options — expectant, medical and surgical '
          '— and their success rates, before assuming surgery'),
      TopicPoint('Ask what she wants done with the pregnancy tissue, and '
          'record it', critical: true),
    ]),
    TopicSection('Technique — vacuum aspiration', [
      TopicPoint('Bimanual examination to establish uterine size and version',
          critical: true),
      TopicPoint('Local paracervical block, or general anaesthesia by choice '
          'and gestation'),
      TopicPoint('Dilate only as far as needed — a cannula size roughly equal '
          'to the gestational age in weeks'),
      TopicPoint('Manual vacuum aspiration with a 60 mL syringe, or electric '
          'suction at about 60 mmHg'),
      TopicPoint('Rotate and move the cannula gently; the endpoints are grating '
          'sensation, red foam in the cannula, and the uterus gripping'),
      TopicPoint('Inspect the aspirate for products of conception',
          critical: true),
      TopicPoint('perform routine sharp curettage afterwards', avoid: true,
          detail: 'It adds no benefit and causes Asherman syndrome.'),
    ]),
    TopicSection('Complications', [
      TopicPoint('Uterine perforation, about 1 per 1000 — higher with a '
          'retroverted uterus and with inexperienced dilatation'),
      TopicPoint('Cervical trauma'),
      TopicPoint('Incomplete evacuation and retained products'),
      TopicPoint('Infection and endometritis'),
      TopicPoint('Haemorrhage'),
      TopicPoint('Intrauterine adhesions — chiefly a consequence of sharp '
          'curettage', critical: true),
      TopicPoint('Failure to recognise an ectopic pregnancy where no products '
          'are seen in the aspirate', critical: true),
    ]),
    TopicSection('If no products are seen', [
      TopicPoint('Do not assume the evacuation was complete', critical: true),
      TopicPoint('Send the aspirate for histology'),
      TopicPoint('Follow up serum hCG', critical: true),
      TopicPoint('Consider ectopic pregnancy, and arrange urgent review'),
    ]),
    TopicSection('Aftercare and documentation', [
      TopicPoint('Anti-D for Rhesus-negative women', critical: true),
      TopicPoint('Contraception discussion before discharge — fertility '
          'returns within two weeks'),
      TopicPoint('Bleeding for up to two weeks; return for heavy bleeding, '
          'fever or offensive discharge'),
      TopicPoint('Histology, with a fail-safe result pathway — to exclude '
          'molar pregnancy', critical: true),
      TopicPoint('Emotional support and follow-up. This is a bereavement, and '
          'the procedure record should not be the only thing documented.'),
      TopicPoint('Record: gestation, cannula size, findings, estimated blood '
          'loss, anti-D given, and the tissue disposal choice'),
    ]),
  ],
  sources: [
    'NICE NG126 — Ectopic pregnancy and miscarriage: diagnosis and initial '
        'management.',
    'RCOG Green-top Guideline 25 — Management of Early Pregnancy Loss.',
    'WHO — Clinical practice handbook for safe abortion; manual vacuum '
        'aspiration guidance.',
    'FOGSI GCPR — Early Pregnancy Complications; MoHFW Comprehensive Abortion '
        'Care training manual, Government of India.',
  ],
);

const kImplantTopic = ClinicalTopic(
  id: 'proc-implant',
  name: 'Contraceptive implant',
  subtitle: 'Insertion, removal, and the impalpable implant',
  headline: 'Insert subdermally — you should see the tenting of the needle '
      'under the skin throughout. An implant placed too deep is an implant '
      'that will need imaging and a specialist to remove.',
  keyFacts: [
    ('Site', '8 – 10 cm above the medial epicondyle, in the sulcus'),
    ('Duration', '3 years (etonogestrel)'),
    ('Typical failure', '0.1% — the most effective reversible method'),
    ('Depth', 'Subdermal — visible tenting throughout insertion'),
    ('Impalpable implant', 'Do not explore — image first'),
  ],
  sections: [
    TopicSection('Indications and eligibility', [
      TopicPoint('Contraception for any woman who wants long-acting reversible '
          'contraception'),
      TopicPoint('Suitable while breastfeeding, from immediately after birth'),
      TopicPoint('WHO MEC category 1 or 2 for almost all conditions, including '
          'migraine with aura, hypertension and previous VTE — where the '
          'combined pill is contraindicated', critical: true),
      TopicPoint('Category 4 only in current breast cancer'),
    ]),
    TopicSection('Before insertion', [
      TopicPoint('Exclude pregnancy'),
      TopicPoint('COUNSEL ABOUT BLEEDING PATTERN — irregular bleeding is the '
          'commonest reason for early removal, and warning her about it in '
          'advance is what prevents that', critical: true,
          detail: 'About one in five will have amenorrhoea, one in five '
              'frequent or prolonged bleeding, and the rest something in '
              'between.'),
      TopicPoint('Explain the 3-year duration and record the replacement date'),
      TopicPoint('Check for enzyme-inducing medication, which reduces efficacy',
          critical: true),
    ]),
    TopicSection('Insertion technique', [
      TopicPoint('Non-dominant arm, supine, elbow flexed and arm externally '
          'rotated'),
      TopicPoint('Mark 8–10 cm proximal to the medial epicondyle, in the '
          'sulcus between biceps and triceps', critical: true,
          detail: 'This avoids the neurovascular bundle. Inserting too '
              'medially or too proximally risks the ulnar nerve and the '
              'brachial vessels.'),
      TopicPoint('Local anaesthetic along the insertion track'),
      TopicPoint('Insert the needle at about 30 degrees, then lower to '
          'horizontal and advance SUBDERMALLY, tenting the skin throughout',
          critical: true),
      TopicPoint('Withdraw the needle while keeping the applicator still — do '
          'not push the rod in'),
      TopicPoint('PALPATE THE IMPLANT IMMEDIATELY, and have the woman palpate '
          'it too', critical: true),
      TopicPoint('Apply a pressure dressing to limit bruising'),
      TopicPoint('insert deeply or intramuscularly', avoid: true,
          detail: 'Deep insertion causes neurovascular injury and makes '
              'removal a specialist procedure.'),
    ]),
    TopicSection('Removal', [
      TopicPoint('Palpate and mark the distal end'),
      TopicPoint('Local anaesthetic beneath the distal end, not over it — a '
          'wheal on top obscures palpation', critical: true),
      TopicPoint('2 mm incision at the distal end; push the proximal end '
          'towards it and grasp with mosquito forceps'),
      TopicPoint('Strip any fibrous sheath before withdrawing'),
      TopicPoint('Confirm the whole rod is out and measure it — 4 cm'),
    ]),
    TopicSection('The impalpable implant', [
      TopicPoint('Do NOT explore blindly', critical: true),
      TopicPoint('Confirm one was inserted, and check the records'),
      TopicPoint('Ultrasound with a high-frequency linear probe, or plain '
          'radiography — the etonogestrel implant is radio-opaque'),
      TopicPoint('MRI where ultrasound and radiography fail'),
      TopicPoint('Refer to a specialist removal service', critical: true),
      TopicPoint('Advise alternative contraception until it is located and '
          'removed'),
    ]),
    TopicSection('Documentation', [
      TopicPoint('Arm used and exact site'),
      TopicPoint('Batch number and expiry'),
      TopicPoint('That the implant was palpated after insertion, by the '
          'clinician and by the woman', critical: true),
      TopicPoint('Replacement or removal date'),
      TopicPoint('What was explained about bleeding pattern and about when to '
          'seek help'),
    ]),
  ],
  sources: [
    'FSRH Clinical Guideline — Progestogen-only Implant.',
    'WHO Medical Eligibility Criteria for Contraceptive Use, 5th edition.',
    'MoHFW Government of India — Family Planning reference manuals; National '
        'Family Planning programme guidance on implants.',
    'FOGSI GCPR — Contraception.',
  ],
);
