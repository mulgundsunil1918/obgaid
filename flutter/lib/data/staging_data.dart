import '../models/staging.dart';

/// FIGO staging systems, transcribed from the source publications.
const kStagingSystems = <StagingSystem>[
  _cervical,
  _endometrial,
  _ovarian,
  _vulvar,
  _gtd,
];

const _cervical = StagingSystem(
  id: 'figo-cervix-2018',
  name: 'Cervical carcinoma',
  edition: 'FIGO 2018',
  keyChange:
      'The 2018 revision allows imaging and pathology to assign stage, and '
      'introduces Stage IIIC for nodal disease. Add "r" for imaging-based and '
      '"p" for pathology-based nodal assignment (e.g. IIIC1r).',
  stages: [
    StageEntry('I', 'Carcinoma strictly confined to the cervix. Extension to '
        'the corpus is disregarded.', children: [
      StageEntry('IA',
          'Invasive carcinoma diagnosed only by microscopy, maximum depth of '
          'invasion < 5 mm.', children: [
        StageEntry('IA1', 'Measured stromal invasion < 3 mm in depth.'),
        StageEntry('IA2', 'Measured stromal invasion ≥ 3 mm and < 5 mm.'),
      ]),
      StageEntry('IB',
          'Invasive carcinoma with measured deepest invasion ≥ 5 mm, lesion '
          'limited to the cervix.', children: [
        StageEntry('IB1', 'Invasion ≥ 5 mm depth and < 2 cm greatest dimension.'),
        StageEntry('IB2', '≥ 2 cm and < 4 cm greatest dimension.'),
        StageEntry('IB3', '≥ 4 cm greatest dimension.'),
      ]),
    ]),
    StageEntry('II',
        'Invades beyond the uterus but not onto the lower third of the vagina '
        'or the pelvic wall.', children: [
      StageEntry('IIA', 'Involvement limited to the upper two-thirds of the '
          'vagina without parametrial involvement.', children: [
        StageEntry('IIA1', '< 4 cm greatest dimension.'),
        StageEntry('IIA2', '≥ 4 cm greatest dimension.'),
      ]),
      StageEntry('IIB', 'Parametrial involvement, not up to the pelvic wall.'),
    ]),
    StageEntry('III',
        'Involves the lower third of the vagina and/or extends to the pelvic '
        'wall and/or causes hydronephrosis or a non-functioning kidney and/or '
        'involves pelvic or para-aortic lymph nodes.', children: [
      StageEntry('IIIA',
          'Lower third of the vagina, no extension to the pelvic wall.'),
      StageEntry('IIIB',
          'Extension to the pelvic wall and/or hydronephrosis or non-'
          'functioning kidney (unless due to another cause).'),
      StageEntry('IIIC',
          'Pelvic and/or para-aortic lymph node involvement, including '
          'micrometastases, irrespective of tumour size and extent.', children: [
        StageEntry('IIIC1', 'Pelvic lymph node metastasis only.'),
        StageEntry('IIIC2', 'Para-aortic lymph node metastasis.'),
      ]),
    ]),
    StageEntry('IV',
        'Extends beyond the true pelvis, or has involved (biopsy-proven) the '
        'mucosa of the bladder or rectum. Bullous oedema alone does not '
        'qualify.', children: [
      StageEntry('IVA', 'Spread to adjacent pelvic organs.'),
      StageEntry('IVB', 'Spread to distant organs.'),
    ]),
  ],
  sources: [
    'Bhatla N et al. Revised FIGO staging for carcinoma of the cervix uteri. '
        'Int J Gynecol Obstet 2019;145:129–135.',
    'FIGO Committee on Gynecologic Oncology, 2018 (corrigendum 2019).',
    'National Cancer Grid of India — cervical cancer management guidelines.',
    'MoHFW Government of India — Operational Framework for Management of '
        'Common Cancers.',
  ],
);

