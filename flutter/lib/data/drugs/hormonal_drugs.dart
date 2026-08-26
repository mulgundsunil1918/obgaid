import '../../models/drug.dart';

const kCoc = Drug(
  id: 'coc',
  generic: 'Combined oral contraceptive',
  drugClass: 'Ethinylestradiol with a progestogen',
  mechanism: 'Suppresses the mid-cycle LH surge and so prevents ovulation; '
      'also thickens cervical mucus and thins the endometrium. The oestrogen '
      'component drives both the cycle control and the thrombotic risk.',
  indications: [
    'Contraception',
    'Cycle control and dysmenorrhoea',
    'Heavy menstrual bleeding',
    'Acne and hirsutism, including in PCOS',
    'Endometriosis-related pain, used continuously',
    'Endometrial protection in chronic anovulation',
  ],
  doses: [
    DrugDose(
      indication: 'Contraception',
      dose: 'One tablet daily',
      route: 'Oral',
      frequency: '21 active days then 7 free, or 24/4, or continuously',
      notes: 'Continuous or extended use is safe and avoids withdrawal '
          'symptoms. There is no medical need for a monthly bleed.',
    ),
  ],
  contraindications: [
    'Migraine with aura at any age — WHO category 4',
    'Blood pressure 160/100 or above',
    'Current or past venous thromboembolism',
    'Known thrombogenic mutation',
    'Current breast cancer',
    'Smoking 15 or more a day at age 35 or over',
    'Ischaemic heart disease, stroke, complicated valvular disease',
    'Severe cirrhosis or hepatocellular tumour',
    'Major surgery with prolonged immobilisation',
    'Breastfeeding under 6 weeks postpartum',
    'Diabetes with vascular complications',
  ],
  warnings: [
    'Migraine WITH AURA is an absolute contraindication at any age — this is '
        'the most commonly missed category 4.',
    'Venous thromboembolism risk is roughly two to four times baseline, and '
        'highest in the first year of use.',
    'Not before 3 weeks postpartum in anyone, or 6 weeks if breastfeeding.',
  ],
  adverseEffects: [
    'Breakthrough bleeding, particularly in the first three months',
    'Nausea, breast tenderness, headache',
    'Mood change',
    'Raised blood pressure',
    'Venous thromboembolism',
  ],
  interactions: [
    'Enzyme inducers reduce efficacy — rifampicin, rifabutin, carbamazepine, '
        'phenytoin, phenobarbital, topiramate, some antiretrovirals, St '
        'John\'s wort.',
    'Rifampicin affects efficacy for 28 days after stopping.',
    'Lamotrigine levels FALL on the pill and rise in the pill-free week.',
    'Non-enzyme-inducing antibiotics do NOT reduce efficacy.',
  ],
  monitoring: [
    'Blood pressure at initiation and at each review',
    'Reassess eligibility annually, and whenever a new symptom appears',
    'Ask specifically about migraine aura at every review',
  ],
  pregnancy: DrugSafety(
    summary: 'Not used in pregnancy. Inadvertent exposure in early pregnancy '
        'has not been associated with congenital malformation — stop it and '
        'reassure.',
    source: 'FSRH guidance.',
  ),
  lactation: DrugSafety(
    summary: 'Avoid before 6 weeks postpartum in a breastfeeding woman, and '
        'use with caution to 6 months. Oestrogen may reduce milk volume in '
        'the establishment phase.',
    points: [
      'A progestogen-only method is the better choice while establishing '
          'breastfeeding.',
    ],
    source: 'WHO MEC; LactMed.',
  ),
  references: [
    'WHO Medical Eligibility Criteria for Contraceptive Use, 5th edition.',
    'FSRH Clinical Guideline — Combined Hormonal Contraception.',
    'Ministry of Health & Family Welfare, Government of India — Family '
        'Planning reference manual for combined oral contraceptives.',
    'FOGSI GCPR — Contraception.',
  ],
);

