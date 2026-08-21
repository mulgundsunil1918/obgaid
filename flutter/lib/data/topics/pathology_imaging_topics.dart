import '../../models/topic.dart';

const kPathologyTopic = ClinicalTopic(
  id: 'pathology',
  name: 'Pathology reference',
  subtitle: 'Cervical cytology · endometrial · ovarian',
  headline: 'Atypical endometrial hyperplasia is the report that most often '
      'gets under-treated: about 40% of women already have a concurrent '
      'carcinoma at hysterectomy. It is a surgical diagnosis until proven '
      'otherwise, not a follow-up-in-six-months one.',
  keyFacts: [
    ('ASC-US', 'HPV reflex; colposcopy if positive'),
    ('ASC-H · HSIL · AGC · AIS', 'Colposcopy'),
    ('CIN 1', 'Observe — about 60% regress'),
    ('CIN 2', 'Equivocal; p16 stratifies. May observe in young women'),
    ('CIN 3', 'Treat — excision'),
    ('Hyperplasia without atypia', '< 5% progress over 20 years'),
    ('Atypical hyperplasia / EIN', '~28% progress; ~40% concurrent carcinoma'),
    ('Excision depth > 10 – 15 mm', 'Raises preterm birth risk'),
  ],
  sections: [
    TopicSection('Cervical cytology — Bethesda terminology', [
      TopicPoint('NILM — negative for intraepithelial lesion or malignancy. '
          'Return to routine screening.'),
      TopicPoint('ASC-US — atypical squamous cells of undetermined '
          'significance. Reflex HPV testing; colposcopy if high-risk HPV '
          'positive.'),
      TopicPoint('ASC-H — atypical squamous cells, cannot exclude a high-grade '
          'lesion. Colposcopy regardless of HPV status.', critical: true),
      TopicPoint('LSIL — low-grade squamous intraepithelial lesion. Colposcopy, '
          'or HPV-based triage depending on the programme and her age.'),
      TopicPoint('HSIL — high-grade. Colposcopy, and see-and-treat is '
          'reasonable where the risk of default is high.', critical: true),
      TopicPoint('AGC — atypical glandular cells. Colposcopy WITH endocervical '
          'sampling, and endometrial sampling if she is 35 or over or has risk '
          'factors.', critical: true,
          detail: 'Glandular abnormalities carry a far higher rate of '
              'underlying malignancy than squamous ones, and are more often '
              'under-investigated.'),
      TopicPoint('AIS — adenocarcinoma in situ. Excisional procedure; ablation '
          'is inadequate.', critical: true),
      TopicPoint('Unsatisfactory — repeat. An unsatisfactory smear is not a '
          'negative one.', critical: true),
    ]),
    TopicSection('Cervical histology and the LAST terminology', [
      TopicPoint('CIN 1 corresponds to LSIL — about 60% regress spontaneously. '
          'Observe with repeat cytology and colposcopy.'),
      TopicPoint('CIN 2 is the equivocal grade. p16 immunostaining stratifies '
          'it: p16-positive behaves as high-grade, p16-negative as low-grade.',
          critical: true),
      TopicPoint('Conservative management of CIN 2 is reasonable in women under '
          '25 who will attend follow-up — roughly half regress'),
      TopicPoint('CIN 3 corresponds to HSIL and is treated'),
      TopicPoint('LAST terminology collapses the three-tier CIN system into '
          'two: LSIL and HSIL, matching cytology'),
      TopicPoint('Treatment: large loop excision of the transformation zone, '
          'or cold knife cone where glandular disease or invasion is '
          'suspected'),
      TopicPoint('Excision depth above 10–15 mm raises the risk of preterm '
          'birth — take what is needed and no more, particularly in a young '
          'woman', critical: true),
      TopicPoint('India screens through HPV testing and visual inspection with '
          'acetic acid in the national programme, rather than cytology at '
          'scale', critical: true),
    ]),
    TopicSection('Endometrial pathology', [
      TopicPoint('HYPERPLASIA WITHOUT ATYPIA — under 5% progress to carcinoma '
          'over 20 years',
          detail: 'Levonorgestrel intrauterine system is first-line, with '
              'biopsy at 6 and 12 months. Oral progestogens are an '
              'alternative. Address the source of unopposed oestrogen: '
              'obesity, anovulation, tamoxifen.'),
      TopicPoint('ATYPICAL HYPERPLASIA / ENDOMETRIOID INTRAEPITHELIAL '
          'NEOPLASIA — about 28% progress, and about 40% have a concurrent '
          'carcinoma already', critical: true,
          detail: 'Total hysterectomy with bilateral salpingo-oophorectomy is '
              'standard. Conservative management with an intrauterine system '
              'is only for women who want fertility, and demands 3-monthly '
              'biopsy and a defined exit point.'),
      TopicPoint('ENDOMETRIOID CARCINOMA — the type 1 tumour. Oestrogen-driven, '
          'usually low grade, usually early stage, generally good prognosis.'),
      TopicPoint('SEROUS CARCINOMA — type 2. p53-abnormal, not '
          'oestrogen-driven, spreads early and behaves like ovarian serous '
          'carcinoma. Stage it surgically as such.', critical: true),
      TopicPoint('CLEAR CELL CARCINOMA — uncommon, aggressive, '
          'chemoresistant.'),
      TopicPoint('CARCINOSARCOMA — now regarded as a dedifferentiated '
          'carcinoma rather than a true sarcoma, and treated as high-risk '
          'carcinoma.', critical: true),
      TopicPoint('MOLECULAR CLASSIFICATION should be recorded wherever '
          'available: POLE-mutated (excellent prognosis, may permit '
          'de-escalation), mismatch repair deficient, no specific molecular '
          'profile, and p53-abnormal (worst).', critical: true,
          detail: 'FIGO 2023 staging incorporates these, so a report without '
              'them cannot be staged to the current system.'),
    ]),
    TopicSection('Ovarian pathology', [
      TopicPoint('EPITHELIAL — about 90% of malignancies'),
      TopicPoint('High-grade serous is the commonest. Ubiquitous p53 mutation, '
          'associated with BRCA, and now understood to arise largely from the '
          'fallopian tube fimbria.', critical: true,
          detail: 'This is why opportunistic salpingectomy at hysterectomy or '
              'sterilisation is now recommended.'),
      TopicPoint('Low-grade serous — indolent, chemoresistant, hormonally '
          'responsive'),
      TopicPoint('Endometrioid and clear cell — both associated with '
          'endometriosis; clear cell is chemoresistant'),
      TopicPoint('Mucinous — often large and unilateral; exclude a '
          'gastrointestinal primary before calling it ovarian',
          critical: true),
      TopicPoint('GERM CELL — young women. Dysgerminoma (LDH), yolk sac tumour '
          '(AFP), immature teratoma. Mature cystic teratoma is the benign '
          'dermoid.',
          detail: 'Highly chemosensitive; fertility-sparing surgery is usually '
              'appropriate.'),
      TopicPoint('SEX-CORD STROMAL — granulosa cell tumour secretes inhibin '
          'and oestrogen, so it presents with bleeding and may cause '
          'endometrial hyperplasia. Sertoli-Leydig virilises. Fibroma with '
          'ascites and pleural effusion is Meigs syndrome.', critical: true),
      TopicPoint('BORDERLINE tumours have no stromal invasion, occur in '
          'younger women, and carry an excellent prognosis. Fertility-sparing '
          'surgery is appropriate.', critical: true),
      TopicPoint('METASTATIC — Krukenberg tumours are signet-ring '
          'adenocarcinoma, usually gastric, and are typically bilateral.'),
    ]),
    TopicSection('Tumour markers — and their traps', [
      TopicPoint('CA-125 — epithelial ovarian cancer. Raised by endometriosis, '
          'fibroids, pelvic inflammatory disease, pregnancy, menstruation, '
          'cirrhosis and any peritoneal irritation.', critical: true),
      TopicPoint('AFP — yolk sac tumour and immature teratoma'),
      TopicPoint('hCG — choriocarcinoma, dysgerminoma with syncytiotrophoblast, '
          'and of course pregnancy'),
      TopicPoint('LDH — dysgerminoma'),
      TopicPoint('Inhibin B and anti-Müllerian hormone — granulosa cell tumour'),
      TopicPoint('CEA and CA 19-9 — mucinous tumours; a raised CEA should '
          'prompt a search for a gastrointestinal primary'),
      TopicPoint('HE4 with CA-125 forms the ROMA index'),
      TopicPoint('use a tumour marker to exclude cancer', avoid: true,
          detail: 'Half of early ovarian cancers have a normal CA-125.'),
    ]),
  ],
  sources: [
    'Nayar R, Wilbur DC. The Bethesda System for Reporting Cervical Cytology, '
        '3rd edition, 2015.',
    'Darragh TM et al. The Lower Anogenital Squamous Terminology (LAST) '
        'Standardization Project. 2012.',
    'RCOG / BSGE Green-top Guideline 67 — Management of Endometrial '
        'Hyperplasia.',
    'WHO Classification of Tumours: Female Genital Tumours, 5th edition, 2020.',
    'Berek JS et al. FIGO staging of endometrial cancer: 2023.',
    'Government of India — Operational Framework for Management of Common '
        'Cancers; HPV and VIA-based cervical screening.',
  ],
);