const _endometrial = StagingSystem(
  id: 'figo-endometrium-2023',
  name: 'Endometrial carcinoma',
  edition: 'FIGO 2023',
  keyChange:
      'The 2023 revision separates non-aggressive from aggressive histology, '
      'gives substantial LVSI its own stage (IIB), and incorporates molecular '
      'classification — POLEmut confined to the uterus becomes Stage IAmPOLEmut, '
      'and p53abn with myometrial invasion becomes Stage IICmp53abn. Most apps '
      'still carry the 2009 system.',
  stages: [
    StageEntry('I', 'Confined to the uterine corpus and ovary.', children: [
      StageEntry('IA', 'Disease limited to the endometrium, or non-aggressive '
          'histology with invasion of less than half the myometrium, with no or '
          'focal LVSI.', children: [
        StageEntry('IA1',
            'Non-aggressive histological type limited to an endometrial polyp '
            'or confined to the endometrium.'),
        StageEntry('IA2',
            'Non-aggressive histological types with invasion of less than half '
            'of the myometrium, with no or focal LVSI.'),
        StageEntry('IA3',
            'Low-grade endometrioid carcinoma limited to the uterus and ovary.'),
      ]),
      StageEntry('IB',
          'Non-aggressive histological types with invasion of half or more of '
          'the myometrium, with no or focal LVSI.'),
      StageEntry('IC',
          'Aggressive histological types limited to a polyp or confined to the '
          'endometrium.'),
    ]),
    StageEntry('II',
        'Invasion of cervical stroma without extrauterine extension, or with '
        'substantial LVSI, or aggressive histology with myometrial invasion.',
        children: [
      StageEntry('IIA',
          'Invasion of the cervical stroma of non-aggressive histological types.'),
      StageEntry('IIB',
          'Substantial LVSI of non-aggressive histological types.'),
      StageEntry('IIC',
          'Aggressive histological types with any myometrial invasion.'),
    ]),
    StageEntry('III', 'Local and/or regional spread of the tumour.', children: [
      StageEntry('IIIA', 'Invasion of the uterine serosa, adnexa, or both.',
          children: [
        StageEntry('IIIA1', 'Spread to the ovary or fallopian tube.'),
        StageEntry('IIIA2',
            'Involvement of the uterine subserosa or spread through the '
            'uterine serosa.'),
      ]),
      StageEntry('IIIB',
          'Metastasis or direct spread to the vagina, parametria, or pelvic '
          'peritoneum.', children: [
        StageEntry('IIIB1',
            'Metastasis or direct spread to the vagina and/or the parametria.'),
        StageEntry('IIIB2', 'Metastasis to the pelvic peritoneum.'),
      ]),
      StageEntry('IIIC',
          'Metastasis to the pelvic or para-aortic lymph nodes.', children: [
        StageEntry('IIIC1', 'Metastasis to the pelvic lymph nodes.'),
        StageEntry('IIIC2',
            'Metastasis to the para-aortic lymph nodes up to the renal vessels, '
            'with or without pelvic node involvement.'),
      ]),
    ]),
    StageEntry('IV',
        'Spread to the bladder mucosa and/or intestinal mucosa, and/or distant '
        'metastasis.', children: [
      StageEntry('IVA',
          'Invasion of the bladder mucosa and/or the intestinal/bowel mucosa.'),
      StageEntry('IVB', 'Abdominal peritoneal metastasis beyond the pelvis.'),
      StageEntry('IVC',
          'Distant metastasis, including to any extra- or intra-abdominal '
          'lymph nodes above the renal vessels, lungs, liver, brain or bone.'),
    ]),
  ],
  sources: [
    'Berek JS et al. FIGO staging of endometrial cancer: 2023. '
        'Int J Gynecol Obstet 2023;162:383–394.',
    'National Cancer Grid of India — uterine cancer guidelines.',
    'ESGO-ESTRO-ESP guidelines for the management of patients with '
        'endometrial carcinoma.',
  ],
  note: 'Molecular classification (POLEmut, MMRd, NSMP, p53abn) should be '
      'recorded in all cases where available, and modifies stage in early '
      'disease.',
);