const kLngIus = Drug(
  id: 'lng-ius',
  generic: 'Levonorgestrel intrauterine system',
  brandNames: ['Mirena', 'Kyleena', 'Emily', 'Eloira'],
  drugClass: 'Intrauterine progestogen-releasing system',
  mechanism: 'Releases levonorgestrel locally, producing profound endometrial '
      'atrophy and thick cervical mucus. Systemic levels are a fraction of '
      'those from oral progestogen, which is why it does so much with so few '
      'systemic effects.',
  indications: [
    'Contraception',
    'Heavy menstrual bleeding — first-line medical treatment',
    'Adenomyosis and endometriosis-related pain',
    'Endometrial protection with menopausal hormone therapy',
    'Endometrial hyperplasia without atypia — first-line',
    'Fertility-sparing management of atypical hyperplasia, with strict '
        'surveillance',
  ],
  doses: [
    DrugDose(
      indication: 'All indications',
      dose: '52 mg device (or 19.5 mg / 13.5 mg lower-dose devices)',
      route: 'Intrauterine',
      frequency: 'Single insertion',
      max: '5 to 8 years depending on device and indication',
      notes: 'Only the 52 mg device is licensed for heavy menstrual bleeding '
          'and for endometrial protection.',
    ),
  ],
  contraindications: [
    'Pregnancy',
    'Current pelvic infection or purulent cervicitis',
    'Unexplained abnormal uterine bleeding, until investigated',
    'Distorted uterine cavity',
    'Current breast cancer',
    'Gestational trophoblastic disease with raised hCG',
  ],
  warnings: [
    'Not effective where the cavity is distorted by submucosal fibroids — a '
        'common reason for apparent treatment failure.',
    'Irregular bleeding for the first three to six months is expected. '
        'Warning her about it at insertion is what prevents early removal.',
    'Expulsion risk is highest in the first three months and in a bulky '
        'uterus.',
  ],
  adverseEffects: [
    'Irregular bleeding, settling to light or absent periods',
    'Amenorrhoea in about 20% at one year — a benefit if expected, alarming '
        'if not',
    'Ovarian cysts, usually self-resolving',
    'Acne, breast tenderness, mood change — less than with systemic '
        'progestogen',
    'Expulsion and, rarely, perforation',
  ],
  interactions: [
    'Enzyme inducers do NOT reduce contraceptive efficacy — the action is '
        'local. This makes it the method of choice alongside rifampicin or '
        'enzyme-inducing antiepileptics.',
  ],
  monitoring: [
    'Check threads at 6 weeks and then annually',
    'Endometrial biopsy at 6 and 12 months when treating hyperplasia',
  ],
  pregnancy: DrugSafety(
    summary: 'Not used in pregnancy. If pregnancy occurs with the device in '
        'situ, exclude ectopic and discuss removal — leaving it raises the '
        'risk of miscarriage, infection and preterm birth.',
    source: 'FSRH Intrauterine Contraception guideline.',
  ),
  lactation: DrugSafety(
    summary: 'Compatible. Progestogen-only methods do not affect milk supply, '
        'and it may be inserted within 48 hours of birth or after 4 weeks.',
    source: 'LactMed; WHO MEC.',
  ),
  references: [
    'FSRH Clinical Guideline — Intrauterine Contraception.',
    'NICE NG88 — Heavy menstrual bleeding.',
    'RCOG Green-top Guideline 67 — Endometrial Hyperplasia.',
    'MoHFW Government of India — Postpartum IUCD reference manual.',
    'FOGSI GCPR — Abnormal Uterine Bleeding.',
  ],
);

