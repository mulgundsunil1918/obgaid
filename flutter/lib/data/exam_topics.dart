import '../models/exam_topic.dart';
import 'exam_topics_2.dart';

const _core = <ExamTopic>[
  ExamTopic(
    id: 'exam-hypertensive',
    title: 'Hypertensive disorders of pregnancy',
    area: ExamArea.obstetrics,
    highYield: [
      'Pre-eclampsia does NOT require proteinuria. Hypertension after 20 weeks '
          'with any severe feature is sufficient.',
      'Magpie: magnesium halves eclampsia risk. NNT about 91 overall, 63 in '
          'severe disease.',
      'ASPRE: aspirin 150 mg nightly before 16 weeks cuts preterm '
          'pre-eclampsia by about 60%.',
      'Magnesium is an anticonvulsant, not an antihypertensive. Know why that '
          'distinction is examined.',
      'Pritchard, Zuspan and Sibai regimens — be able to state all three.',
      'Fluid restriction to 80 mL/hour. Pulmonary oedema, not the seizure, is '
          'what kills.',
      'Antidote is calcium gluconate 1 g over 10 minutes.',
      'NICE lowered the treatment threshold to 140/90 after CHIPS.',
    ],
    vivaQuestions: [
      'A woman at 34 weeks has a blood pressure of 168/112 and a headache. '
          'Talk me through the next thirty minutes.',
      'Why do you restrict fluid in severe pre-eclampsia?',
      'She fits despite magnesium. What now?',
      'How would you counsel her about a future pregnancy?',
      'What is the evidence for magnesium sulphate over diazepam?',
    ],
    classicTraps: [
      'Saying proteinuria is required for the diagnosis.',
      'Giving methylergometrine for postpartum haemorrhage in a '
          'pre-eclamptic woman.',
      'Fluid-loading for oliguria.',
      'Forgetting that a third of eclampsia is postpartum, up to four weeks.',
    ],
    sources: [
      'FOGSI-ICOG Good Clinical Practice Recommendations — Hypertensive Disorders of Pregnancy.',
      'Ministry of Health & Family Welfare, Government of India — Maternal Health Division guidelines on pre-eclampsia and eclampsia.',
      'NICE NG133; ACOG Practice Bulletin 222; NICE NG133 — Hypertension in pregnancy (RCOG Green-top 10A is archived).',
      'Magpie Trial, Lancet 2002;359:1877. ASPRE, N Engl J Med 2017;377:613. CHIPS, N Engl J Med 2015;372:407.',
      'Dutta DC. Textbook of Obstetrics; Williams Obstetrics, 26th edition.',
      'National Medical Commission — MS/DNB Obstetrics & Gynaecology competency-based curriculum.',
    ],
    readsInApp: ['algo-eclampsia', 'algo-severe-htn', 'mgso4', 'magpie', 'aspre'],
  ),
  ExamTopic(
    id: 'exam-pph',
    title: 'Postpartum haemorrhage',
    area: ExamArea.obstetrics,
    highYield: [
      'The 4 Ts and their approximate contributions: tone 70%, trauma 20%, '
          'tissue 10%, thrombin 1%.',
      'WOMAN trial: tranexamic acid within 3 hours reduces death from '
          'bleeding. No benefit after.',
      'E-MOTIVE: objective measurement plus a simultaneous bundle cut severe '
          'haemorrhage by 60%.',
      'Shock index HR ÷ SBP. Normal in pregnancy 0.7 – 0.9.',
      'Fibrinogen below 2 g/L predicts progression — and it RISES in '
          'pregnancy, so 2.5 is already low.',
      'Uterotonic contraindications: methylergometrine in hypertension, '
          'carboprost in asthma.',
      'Blood volume at term is about 100 mL/kg.',
      'Massive transfusion ratio 1:1:1.',
    ],
    vivaQuestions: [
      'Estimated loss is 1500 mL and the uterus is boggy. Take me through it.',
      'The bleeding continues after the full uterotonic ladder. What next?',
      'When would you decide on hysterectomy?',
      'How do you quantify blood loss, and why does it matter?',
      'What would you do differently if she were asthmatic? Hypertensive?',
    ],
    classicTraps: [
      'Giving oxytocin as a rapid intravenous bolus.',
      'Reciting the uterotonic ladder without its contraindications.',
      'Deciding on hysterectomy too late — the recurring theme in maternal '
          'death reviews.',
      'Estimating loss visually, which understates it by 30 – 50%.',
    ],
    sources: [
      'FOGSI GCPR — Prevention and Management of Postpartum Haemorrhage.',
      'MoHFW Government of India — Guidelines for Management of Postpartum Haemorrhage; LaQshya labour room standards.',
      'RCOG Green-top Guideline 52; ACOG Practice Bulletin 183; WHO PPH recommendations 2023.',
      'WOMAN Trial, Lancet 2017;389:2105. E-MOTIVE, N Engl J Med 2023;389:11.',
      'Dutta DC. Textbook of Obstetrics; Williams Obstetrics, 26th edition.',
    ],
    readsInApp: ['algo-pph', 'pph', 'woman', 'emotive', 'proc-balloon'],
  ),
  ExamTopic(
    id: 'exam-fetal-monitoring',
    title: 'Fetal monitoring and growth',
    area: ExamArea.obstetrics,
    highYield: [
      'DR C BRaVADO as the systematic approach.',
      'Normal baseline 110 – 160; variability 5 – 25.',
      'Sinusoidal pattern is pathological by definition — think fetal anaemia.',
      'Do not mix NICE and FIGO classification systems. Name which you use.',
      'Delphi consensus definitions of early and late fetal growth '
          'restriction.',
      'SGA is a size statement; FGR is a failure-to-reach-potential statement.',
      'TRUFFLE: ductus venosus-based timing improved 2-year neurological '
          'outcome.',
      'MCA-PSV above 1.5 MoM predicts fetal anaemia.',
      'Routine maternal oxygen for a non-reassuring trace has no benefit.',
    ],
    vivaQuestions: [
      'Describe this trace to me.',
      'What are your conservative measures, and why does oxygen not appear '
          'among them?',
      'How do you distinguish a constitutionally small fetus from growth '
          'restriction?',
      'At what point would you deliver a fetus with absent end-diastolic flow?',
      'What does a sinusoidal pattern make you think of?',
    ],
    classicTraps: [
      'Quoting a category without naming its system.',
      'Treating a single ten-minute window rather than the trend.',
      'Repeating growth scans at intervals under two weeks, where measurement '
          'error exceeds real growth.',
    ],
    sources: [
      'FOGSI GCPR — Fetal Growth Restriction; ICOG recommendations on antenatal fetal surveillance.',
      'NICE NG229 — Fetal monitoring in labour; FIGO intrapartum fetal monitoring consensus, Int J Gynecol Obstet 2015;131:13.',
      'Morris RK et al. Investigation and Care of a Small-for-Gestational-Age Fetus and a Growth Restricted Fetus: RCOG Green-top Guideline 31. BJOG 2024;131:e31-e80.',
      'Gordijn SJ et al. Delphi consensus on FGR, Ultrasound Obstet Gynecol 2016;48:333. TRUFFLE, Lancet 2015;385:2162.',
      'ISUOG Practice Guidelines on Doppler in obstetrics.',
    ],
    readsInApp: ['ctg', 'fgr', 'efw', 'truffle', 'usg-guide'],
  ),
  ExamTopic(
    id: 'exam-labour',
    title: 'Labour, induction and VBAC',
    area: ExamArea.obstetrics,
    highYield: [
      'The WHO Labour Care Guide replaced the partograph. Active phase begins '
          'at 5 cm, and there is no fixed rate of progress.',
      'Bishop score components and the ≥ 8 / ≤ 6 thresholds.',
      'ARRIVE: elective induction at 39 weeks lowered caesarean rates.',
      'VBAC success about 75%; rupture about 1 in 200 in spontaneous labour.',
      'Prostaglandins raise rupture risk two- to threefold in a scarred '
          'uterus — mechanical methods instead.',
      'Caesarean urgency categories 1 to 4, with 30 and 75 minute standards.',
      'Antibiotic prophylaxis BEFORE skin incision at caesarean.',
      'Term Breech Trial and its two-year follow-up — know both.',
    ],
    vivaQuestions: [
      'What has replaced the partograph, and why?',
      'Counsel this woman about VBAC after one caesarean.',
      'How would you induce a woman with a previous caesarean?',
      'What is a category 1 caesarean, and what is the standard?',
      'Why did the Term Breech Trial prove controversial?',
    ],
    classicTraps: [
      'Quoting the 1 cm per hour rule.',
      'Offering prostaglandin induction in a scarred uterus.',
      'Giving caesarean antibiotics after cord clamping.',
      'Quoting relative rather than absolute risks in VBAC counselling.',
    ],
    sources: [
      'FOGSI GCPR — Induction of Labour; Vaginal Birth After Caesarean.',
      'MoHFW Government of India — Dakshata and LaQshya intrapartum care standards.',
      'WHO Labour Care Guide 2020; NICE NG207 and NG235; RCOG Green-top 45; ACOG Practice Bulletins 107 and 205.',
      'ARRIVE, N Engl J Med 2018;379:513. Term Breech Trial, Lancet 2000;356:1375. Landon MB et al. N Engl J Med 2004;351:2581.',
      'Dutta DC. Textbook of Obstetrics.',
    ],
    readsInApp: ['induction', 'vbac', 'caesarean', 'bishop', 'arrive',
        'term-breech', 'landon-vbac'],
  ),
  ExamTopic(
    id: 'exam-preterm',
    title: 'Preterm birth and PPROM',
    area: ExamArea.obstetrics,
    highYield: [
      'Corticosteroids 24 – 34 weeks; betamethasone 12 mg × 2, or '
          'dexamethasone 6 mg × 4.',
      'Magnesium for neuroprotection below 30 – 32 weeks — a DIFFERENT regimen '
          'from eclampsia prophylaxis.',
      'Tocolysis buys 48 hours for steroids and transfer. Nothing more.',
      'ORACLE I: erythromycin in PPROM; co-amoxiclav causes necrotising '
          'enterocolitis.',
      'ORACLE II: no antibiotics with intact membranes — cerebral palsy at 7 '
          'years.',
      'Vaginal progesterone for cervical length ≤ 25 mm.',
      'In utero transfer beats postnatal transfer.',
      'PPROMT: expectant management to 37 weeks — less respiratory morbidity, '
          'more maternal infection.',
    ],
    vivaQuestions: [
      'A woman at 29 weeks has ruptured membranes. What do you do?',
      'Why erythromycin and not co-amoxiclav?',
      'What is the purpose of tocolysis?',
      'Which magnesium regimen, and for what indication?',
      'How do you decide when to deliver her?',
    ],
    classicTraps: [
      'Giving antibiotics for threatened preterm labour with intact '
          'membranes.',
      'Using tocolysis to prolong pregnancy indefinitely.',
      'Digital vaginal examination in PPROM.',
      'Confusing the neuroprotection and eclampsia magnesium regimens.',
    ],
    sources: [
      'FOGSI GCPR — Preterm Labour and Preterm Birth.',
      'MoHFW Government of India — India Newborn Action Plan; antenatal corticosteroid guidance.',
      'NICE NG25; RCOG Green-top Guidelines 1B and 73.',
      'ORACLE I and II, Lancet 2001;357:979 and 989, with 7-year follow-up Lancet 2008;372:1319. ACTOMgSO4, JAMA 2003;290:2669.',
      'Liggins GC, Howie RN. Pediatrics 1972;50:515.',
    ],
    readsInApp: ['pprom', 'preterm-labour', 'oracle', 'mgso4'],
  ),
  ExamTopic(
    id: 'exam-aub',
    title: 'Abnormal uterine bleeding and fibroids',
    area: ExamArea.gynaecology,
    highYield: [
      'PALM-COEIN — be able to give all nine and say which are structural.',
      'FIGO leiomyoma classification 0 – 8, and which types come out '
          'hysteroscopically.',
      'PBAC above 100 corresponds to loss above 80 mL.',
      'Sample the endometrium at 45 and over, or younger with risk factors.',
      'Levonorgestrel system is first-line for heavy menstrual bleeding.',
      'Coagulopathy accounts for about 13% — screen if bleeding since '
          'menarche.',
      'Hyperplasia without atypia: under 5% progress. Atypical: about 28% '
          'progress and about 40% have concurrent carcinoma.',
    ],
    vivaQuestions: [
      'Classify the causes of abnormal uterine bleeding.',
      'A 47-year-old with heavy periods and a 6 cm fibroid — how do you '
          'proceed?',
      'When would you sample the endometrium?',
      'The biopsy shows atypical hyperplasia. What now?',
      'Which fibroids affect fertility?',
    ],
    classicTraps: [
      'Assuming a fibroid found on scan is the cause of the bleeding.',
      'Managing atypical hyperplasia conservatively without stating the 40% '
          'concurrent carcinoma rate.',
      'Offering a levonorgestrel system where the cavity is distorted.',
      'Power morcellation without containment.',
    ],
    sources: [
      'FOGSI GCPR — Abnormal Uterine Bleeding.',
      'Munro MG et al. FIGO PALM-COEIN classification, Int J Gynecol Obstet 2011;113:3, revised 2018.',
      'NICE NG88; RCOG/BSGE Green-top Guideline 67; ACOG Practice Bulletin 228.',
      'Shaw\'s Textbook of Gynaecology, 17th edition; Novak\'s Gynecology.',
    ],
    readsInApp: ['aub', 'fibroids', 'pathology', 'proc-endometrial-biopsy'],
  ),
  ExamTopic(
    id: 'exam-pcos-infertility',
    title: 'PCOS and infertility',
    area: ExamArea.reproductive,
    highYield: [
      'Rotterdam: any two of three, with other causes excluded.',
      '2023 guideline: 20 follicles per ovary, not 12. No ultrasound in '
          'adolescents.',
      'AMH may replace ultrasound in adults.',
      'Letrozole is first-line for ovulation induction — Legro 2014.',
      'OGTT at diagnosis and every 1 – 3 years; HbA1c misses impaired glucose '
          'tolerance here.',
      'WHO 2021 semen limits: concentration 16 million/mL, progressive '
          'motility 30%, morphology 4%.',
      'Hydrosalpinx halves IVF success — remove or occlude it first.',
      'OHSS prevention: antagonist protocol, agonist trigger, freeze-all, '
          'cabergoline.',
    ],
    vivaQuestions: [
      'Define PCOS. What has changed in the criteria?',
      'How do you investigate a couple who have not conceived in 18 months?',
      'Why letrozole rather than clomiphene?',
      'Classify OHSS and tell me how you would manage the severe form.',
      'What do you do about a hydrosalpinx before IVF?',
    ],
    classicTraps: [
      'Using the 12-follicle threshold.',
      'Diagnosing PCOS in an adolescent on ultrasound.',
      'Giving diuretics in OHSS before restoring intravascular volume.',
      'Forgetting that thromboprophylaxis is mandatory in severe OHSS.',
      'Investigating the woman alone.',
    ],
    sources: [
      'FOGSI-ICOG GCPR on PCOS; Indian Society for Assisted Reproduction (ISAR) practice recommendations.',
      'International Evidence-Based Guideline for the Assessment and Management of PCOS, 2023.',
      'WHO Laboratory Manual for the Examination and Processing of Human Semen, 6th edition, 2021.',
      'NICE CG156; ESHRE ovarian stimulation guideline; RCOG Green-top Guideline 5 (OHSS).',
      'Legro RS et al. N Engl J Med 2014;371:119.',
    ],
    readsInApp: ['pcos', 'infertility', 'ohss', 'pcos-assessment', 'legro-letrozole'],
  ),
  ExamTopic(
    id: 'exam-oncology',
    title: 'Gynaecological oncology',
    area: ExamArea.oncology,
    highYield: [
      'FIGO cervical 2018 — the introduction of IIIC for nodal disease, and '
          'the r / p suffixes.',
      'FIGO endometrial 2023 — histological type, LVSI and molecular '
          'classification now change the stage.',
      'FIGO ovarian 2014 — the IC subdivisions by mechanism of capsule '
          'breach.',
      'Molecular groups: POLEmut (best), MMRd, NSMP, p53abn (worst).',
      'High-grade serous carcinoma largely arises from the tubal fimbria — '
          'hence opportunistic salpingectomy.',
      'RMI ≥ 200 triggers referral. IOTA simple rules are inconclusive in '
          'about 20%.',
      'GTN: FIGO anatomical stage plus WHO score. Score 0 – 6 low risk, ≥ 7 '
          'high risk.',
      'Cervical screening in India is HPV and VIA-based, not cytology at '
          'scale.',
    ],
    vivaQuestions: [
      'Stage this cervical cancer for me.',
      'What changed in the 2023 endometrial staging, and why?',
      'How do you assess an adnexal mass in a postmenopausal woman?',
      'Why do we now remove the tubes at hysterectomy?',
      'A GTN patient scores 8. What does that mean for treatment?',
    ],
    classicTraps: [
      'Using the 2009 endometrial staging.',
      'Relying on CA-125 to exclude malignancy — half of early cancers have a '
          'normal value.',
      'Forgetting that mucinous ovarian tumours may be metastatic from the '
          'gastrointestinal tract.',
      'Staging after treatment — stage is assigned once, at diagnosis.',
    ],
    sources: [
      'National Cancer Grid of India — gynaecological cancer management guidelines.',
      'MoHFW Government of India — Operational Framework for Management of Common Cancers; HPV and VIA-based cervical screening.',
      'FIGO staging: cervical 2018 (Int J Gynecol Obstet 2019;145:129); endometrial 2023 (2023;162:383); ovarian 2014 (2014;124:1); vulvar 2021 (2021;155:43).',
      'ESGO-ESTRO-ESP guidelines; NCCN guidelines.',
      'LACC, N Engl J Med 2018;379:1895. SOLO-1, N Engl J Med 2018;379:2495. PORTEC-3, Lancet Oncol 2018;19:295.',
    ],
    readsInApp: ['figo-cervix-2018', 'figo-endometrium-2023',
        'figo-ovary-2014', 'figo-who-gtn', 'adnexal-mass', 'pathology'],
  ),
  ExamTopic(
    id: 'exam-contraception-menopause',
    title: 'Contraception and menopause',
    area: ExamArea.gynaecology,
    highYield: [
      'WHO MEC categories 1 – 4, and the category 4s for combined hormonal '
          'contraception.',
      'Migraine with aura is category 4 at any age.',
      'Typical versus perfect use failure rates — the gap LARC closes.',
      'Missed pill rules, and the week-3 instruction to omit the pill-free '
          'interval.',
      'Emergency contraception: copper IUD most effective; double '
          'levonorgestrel above 70 kg.',
      'Enzyme inducers do not affect intrauterine methods or DMPA.',
      'Menopause over 45 with typical symptoms is a clinical diagnosis — no '
          'FSH.',
      'Unopposed oestrogen with a uterus causes hyperplasia and carcinoma.',
      'Vaginal oestrogen needs no progestogen, at any uterine status.',
    ],
    vivaQuestions: [
      'She has migraine with aura and wants the pill. What do you say?',
      'Take me through the missed pill rules.',
      'A 52-year-old with flushes and a uterus — how do you prescribe?',
      'Quantify the breast cancer risk of HRT for her.',
      'She had breast cancer and has severe vaginal dryness. Options?',
    ],
    classicTraps: [
      'Measuring FSH in a woman over 45.',
      'Giving unopposed oestrogen to a woman with a uterus.',
      'Adding a progestogen to vaginal oestrogen.',
      'Assuming broad-spectrum antibiotics reduce pill efficacy.',
      'Paroxetine alongside tamoxifen.',
    ],
    sources: [
      'MoHFW Government of India — Family Planning reference manuals; Antara and Chhaya programme guidelines.',
      'Indian Menopause Society — clinical practice recommendations.',
      'WHO Medical Eligibility Criteria for Contraceptive Use, 5th edition; FSRH guidance.',
      'NICE NG23; British Menopause Society consensus statements; NAMS 2022 Hormone Therapy Position Statement.',
      'Women\'s Health Initiative, JAMA 2002;288:321, with subsequent age-stratified reanalyses.',
    ],
    readsInApp: ['contraception', 'menopause', 'proc-iucd'],
  ),
  ExamTopic(
    id: 'exam-india-statute',
    title: 'Indian statute and national programmes',
    area: ExamArea.obstetrics,
    highYield: [
      'MTP Act 2021: 20 weeks with one practitioner, 24 with two for Rule 3B '
          'categories, beyond 24 only by State Medical Board.',
      'The seven Rule 3B categories — be able to list them.',
      'Contraceptive failure now applies to any woman and her partner.',
      'Spousal consent is never required.',
      'PCPNDT: Form F before every prenatal procedure; records kept two years.',
      'Section 4(3) indications and conditions for a prenatal diagnostic test.',
      'PCPNDT offences are cognizable, non-bailable and non-compoundable.',
      'DIPSI: 75 g non-fasting, 2-hour ≥ 140 mg/dL.',
      'Anemia Mukt Bharat grading and IV iron pathways.',
    ],
    vivaQuestions: [
      'A 17-year-old at 22 weeks requests termination. Walk me through the '
          'legal position.',
      'What must be completed before you perform an anomaly scan?',
      'Why does India use DIPSI rather than IADPSG?',
      'What are the penalties under the PCPNDT Act?',
      'How is the MTP Act different since 2021?',
    ],
    classicTraps: [
      'Saying spousal consent is needed.',
      'Quoting the pre-2021 20-week limit as absolute.',
      'Not knowing that Form F must be completed BEFORE the procedure.',
      'Confusing the MTP Act with the PCPNDT Act — they are read together but '
          'they are different statutes.',
    ],
    sources: [
      'Medical Termination of Pregnancy (Amendment) Act 2021 (Act No. 8 of 2021) and MTP (Amendment) Rules 2021, Government of India.',
      'Pre-conception and Pre-natal Diagnostic Techniques (Prohibition of Sex Selection) Act 1994, as amended 2003, and PCPNDT Rules 1996.',
      'MoHFW National Guidelines for Diagnosis and Management of Gestational Diabetes Mellitus (DIPSI).',
      'Anemia Mukt Bharat — Operational Guidelines, MoHFW.',
      'FOGSI position statements on the MTP and PCPNDT Acts.',
    ],
    readsInApp: ['mtp-act', 'pcpndt-act', 'gdm', 'anaemia'],
  ),
];


/// Every §59 academic topic.
List<ExamTopic> get kExamTopics => [..._core, ...kExamTopics2];