const _ovarian = StagingSystem(
  id: 'figo-ovary-2014',
  name: 'Ovarian, fallopian tube & peritoneal carcinoma',
  edition: 'FIGO 2014',
  keyChange:
      'The 2014 revision stages ovarian, fallopian tube and primary peritoneal '
      'carcinoma together, and subdivides IC by the mechanism of capsule '
      'breach — surgical spill (IC1) carries a different prognosis from '
      'pre-operative rupture (IC2).',
  stages: [
    StageEntry('I', 'Tumour confined to the ovaries or fallopian tubes.',
        children: [
      StageEntry('IA',
          'Limited to one ovary (capsule intact) or one fallopian tube; no '
          'tumour on the surface; negative washings or ascites.'),
      StageEntry('IB',
          'Limited to both ovaries or both tubes, otherwise as IA.'),
      StageEntry('IC', 'Limited to one or both ovaries or tubes, with any of:',
          children: [
        StageEntry('IC1', 'Surgical spill.'),
        StageEntry('IC2',
            'Capsule ruptured before surgery, or tumour on the ovarian or '
            'tubal surface.'),
        StageEntry('IC3',
            'Malignant cells in the ascites or peritoneal washings.'),
      ]),
    ]),
    StageEntry('II',
        'Tumour involves one or both ovaries or tubes with pelvic extension '
        'below the pelvic brim, or primary peritoneal cancer.', children: [
      StageEntry('IIA',
          'Extension and/or implants on the uterus and/or fallopian tubes '
          'and/or ovaries.'),
      StageEntry('IIB', 'Extension to other pelvic intraperitoneal tissues.'),
    ]),
    StageEntry('III',
        'Spread to the peritoneum outside the pelvis and/or metastasis to the '
        'retroperitoneal lymph nodes.', children: [
      StageEntry('IIIA1',
          'Positive retroperitoneal lymph nodes only (cytologically or '
          'histologically proven): (i) metastasis ≤ 10 mm; (ii) > 10 mm.'),
      StageEntry('IIIA2',
          'Microscopic extrapelvic peritoneal involvement, with or without '
          'positive retroperitoneal nodes.'),
      StageEntry('IIIB',
          'Macroscopic peritoneal metastasis beyond the pelvis ≤ 2 cm, with or '
          'without retroperitoneal node metastasis.'),
      StageEntry('IIIC',
          'Macroscopic peritoneal metastasis beyond the pelvis > 2 cm, with or '
          'without retroperitoneal node metastasis. Includes extension to the '
          'capsule of the liver and spleen without parenchymal involvement.'),
    ]),
    StageEntry('IV',
        'Distant metastasis excluding peritoneal metastases.', children: [
      StageEntry('IVA', 'Pleural effusion with positive cytology.'),
      StageEntry('IVB',
          'Parenchymal metastases, and metastases to extra-abdominal organs '
          '(including inguinal nodes and nodes outside the abdominal cavity).'),
    ]),
  ],
  sources: [
    'Prat J, FIGO Committee on Gynecologic Oncology. Staging classification for '
        'cancer of the ovary, fallopian tube, and peritoneum. '
        'Int J Gynecol Obstet 2014;124:1–5.',
    'National Cancer Grid of India — ovarian cancer management guidelines.',
    'ESGO guidelines on ovarian cancer surgery and management.',
  ],
);