const kMht = Drug(
  id: 'mht',
  generic: 'Menopausal hormone therapy (oestradiol ± progestogen)',
  drugClass: 'Oestrogen replacement with endometrial protection',
  mechanism: 'Replaces circulating oestradiol lost at menopause. A progestogen '
      'is added where a uterus is present, solely to oppose the endometrial '
      'proliferation that oestrogen would otherwise cause.',
  indications: [
    'Vasomotor symptoms of the menopause',
    'Premature ovarian insufficiency — as replacement until the average age '
        'of menopause',
    'Prevention of osteoporosis in symptomatic women',
    'Genitourinary syndrome of the menopause (local preparations)',
  ],
  doses: [
    DrugDose(
      indication: 'Transdermal oestradiol',
      dose: 'Patch 25–100 µg twice weekly, or gel 0.5–1.5 mg daily',
      route: 'Transdermal',
      notes: 'PREFERRED where there is any thrombotic risk factor — obesity, '
          'migraine, hypertriglyceridaemia, or previous VTE. Transdermal '
          'carries no excess VTE risk; oral does.',
    ),
    DrugDose(
      indication: 'Oral oestradiol',
      dose: '1–2 mg daily',
      route: 'Oral',
    ),
    DrugDose(
      indication: 'Endometrial protection — uterus present',
      dose: 'Micronised progesterone 100 mg nightly continuous, or 200 mg for '
          '12–14 nights per cycle',
      route: 'Oral',
      notes: 'A levonorgestrel intrauterine system is an equally valid route '
          'and provides contraception at the same time.',
    ),
    DrugDose(
      indication: 'Vaginal oestrogen',
      dose: 'Estriol cream or estradiol pessary',
      route: 'Vaginal',
      frequency: 'Nightly for 2 weeks, then twice weekly indefinitely',
      notes: 'Needs NO progestogen, whatever the uterine status. Minimal '
          'systemic absorption. This is long-term treatment — symptoms return '
          'within weeks of stopping.',
    ),
  ],
  contraindications: [
    'Current, past or suspected breast cancer',
    'Known or suspected oestrogen-dependent malignancy',
    'Undiagnosed abnormal vaginal bleeding — investigate first',
    'Untreated endometrial hyperplasia',
    'Active or recent venous thromboembolism, unless anticoagulated',
    'Active arterial thromboembolic disease',
    'Active liver disease with deranged function',
  ],
  warnings: [
    'NEVER give unopposed oestrogen to a woman with a uterus.',
    'Vaginal oestrogen is a separate question from systemic therapy and may '
        'be appropriate after breast cancer, after oncology discussion.',
    'For premature ovarian insufficiency the risk-benefit calculation from '
        'trials in women over 50 does not apply — this is replacement.',
  ],
  adverseEffects: [
    'Breast tenderness and bloating, usually settling',
    'Irregular bleeding in the first months of a continuous regimen',
    'Headache, nausea',
    'Venous thromboembolism — oral only',
    'Small increase in breast cancer risk with combined therapy, rising with '
        'duration',
  ],
  interactions: [
    'Enzyme inducers reduce oestradiol levels.',
    'Thyroxine requirements may rise with oral oestrogen.',
  ],
  monitoring: [
    'Blood pressure and weight annually',
    'Review symptoms and continue as long as benefit outweighs risk — there '
        'is no arbitrary time limit',
    'Investigate any unscheduled bleeding after the first six months',
  ],
  pregnancy: DrugSafety(
    summary: 'Not applicable — this is postmenopausal therapy. In premature '
        'ovarian insufficiency, spontaneous pregnancy occurs in about 5%, so '
        'contraception is a separate conversation.',
  ),
  lactation: DrugSafety(summary: 'Not applicable.'),
  references: [
    'NICE NG23 — Menopause: diagnosis and management.',
    'British Menopause Society consensus statements.',
    'NAMS 2022 Hormone Therapy Position Statement.',
    'ESHRE guideline on premature ovarian insufficiency.',
    'Indian Menopause Society — clinical practice recommendations on '
        'menopausal hormone therapy.',
  ],
);

const kGnrhAgonist = Drug(
  id: 'gnrh-agonist',
  generic: 'GnRH agonist (leuprolide, goserelin, triptorelin)',
  drugClass: 'Gonadotrophin-releasing hormone agonist',
  mechanism: 'Continuous receptor stimulation downregulates pituitary GnRH '
      'receptors after an initial flare, producing profound hypo-oestrogenism. '
      'The flare is why symptoms briefly worsen in the first two weeks.',
  indications: [
    'Endometriosis-related pain refractory to first-line treatment',
    'Preoperative shrinkage of fibroids and correction of anaemia',
    'Adenomyosis, as a bridge to surgery or IVF',
    'Downregulation in IVF long protocols',
    'Hormone-responsive malignancy',
  ],
  doses: [
    DrugDose(
      indication: 'Endometriosis or fibroids',
      dose: 'Leuprolide 3.75 mg monthly, or 11.25 mg three-monthly; goserelin '
          '3.6 mg monthly',
      route: 'Subcutaneous or intramuscular depot',
      max: 'Usually 6 months without add-back; longer only with add-back',
      notes: 'Give ADD-BACK hormone therapy from the start — it protects bone '
          'and does not reduce efficacy.',
    ),
    DrugDose(
      indication: 'Add-back therapy',
      dose: 'Tibolone 2.5 mg daily, or low-dose oestradiol with a progestogen',
      route: 'Oral',
      notes: 'Start with the agonist rather than waiting for symptoms.',
    ),
  ],
  contraindications: [
    'Pregnancy and breastfeeding',
    'Undiagnosed abnormal vaginal bleeding',
    'Known hypersensitivity',
  ],
  warnings: [
    'The initial FLARE worsens symptoms for one to two weeks — warn her, or '
        'she will stop the treatment.',
    'Bone mineral density falls with prolonged use; add-back mitigates this.',
    'Not a long-term treatment on its own.',
  ],
  adverseEffects: [
    'Hot flushes, night sweats, vaginal dryness',
    'Mood change',
    'Reduced bone mineral density',
    'Headache',
    'Initial symptom flare',
  ],
  interactions: ['No clinically important interactions at these doses.'],
  monitoring: [
    'Bone density where use exceeds 6 months',
    'Symptom response at 3 months',
  ],
  pregnancy: DrugSafety(
    summary: 'Contraindicated. Exclude pregnancy before starting, and advise '
        'non-hormonal contraception — it is not itself a reliable '
        'contraceptive.',
  ),
  lactation: DrugSafety(summary: 'Contraindicated.'),
  fertility: 'Suppresses ovulation while in use; fertility returns within '
      'weeks to a few months of the last depot.',
  references: [
    'ESHRE Endometriosis Guideline 2022.',
    'NICE NG73 — Endometriosis.',
    'RCOG / BSGE guidance on fibroid management.',
    'FOGSI GCPR — Endometriosis; FOGSI GCPR — Management of Fibroids.',
  ],
);

