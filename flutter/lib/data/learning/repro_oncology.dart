import '../../models/learning_topic.dart';

const kReproOncLearningTopics = <LearningTopic>[
  LearningTopic(
    id: 'lrn-male-factor',
    title: 'Male factor infertility',
    subtitle: 'Semen analysis, and the causes worth finding',
    category: LearningCategory.reproductive,
    competency: 'OG 19.2',
    summary: 'A male factor contributes in about half of infertile couples. '
        'Semen analysis is cheap, non-invasive and decisive, which is why it '
        'belongs at the start of the evaluation rather than after the woman '
        'has had invasive testing.',
    sections: [
      LearningSection('Semen analysis', [
        'Abstinence of 2–7 days; collect the whole sample and deliver it to '
            'the laboratory promptly, kept near body temperature.',
        'WHO 2021 (sixth edition) lower reference limits, which are the 5th '
            'centile of fertile men and are NOT a threshold of normality: '
            'volume 1.4 mL, concentration 16 million/mL, total count 39 '
            'million, progressive motility 30%, total motility 42%, normal '
            'morphology 4%.',
        'REPEAT AN ABNORMAL RESULT after about 3 months — spermatogenesis '
            'takes roughly 74 days, so a single abnormal sample may reflect a '
            'transient insult such as fever.',
        'Azoospermia must be confirmed on a centrifuged specimen on two '
            'occasions before it is accepted.',
      ]),
      LearningSection('Terminology', [
        'OLIGOZOOSPERMIA — low concentration.',
        'ASTHENOZOOSPERMIA — reduced motility.',
        'TERATOZOOSPERMIA — reduced normal forms.',
        'OLIGOASTHENOTERATOZOOSPERMIA — all three.',
        'AZOOSPERMIA — no sperm, which divides into obstructive and '
            'non-obstructive, and that division governs everything that '
            'follows.',
      ]),
      LearningSection('Causes', [
        'PRE-TESTICULAR — hypogonadotrophic hypogonadism, including Kallmann '
            'syndrome; hyperprolactinaemia; exogenous androgens, which are a '
            'common and reversible cause and are frequently not volunteered.',
        'TESTICULAR — varicocele, cryptorchidism, orchitis including mumps, '
            'torsion, chemotherapy and radiotherapy, Klinefelter syndrome '
            '(47,XXY), Y-chromosome microdeletion.',
        'POST-TESTICULAR — congenital bilateral absence of the vas deferens, '
            'which is associated with CFTR mutations; obstruction from '
            'infection or vasectomy; ejaculatory dysfunction, including '
            'retrograde ejaculation in diabetes.',
        'LIFESTYLE — smoking, alcohol, obesity, anabolic steroids, heat '
            'exposure.',
        'In India, genital tuberculosis is an important cause of obstructive '
            'azoospermia.',
      ]),
      LearningSection('Investigation beyond the semen analysis', [
        'Examination: testicular volume with an orchidometer, vasa present or '
            'absent, varicocele.',
        'FSH, LH and testosterone. High FSH with small testes indicates '
            'primary testicular failure; low FSH and LH indicate a '
            'hypothalamic-pituitary cause, which is treatable.',
        'Karyotype and Y-chromosome microdeletion testing in severe '
            'oligozoospermia or non-obstructive azoospermia.',
        'CFTR testing where the vasa are absent — and test the female partner '
            'too before proceeding.',
        'Scrotal ultrasound; transrectal ultrasound where distal obstruction '
            'is suspected.',
        'Post-ejaculatory urinalysis for retrograde ejaculation.',
      ]),
      LearningSection('Management', [
        'Treat the reversible: stop anabolic steroids, treat '
            'hyperprolactinaemia, correct hypogonadotrophic hypogonadism with '
            'gonadotrophins.',
        'Lifestyle change, with honest expectations about effect size.',
        'Varicocele repair is debated; it may improve parameters in selected '
            'men with a clinical varicocele and abnormal semen.',
        'Surgical sperm retrieval — PESA, TESA, TESE or micro-TESE — with '
            'ICSI. Micro-TESE has the best yield in non-obstructive '
            'azoospermia.',
        'Donor sperm where retrieval fails or is declined, within the ART Act '
            'framework.',
        'Never treat the woman alone. Proceeding to IVF without assessing the '
            'man is a common and expensive error.',
        'Do not prescribe empirical testosterone — it suppresses '
            'spermatogenesis and makes the problem worse.',
      ]),
    ],
    keyPoints: [
      'Semen analysis first — it is cheap, decisive, and often skipped.',
      'WHO 2021 limits are 5th centiles of fertile men, not thresholds of '
          'normality.',
      'Repeat an abnormal sample after about 3 months; spermatogenesis takes '
          '74 days.',
      'Absent vasa means test for CFTR mutations, in both partners.',
      'Testosterone suppresses spermatogenesis — never give it for '
          'infertility.',
    ],
    related: ['infertility', 'couns-infertility', 'couns-ivf', 'lrn-asherman'],
    sources: [
      'WHO laboratory manual for the examination and processing of human '
          'semen, sixth edition, 2021.',
      'NICE NG257 — Fertility problems: assessment and treatment.',
      'EAU Guidelines on Sexual and Reproductive Health.',
      'ICMR National Guidelines for Accreditation, Supervision and Regulation '
          'of ART Clinics; ART (Regulation) Act 2021; Indian Society for '
          'Assisted Reproduction recommendations.',
    ],
  ),
  LearningTopic(
    id: 'lrn-ovulation-induction',
    title: 'Ovulation induction',
    subtitle: 'Agents, monitoring, and the complications to prevent',
    category: LearningCategory.reproductive,
    competency: 'OG 19.3',
    summary: 'Ovulation induction aims to produce ONE dominant follicle in an '
        'anovulatory woman. That distinguishes it from superovulation for '
        'IVF, and it is why monitoring matters — the goal is a singleton '
        'pregnancy, not the most follicles possible.',
    sections: [
      LearningSection('Classify the anovulation first', [
        'WHO GROUP I — hypogonadotrophic hypogonadal anovulation. Low FSH, '
            'low LH, low oestradiol. Includes functional hypothalamic '
            'amenorrhoea and Kallmann syndrome. Treated with pulsatile GnRH '
            'or gonadotrophins containing LH activity.',
        'WHO GROUP II — normogonadotrophic normo-oestrogenic anovulation. '
            'Around 85% of cases, and mostly PCOS. Treated with letrozole, '
            'clomiphene or gonadotrophins.',
        'WHO GROUP III — hypergonadotrophic hypo-oestrogenic anovulation, '
            'that is ovarian failure. Ovulation induction does not work; '
            'donor oocytes are the route.',
        'Hyperprolactinaemic anovulation is treated with a dopamine agonist '
            'and is classified separately.',
      ]),
      LearningSection('Agents in WHO group II', [
        'LETROZOLE — an aromatase inhibitor, now first line. Higher live '
            'birth rates than clomiphene in PCOS (Legro, PPCOS II). Short '
            'half-life, so no antioestrogenic effect on endometrium or '
            'cervical mucus.',
        'CLOMIPHENE CITRATE — a selective oestrogen receptor modulator that '
            'blocks hypothalamic feedback. Effective, but its long half-life '
            'thins the endometrium and thickens cervical mucus, and there is '
            'a dissociation between ovulation and conception rates.',
        'METFORMIN — improves ovulation in PCOS, particularly with insulin '
            'resistance, but is less effective than letrozole for live '
            'birth. Useful as an adjunct.',
        'GONADOTROPHINS — where oral agents fail. Effective, and carry the '
            'highest risk of multiple pregnancy and OHSS, so they demand '
            'careful monitoring.',
        'LAPAROSCOPIC OVARIAN DRILLING — an alternative in clomiphene-resistant '
            'PCOS. Avoids multiple pregnancy but risks adhesions and reduced '
            'ovarian reserve.',
        'Weight loss of even 5–10% restores ovulation in a meaningful '
            'proportion and should be offered alongside, not instead of, '
            'treatment.',
      ]),
      LearningSection('Monitoring', [
        'Ultrasound follicular tracking, particularly in the first cycle and '
            'always with gonadotrophins.',
        'CANCEL OR WITHHOLD hCG where too many follicles develop — this is '
            'the step that prevents both high-order multiple pregnancy and '
            'OHSS, and it is the step most often skipped under pressure to '
            'proceed.',
        'Mid-luteal progesterone to confirm ovulation, taken 7 days before '
            'the expected period.',
        'Confirm tubal patency and a semen analysis BEFORE embarking on '
            'repeated cycles — inducing ovulation into a blocked tube or an '
            'untreated male factor wastes months.',
      ]),
      LearningSection('Risks and counselling', [
        'MULTIPLE PREGNANCY — the principal risk, and the reason for '
            'monitoring.',
        'OHSS — much less common with oral agents than with gonadotrophins.',
        'Ovarian torsion in stimulated ovaries.',
        'Ectopic pregnancy risk is raised.',
        'Limit clomiphene to about six ovulatory cycles; continuing beyond '
            'that adds little.',
        'Counsel on realistic cumulative success by age and diagnosis, and on '
            'cost, before starting.',
        'The ART Act and ICMR guidelines govern practice, record-keeping and '
            'what may be offered.',
      ]),
    ],
    keyPoints: [
      'Classify the anovulation into WHO groups first — it dictates the '
          'agent.',
      'Letrozole beats clomiphene for live birth in PCOS.',
      'The aim is one follicle, not many.',
      'Withhold the trigger when too many follicles develop.',
      'Confirm tubal patency and semen analysis before repeated cycles.',
    ],
    related: ['pcos', 'infertility', 'legro-letrozole', 'algo-ohss',
        'couns-infertility'],
    sources: [
      'Legro RS et al. Letrozole versus clomiphene for infertility in the '
          'polycystic ovary syndrome. N Engl J Med 2014;371:119–129.',
      'International evidence-based guideline for the assessment and '
          'management of polycystic ovary syndrome, 2023.',
      'NICE NG257 — Fertility problems; ESHRE ovarian stimulation guideline.',
      'ICMR National Guidelines for ART Clinics; ART (Regulation) Act 2021; '
          'FOGSI-ICOG recommendations on ovulation induction.',
    ],
  ),
  LearningTopic(
    id: 'lrn-art-techniques',
    title: 'Assisted reproductive techniques',
    subtitle: 'IUI, IVF, ICSI, and what the regulations require',
    category: LearningCategory.reproductive,
    competency: 'OG 19.4',
    summary: 'A ladder of interventions from intrauterine insemination '
        'through to ICSI with preimplantation testing. Choosing the right '
        'rung depends on the diagnosis, her age, and how long they have been '
        'trying.',
    sections: [
      LearningSection('Intrauterine insemination', [
        'Prepared sperm placed in the uterine cavity around ovulation.',
        'Requires at least one patent tube and adequate sperm parameters.',
        'Used for mild male factor, cervical factor, unexplained '
            'subfertility, and where intercourse is not possible.',
        'May be in a natural or a stimulated cycle; stimulation improves '
            'success and raises multiple pregnancy risk.',
        'Success per cycle is modest, so agree in advance how many cycles '
            'before moving on — usually three to six.',
      ]),
      LearningSection('IVF and ICSI', [
        'IVF: oocytes and prepared sperm are co-incubated and fertilisation '
            'occurs conventionally.',
        'ICSI: a single sperm is injected into the oocyte. Indicated for '
            'severe male factor, previous fertilisation failure, and '
            'surgically retrieved sperm.',
        'ICSI DOES NOT IMPROVE OUTCOMES in non-male-factor infertility, and '
            'offering it routinely adds cost without benefit.',
        'Steps: down-regulation or antagonist suppression, stimulation, '
            'monitoring, trigger, retrieval, fertilisation, culture, '
            'transfer, luteal support, pregnancy test.',
        'Fertilisation is assessed at 16–18 hours by the presence of two '
            'pronuclei.',
        'Transfer at cleavage stage (day 2–3) or blastocyst (day 5–6).',
      ]),
      LearningSection('Embryo transfer and cryopreservation', [
        'SINGLE EMBRYO TRANSFER gives a comparable cumulative live birth rate '
            'with far less multiple pregnancy, which is the main avoidable '
            'harm in this field.',
        'Vitrification has largely replaced slow freezing for both oocytes '
            'and embryos.',
        'Freeze-all strategies avoid transferring into a supraphysiological '
            'endocrine environment and are used to prevent OHSS.',
        'Storage duration, cost and the disposition of embryos on separation '
            'or death must be consented for in writing at the outset.',
      ]),
      LearningSection('Preimplantation genetic testing', [
        'PGT-M for monogenic disorders; PGT-SR for structural rearrangements; '
            'PGT-A for aneuploidy screening.',
        'Trophectoderm biopsy at blastocyst stage is preferred to '
            'cleavage-stage biopsy, which damages the embryo.',
        'PGT-A has not been shown to improve cumulative live birth per '
            'started cycle and should be presented honestly.',
        'PGT FOR SEX SELECTION IS PROHIBITED IN INDIA under the PCPNDT Act, '
            'except for sex-linked disorders.',
      ]),
      LearningSection('Regulation in India', [
        'The ART (Regulation) Act 2021 and its Rules govern clinic '
            'registration, permissible procedures, donor gametes and record '
            'keeping.',
        'The Surrogacy (Regulation) Act 2021 permits only altruistic '
            'surrogacy and sets eligibility criteria.',
        'Commercial surrogacy and commercial gamete donation are prohibited.',
        'The PCPNDT Act separately prohibits sex selection at any stage.',
        'Written informed consent, accurate disclosure of success rates, and '
            'mandatory record retention are statutory, not optional.',
        'Counsel about add-ons: many are offered widely and few have evidence '
            '— say which is which.',
      ]),
    ],
    keyPoints: [
      'ICSI is for male factor and fertilisation failure, not for everyone.',
      'Single embryo transfer gives similar cumulative live birth with far '
          'less multiple pregnancy.',
      'PGT-A has not been shown to improve cumulative live birth.',
      'Sex selection by PGT is illegal in India except for sex-linked '
          'disease.',
      'The ART and Surrogacy Acts make consent, disclosure and records '
          'statutory duties.',
    ],
    related: ['infertility', 'ohss', 'algo-ohss', 'couns-ivf', 'pcpndt-act'],
    sources: [
      'ESHRE guideline — Ovarian Stimulation for IVF/ICSI, 2019; ESHRE good '
          'practice recommendations on add-ons.',
      'NICE NG257 — Fertility problems: assessment and treatment.',
      'HFEA information on treatment add-ons and success rates.',
      'ART (Regulation) Act 2021 and Rules; Surrogacy (Regulation) Act 2021; '
          'PCPNDT Act 1994; ICMR National Guidelines for ART Clinics; ISAR '
          'recommendations.',
    ],
  ),
  LearningTopic(
    id: 'lrn-cervical-cancer',
    title: 'Cervical cancer',
    subtitle: 'Screening, presentation and treatment — India\'s largest '
        'gynaecological cancer burden',
    category: LearningCategory.oncology,
    competency: 'OG 22.2',
    summary: 'Almost entirely preventable, and still one of the commonest '
        'causes of cancer death in Indian women. The gap is not knowledge but '
        'coverage of vaccination and screening.',
    sections: [
      LearningSection('Screening in India', [
        'The national programme under NPCDCS uses VISUAL INSPECTION WITH '
            'ACETIC ACID (VIA) delivered at the primary care level, because '
            'it requires no laboratory and gives a same-visit result.',
        'Screen-and-treat with VIA followed by cryotherapy or thermal '
            'ablation avoids loss to follow-up, which is the main failure '
            'mode of cytology-based programmes in low-resource settings.',
        'Cytology and HPV testing are used where available; WHO recommends '
            'HPV testing as the preferred primary method.',
        'WHO\'s 90-70-90 elimination targets: 90% of girls vaccinated by 15, '
            '70% of women screened twice with a high-performance test, and '
            '90% of those with disease treated.',
        'Screening intervals and start age follow national guidance; the '
            'practical priority is screening women at least once in the '
            '30–49 age band.',
      ]),
      LearningSection('Presentation', [
        'Often asymptomatic and screen-detected in early disease.',
        'POSTCOITAL BLEEDING — the classic symptom, and the one most often '
            'dismissed.',
        'Intermenstrual and postmenopausal bleeding.',
        'Offensive blood-stained vaginal discharge.',
        'Advanced disease: pelvic or back pain, leg swelling from '
            'lymphoedema or vein compression, ureteric obstruction and renal '
            'failure, vesicovaginal or rectovaginal fistula.',
        'A CERVIX THAT LOOKS ABNORMAL IS BIOPSIED, whatever the smear '
            'result. This is the single most important rule here.',
      ]),
      LearningSection('Pathology and spread', [
        'Squamous cell carcinoma is the commonest; adenocarcinoma is rising '
            'and is less well detected by cytology.',
        'Arises at the transformation zone.',
        'Spreads by direct extension into the parametrium, vagina, bladder '
            'and rectum; lymphatically to pelvic then para-aortic nodes; '
            'haematogenous spread is late.',
        'Staged by FIGO 2018, which for the first time incorporates imaging '
            'and pathological nodal status.',
      ]),
      LearningSection('Treatment principles', [
        'Microinvasive disease: conisation may suffice, preserving '
            'fertility.',
        'Early-stage disease: radical hysterectomy with pelvic '
            'lymphadenectomy, or chemoradiotherapy — equivalent survival, '
            'different morbidity.',
        'The LACC trial showed minimally invasive radical hysterectomy had '
            'WORSE disease-free and overall survival than open surgery, which '
            'returned open surgery to standard.',
        'Locally advanced disease: concurrent cisplatin-based '
            'chemoradiotherapy with brachytherapy. Brachytherapy is not '
            'optional and omitting it worsens survival.',
        'Fertility-sparing radical trachelectomy in selected early disease.',
        'Recurrent or metastatic disease: chemotherapy with bevacizumab, and '
            'pembrolizumab in PD-L1-positive disease.',
        'Manage in a centre with gynaecological oncology and radiotherapy; '
            'the National Cancer Grid resource-stratified guidelines set out '
            'what is appropriate at each level of facility.',
      ]),
      LearningSection('Survivorship', [
        'Vaginal stenosis after radiotherapy — dilators, explained properly '
            'and early, not mentioned once in passing.',
        'Surgical menopause in young women, and whether hormone therapy is '
            'appropriate for her.',
        'Bladder and bowel dysfunction, and lymphoedema.',
        'Sexual function — raise it yourself; she will not.',
        'Fertility loss, discussed before treatment starts.',
      ]),
    ],
    keyPoints: [
      'India uses VIA-based screen-and-treat because same-visit treatment '
          'beats loss to follow-up.',
      'Postcoital bleeding is the classic symptom and the most dismissed.',
      'Biopsy an abnormal-looking cervix whatever the smear says.',
      'LACC returned open radical hysterectomy to standard for early disease.',
      'Brachytherapy is essential in locally advanced disease.',
    ],
    related: [
      'figo-cervix-2018',
      'proc-pap',
      'proc-colposcopy',
      'lacc',
      'lrn-hpv-vaccination',
      'couns-cancer-diagnosis',
    ],
    sources: [
      'FIGO staging for carcinoma of the cervix uteri, 2018 revision.',
      'Ramirez PT et al. LACC. N Engl J Med 2018;379:1895–1904.',
      'WHO Global Strategy to Accelerate the Elimination of Cervical Cancer, '
          '2020; WHO guideline for screening and treatment of cervical '
          'pre-cancer lesions, 2021.',
      'MoHFW Operational Framework: Management of Common Cancers under '
          'NPCDCS; National Cancer Grid of India resource-stratified '
          'guidelines for cervical cancer; Tata Memorial Centre '
          'evidence-based management manuals.',
    ],
  ),
  LearningTopic(
    id: 'lrn-ovarian-cancer',
    title: 'Ovarian cancer',
    subtitle: 'Late presentation, and why the tube matters',
    category: LearningCategory.oncology,
    competency: 'OG 22.4',
    summary: 'Most epithelial ovarian cancer presents at an advanced stage '
        'because early symptoms are vague and there is no effective screening '
        'test. High-grade serous carcinoma is now understood to arise largely '
        'from the fallopian tube.',
    sections: [
      LearningSection('Origin and pathology', [
        'HIGH-GRADE SEROUS is the commonest and most lethal. Almost universal '
            'p53 mutation, associated with BRCA, and arising largely from '
            'serous tubal intraepithelial carcinoma in the fimbria.',
        'That origin is why OPPORTUNISTIC SALPINGECTOMY at hysterectomy or '
            'sterilisation is now recommended — it removes the tissue the '
            'cancer starts in.',
        'Low-grade serous: indolent, chemoresistant, hormonally responsive.',
        'Endometrioid and clear cell: both associated with endometriosis; '
            'clear cell is chemoresistant.',
        'Mucinous: often large and unilateral — exclude a gastrointestinal '
            'primary before accepting it as ovarian.',
        'Germ cell tumours in young women, and sex cord-stromal tumours, '
            'behave entirely differently and are usually curable with '
            'fertility-sparing surgery.',
      ]),
      LearningSection('Risk and prevention', [
        'Risk rises with ovulatory cycles: nulliparity, early menarche, late '
            'menopause.',
        'PROTECTIVE: pregnancy, breastfeeding, combined oral contraception '
            '(substantially, and durably), tubal ligation, salpingectomy.',
        'BRCA1 and BRCA2 carry high lifetime risk; Lynch syndrome raises risk '
            'of endometrial and ovarian cancer.',
        'Offer genetic testing to every woman with high-grade serous '
            'carcinoma — it changes her treatment and her family\'s '
            'surveillance.',
        'Risk-reducing bilateral salpingo-oophorectomy in confirmed carriers, '
            'timed to completed family and age.',
        'Population screening with CA-125 and ultrasound has NOT been shown '
            'to reduce mortality (UKCTOCS) and is not recommended.',
      ]),
      LearningSection('Presentation and assessment', [
        'Persistent bloating, early satiety, pelvic or abdominal pain, '
            'urinary urgency or frequency — vague, and often attributed to '
            'irritable bowel.',
        'Consider ovarian cancer in any woman over 50 with new IBS-type '
            'symptoms; new IBS rarely begins at that age.',
        'Abdominal or pelvic mass, ascites, omental cake.',
        'CA-125, with the caveat that it is raised by endometriosis, '
            'fibroids, infection, pregnancy and menstruation, and is normal '
            'in about half of early cancers.',
        'Risk stratification with RMI, IOTA Simple Rules or ADNEX, or ROMA.',
        'CT chest, abdomen and pelvis for staging.',
        'In a woman under 40, add AFP, hCG and LDH for germ cell tumours.',
      ]),
      LearningSection('Treatment', [
        'Staged surgically by FIGO, and the aim of surgery is COMPLETE '
            'CYTOREDUCTION — residual disease volume is the strongest '
            'modifiable prognostic factor.',
        'Full staging includes hysterectomy, bilateral salpingo-oophorectomy, '
            'omentectomy, peritoneal biopsies, washings and nodal assessment.',
        'Primary debulking where complete resection is achievable; '
            'neoadjuvant chemotherapy with interval debulking where it is '
            'not.',
        'Adjuvant carboplatin and paclitaxel.',
        'Bevacizumab in advanced disease (GOG-0218, ICON7).',
        'PARP inhibitor maintenance transformed outcomes in BRCA-mutated '
            'disease (SOLO-1) and in homologous recombination deficiency with '
            'bevacizumab (PAOLA-1).',
        'Fertility-sparing unilateral salpingo-oophorectomy in early-stage '
            'disease in a young woman, and in germ cell tumours.',
      ]),
    ],
    keyPoints: [
      'High-grade serous largely arises in the fallopian tube — hence '
          'opportunistic salpingectomy.',
      'Population screening does not reduce mortality; UKCTOCS settled that.',
      'New IBS-type symptoms over 50 warrant investigation.',
      'CA-125 is normal in about half of early cancers.',
      'Complete cytoreduction is the strongest modifiable prognostic factor.',
      'Offer genetic testing to every woman with high-grade serous disease.',
    ],
    related: [
      'figo-ovary-2014',
      'adnexal-mass',
      'score-rmi',
      'score-roma',
      'score-iota-adnex',
      'solo1',
      'couns-cancer-treatment',
    ],
    sources: [
      'FIGO staging for ovarian, fallopian tube and peritoneal cancer, 2014.',
      'Menon U et al. UKCTOCS long-term follow-up. Lancet 2021;397:2182–2193.',
      'Moore K et al. SOLO-1. N Engl J Med 2018;379:2495–2505; Ray-Coquard I '
          'et al. PAOLA-1. N Engl J Med 2019;381:2416–2428.',
      'ESGO-ESMO consensus recommendations on ovarian cancer.',
      'National Cancer Grid of India resource-stratified guidelines for '
          'ovarian cancer; ICMR consensus document; Tata Memorial Centre '
          'evidence-based management manuals.',
    ],
  ),
  LearningTopic(
    id: 'lrn-endometrial-cancer',
    title: 'Endometrial cancer',
    subtitle: 'Two types, one molecular classification',
    category: LearningCategory.oncology,
    competency: 'OG 22.3',
    summary: 'The commonest gynaecological cancer in high-income countries '
        'and rising in India with obesity and diabetes. It usually presents '
        'early because it bleeds, which is why postmenopausal bleeding is '
        'investigated so aggressively.',
    sections: [
      LearningSection('The traditional two types', [
        'TYPE I — endometrioid, oestrogen-driven, arising through '
            'hyperplasia, in younger and heavier women. Usually low grade and '
            'good prognosis.',
        'TYPE II — serous and clear cell, not oestrogen-driven, in older and '
            'thinner women, arising from atrophic endometrium. Aggressive, '
            'and behaves like ovarian serous carcinoma.',
        'Carcinosarcoma is now regarded as a dedifferentiated carcinoma '
            'rather than a sarcoma.',
      ]),
      LearningSection('Molecular classification', [
        'The Cancer Genome Atlas defined four groups, which the FIGO 2023 '
            'staging incorporates: POLE-ultramutated, mismatch repair '
            'deficient, p53-abnormal, and no specific molecular profile.',
        'POLE-mutated tumours have an EXCELLENT prognosis even at higher '
            'grade, and identifying them can spare a woman adjuvant '
            'treatment.',
        'p53-abnormal tumours behave badly and are treated more '
            'aggressively.',
        'Mismatch repair deficient tumours respond to checkpoint inhibition, '
            'and universal MMR testing also identifies Lynch syndrome.',
      ]),
      LearningSection('Risk factors and presentation', [
        'All are unopposed oestrogen: obesity, anovulation and PCOS, '
            'nulliparity, late menopause, oestrogen-only therapy, tamoxifen, '
            'oestrogen-secreting tumours.',
        'Diabetes and hypertension.',
        'LYNCH SYNDROME — endometrial cancer is often the sentinel cancer, '
            'preceding colorectal cancer. Test every endometrial carcinoma '
            'for mismatch repair deficiency.',
        'POSTMENOPAUSAL BLEEDING is the presenting symptom in the great '
            'majority, and about one in ten women with it has cancer.',
        'Premenopausal: heavy or intermenstrual bleeding, particularly with '
            'PCOS or obesity.',
      ]),
      LearningSection('Diagnosis and staging', [
        'Transvaginal ultrasound for endometrial thickness, then sampling.',
        'Endometrial thickness of 4 mm or less in a woman not on HRT makes '
            'cancer unlikely; above that, sample.',
        'Any bleeding on tamoxifen requires hysteroscopy regardless of '
            'thickness, and thickness measurement is unreliable there.',
        'Recurrent bleeding requires hysteroscopy whatever the thickness — a '
            'negative pipelle in a woman who keeps bleeding is not an answer.',
        'MRI for myometrial invasion and cervical involvement; CT for distant '
            'disease.',
        'FIGO 2023 staging incorporates histological type, '
            'lymphovascular space invasion and molecular classification.',
      ]),
      LearningSection('Treatment', [
        'Total hysterectomy with bilateral salpingo-oophorectomy is the '
            'basis.',
        'Minimally invasive surgery is standard here — unlike cervical '
            'cancer, laparoscopic approach does not compromise survival '
            '(LAP2, LACE).',
        'Sentinel lymph node biopsy has largely replaced systematic '
            'lymphadenectomy.',
        'Adjuvant vaginal brachytherapy, external beam radiotherapy or '
            'chemotherapy guided by risk group; PORTEC-3 defined the role of '
            'chemoradiotherapy in high-risk disease.',
        'Pembrolizumab with chemotherapy in advanced or recurrent disease, '
            'with the largest benefit in mismatch repair deficient tumours '
            '(NRG-GY018, RUBY).',
        'FERTILITY-SPARING management with a levonorgestrel intrauterine '
            'system is possible in selected young women with grade 1 '
            'endometrioid disease confined to the endometrium, with close '
            'surveillance and hysterectomy once the family is complete.',
      ]),
    ],
    keyPoints: [
      'Type I is oestrogen-driven and good prognosis; type II is not and is '
          'aggressive.',
      'POLE-mutated tumours do well even at high grade and may need no '
          'adjuvant treatment.',
      'Test every endometrial cancer for mismatch repair — it finds Lynch '
          'syndrome.',
      'Minimally invasive surgery is standard here, unlike cervical cancer.',
      'One in ten women with postmenopausal bleeding has cancer.',
    ],
    related: [
      'figo-endometrium-2023',
      'algo-pmb',
      'lrn-endometrial-hyperplasia',
      'proc-endometrial-biopsy',
      'portec3',
      'couns-cancer-treatment',
    ],
    sources: [
      'FIGO staging of endometrial cancer, 2023.',
      'Cancer Genome Atlas Research Network. Integrated genomic '
          'characterization of endometrial carcinoma. Nature '
          '2013;497:67–73.',
      'de Boer SM et al. PORTEC-3. Lancet Oncol 2018;19:295–309; Eskander RN '
          'et al. NRG-GY018. N Engl J Med 2023;388:2159–2170.',
      'ESGO-ESTRO-ESP guidelines for the management of patients with '
          'endometrial carcinoma.',
      'National Cancer Grid of India guidelines for endometrial cancer; Tata '
          'Memorial Centre evidence-based management manuals.',
    ],
  ),
];