const kImagingTopic = ClinicalTopic(
  id: 'imaging',
  name: 'Imaging reference',
  subtitle: 'CT and MRI in pregnancy · contrast · modality choice',
  headline: 'Do not withhold necessary imaging because she is pregnant. The '
      'fetal dose from a CT pulmonary angiogram is a fraction of a milligray, '
      'the threshold for deterministic fetal effects is around 100 mGy, and a '
      'missed pulmonary embolism kills.',
  keyFacts: [
    ('Fetal risk threshold', '~100 mGy — most diagnostic CT is far below'),
    ('CTPA fetal dose', '~0.01 – 0.66 mGy'),
    ('MRI at 1.5 T', 'No known fetal harm at any gestation'),
    ('Gadolinium in pregnancy', 'Avoid unless the benefit is compelling'),
    ('Iodinated contrast', 'Acceptable; check neonatal thyroid once'),
    ('Breastfeeding after contrast', 'No interruption needed, either agent'),
  ],
  sections: [
    TopicSection('Ionising radiation in pregnancy', [
      TopicPoint('Deterministic fetal effects require doses around 100 mGy or '
          'more; below 50 mGy no increase in anomaly or loss has been '
          'demonstrated', critical: true),
      TopicPoint('Chest radiograph: fetal dose under 0.01 mGy'),
      TopicPoint('CT pulmonary angiogram: roughly 0.01–0.66 mGy'),
      TopicPoint('CT abdomen and pelvis: roughly 10–35 mGy — the one worth '
          'thinking about, though still below threshold'),
      TopicPoint('Ventilation-perfusion scanning delivers a slightly higher '
          'fetal dose than CTPA but a much lower maternal breast dose — the '
          'trade is maternal, not fetal', critical: true),
      TopicPoint('Counsel about the small stochastic risk, document the '
          'discussion, and then do the scan she needs'),
      TopicPoint('refuse a necessary CT because of the pregnancy', avoid: true,
          detail: 'The commonest harm in this area is a missed diagnosis, not '
              'radiation.'),
    ]),
    TopicSection('Contrast agents', [
      TopicPoint('IODINATED CONTRAST crosses the placenta. Theoretical '
          'neonatal thyroid suppression has not been borne out, but a single '
          'neonatal thyroid function check is reasonable.', critical: true),
      TopicPoint('It is not a contraindication where the study requires it'),
      TopicPoint('GADOLINIUM crosses the placenta and is excreted into the '
          'amniotic fluid, where it recirculates. Avoid unless the benefit is '
          'compelling.', critical: true,
          detail: 'A large cohort found an association with rheumatological, '
              'inflammatory and infiltrative skin conditions in childhood, and '
              'with stillbirth.'),
      TopicPoint('BREASTFEEDING need not be interrupted after either agent — '
          'less than 1% is excreted into milk and less than 1% of that is '
          'absorbed', critical: true),
    ]),
    TopicSection('Choosing the modality', [
      TopicPoint('ULTRASOUND first for almost everything in obstetrics and '
          'gynaecology — no ionising radiation, dynamic, and repeatable'),
      TopicPoint('MRI for placenta accreta spectrum where ultrasound is '
          'equivocal or the placenta is posterior'),
      TopicPoint('MRI for deep infiltrating endometriosis, for fibroid mapping '
          'before surgery, and to distinguish adenomyosis'),
      TopicPoint('MRI for local staging in cervical and endometrial carcinoma'),
      TopicPoint('MRI for the fetal brain where ultrasound findings are '
          'equivocal, usually after 20 weeks'),
      TopicPoint('CT for the acute abdomen where ultrasound is unhelpful, for '
          'suspected pulmonary embolism, and for staging distant disease'),
      TopicPoint('PET-CT for recurrence and for nodal staging in '
          'gynaecological cancer — not in pregnancy'),
    ]),
    TopicSection('Gynaecological ultrasound reporting standards', [
      TopicPoint('IOTA terminology for adnexal masses; O-RADS for risk '
          'stratification'),
      TopicPoint('MUSA terminology for myometrial and uterine masses'),
      TopicPoint('IETA terminology for the endometrium'),
      TopicPoint('Endometrial thickness above 4 mm in a woman with '
          'postmenopausal bleeding requires sampling', critical: true,
          detail: 'The threshold applies to bleeding. An incidentally thick '
              'endometrium in an asymptomatic postmenopausal woman is a '
              'different and less urgent question.'),
      TopicPoint('Use structured reporting — an unstructured report cannot be '
          'compared with the next one'),
    ]),
    TopicSection('Limits', [
      TopicPoint('This is a guide to choosing and interpreting an '
          'investigation, not a substitute for specialist radiological '
          'reporting', critical: true),
      TopicPoint('Discuss complex or equivocal imaging with the radiologist '
          'rather than acting on the report line alone'),
      TopicPoint('Every prenatal ultrasound in India requires Form F under the '
          'PCPNDT Act, completed before the procedure', critical: true),
    ]),
  ],
  sources: [
    'ACOG Committee Opinion 723 — Guidelines for Diagnostic Imaging During '
        'Pregnancy and Lactation.',
    'RCOG Green-top Guideline 37b — Thromboembolic Disease in Pregnancy: '
        'imaging considerations.',
    'Ray JG et al. Association between MRI exposure during pregnancy and fetal '
        'and childhood outcomes. JAMA 2016;316:952–961.',
    'IOTA, MUSA and IETA consensus terminology statements.',
    'ACR Manual on Contrast Media.',
  ],
);
