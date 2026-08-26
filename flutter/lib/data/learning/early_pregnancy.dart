import '../../models/learning_topic.dart';

const kEarlyPregnancyLearningTopics = <LearningTopic>[
  LearningTopic(
    id: 'lrn-hyperemesis',
    title: 'Nausea, vomiting and hyperemesis gravidarum',
    subtitle: 'A spectrum, and the point at which it becomes an admission',
    category: LearningCategory.earlyPregnancy,
    competency: 'OG 8.2',
    summary: 'Nausea affects most pregnancies; hyperemesis affects a small '
        'minority and is a diagnosis of exclusion requiring dehydration, '
        'weight loss and ketosis. It is routinely undertreated because it is '
        'mistaken for a normal experience.',
    sections: [
      LearningSection('Definition and severity', [
        'Nausea and vomiting of pregnancy typically begins before 9 weeks and '
            'settles by about 16–20 weeks.',
        'HYPEREMESIS GRAVIDARUM requires protracted vomiting with the triad '
            'of dehydration, electrolyte disturbance and weight loss — '
            'conventionally more than 5% of pre-pregnancy weight — with '
            'ketosis.',
        'Score severity with the PUQE index so that treatment escalates '
            'against a measure rather than an impression.',
        'Onset after 9 weeks, or persistence beyond 20, should prompt a '
            'search for another cause.',
      ]),
      LearningSection('Exclude other causes', [
        'Multiple pregnancy and gestational trophoblastic disease — both '
            'raise hCG, so scan.',
        'Urinary tract infection.',
        'Thyrotoxicosis — biochemical hyperthyroidism is common in '
            'hyperemesis through hCG cross-reactivity and usually needs no '
            'antithyroid treatment.',
        'Gastrointestinal causes: gastritis, peptic ulcer, hepatitis, '
            'pancreatitis, bowel obstruction.',
        'Raised intracranial pressure, and drug causes.',
      ]),
      LearningSection('Management', [
        'Rehydrate with normal saline. AVOID DEXTROSE-CONTAINING FLUID as the '
            'first fluid — a glucose load in a thiamine-deplete woman can '
            'precipitate Wernicke encephalopathy.',
        'Replace potassium as required.',
        'THIAMINE in every woman with prolonged vomiting, before or with '
            'carbohydrate.',
        'Antiemetics in a stepwise order: doxylamine with pyridoxine, then '
            'antihistamines and phenothiazines, then metoclopramide or '
            'ondansetron, then corticosteroids in refractory disease.',
        'Ondansetron: discuss the small absolute increase in orofacial '
            'clefting reported with first-trimester exposure, against the '
            'harm of continued vomiting. It is a conversation, not a '
            'prohibition.',
        'Restrict metoclopramide courses to about five days because of '
            'extrapyramidal effects.',
        'Thromboprophylaxis — dehydration and immobility make hyperemesis a '
            'VTE risk factor.',
        'Nutritional support and, rarely, parenteral nutrition.',
      ]),
      LearningSection('Complications', [
        'Wernicke encephalopathy — confusion, ophthalmoplegia and ataxia. '
            'Preventable, and devastating when missed.',
        'Mallory-Weiss tear.',
        'Venous thromboembolism.',
        'Central pontine myelinolysis from over-rapid sodium correction.',
        'Depression, and a real risk of the pregnancy being terminated '
            'because the illness was undertreated.',
        'Fetal growth restriction where weight loss is severe and sustained.',
      ]),
    ],
    keyPoints: [
      'Hyperemesis needs dehydration, electrolyte disturbance and weight loss '
          '— not just vomiting.',
      'Give thiamine before or with any carbohydrate load.',
      'Scan to exclude multiple and molar pregnancy.',
      'Biochemical hyperthyroidism here is usually hCG-driven and self-limiting.',
      'Prescribe thromboprophylaxis.',
    ],
    related: ['formulary', 'vte-risk', 'figo-who-gtn', 'lab-reference'],
    sources: [
      'RCOG Green-top Guideline 69 — The Management of Nausea and Vomiting of '
          'Pregnancy and Hyperemesis Gravidarum.',
      'ACOG Practice Bulletin 189 — Nausea and Vomiting of Pregnancy.',
      'Koren G et al. PUQE scoring index. Am J Obstet Gynecol 2002;186:S228.',
      'National Medical Commission postgraduate curriculum; FOGSI GCPR — '
          'Hyperemesis Gravidarum.',
    ],
  ),
  LearningTopic(
    id: 'lrn-gtd',
    title: 'Gestational trophoblastic disease',
    subtitle: 'Molar pregnancy, and the follow-up that prevents deaths',
    category: LearningCategory.earlyPregnancy,
    competency: 'OG 8.4',
    summary: 'A spectrum from benign hydatidiform mole to malignant '
        'choriocarcinoma. It is one of the few disseminated malignancies that '
        'is reliably curable, and the reason is registration and hCG '
        'surveillance rather than any single treatment.',
    sections: [
      LearningSection('Classification', [
        'COMPLETE MOLE — diploid and entirely paternal in origin, usually '
            'from a single sperm fertilising an empty ovum then duplicating. '
            'No fetal tissue. Higher malignant potential.',
        'PARTIAL MOLE — triploid, usually two sperm and one ovum. Some fetal '
            'tissue is present. Lower malignant potential.',
        'INVASIVE MOLE — mole penetrating the myometrium.',
        'CHORIOCARCINOMA — frankly malignant, and can follow any pregnancy '
            'including a normal one.',
        'PLACENTAL SITE TROPHOBLASTIC TUMOUR — rare, produces relatively '
            'little hCG, and is comparatively chemoresistant.',
      ]),
      LearningSection('Presentation', [
        'Irregular first-trimester bleeding, classically with passage of '
            'grape-like vesicles.',
        'A uterus large for dates, though it may be small.',
        'Exaggerated pregnancy symptoms and hyperemesis.',
        'Very high hCG for gestation.',
        'Theca lutein cysts from hCG stimulation.',
        'Early pre-eclampsia — pre-eclampsia before 20 weeks should always '
            'prompt a scan for molar pregnancy.',
        'Hyperthyroidism from hCG cross-reactivity at the TSH receptor.',
        'Ultrasound shows a heterogeneous mass with cystic spaces, often '
            'described as a snowstorm.',
      ]),
      LearningSection('Management', [
        'Suction evacuation, avoiding sharp curettage.',
        'Send all products of conception for histology — this is what makes '
            'the diagnosis, and it is why tissue is sent after every '
            'evacuation.',
        'Anti-D where rhesus negative, though it is not required after a '
            'confirmed complete mole because there is no fetal red cell '
            'antigen.',
        'REGISTER with a trophoblastic disease centre. In India this is done '
            'through the designated regional centres.',
        'Avoid oxytocic agents before evacuation is complete where possible, '
            'because of the theoretical risk of embolising trophoblast.',
      ]),
      LearningSection('Follow-up', [
        'Serial hCG until normal and then for a defined period, per the '
            'registering centre.',
        'Effective contraception throughout follow-up. Avoid pregnancy until '
            'discharged, because a new pregnancy makes hCG uninterpretable.',
        'A plateau or rise in hCG, or persistent bleeding, indicates '
            'gestational trophoblastic neoplasia.',
        'Neoplasia is staged by FIGO and risk-scored by the WHO system; the '
            'score decides single-agent methotrexate against multi-agent '
            'chemotherapy.',
        'Cure rates are high even with metastatic disease when the pathway is '
            'followed.',
        'Recurrence risk in a future pregnancy is roughly 1 in 80, so an '
            'early scan and hCG after any subsequent pregnancy is advised.',
      ]),
    ],
    keyPoints: [
      'Complete mole: diploid, entirely paternal, no fetal tissue, higher '
          'malignant potential.',
      'Pre-eclampsia before 20 weeks means scan for a mole.',
      'Suction evacuation, never sharp curettage, and send everything for '
          'histology.',
      'Registration and hCG surveillance are what make this curable.',
      'No pregnancy until discharged from follow-up.',
    ],
    related: [
      'figo-who-gtn',
      'score-gtn',
      'proc-surgical-miscarriage',
      'algo-miscarriage',
      'rh-negative',
    ],
    sources: [
      'RCOG Green-top Guideline 38 — Gestational Trophoblastic Disease.',
      'FIGO staging and WHO prognostic scoring for gestational trophoblastic '
          'neoplasia.',
      'Ngan HYS et al. Update on the diagnosis and management of gestational '
          'trophoblastic disease. Int J Gynecol Obstet 2021;155(S1):86–93.',
      'National Cancer Grid of India guidelines on gestational trophoblastic '
          'neoplasia; Tata Memorial Centre evidence-based management manuals; '
          'FOGSI GCPR — Gestational Trophoblastic Disease.',
    ],
  ),
  LearningTopic(
    id: 'lrn-recurrent-loss',
    title: 'Recurrent pregnancy loss',
    subtitle: 'What to investigate, and what not to',
    category: LearningCategory.earlyPregnancy,
    competency: 'OG 8.5',
    summary: 'In about half of couples no cause is found, and that group '
        'still has a good chance of a live birth with supportive care alone. '
        'The clinical skill is investigating what is treatable without '
        'subjecting couples to tests that change nothing.',
    sections: [
      LearningSection('Definition', [
        'Traditionally three or more consecutive losses; ESHRE and many units '
            'now investigate after two, particularly where the woman is older '
            'or the losses were second trimester.',
        'Distinguish first-trimester loss, which is usually chromosomal, from '
            'second-trimester loss, which is more often structural, '
            'thrombophilic or infective.',
      ]),
      LearningSection('Causes worth finding', [
        'ANTIPHOSPHOLIPID SYNDROME — the most important treatable cause. '
            'Requires persistent positivity on two occasions at least 12 '
            'weeks apart, with the appropriate clinical criterion.',
        'PARENTAL BALANCED TRANSLOCATION — found in a small percentage of '
            'couples; karyotype both partners where the history or the '
            'products suggest it.',
        'UTERINE ANOMALY — septate uterus is the one with evidence for '
            'intervention. Assess with three-dimensional ultrasound or MRI '
            'rather than hysterosalpingography alone.',
        'CERVICAL INSUFFICIENCY — painless dilatation with mid-trimester '
            'loss.',
        'ENDOCRINE — poorly controlled diabetes and overt thyroid disease. '
            'Thyroid peroxidase antibodies with normal thyroid function are '
            'associated but treating them has not been shown to help (TABLET '
            'trial).',
        'Inherited thrombophilia is associated with late loss, but '
            'anticoagulation has not been shown to improve live birth in '
            'unselected women.',
      ]),
      LearningSection('Management', [
        'Antiphospholipid syndrome: low-dose aspirin plus prophylactic '
            'heparin from a positive pregnancy test.',
        'Septate uterus: hysteroscopic resection, discussed with realistic '
            'expectations.',
        'Cervical insufficiency: cerclage, or serial cervical length '
            'surveillance with progesterone.',
        'Progesterone: vaginal micronised progesterone benefits women with '
            'early pregnancy bleeding AND previous miscarriages, with the '
            'benefit rising with the number of prior losses (PRISM and '
            'PROMISE).',
        'Optimise thyroid function, glycaemic control, weight, smoking and '
            'alcohol.',
        'Folic acid before conception.',
        'Supportive care in a dedicated early pregnancy clinic measurably '
            'improves outcomes and is not a placebo to be apologised for.',
      ]),
      LearningSection('What to avoid', [
        'Empirical immunotherapy, paternal leucocyte immunisation and '
            'intravenous immunoglobulin — no benefit and real harm.',
        'Empirical heparin in the absence of antiphospholipid syndrome.',
        'Routine karyotyping of every couple regardless of history.',
        'Telling her the losses were caused by something she did. They were '
            'not, and she will remember the sentence for years.',
      ]),
    ],
    keyPoints: [
      'Half have no identifiable cause and still have a good chance of a live '
          'birth.',
      'Antiphospholipid syndrome is the key treatable cause — aspirin plus '
          'heparin.',
      'Antiphospholipid testing must be repeated at least 12 weeks apart.',
      'Progesterone helps women with bleeding plus previous losses, not '
          'everyone.',
      'Do not offer immunotherapy.',
    ],
    related: [
      'algo-miscarriage',
      'couns-miscarriage',
      'maternal-medicine',
      'algo-preterm-labour',
    ],
    sources: [
      'RCOG Green-top Guideline 17 — Recurrent Miscarriage.',
      'ESHRE guideline — Recurrent Pregnancy Loss, 2023 update.',
      'Coomarasamy A et al. PRISM. N Engl J Med 2019;380:1815–1824; PROMISE. '
          'N Engl J Med 2015;373:2141–2148.',
      'Dhillon-Smith RS et al. TABLET. N Engl J Med 2019;380:1316–1325.',
      'National Medical Commission postgraduate curriculum; FOGSI GCPR — '
          'Recurrent Pregnancy Loss.',
    ],
  ),
  LearningTopic(
    id: 'lrn-abortion-care',
    title: 'Comprehensive abortion care',
    subtitle: 'Methods, safety, and the law as it actually stands in India',
    category: LearningCategory.earlyPregnancy,
    competency: 'OG 8.6',
    summary: 'Safe abortion is a core clinical service and unsafe abortion '
        'remains a significant contributor to maternal death in India. The '
        'clinical methods are simple; the failures are almost always failures '
        'of access, confidentiality or knowledge of the law.',
    sections: [
      LearningSection('The legal frame in India', [
        'The Medical Termination of Pregnancy Act 1971, as amended in 2021, '
            'governs practice.',
        'Up to 20 weeks requires the opinion of one registered medical '
            'practitioner.',
        'From 20 to 24 weeks requires two, and applies to categories '
            'specified in Rule 3B — which include survivors of sexual assault, '
            'minors, and changes in marital status among others.',
        'Beyond 24 weeks, only a State-level Medical Board may permit '
            'termination, and only for substantial fetal abnormality.',
        'There is no gestational limit where it is immediately necessary to '
            'save the woman\'s life.',
        'Consent is the woman\'s alone if she is 18 or over and of sound '
            'mind. Spousal consent is NOT required, and requiring it is '
            'unlawful.',
        'For a minor, the guardian consents, and POCSO reporting obligations '
            'apply.',
        'Confidentiality is protected by statute; disclosure other than as '
            'permitted is an offence.',
        'Sex determination is separately prohibited by the PCPNDT Act. The '
            'two Acts are frequently confused, and that confusion obstructs '
            'lawful abortion care.',
      ]),
      LearningSection('Assessment', [
        'Confirm pregnancy and establish gestation, by scan where the dates '
            'are uncertain.',
        'Exclude ectopic pregnancy.',
        'Haemoglobin and blood group; anti-D where rhesus negative.',
        'Discuss the options without steering, and document the discussion.',
        'Offer, but never require, counselling.',
      ]),
      LearningSection('Medical methods', [
        'Mifepristone followed 24–48 hours later by misoprostol is the '
            'standard regimen, with the misoprostol dose and route varying by '
            'gestation.',
        'Effective and safe in the first trimester, with success rates above '
            '95%.',
        'Warn her to expect bleeding heavier than a period and cramping.',
        'Confirm completion — a follow-up test or scan per protocol.',
        'Continuing pregnancy after failed medical abortion requires surgical '
            'completion, because of the teratogenic risk of misoprostol.',
      ]),
      LearningSection('Surgical methods', [
        'Manual or electric vacuum aspiration up to about 12–14 weeks, under '
            'local anaesthesia or sedation.',
        'Dilatation and evacuation beyond that, by a trained operator.',
        'Cervical preparation with misoprostol or osmotic dilators reduces '
            'trauma.',
        'Avoid sharp curettage — vacuum aspiration is safer and causes less '
            'Asherman syndrome.',
        'Antibiotic prophylaxis.',
        'Complications: haemorrhage, perforation, cervical injury, retained '
            'products, infection, and rarely Asherman syndrome.',
      ]),
      LearningSection('Afterwards', [
        'Contraception before she leaves — fertility returns within about two '
            'weeks, and an IUD or implant can be placed immediately.',
        'Anti-D where indicated.',
        'Warning signs: heavy bleeding, fever, offensive discharge, severe '
            'pain.',
        'Follow-up as agreed, without making it a condition of care.',
        'Do not moralise. The clinical evidence is that judgemental care '
            'pushes women toward unsafe providers, which is what kills them.',
      ]),
    ],
    keyPoints: [
      'One practitioner up to 20 weeks, two from 20 to 24 for Rule 3B '
          'categories, a Medical Board beyond 24.',
      'Spousal consent is not required and requiring it is unlawful.',
      'The MTP Act and the PCPNDT Act are different laws — confusing them '
          'obstructs lawful care.',
      'Vacuum aspiration, not sharp curettage.',
      'Contraception before discharge; fertility returns within two weeks.',
    ],
    related: [
      'mtp-act',
      'pcpndt-act',
      'proc-surgical-miscarriage',
      'algo-septic-abortion',
      'contraception',
      'champion',
    ],
    sources: [
      'Medical Termination of Pregnancy Act 1971 as amended 2021, and MTP '
          'Rules 2021, Government of India.',
      'MoHFW Comprehensive Abortion Care training and service delivery '
          'guidelines.',
      'WHO Abortion Care Guideline, 2022.',
      'Pre-conception and Pre-natal Diagnostic Techniques (PCPNDT) Act 1994.',
      'FOGSI GCPR on medical methods of abortion; Protection of Children from '
          'Sexual Offences Act 2012.',
    ],
  ),
];
