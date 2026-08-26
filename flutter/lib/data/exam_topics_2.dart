import '../models/exam_topic.dart';

/// Spec §59 — the areas the academic section was still missing.
const kExamTopics2 = <ExamTopic>[
  ExamTopic(
    id: 'exam-basic-sciences',
    title: 'Basic sciences — anatomy, physiology, embryology',
    area: ExamArea.basicSciences,
    highYield: [
      'The ureter passes UNDER the uterine artery about 1.5 cm lateral to the '
          'cervix — water under the bridge. This is the single most examined '
          'relation in the syllabus.',
      'Blood supply of the uterus: uterine artery from the anterior division '
          'of the internal iliac, anastomosing with the ovarian artery from '
          'the aorta.',
      'The ovarian artery arises from the aorta at L2; the right ovarian vein '
          'drains to the inferior vena cava and the left to the left renal '
          'vein.',
      'Pudendal nerve S2, S3, S4 — keeps the perineum off the floor. It '
          'passes around the ischial spine, which is the landmark for a '
          'pudendal block.',
      'Müllerian (paramesonephric) ducts form the fallopian tubes, uterus, '
          'cervix and upper two-thirds of the vagina. The lower third is '
          'urogenital sinus.',
      'Anti-Müllerian hormone from Sertoli cells causes Müllerian '
          'regression; its absence allows female internal genitalia to '
          'develop — the default pathway.',
      'Müllerian anomalies are classified by ESHRE/ESGE and by the older '
          'AFS system; they associate with renal anomalies because the '
          'mesonephric duct guides Müllerian migration.',
      'Fetal circulation shunts: ductus venosus, foramen ovale, ductus '
          'arteriosus — and what closes when after birth.',
      'Placental transfer: simple diffusion for gases, facilitated diffusion '
          'for glucose, active transport for amino acids, pinocytosis for '
          'IgG.',
      'Physiological changes: plasma volume rises about 50% and red cell mass '
          'about 25%, giving physiological anaemia; cardiac output rises 30 – '
          '50%; GFR rises 40 – 50%; a compensated respiratory alkalosis.',
      'Menstrual cycle: FSH drives follicular recruitment, oestradiol '
          'provides negative then positive feedback, the LH surge triggers '
          'ovulation about 36 hours later, and progesterone from the corpus '
          'luteum maintains the luteal phase.',
      'The pelvic floor: levator ani — pubococcygeus, puborectalis, '
          'iliococcygeus — with the perineal body as the central tendon.',
    ],
    vivaQuestions: [
      'Describe the course of the ureter in the pelvis and where it is at '
          'risk.',
      'What is the blood supply of the uterus, and what would you ligate in '
          'intractable haemorrhage?',
      'Describe the embryological origin of the uterus and vagina.',
      'Why does a Müllerian anomaly make you image the renal tract?',
      'What are the haemodynamic changes of pregnancy and when do they peak?',
      'Explain the hormonal control of the menstrual cycle.',
      'Describe the anatomy of the perineum and what is torn in a '
          'third-degree tear.',
      'What are the boundaries of the pelvic inlet, and what diameters '
          'matter?',
    ],
    classicTraps: [
      'Saying the ureter passes over the uterine artery.',
      'Forgetting that the left ovarian vein drains into the left renal vein, '
          'not the cava.',
      'Confusing mesonephric (Wolffian) with paramesonephric (Müllerian) '
          'derivatives.',
      'Describing plasma volume and red cell mass as rising equally — the '
          'disproportion is the whole point.',
      'Placing the pudendal nerve at the wrong root values.',
    ],
    sources: [
      'FOGSI-ICOG postgraduate curriculum; National Medical Commission '
          'competency-based postgraduate curriculum for MD Obstetrics and '
          'Gynaecology.',
      'Standring S (ed). Gray\'s Anatomy, 42nd edition.',
      'Sadler TW. Langman\'s Medical Embryology.',
      'Grimbizis GF et al. ESHRE/ESGE consensus on the classification of '
          'female genital tract congenital anomalies. Hum Reprod '
          '2013;28:2032–2044.',
      'Dutta DC. Textbook of Obstetrics; Textbook of Gynecology.',
    ],
    readsInApp: [
      'anat-ureter',
      'anat-uterine-artery',
      'anat-internal-iliac',
      'anat-perineum',
      'anat-nerves',
      'haemodynamics',
    ],
  ),
  ExamTopic(
    id: 'exam-reproductive-medicine',
    title: 'Reproductive medicine — ovulation, reserve, IVF, ICSI, PGT',
    area: ExamArea.reproductive,
    highYield: [
      'Ovarian reserve is measured by AMH and antral follicle count. Both '
          'predict RESPONSE to stimulation, not natural fertility and not the '
          'chance of a live birth.',
      'AMH is produced by granulosa cells of preantral and small antral '
          'follicles, is relatively cycle-independent, and falls with age and '
          'after ovarian surgery.',
      'Letrozole is first line for ovulation induction in PCOS, ahead of '
          'clomiphene, on live birth (Legro, NEJM 2014).',
      'Antagonist protocols and a GnRH agonist trigger, with freeze-all, are '
          'the main strategies to prevent OHSS.',
      'ICSI is indicated for severe male factor and previous fertilisation '
          'failure. It does not improve outcomes in non-male-factor '
          'infertility.',
      'Fertilisation is checked at 16 – 18 hours for two pronuclei; cleavage '
          'stage transfer at day 2 – 3, blastocyst at day 5 – 6.',
      'Single embryo transfer gives a similar cumulative live birth rate with '
          'far less multiple pregnancy.',
      'PGT-A screens for aneuploidy, PGT-M for monogenic disease, PGT-SR for '
          'structural rearrangements. PGT-A has not been shown to improve '
          'cumulative live birth per started cycle.',
      'Trophectoderm biopsy at blastocyst is now preferred to cleavage-stage '
          'biopsy, which harms the embryo.',
      'Vitrification has largely replaced slow freezing, for oocytes and '
          'embryos alike.',
      'In India, the ART (Regulation) Act 2021 and the Surrogacy '
          '(Regulation) Act 2021 govern practice, registration, and what may '
          'be offered — including limits on donor gametes and commercial '
          'surrogacy.',
      'The PCPNDT Act prohibits sex selection, including at the '
          'preimplantation stage. PGT for sex selection is illegal except for '
          'sex-linked disorders.',
    ],
    vivaQuestions: [
      'How do you assess ovarian reserve, and what does the result tell the '
          'couple?',
      'A woman with PCOS wants to conceive. How do you induce ovulation?',
      'What is the difference between IVF and ICSI, and when is ICSI '
          'indicated?',
      'How would you prevent OHSS in a high responder?',
      'What is PGT-A, and does it improve live birth rates?',
      'What does the ART Act require of you before starting treatment?',
      'Why can you not offer preimplantation sex selection in India?',
    ],
    classicTraps: [
      'Saying AMH predicts natural fertility or the chance of conceiving.',
      'Offering ICSI routinely in the absence of male factor.',
      'Quoting clinic pregnancy rates rather than age-specific live birth '
          'rates.',
      'Claiming PGT-A improves outcomes generally.',
      'Missing the statutory framework — Indian examinations ask about the '
          'ART Act and PCPNDT directly.',
    ],
    sources: [
      'FOGSI-ICOG and ISAR recommendations on assisted reproduction; ICMR '
          'National Guidelines for Accreditation, Supervision and Regulation '
          'of ART Clinics in India.',
      'ART (Regulation) Act 2021; Surrogacy (Regulation) Act 2021; PCPNDT '
          'Act 1994.',
      'ESHRE guideline — Ovarian Stimulation for IVF/ICSI, 2019.',
      'NICE CG156 — Fertility problems.',
      'Legro RS et al. Letrozole versus clomiphene for infertility in PCOS. '
          'N Engl J Med 2014;371:119–129.',
    ],
    readsInApp: [
      'infertility',
      'ohss',
      'algo-ohss',
      'pcos',
      'legro-letrozole',
      'couns-ivf',
      'pcpndt-act',
    ],
  ),
  ExamTopic(
    id: 'exam-operative-obstetrics',
    title: 'Operative obstetrics',
    area: ExamArea.obstetrics,
    highYield: [
      'Caesarean urgency categories 1 to 4; category 1 target is 30 minutes '
          'decision to delivery, category 2 is 75 minutes.',
      'Term Breech Trial (Hannah, Lancet 2000) made planned caesarean the '
          'standard for term breech — with the criticisms of the trial worth '
          'knowing.',
      'VBAC: about 72 – 75% success overall, rupture risk around 0.5% with '
          'one previous transverse scar, rising with induction and '
          'augmentation.',
      'Assisted vaginal delivery: the conditions must all be met before you '
          'start — full dilatation, ruptured membranes, engaged head, known '
          'position, adequate analgesia, empty bladder, and a plan if it '
          'fails.',
      'Ventouse has less maternal trauma and more cephalhaematoma and '
          'subgaleal haemorrhage; forceps have more perineal trauma and a '
          'higher success rate.',
      'Sequential use of instruments increases neonatal morbidity — choose '
          'once.',
      'Third- and fourth-degree tear repair: end-to-end or overlap for a full '
          '3b/3c, monofilament suture, antibiotics, laxatives, and '
          'physiotherapy.',
      'B-Lynch and other compression sutures, balloon tamponade, stepwise '
          'devascularisation, internal iliac ligation, and hysterectomy — the '
          'order of escalation in intractable PPH.',
      'Placenta accreta spectrum: antenatal diagnosis, a planned '
          'multidisciplinary delivery, and caesarean hysterectomy or '
          'conservative management — never blind attempts at removal.',
      'Symphysiotomy and destructive operations remain in the Indian '
          'curriculum for settings where caesarean is not available.',
      'Uterine incision: transverse lower segment is standard; classical for '
          'a very preterm undeveloped lower segment, transverse lie with '
          'ruptured membranes, or anterior placenta praevia with dense '
          'adhesions.',
    ],
    vivaQuestions: [
      'Classify the urgency of caesarean section and give the time targets.',
      'What are the prerequisites for an assisted vaginal delivery?',
      'Forceps or ventouse — how do you choose, and what do you tell her?',
      'Describe your management of a third-degree tear.',
      'Describe the surgical steps in intractable postpartum haemorrhage.',
      'When would you perform a classical caesarean section?',
      'How do you counsel a woman with one previous caesarean?',
      'What is your approach to a suspected placenta accreta?',
    ],
    classicTraps: [
      'Starting an instrumental delivery without confirming the position.',
      'Using a second instrument after the first has failed.',
      'Quoting a VBAC rupture risk without saying which scar.',
      'Forgetting antibiotics and laxatives after an obstetric anal sphincter '
          'injury.',
      'Attempting piecemeal removal of an adherent placenta.',
    ],
    sources: [
      'FOGSI GCPR — Caesarean Section; Operative Vaginal Delivery.',
      'RCOG Green-top Guidelines 26 (Operative Vaginal Delivery), 29 '
          '(Third- and Fourth-degree Perineal Tears), 45 (Birth After '
          'Previous Caesarean), 27a (Placenta Praevia and Accreta), 52 (PPH).',
      'NICE NG192 — Caesarean birth.',
      'Hannah ME et al. Term Breech Trial. Lancet 2000;356:1375–1383.',
      'MoHFW LaQshya and Dakshata guidelines; Dutta DC. Textbook of '
          'Obstetrics.',
    ],
    readsInApp: [
      'caesarean',
      'vbac',
      'proc-avd',
      'proc-perineal-repair',
      'algo-pph',
      'term-breech',
      'landon-vbac',
    ],
  ),
  ExamTopic(
    id: 'exam-endometriosis-fibroids',
    title: 'Endometriosis, adenomyosis and fibroids',
    area: ExamArea.gynaecology,
    highYield: [
      'Endometriosis: the extent of disease correlates poorly with the '
          'severity of pain. This is the examiner\'s favourite point.',
      'Diagnosis no longer requires laparoscopy — ESHRE 2022 supports '
          'imaging-based diagnosis and empirical treatment.',
      'rASRM staging predicts fertility outcome poorly; the Endometriosis '
          'Fertility Index performs better for that question.',
      'Medical treatment is contraceptive, so it does not treat infertility — '
          'the order of treatment changes entirely if she wants to conceive.',
      'GnRH analogues need add-back therapy to protect bone.',
      'Repeated ovarian cystectomy for endometrioma reduces ovarian reserve.',
      'Adenomyosis: MUSA ultrasound criteria; junctional zone thickening on '
          'MRI. Distinguishing it from a fibroid changes the operation.',
      'FIGO leiomyoma classification 0 to 8; submucous types 0, 1 and 2 are '
          'the ones that cause heavy bleeding and affect implantation.',
      'Levonorgestrel intrauterine system is the most effective medical '
          'treatment for heavy menstrual bleeding where the cavity allows.',
      'Uterine artery embolisation: effective, uterus-preserving, but not '
          'first choice for a woman who wants to conceive.',
      'Red degeneration of a fibroid in pregnancy — pain, low-grade fever, '
          'leucocytosis; treat conservatively with analgesia.',
      'Power morcellation risks disseminating an unsuspected leiomyosarcoma; '
          'contained morcellation and careful case selection.',
    ],
    vivaQuestions: [
      'How do you diagnose endometriosis without a laparoscopy?',
      'A 28-year-old with an endometrioma wants to conceive. What do you '
          'advise?',
      'Why does GnRH analogue need add-back?',
      'How do you distinguish adenomyosis from a fibroid on ultrasound?',
      'Classify fibroids and say why the classification matters.',
      'What are the options for a 38-year-old with heavy bleeding and a 6 cm '
          'intramural fibroid who has completed her family?',
      'What is red degeneration, and how do you manage it?',
    ],
    classicTraps: [
      'Insisting on laparoscopic confirmation before any treatment.',
      'Offering hormonal suppression to a woman who wants to conceive.',
      'Recommending hysterectomy as the opening option for fibroids.',
      'Treating the fibroid and forgetting the anaemia.',
      'Failing to exclude endometrial pathology in a woman over 45.',
    ],
    sources: [
      'FOGSI-ICOG Good Clinical Practice Recommendations on Endometriosis; '
          'FOGSI GCPR — Management of Fibroid Uterus.',
      'ESHRE guideline — Endometriosis, 2022.',
      'NICE NG73 — Endometriosis; NICE NG88 — Heavy menstrual bleeding.',
      'Munro MG et al. FIGO PALM-COEIN. Int J Gynaecol Obstet 2011;113:3–13.',
      'Van den Bosch T et al. MUSA consensus on measurement of the uterus. '
          'Ultrasound Obstet Gynecol 2015;46:284–298.',
      'MoHFW National Guidelines to Prevent Unnecessary Hysterectomies.',
    ],
    readsInApp: [
      'endometriosis',
      'adenomyosis',
      'fibroids',
      'score-rasrm',
      'score-ehp30',
      'algo-aub',
      'couns-endometriosis',
      'couns-fibroids',
    ],
  ),
  ExamTopic(
    id: 'exam-urogynaecology',
    title: 'Urogynaecology and pelvic floor',
    area: ExamArea.gynaecology,
    highYield: [
      'POP-Q uses six points, and the hymen is the zero reference. Stage is '
          'assigned by the leading edge relative to it.',
      'Stress incontinence is urethral sphincter incompetence; urgency '
          'incontinence is detrusor overactivity. The history separates them '
          'in most women.',
      'First-line for stress incontinence is supervised pelvic floor muscle '
          'training for at least three months.',
      'First-line for overactive bladder is bladder training, then '
          'antimuscarinics or mirabegron. Avoid oxybutynin in older women '
          'because of cognitive effects.',
      'Duloxetine is second line for stress incontinence and is poorly '
          'tolerated.',
      'Transvaginal mesh for prolapse is restricted or suspended in most '
          'jurisdictions following the Cumberlege review.',
      'Colposuspension and autologous fascial sling are the alternatives to '
          'mid-urethral tape where tape is not available.',
      'Obstetric fistula remains a significant problem in parts of India and '
          'is overwhelmingly caused by obstructed labour; prevention is '
          'timely intrapartum care.',
      'Urodynamics is not required before first-line conservative treatment; '
          'it is indicated before surgery, in mixed symptoms, and after '
          'failed treatment.',
      'A pessary is a legitimate long-term treatment, not merely a temporary '
          'measure, and needs a review schedule.',
      'Prolapse repair can unmask stress incontinence — counsel for it '
          'before operating.',
    ],
    vivaQuestions: [
      'Describe the POP-Q system and stage this prolapse.',
      'How do you distinguish stress from urgency incontinence?',
      'What is your first-line management of stress urinary incontinence?',
      'When would you request urodynamics?',
      'What do you tell a woman asking about mesh?',
      'How would you manage a vesicovaginal fistula after obstructed labour?',
      'What are the complications of a pessary left unreviewed?',
    ],
    classicTraps: [
      'Offering surgery before three months of supervised pelvic floor '
          'training.',
      'Prescribing oxybutynin to an elderly woman.',
      'Staging prolapse without reference to the hymen.',
      'Failing to warn about occult stress incontinence before prolapse '
          'repair.',
      'Discharging a pessary patient without a review date.',
    ],
    sources: [
      'NICE NG123 — Urinary incontinence and pelvic organ prolapse in women.',
      'RCOG/BSUG joint guidance on prolapse and continence surgery; '
          'Independent Medicines and Medical Devices Safety Review '
          '(Cumberlege), 2020.',
      'Bump RC et al. POP-Q standardisation. Am J Obstet Gynecol '
          '1996;175:10–17.',
      'Avery K et al. ICIQ-UI Short Form. Neurourol Urodyn 2004;23:322–330.',
      'Urogynecological Society of India guidance; FOGSI GCPR — '
          'Urogynaecology; MoHFW guidance on obstetric fistula management.',
    ],
    readsInApp: [
      'urogynaecology',
      'popq',
      'score-iciq-ui',
      'algo-urinary-retention',
      'proc-vaginal-surgery',
      'anat-perineum',
    ],
  ),
  ExamTopic(
    id: 'exam-maternal-medicine',
    title: 'Maternal medicine',
    area: ExamArea.obstetrics,
    highYield: [
      'Cardiac disease is the leading indirect cause of maternal death. '
          'Modified WHO classification of maternal cardiovascular risk '
          'decides where she delivers.',
      'In India, rheumatic heart disease remains a major contributor — mitral '
          'stenosis decompensates as cardiac output rises, typically in the '
          'second trimester and in labour.',
      'Thyroid: levothyroxine requirements rise by 25 – 50% in early '
          'pregnancy. Increase the dose as soon as pregnancy is confirmed '
          'rather than waiting for a test.',
      'Propylthiouracil in the first trimester, carbimazole thereafter — the '
          'switch is examined because both drugs carry different '
          'teratogenic risks.',
      'Epilepsy: sodium valproate is contraindicated in women of childbearing '
          'potential; lamotrigine and levetiracetam are preferred, and '
          'lamotrigine levels fall substantially in pregnancy.',
      'Folic acid 5 mg for epilepsy, diabetes, obesity, previous neural tube '
          'defect, sickle cell disease and thalassaemia.',
      'SLE and antiphospholipid syndrome: aspirin and, where indicated, '
          'heparin; anti-Ro and anti-La confer a risk of fetal heart block.',
      'Renal disease: pregnancy outcome tracks pre-pregnancy creatinine and '
          'blood pressure. A creatinine above 1.5 mg/dL carries a substantial '
          'risk of permanent decline.',
      'Venous thromboembolism remains a leading direct cause of maternal '
          'death; risk-assess at booking, on admission and after delivery.',
      'Tuberculosis in pregnancy: treat, do not defer. Standard first-line '
          'therapy is used, with streptomycin avoided.',
      'Anaemia: India\'s prevalence remains high; intravenous iron where oral '
          'fails or gestation is advanced, and blood only where indicated.',
      'Obstetric cholestasis: bile acids above 100 µmol/L carry the clearest '
          'stillbirth risk; the PITCHES trial found ursodeoxycholic acid did '
          'not improve perinatal outcomes.',
    ],
    vivaQuestions: [
      'How do you counsel a woman with rheumatic mitral stenosis planning '
          'pregnancy?',
      'A woman on levothyroxine has just conceived. What do you do?',
      'Why do we switch antithyroid drugs between trimesters?',
      'How do you manage epilepsy in pregnancy?',
      'Who gets 5 mg folic acid?',
      'How do you assess and manage VTE risk?',
      'How do you manage obstetric cholestasis and when do you deliver?',
      'A pregnant woman is diagnosed with pulmonary tuberculosis. What is '
          'your management?',
    ],
    classicTraps: [
      'Waiting for a thyroid function test before increasing levothyroxine.',
      'Continuing valproate because "she is stable on it".',
      'Using D-dimer to exclude VTE in pregnancy.',
      'Withholding a CTPA or V/Q scan because of radiation.',
      'Giving standard-dose folic acid to a woman with diabetes or epilepsy.',
      'Deferring tuberculosis treatment until after delivery.',
    ],
    sources: [
      'FOGSI GCPR — Medical Disorders in Pregnancy; MoHFW Anaemia Mukt '
          'Bharat; Revised National Tuberculosis Control Programme / National '
          'TB Elimination Programme guidance on TB in pregnancy.',
      'RCOG Green-top Guidelines 37a and 37b (VTE), 43 (Obstetric '
          'Cholestasis).',
      'ESC Guidelines for the management of cardiovascular diseases during '
          'pregnancy, 2018.',
      'MBRRACE-UK — Saving Lives, Improving Mothers\' Care.',
      'Chappell LC et al. PITCHES. Lancet 2019;394:849–860.',
    ],
    readsInApp: [
      'maternal-medicine',
      'anaemia',
      'vte-risk',
      'score-caprini',
      'lab-reference',
      'immunisation',
    ],
  ),
];