const kGonadotrophins = Drug(
  id: 'gonadotrophins',
  generic: 'Gonadotrophins (FSH, hMG) and hCG trigger',
  drugClass: 'Recombinant and urinary gonadotrophins',
  mechanism: 'Directly stimulate follicular recruitment and growth, bypassing '
      'the hypothalamic-pituitary axis. hCG shares the LH receptor and '
      'substitutes for the LH surge to trigger final oocyte maturation.',
  indications: [
    'Ovulation induction where oral agents have failed',
    'Controlled ovarian stimulation for IVF and ICSI',
    'Hypogonadotrophic hypogonadism',
  ],
  doses: [
    DrugDose(
      indication: 'Ovulation induction — low-dose step-up',
      dose: 'FSH 37.5–75 IU daily, increasing by 37.5 IU after 7–14 days if '
          'no response',
      route: 'Subcutaneous',
      notes: 'The aim is a single dominant follicle. Cancel or convert to IVF '
          'if three or more mature follicles develop.',
      max: 'Individualised',
    ),
    DrugDose(
      indication: 'IVF stimulation',
      dose: 'FSH 150–300 IU daily, set by age, AMH, AFC and previous response',
      route: 'Subcutaneous',
    ),
    DrugDose(
      indication: 'hCG trigger',
      dose: '5000–10 000 IU',
      route: 'Subcutaneous or intramuscular',
      frequency: 'Single dose, 34–36 hours before retrieval',
      notes: 'A GnRH AGONIST trigger instead of hCG nearly eliminates severe '
          'OHSS in an antagonist cycle, but requires freeze-all or intensive '
          'luteal support.',
    ),
  ],
  contraindications: [
    'Ovarian, uterine or breast malignancy',
    'Undiagnosed abnormal uterine bleeding',
    'Ovarian cyst not due to PCOS',
    'Primary ovarian failure',
    'Untreated thyroid or adrenal dysfunction',
  ],
  warnings: [
    'OVARIAN HYPERSTIMULATION SYNDROME is the major risk, and is largely '
        'preventable — antagonist protocol, agonist trigger, freeze-all, '
        'cabergoline.',
    'Multiple pregnancy risk is substantial in ovulation induction without '
        'strict monitoring.',
    'Never use without ultrasound follicular tracking.',
  ],
  adverseEffects: [
    'Injection-site reactions',
    'Abdominal bloating and discomfort',
    'Ovarian hyperstimulation syndrome',
    'Multiple pregnancy',
    'Ovarian torsion, particularly with enlarged ovaries',
  ],
  interactions: ['None of clinical importance.'],
  monitoring: [
    'Serial transvaginal ultrasound for follicle number and size',
    'Serum oestradiol',
    'Cancel or coast where the response is excessive',
  ],
  pregnancy: DrugSafety(
    summary: 'Given before conception, not during pregnancy. No teratogenic '
        'signal; the risks to the pregnancy are multiple gestation and OHSS '
        'rather than the drug.',
    source: 'ESHRE guideline on ovarian stimulation.',
  ),
  lactation: DrugSafety(summary: 'Not applicable to the fertility indication.'),
  fertility: 'The most effective ovulation induction available, and the most '
      'dangerous without monitoring.',
  references: [
    'ESHRE guideline on ovarian stimulation for IVF/ICSI.',
    'NICE NG257 — Fertility problems (replaced CG156).',
    'RCOG Green-top Guideline 5 — OHSS.',
    'Indian Society for Assisted Reproduction (ISAR) practice '
        'recommendations; Assisted Reproductive Technology (Regulation) Act '
        '2021, Government of India.',
  ],
);