const _vulvar = StagingSystem(
  id: 'figo-vulva-2021',
  name: 'Vulvar carcinoma',
  edition: 'FIGO 2021',
  keyChange:
      'The 2021 revision removes tumour size from the Stage I/II distinction '
      'and reclassifies nodal disease by size and extracapsular spread.',
  stages: [
    StageEntry('I', 'Tumour confined to the vulva.', children: [
      StageEntry('IA',
          'Tumour ≤ 2 cm confined to the vulva or perineum, with stromal '
          'invasion ≤ 1 mm.'),
      StageEntry('IB',
          'Tumour > 2 cm, or with stromal invasion > 1 mm, confined to the '
          'vulva or perineum.'),
    ]),
    StageEntry('II',
        'Tumour of any size with extension to the lower third of the urethra, '
        'lower third of the vagina, or lower third of the anus, with negative '
        'nodes.'),
    StageEntry('III',
        'Tumour of any size with extension to the upper adjacent structures, '
        'or with any number of non-fixed, non-ulcerated lymph node metastases.',
        children: [
      StageEntry('IIIA',
          'Upper two-thirds of urethra or vagina, bladder or rectal mucosa; or '
          'regional node metastasis ≤ 5 mm.'),
      StageEntry('IIIB', 'Regional node metastasis > 5 mm.'),
      StageEntry('IIIC', 'Regional node metastasis with extracapsular spread.'),
    ]),
    StageEntry('IV',
        'Tumour of any size fixed to bone, or with fixed or ulcerated nodal '
        'disease, or distant metastasis.', children: [
      StageEntry('IVA',
          'Disease fixed to pelvic bone, or fixed or ulcerated regional node '
          'metastasis.'),
      StageEntry('IVB', 'Distant metastasis.'),
    ]),
  ],
  sources: [
    'Olawaiye AB et al. FIGO staging for carcinoma of the vulva: 2021 revision. '
        'Int J Gynecol Obstet 2021;155:43–47.',
    'ESGO-ESTRO-ESP guidelines for the management of patients with vulvar '
        'cancer.',
  ],
);

const _gtd = StagingSystem(
  id: 'figo-who-gtn',
  name: 'Gestational trophoblastic neoplasia',
  edition: 'FIGO anatomical stage + WHO prognostic score',
  keyChange:
      'GTN is staged anatomically (I–IV) and scored prognostically. The score, '
      'not the stage, decides single-agent versus multi-agent chemotherapy: '
      '0–6 is low risk, ≥ 7 is high risk.',
  stages: [
    StageEntry('I', 'Disease confined to the uterus.'),
    StageEntry('II',
        'GTN extends outside the uterus but is limited to the genital '
        'structures (adnexa, vagina, broad ligament).'),
    StageEntry('III',
        'GTN extends to the lungs, with or without known genital tract '
        'involvement.'),
    StageEntry('IV', 'All other metastatic sites.'),
    StageEntry('WHO prognostic score', 'Summed across eight factors:',
        children: [
      StageEntry('Age', '< 40 years = 0 · ≥ 40 years = 1'),
      StageEntry('Antecedent pregnancy',
          'Mole = 0 · Abortion = 1 · Term pregnancy = 2'),
      StageEntry('Interval from index pregnancy',
          '< 4 months = 0 · 4–6 = 1 · 7–12 = 2 · > 12 months = 4'),
      StageEntry('Pre-treatment serum hCG (IU/L)',
          '< 10³ = 0 · 10³–10⁴ = 1 · 10⁴–10⁵ = 2 · > 10⁵ = 4'),
      StageEntry('Largest tumour size including uterus',
          '< 3 cm = 0 · 3–5 cm = 1 · ≥ 5 cm = 2'),
      StageEntry('Site of metastases',
          'Lung = 0 · Spleen, kidney = 1 · Gastrointestinal = 2 · '
          'Liver, brain = 4'),
      StageEntry('Number of metastases',
          'None = 0 · 1–4 = 1 · 5–8 = 2 · > 8 = 4'),
      StageEntry('Previous failed chemotherapy',
          'None = 0 · Single drug = 2 · Two or more drugs = 4'),
    ]),
  ],
  sources: [
    'FIGO Oncology Committee. FIGO staging for gestational trophoblastic '
        'neoplasia 2000. Int J Gynecol Obstet 2002;77:285–287.',
    'WHO prognostic scoring system, as adopted by FIGO.',
    'FOGSI GCPR — Gestational Trophoblastic Disease.',
    'National Cancer Grid of India — gestational trophoblastic neoplasia '
        'guidelines.',
  ],
  note: 'Total score 0–6 = low risk (single-agent methotrexate or '
      'actinomycin-D). Score ≥ 7 = high risk (multi-agent, usually EMA-CO).',
);
