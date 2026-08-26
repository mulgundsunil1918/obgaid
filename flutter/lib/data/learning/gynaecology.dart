import '../../models/learning_topic.dart';

const kGynaecologyLearningTopics = <LearningTopic>[
  LearningTopic(
    id: 'lrn-amenorrhoea',
    title: 'Amenorrhoea',
    subtitle: 'Primary and secondary, worked through by compartment',
    category: LearningCategory.gynaecology,
    competency: 'OG 17.1',
    summary: 'Amenorrhoea is best approached by asking which compartment has '
        'failed — outflow tract, ovary, pituitary or hypothalamus. That '
        'question orders the investigations and prevents a scattergun '
        'hormone profile.',
    sections: [
      LearningSection('Definitions', [
        'PRIMARY — no menstruation by 15 years with normal secondary sexual '
            'characteristics, or by 13 years with none.',
        'SECONDARY — cessation for 3 months in a woman with previously '
            'regular cycles, or 6 months if they were irregular.',
        'EXCLUDE PREGNANCY FIRST, every time, whatever she tells you about '
            'sexual activity.',
      ]),
      LearningSection('The four compartments', [
        'OUTFLOW TRACT — imperforate hymen, transverse vaginal septum, '
            'Müllerian agenesis, cervical stenosis, Asherman syndrome.',
        'OVARY — premature ovarian insufficiency, gonadal dysgenesis '
            'including Turner syndrome, PCOS.',
        'PITUITARY — prolactinoma, other adenoma, Sheehan syndrome, empty '
            'sella.',
        'HYPOTHALAMUS — functional hypothalamic amenorrhoea from weight loss, '
            'exercise or stress; Kallmann syndrome; infiltrative disease.',
        'Add the systemic and endocrine causes that act across compartments: '
            'thyroid disease, Cushing syndrome, congenital adrenal '
            'hyperplasia, chronic illness.',
      ]),
      LearningSection('Assessment of primary amenorrhoea', [
        'Are secondary sexual characteristics present? Their absence points '
            'to gonadal or hypothalamic-pituitary failure.',
        'Is the uterus present on ultrasound?',
        'Breasts present with absent uterus: Müllerian agenesis (MRKH) or '
            'androgen insensitivity syndrome. Karyotype and testosterone '
            'separate them — 46,XX with normal female testosterone in MRKH, '
            '46,XY with male-range testosterone in androgen insensitivity.',
        'No breasts with a uterus: measure FSH. High FSH means gonadal '
            'failure, so karyotype for Turner syndrome; low or normal FSH '
            'means hypothalamic-pituitary.',
        'Cyclical pain with amenorrhoea and a bulging blue membrane is an '
            'imperforate hymen with haematocolpos — a surgical, not a '
            'hormonal, problem.',
      ]),
      LearningSection('Assessment of secondary amenorrhoea', [
        'Pregnancy test.',
        'FSH, LH, oestradiol, prolactin, TSH, and testosterone where there is '
            'hirsutism or virilisation.',
        'High FSH with low oestradiol — premature ovarian insufficiency; '
            'repeat and karyotype in a young woman.',
        'High prolactin — repeat, exclude drugs, hypothyroidism and stress, '
            'then image the pituitary.',
        'Low FSH and LH — hypothalamic; ask about weight, exercise and '
            'stress, and image if there are neurological features.',
        'Normal or high LH:FSH with hyperandrogenism — consider PCOS by '
            'Rotterdam criteria.',
        'Pelvic ultrasound.',
        'A history of instrumentation with amenorrhoea suggests Asherman.',
      ]),
      LearningSection('Management principles', [
        'Treat the cause, not the symptom.',
        'Oestrogen replacement is required wherever there is prolonged '
            'hypo-oestrogenism, to protect bone and cardiovascular health — '
            'this is not optional in a young woman.',
        'In functional hypothalamic amenorrhoea, restoring energy '
            'availability is the treatment; the combined pill masks the '
            'problem without fixing the bone loss.',
        'Dopamine agonist for prolactinoma.',
        'Surgery for outflow obstruction.',
        'Discuss fertility explicitly, and early, because it is usually the '
            'question she came with and rarely the one she asks.',
      ]),
    ],
    keyPoints: [
      'Exclude pregnancy first, always.',
      'Think in four compartments: outflow, ovary, pituitary, hypothalamus.',
      'Breasts present with absent uterus: MRKH or androgen insensitivity — '
          'karyotype and testosterone separate them.',
      'Prolonged hypo-oestrogenism needs replacement to protect bone.',
      'The combined pill masks hypothalamic amenorrhoea without treating it.',
    ],
    related: ['pcos', 'score-rotterdam', 'menopause', 'infertility'],
    sources: [
      'ESHRE guideline — Premature Ovarian Insufficiency; ESHRE/ASRM PCOS '
          'international guideline, 2023.',
      'Gordon CM et al. Functional hypothalamic amenorrhea: an Endocrine '
          'Society clinical practice guideline. J Clin Endocrinol Metab '
          '2017;102:1413–1439.',
      'RCOG/BSPAG guidance on paediatric and adolescent gynaecology.',
      'National Medical Commission postgraduate curriculum; FOGSI GCPR — '
          'Amenorrhoea; Indian Society for Assisted Reproduction guidance.',
    ],
  ),
  LearningTopic(
    id: 'lrn-dysmenorrhoea',
    title: 'Dysmenorrhoea',
    subtitle: 'Primary and secondary, and why the distinction matters',
    category: LearningCategory.gynaecology,
    competency: 'OG 17.2',
    summary: 'Period pain that stops a woman working or studying is not '
        'normal, whatever she has been told. The clinical task is to relieve '
        'it and to identify the minority in whom it signals disease.',
    sections: [
      LearningSection('Primary dysmenorrhoea', [
        'No underlying pathology.',
        'Begins 6–12 months after menarche, once cycles become ovulatory.',
        'Cramping suprapubic pain starting with or just before bleeding, '
            'lasting 8–72 hours, often with nausea, diarrhoea and headache.',
        'Mechanism is excess endometrial prostaglandin production causing '
            'myometrial contraction and ischaemia — which is why NSAIDs '
            'work.',
      ]),
      LearningSection('Secondary dysmenorrhoea', [
        'Onset years after menarche, or a change in an established pattern.',
        'Pain that begins days before bleeding, persists after it, or is '
            'associated with deep dyspareunia.',
        'Causes: endometriosis, adenomyosis, fibroids, pelvic inflammatory '
            'disease, endometrial polyp, ovarian cyst, obstructive Müllerian '
            'anomaly, and the copper IUD.',
        'Red flags for referral: non-cyclical pain, abnormal bleeding, '
            'dyspareunia, subfertility, a pelvic mass, or failure of '
            'first-line treatment.',
      ]),
      LearningSection('Assessment', [
        'Full menstrual and sexual history.',
        'Abdominal examination in all; pelvic examination where she is '
            'sexually active and secondary causes are suspected — it is not '
            'required in a young adolescent with a typical primary picture.',
        'Swabs where infection is possible.',
        'Transvaginal ultrasound where secondary causes are suspected.',
        'A normal scan does NOT exclude endometriosis.',
      ]),
      LearningSection('Management', [
        'NSAIDs first line — mefenamic acid, ibuprofen or naproxen — started '
            'before or as pain begins rather than once established.',
        'Combined hormonal contraception, continuous or extended-cycle where '
            'she has no contraindication.',
        'Levonorgestrel intrauterine system, or a progestogen.',
        'Local heat has reasonable evidence and costs nothing.',
        'Exercise and transcutaneous nerve stimulation as adjuncts.',
        'Empirical treatment for suspected endometriosis is appropriate '
            'before laparoscopy — ESHRE no longer requires laparoscopic '
            'confirmation to treat.',
        'Refer if first-line treatment fails after about three months.',
      ]),
      LearningSection('Common errors', [
        'Telling an adolescent that severe period pain is normal, which is '
            'the beginning of the years-long delay to an endometriosis '
            'diagnosis.',
        'Prescribing analgesia to be taken only once the pain is established.',
        'Treating a normal scan as excluding disease.',
        'Not asking about school or work absence, which is the measure of '
            'severity that matters.',
      ]),
    ],
    keyPoints: [
      'Primary dysmenorrhoea begins 6–12 months after menarche, with ovulatory '
          'cycles.',
      'A prostaglandin mechanism is why NSAIDs are first line — and why they '
          'are taken early.',
      'A normal ultrasound does not exclude endometriosis.',
      'Pain that stops her working is not normal, and saying otherwise causes '
          'the diagnostic delay.',
    ],
    related: ['endometriosis', 'adenomyosis', 'score-ehp30', 'contraception'],
    sources: [
      'ESHRE guideline — Endometriosis, 2022.',
      'NICE NG73 — Endometriosis: diagnosis and management.',
      'Marjoribanks J et al. NSAIDs for dysmenorrhoea. Cochrane Database Syst '
          'Rev 2015.',
      'National Medical Commission postgraduate curriculum; FOGSI-ICOG Good '
          'Clinical Practice Recommendations on Endometriosis.',
    ],
  ),
  LearningTopic(
    id: 'lrn-pms',
    title: 'Premenstrual syndrome and PMDD',
    subtitle: 'Cyclical by definition, and diagnosed prospectively',
    category: LearningCategory.gynaecology,
    competency: 'OG 17.3',
    summary: 'Symptoms confined to the luteal phase that resolve with '
        'menstruation and interfere with daily life. The diagnosis requires a '
        'prospective symptom diary — retrospective recall is unreliable and '
        'over-diagnoses.',
    sections: [
      LearningSection('Definition and diagnosis', [
        'Symptoms recur in the luteal phase, resolve by the end of '
            'menstruation, and are followed by a symptom-free week.',
        'They must cause significant impairment.',
        'Diagnose with a prospective daily record over two cycles — the DRSP '
            'is the usual instrument.',
        'PREMENSTRUAL DYSPHORIC DISORDER is the severe form with predominant '
            'mood symptoms, and is a DSM-5 diagnosis.',
        'Underlying depression or anxiety that merely worsens premenstrually '
            'is premenstrual exacerbation, not PMS — the symptom-free week is '
            'what distinguishes them.',
      ]),
      LearningSection('Symptoms', [
        'PSYCHOLOGICAL — irritability, low mood, anxiety, tension, mood '
            'swings, poor concentration.',
        'PHYSICAL — bloating, breast tenderness, headache, joint and muscle '
            'pain, appetite change.',
        'BEHAVIOURAL — reduced function at work or at home, and relationship '
            'strain, which is often the reason she attends.',
      ]),
      LearningSection('Management', [
        'Explanation, and a symptom diary as the first therapeutic step.',
        'Exercise, sleep and stress reduction; cognitive behavioural therapy '
            'has good evidence.',
        'Calcium supplementation has reasonable evidence; vitamin B6 at low '
            'dose is widely used, with peripheral neuropathy at high dose.',
        'Combined hormonal contraception, particularly continuous regimens '
            'and drospirenone-containing preparations.',
        'SSRIs are effective and can be given continuously or in the luteal '
            'phase only — the luteal-phase-only regimen is a distinctive '
            'feature of this condition and works within days rather than '
            'weeks.',
        'Oestradiol with endometrial protection.',
        'GnRH analogues with add-back for severe refractory disease.',
        'Bilateral oophorectomy with hysterectomy is a last resort, and only '
            'after a GnRH analogue has demonstrated that ovarian suppression '
            'actually helps her.',
      ]),
      LearningSection('Common errors', [
        'Diagnosing from a retrospective history.',
        'Missing an underlying mood disorder because the symptom-free week '
            'was never established.',
        'Offering surgery before confirming a response to medical ovarian '
            'suppression.',
        'Dismissing the complaint — the impairment is real and measurable.',
      ]),
    ],
    keyPoints: [
      'A symptom-free week after menstruation is what defines PMS.',
      'Diagnosis requires a prospective diary over two cycles.',
      'SSRIs can be given luteal-phase only and act within days.',
      'Never offer oophorectomy before a GnRH analogue has shown benefit.',
    ],
    related: ['contraception', 'menopause', 'formulary'],
    sources: [
      'RCOG Green-top Guideline 48 — Management of Premenstrual Syndrome.',
      'ACOG guidance on premenstrual syndrome; DSM-5 criteria for '
          'premenstrual dysphoric disorder.',
      'Marjoribanks J et al. Selective serotonin reuptake inhibitors for '
          'premenstrual syndrome. Cochrane Database Syst Rev 2013.',
      'National Medical Commission postgraduate curriculum; Indian '
          'Psychiatric Society clinical practice guidelines; FOGSI GCPR.',
    ],
  ),
  LearningTopic(
    id: 'lrn-chronic-pelvic-pain',
    title: 'Chronic pelvic pain',
    subtitle: 'Multifactorial by nature, and rarely one diagnosis',
    category: LearningCategory.gynaecology,
    competency: 'OG 17.4',
    summary: 'Intermittent or constant pelvic pain for six months or more, '
        'not exclusively with menstruation or intercourse. It usually has '
        'several contributing causes at once, and treating only the '
        'gynaecological one fails.',
    sections: [
      LearningSection('Causes to consider together', [
        'GYNAECOLOGICAL — endometriosis, adenomyosis, pelvic inflammatory '
            'disease and adhesions, ovarian remnant, pelvic congestion.',
        'GASTROINTESTINAL — irritable bowel syndrome, inflammatory bowel '
            'disease, constipation. IBS is present in a large proportion of '
            'women referred to gynaecology with pelvic pain.',
        'UROLOGICAL — bladder pain syndrome, recurrent infection.',
        'MUSCULOSKELETAL — pelvic floor myalgia, abdominal wall trigger '
            'points, nerve entrapment. A positive Carnett sign — pain worse '
            'on tensing the abdominal wall — points here.',
        'NEUROPATHIC — pudendal neuralgia, nerve entrapment after '
            'Pfannenstiel incision.',
        'PSYCHOSOCIAL — depression, anxiety, and a history of sexual violence, '
            'which is substantially more prevalent in this group and is '
            'rarely volunteered.',
        'CENTRAL SENSITISATION — pain that has outlasted its original cause, '
            'which is a mechanism rather than a diagnosis of exclusion.',
      ]),
      LearningSection('Assessment', [
        'Take a pain history properly: site, radiation, cyclicity, relation '
            'to bowel and bladder, movement and intercourse.',
        'Screen for depression and anxiety, and ask about violence in '
            'private.',
        'A pain diary over two to three cycles.',
        'Abdominal examination including Carnett test.',
        'Pelvic examination looking for focal tenderness, nodularity, a fixed '
            'uterus, and pelvic floor tenderness.',
        'Swabs, urinalysis and transvaginal ultrasound.',
        'MRI where deep endometriosis is suspected.',
        'Laparoscopy is not a first-line investigation and a normal '
            'laparoscopy does not mean there is no pain.',
      ]),
      LearningSection('Management', [
        'Explain the model: several contributors, treated together.',
        'Agree realistic goals — function and quality of life, not '
            'necessarily zero pain.',
        'Cyclical pain: ovarian suppression with the combined pill, '
            'progestogen or the levonorgestrel system, as a therapeutic '
            'trial.',
        'Neuropathic pain: amitriptyline, gabapentin or pregabalin.',
        'Pelvic floor physiotherapy for myofascial pain.',
        'Psychological therapy — as part of the treatment, not as a hint that '
            'the pain is imagined.',
        'Multidisciplinary pain clinic referral where available.',
        'Avoid repeated laparoscopies and repeated ovarian surgery, which add '
            'adhesions and reduce ovarian reserve without relieving pain.',
      ]),
    ],
    keyPoints: [
      'It is usually several causes at once — treating only the '
          'gynaecological one fails.',
      'A positive Carnett sign points to the abdominal wall, not the pelvis.',
      'IBS is common in this population and is frequently the missed '
          'diagnosis.',
      'A normal laparoscopy does not mean there is no pain.',
      'Repeated surgery makes it worse.',
    ],
    related: [
      'endometriosis',
      'algo-pelvic-pain',
      'algo-pelvic-sepsis',
      'score-ehp30',
      'adenomyosis',
    ],
    sources: [
      'RCOG Green-top Guideline 41 — The Initial Management of Chronic Pelvic '
          'Pain.',
      'ESHRE guideline — Endometriosis, 2022.',
      'European Association of Urology guidelines on chronic pelvic pain.',
      'National Medical Commission postgraduate curriculum; Indian Society '
          'for Study of Pain guidance on chronic pelvic pain; FOGSI GCPR.',
    ],
  ),
  LearningTopic(
    id: 'lrn-endometrial-hyperplasia',
    title: 'Endometrial hyperplasia and polyps',
    subtitle: 'Unopposed oestrogen, and the atypia that changes everything',
    category: LearningCategory.gynaecology,
    competency: 'OG 18.2',
    summary: 'Hyperplasia is the precursor lesion of endometrioid carcinoma '
        'and is driven by unopposed oestrogen. The presence or absence of '
        'atypia divides a condition managed medically from one managed '
        'surgically.',
    sections: [
      LearningSection('Classification', [
        'WHO 2014 replaced the older four-category system with two: '
            'hyperplasia WITHOUT atypia, and ATYPICAL hyperplasia — also '
            'called endometrioid intraepithelial neoplasia.',
        'Hyperplasia without atypia: progression to carcinoma is low, under '
            'about 5% over 20 years.',
        'Atypical hyperplasia: substantially higher progression, and a '
            'concurrent carcinoma is found in a large minority — commonly '
            'quoted around 40% — at hysterectomy.',
      ]),
      LearningSection('Risk factors — all unopposed oestrogen', [
        'Obesity, through peripheral aromatisation in adipose tissue. This is '
            'the dominant modifiable factor.',
        'Anovulation, particularly PCOS.',
        'Oestrogen-only hormone therapy in a woman with a uterus.',
        'Tamoxifen.',
        'Oestrogen-secreting tumours, such as granulosa cell tumour.',
        'Nulliparity, late menopause, diabetes.',
        'Lynch syndrome — consider in young women and where there is a family '
            'history of colorectal or endometrial cancer.',
      ]),
      LearningSection('Presentation and diagnosis', [
        'Abnormal uterine bleeding — heavy, intermenstrual, or '
            'postmenopausal.',
        'Transvaginal ultrasound for endometrial thickness, then sampling.',
        'Outpatient pipelle first line; hysteroscopy with directed biopsy '
            'where sampling fails, is insufficient, or focal disease is '
            'suspected.',
        'A blind sample can miss focal disease — persistent bleeding after a '
            'benign pipelle needs hysteroscopy.',
      ]),
      LearningSection('Management without atypia', [
        'Reverse the driver: weight loss, and stop unopposed oestrogen.',
        'Levonorgestrel intrauterine system is first line and has the highest '
            'regression rate.',
        'Oral progestogens — continuous rather than cyclical — where the '
            'system is declined.',
        'Repeat sampling at 6-monthly intervals; at least two consecutive '
            'negative samples before discharge.',
        'Hysterectomy if it progresses to atypia, does not regress within 12 '
            'months, relapses, or she declines surveillance.',
      ]),
      LearningSection('Management with atypia', [
        'Total hysterectomy is the treatment, with bilateral salpingectomy; '
            'oophorectomy is individualised and generally offered after the '
            'menopause.',
        'Do NOT morcellate.',
        'Fertility-sparing management with the levonorgestrel system is '
            'possible for a woman who wants to conceive, but requires '
            'exclusion of invasive disease, close 3-monthly sampling, '
            'referral for fertility treatment, and hysterectomy once the '
            'family is complete.',
        'Involve gynaecological oncology.',
      ]),
      LearningSection('Endometrial polyps', [
        'Common, and usually benign; the malignancy rate rises with age, '
            'postmenopausal status and bleeding.',
        'Cause intermenstrual and postmenopausal bleeding and may impair '
            'implantation.',
        'Diagnose on ultrasound, saline infusion sonography or hysteroscopy.',
        'Remove symptomatic polyps hysteroscopically, and send for histology '
            '— avulsion without histology is how a malignant polyp is '
            'missed.',
      ]),
    ],
    keyPoints: [
      'WHO 2014: with atypia, or without. That division decides everything.',
      'Atypical hyperplasia harbours concurrent carcinoma in a large minority '
          '— hysterectomy is standard.',
      'The levonorgestrel system is first line without atypia.',
      'Obesity is the dominant modifiable driver.',
      'Always send a removed polyp for histology.',
    ],
    related: [
      'algo-pmb',
      'algo-aub',
      'proc-endometrial-biopsy',
      'proc-hysteroscopy',
      'figo-endometrium-2023',
    ],
    sources: [
      'RCOG/BSGE Green-top Guideline 67 — Management of Endometrial '
          'Hyperplasia.',
      'WHO Classification of Tumours of Female Reproductive Organs, 2014.',
      'NICE NG88 — Heavy menstrual bleeding; NICE NG12 — Suspected cancer.',
      'National Cancer Grid of India guidelines on endometrial cancer; FOGSI '
          'GCPR — Abnormal Uterine Bleeding.',
    ],
  ),
  LearningTopic(
    id: 'lrn-mullerian-anomalies',
    title: 'Müllerian anomalies',
    subtitle: 'Fusion and resorption failures, and the renal tract',
    category: LearningCategory.gynaecology,
    competency: 'OG 16.3',
    summary: 'Congenital uterine anomalies arise from failure of Müllerian '
        'duct fusion or of septal resorption. Because the mesonephric duct '
        'guides Müllerian migration, they are frequently accompanied by renal '
        'anomalies — which is why imaging the kidneys is mandatory.',
    sections: [
      LearningSection('Embryological basis', [
        'The paired paramesonephric (Müllerian) ducts form the tubes, uterus, '
            'cervix and upper two-thirds of the vagina.',
        'They fuse in the midline, then the intervening septum is resorbed.',
        'FAILURE OF FUSION gives bicornuate and didelphys uteri.',
        'FAILURE OF RESORPTION gives the septate uterus.',
        'FAILURE OF DEVELOPMENT gives agenesis or a unicornuate uterus with '
            'or without a rudimentary horn.',
        'The mesonephric duct guides migration, so anomalies associate with '
            'renal agenesis, ectopia and duplication.',
      ]),
      LearningSection('Classification', [
        'The ESHRE/ESGE classification describes uterus, cervix and vagina '
            'separately, which the older AFS system did not.',
        'Class U1 dysmorphic, U2 septate, U3 bicorporeal, U4 hemi-uterus, U5 '
            'aplastic, U6 unclassified.',
        'The clinically important distinction is SEPTATE from BICORNUATE: the '
            'septate uterus has a normal external fundal contour and is '
            'treated hysteroscopically; the bicornuate has an indented '
            'external contour and is not.',
        'Three-dimensional ultrasound or MRI is required to make that '
            'distinction. Hysterosalpingography alone cannot, because it sees '
            'only the cavity.',
      ]),
      LearningSection('Clinical consequences', [
        'SEPTATE — the anomaly most associated with miscarriage and preterm '
            'birth.',
        'UNICORNUATE — preterm birth, malpresentation, growth restriction; a '
            'non-communicating rudimentary horn can host an ectopic pregnancy '
            'that ruptures catastrophically.',
        'DIDELPHYS and BICORNUATE — malpresentation and preterm birth, with a '
            'longitudinal vaginal septum in some.',
        'OBSTRUCTIVE anomalies present at puberty with cyclical pain and '
            'primary amenorrhoea or haematocolpos.',
        'OHVIRA (obstructed hemivagina with ipsilateral renal anomaly) — '
            'cyclical pain despite regular periods, with a pelvic mass.',
        'Many women with a non-obstructive anomaly are entirely '
            'asymptomatic.',
      ]),
      LearningSection('Management', [
        'IMAGE THE RENAL TRACT in every case.',
        'Hysteroscopic septal resection for a septate uterus, though the '
            'evidence base is weaker than practice implies — counsel '
            'honestly.',
        'Do not operate on a bicornuate uterus for recurrent loss; '
            'metroplasty is largely historic.',
        'Excise a non-communicating rudimentary horn because of the ectopic '
            'risk.',
        'Relieve obstruction surgically in obstructive anomalies.',
        'Vaginal dilators are first line in Müllerian agenesis, with surgery '
            'reserved for failure; psychological support is part of care, not '
            'an add-on.',
        'Counsel about obstetric risk and arrange appropriate surveillance in '
            'pregnancy.',
      ]),
    ],
    keyPoints: [
      'Fusion failure gives bicornuate and didelphys; resorption failure '
          'gives septate.',
      'Septate has a normal external contour and is resected; bicornuate does '
          'not and is not.',
      'HSG alone cannot make that distinction — use 3D ultrasound or MRI.',
      'Image the renal tract in every case.',
      'Excise a non-communicating rudimentary horn.',
    ],
    related: ['infertility', 'algo-preterm-labour', 'algo-ectopic', 'imaging'],
    sources: [
      'Grimbizis GF et al. ESHRE/ESGE consensus on the classification of '
          'female genital tract congenital anomalies. Hum Reprod '
          '2013;28:2032–2044.',
      'ASRM Müllerian anomalies classification, 2021.',
      'RCOG/BSPAG guidance on paediatric and adolescent gynaecology.',
      'National Medical Commission postgraduate curriculum; FOGSI GCPR — '
          'Congenital Anomalies of the Genital Tract.',
    ],
  ),
  LearningTopic(
    id: 'lrn-asherman',
    title: 'Asherman syndrome',
    subtitle: 'Intrauterine adhesions, mostly iatrogenic',
    category: LearningCategory.gynaecology,
    competency: 'OG 18.4',
    summary: 'Intrauterine adhesions following trauma to a recently pregnant '
        'endometrium. It is overwhelmingly iatrogenic, which makes it the '
        'clearest argument for vacuum aspiration over sharp curettage.',
    sections: [
      LearningSection('Causes', [
        'Curettage of a recently pregnant uterus — the dominant cause, and '
            'the risk is highest with sharp curettage and with repeated '
            'procedures.',
        'Curettage for retained products or after postpartum haemorrhage.',
        'Genital tuberculosis, which is an important cause in India and '
            'produces particularly dense, treatment-resistant adhesions.',
        'Myomectomy entering the cavity, hysteroscopic surgery, and uterine '
            'artery embolisation.',
        'Severe endometritis.',
      ]),
      LearningSection('Presentation', [
        'Amenorrhoea or hypomenorrhoea after an intrauterine procedure.',
        'Cyclical pain if functioning endometrium is trapped behind an '
            'obstruction.',
        'Subfertility and recurrent pregnancy loss.',
        'Abnormal placentation in a subsequent pregnancy, including accreta '
            'spectrum.',
        'The diagnosis is often delayed because the amenorrhoea is attributed '
            'to hormonal causes and hormone profiles come back normal.',
      ]),
      LearningSection('Diagnosis', [
        'A normal hormone profile with amenorrhoea after uterine '
            'instrumentation should raise it immediately.',
        'HYSTEROSCOPY is the reference standard and allows treatment at the '
            'same sitting.',
        'Hysterosalpingography and saline infusion sonography show filling '
            'defects.',
        'Transvaginal ultrasound may show a thin, irregular endometrium.',
        'Test for genital tuberculosis where the picture or the setting '
            'suggests it — endometrial sampling for histology, culture and '
            'PCR.',
      ]),
      LearningSection('Management', [
        'Hysteroscopic adhesiolysis, ideally under direct vision with cold '
            'scissors rather than energy, which causes further damage.',
        'Prevent reformation: an intrauterine device, balloon or gel barrier, '
            'with practice varying and the evidence modest.',
        'Postoperative oestrogen to promote re-epithelialisation.',
        'Second-look hysteroscopy to divide any reformed adhesions.',
        'Treat tuberculosis where confirmed, but counsel that endometrial '
            'damage from genital tuberculosis is often irreversible and that '
            'surrogacy may be the realistic route to a child.',
        'Warn about placenta accreta spectrum in any subsequent pregnancy and '
            'arrange placental localisation.',
      ]),
      LearningSection('Prevention — the part that matters', [
        'Use vacuum aspiration rather than sharp curettage.',
        'Avoid unnecessary and repeated curettage; consider medical '
            'management of miscarriage and retained products first.',
        'Operate on an infected uterus only with antibiotic cover.',
        'Ultrasound guidance during difficult evacuation.',
      ]),
    ],
    keyPoints: [
      'Amenorrhoea with a normal hormone profile after instrumentation is '
          'Asherman until disproven.',
      'It is overwhelmingly iatrogenic and largely preventable.',
      'Genital tuberculosis is an important Indian cause and often '
          'irreversible.',
      'Hysteroscopy both diagnoses and treats.',
      'Subsequent pregnancies carry accreta risk.',
    ],
    related: [
      'proc-hysteroscopy',
      'proc-surgical-miscarriage',
      'proc-uterine-exploration',
      'infertility',
      'lrn-aph-praevia',
    ],
    sources: [
      'AAGL practice guidelines on intrauterine adhesions.',
      'ESHRE guideline — Recurrent Pregnancy Loss, 2023.',
      'Deans R, Abbott J. Review of intrauterine adhesions. J Minim Invasive '
          'Gynecol 2010;17:555–569.',
      'ICMR National Guidelines on genital tuberculosis and infertility; '
          'MoHFW National TB Elimination Programme; FOGSI GCPR — Genital '
          'Tuberculosis.',
    ],
  ),
];
