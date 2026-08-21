import '../../models/topic.dart';

const kPcosTopic = ClinicalTopic(
  id: 'pcos',
  name: 'PCOS',
  subtitle: 'Rotterdam criteria · phenotypes · metabolic risk',
  headline: 'PCOS is a diagnosis of exclusion made on two of three criteria — '
      'and letrozole, not clomiphene, is now first-line for ovulation '
      'induction. The 2023 international guideline also raised the follicle '
      'threshold to 20 per ovary and removed ultrasound from the diagnosis in '
      'adolescents entirely.',
  keyFacts: [
    ('Rotterdam', 'Any 2 of 3, other causes excluded'),
    ('Polycystic morphology (2023)', '≥ 20 follicles per ovary, or volume ≥ 10 mL'),
    ('Adolescents', 'Ultrasound NOT used — needs both other criteria'),
    ('Ferriman-Gallwey cut-off', '≥ 8 (lower in East Asian women)'),
    ('First-line ovulation induction', 'Letrozole'),
    ('Diabetes screening', 'OGTT at diagnosis, then every 1 – 3 years'),
  ],
  sections: [
    TopicSection('Rotterdam criteria — any two of three', [
      TopicPoint('Oligo-ovulation or anovulation',
          detail: 'Cycles longer than 35 days or fewer than eight a year; or '
              'cycles under 21 days.'),
      TopicPoint('Clinical or biochemical hyperandrogenism',
          detail: 'Hirsutism, acne, androgenic alopecia; or raised free '
              'androgen index or total testosterone.'),
      TopicPoint('Polycystic ovarian morphology on ultrasound',
          detail: '20 or more follicles of 2–9 mm per ovary, and/or ovarian '
              'volume of 10 mL or more, using a transducer of 8 MHz or above. '
              'The older threshold of 12 follicles over-diagnoses with modern '
              'equipment.'),
      TopicPoint('Anti-Müllerian hormone may substitute for ultrasound in '
          'adults', critical: true,
          detail: 'Accepted by the 2023 guideline. Not in adolescents.'),
      TopicPoint('use ultrasound to diagnose PCOS within 8 years of menarche',
          avoid: true,
          detail: 'Multifollicular ovaries are normal in adolescence. '
              'Diagnosis then requires both hyperandrogenism and ovulatory '
              'dysfunction.'),
    ]),
    TopicSection('Exclude before diagnosing', [
      TopicPoint('Thyroid dysfunction — TSH'),
      TopicPoint('Hyperprolactinaemia — prolactin'),
      TopicPoint('Non-classical congenital adrenal hyperplasia — early '
          'morning 17-hydroxyprogesterone', critical: true),
      TopicPoint('Cushing syndrome — where there are clinical features'),
      TopicPoint('Androgen-secreting tumour — rapid virilisation, testosterone '
          'more than twice the upper limit', critical: true),
      TopicPoint('Acromegaly, primary ovarian insufficiency, hypothalamic '
          'amenorrhoea'),
    ]),
    TopicSection('Phenotypes', [
      TopicPoint('A — hyperandrogenism + ovulatory dysfunction + polycystic '
          'morphology. The full phenotype, and the worst metabolic profile.',
          critical: true),
      TopicPoint('B — hyperandrogenism + ovulatory dysfunction'),
      TopicPoint('C — hyperandrogenism + polycystic morphology (ovulatory)'),
      TopicPoint('D — ovulatory dysfunction + polycystic morphology '
          '(non-hyperandrogenic). The mildest metabolically.'),
      TopicPoint('Phenotype should be recorded — it changes the metabolic '
          'surveillance she needs.'),
    ]),
    TopicSection('Metabolic assessment', [
      TopicPoint('Oral glucose tolerance test at diagnosis, then every one to '
          'three years', critical: true,
          detail: 'HbA1c and fasting glucose miss impaired glucose tolerance '
              'in this population.'),
      TopicPoint('Screen every pregnancy before 20 weeks and again at 24–28 '
          'weeks'),
      TopicPoint('Fasting lipids at diagnosis'),
      TopicPoint('Blood pressure at every visit'),
      TopicPoint('Weight and waist circumference; South Asian waist thresholds '
          'are 80 cm for women', critical: true),
      TopicPoint('Consider non-alcoholic fatty liver disease and obstructive '
          'sleep apnoea'),
      TopicPoint('Screen for depression and anxiety — both are markedly more '
          'common and routinely missed'),
    ]),
    TopicSection('Management — menstrual regulation and endometrial protection', [
      TopicPoint('Lifestyle modification is first-line for every phenotype'),
      TopicPoint('Combined oral contraceptive for cycle control and '
          'hyperandrogenism'),
      TopicPoint('Cyclical progestogen or a levonorgestrel intrauterine system '
          'where oestrogen is contraindicated'),
      TopicPoint('Unopposed oestrogen from chronic anovulation causes '
          'endometrial hyperplasia and carcinoma — a withdrawal bleed at least '
          'every three to four months is the minimum', critical: true),
      TopicPoint('Metformin for metabolic features, and as an adjunct in '
          'higher BMI'),
    ]),
    TopicSection('Hirsutism and acne', [
      TopicPoint('Ferriman-Gallwey score to quantify and to track response'),
      TopicPoint('Combined oral contraceptive first; allow at least six months '
          'before judging'),
      TopicPoint('Add an anti-androgen after six months if response is '
          'inadequate — spironolactone 50–100 mg daily'),
      TopicPoint('Effective contraception is mandatory with any anti-androgen',
          critical: true,
          detail: 'They feminise a male fetus.'),
      TopicPoint('Cosmetic therapy — laser and electrolysis — works alongside, '
          'not instead of, medical treatment'),
      TopicPoint('Eflornithine cream for facial hirsutism'),
    ]),
    TopicSection('Infertility and ovulation induction', [
      TopicPoint('LETROZOLE is first-line', critical: true,
          detail: 'Legro 2014 showed higher live birth rates than clomiphene '
              'in PCOS. 2.5–7.5 mg on days 3–7.'),
      TopicPoint('Clomiphene citrate 50–150 mg on days 2–6 where letrozole is '
          'unavailable'),
      TopicPoint('Metformin combined with clomiphene where clomiphene alone '
          'fails'),
      TopicPoint('Gonadotrophins — low-dose step-up, with strict monitoring '
          'for multiple follicles and hyperstimulation', critical: true),
      TopicPoint('Laparoscopic ovarian drilling as second-line, particularly '
          'where multiple pregnancy must be avoided'),
      TopicPoint('IVF where these fail, or where other factors coexist'),
      TopicPoint('Weight loss of 5–10% restores ovulation in a substantial '
          'proportion and improves every other outcome'),
    ]),
    TopicSection('Long-term risks', [
      TopicPoint('Type 2 diabetes — several-fold increased, and at a younger '
          'age', critical: true),
      TopicPoint('Gestational diabetes and hypertensive disease in pregnancy'),
      TopicPoint('Endometrial hyperplasia and carcinoma', critical: true),
      TopicPoint('Cardiovascular risk factors — dyslipidaemia, hypertension, '
          'metabolic syndrome'),
      TopicPoint('Obstructive sleep apnoea; non-alcoholic fatty liver disease'),
      TopicPoint('Depression, anxiety and disordered eating'),
      TopicPoint('South Asian women develop these consequences at a lower BMI '
          'and a younger age than European women', critical: true),
    ]),
  ],
  sources: [
    'Teede HJ et al. International Evidence-Based Guideline for the Assessment '
        'and Management of Polycystic Ovary Syndrome, 2023.',
    'Rotterdam ESHRE/ASRM-Sponsored PCOS Consensus Workshop Group. Fertil '
        'Steril 2004;81:19–25.',
    'Legro RS et al. Letrozole versus clomiphene for infertility in the '
        'polycystic ovary syndrome. N Engl J Med 2014;371:119–129.',
    'FOGSI–ICOG GCPR on PCOS.',
  ],
);

const kFibroidsTopic = ClinicalTopic(
  id: 'fibroids',
  name: 'Fibroids',
  subtitle: 'FIGO classification 0 – 8 · management by type',
  headline: 'The FIGO number decides the operation. Types 0 to 2 come out '
      'hysteroscopically and their removal improves fertility; subserosal '
      'fibroids rarely need touching at all. Classify before you plan.',
  keyFacts: [
    ('Type 0', 'Pedunculated intracavitary'),
    ('Type 1', 'Submucosal, < 50% intramural'),
    ('Type 2', 'Submucosal, ≥ 50% intramural'),
    ('Type 3', 'Contacts endometrium, 100% intramural'),
    ('Type 4', 'Intramural'),
    ('Type 5 / 6 / 7', 'Subserosal ≥ 50% / < 50% / pedunculated'),
    ('Type 8', 'Other — cervical, parasitic'),
    ('Hybrid', 'Two numbers, e.g. 2–5'),
  ],
  sections: [
    TopicSection('Symptoms', [
      TopicPoint('Heavy menstrual bleeding — the commonest, and driven mainly '
          'by submucosal and intramural fibroids'),
      TopicPoint('Bulk symptoms — pressure, urinary frequency, constipation, '
          'abdominal distension'),
      TopicPoint('Pelvic pain and dysmenorrhoea'),
      TopicPoint('Subfertility and recurrent miscarriage — chiefly with cavity '
          'distortion'),
      TopicPoint('Acute pain from torsion of a pedunculated fibroid or from '
          'red degeneration'),
      TopicPoint('Many fibroids are asymptomatic and need no treatment at all',
          critical: true),
    ]),
    TopicSection('Diagnosis and mapping', [
      TopicPoint('Transvaginal ultrasound is first-line'),
      TopicPoint('Saline infusion sonography or hysteroscopy to assess the '
          'cavity and classify submucosal fibroids', critical: true),
      TopicPoint('MRI for mapping before myomectomy or embolisation, for very '
          'large or numerous fibroids, and where adenomyosis coexists'),
      TopicPoint('Suspect sarcoma with rapid growth after menopause, or growth '
          'on GnRH treatment — but rapid growth in a premenopausal woman is '
          'not by itself predictive', critical: true),
      TopicPoint('Check haemoglobin and ferritin in anyone with heavy bleeding'),
    ]),
    TopicSection('Medical management', [
      TopicPoint('Tranexamic acid and NSAIDs for bleeding, without affecting '
          'fibroid size'),
      TopicPoint('Levonorgestrel intrauterine system — effective for types 3–6, '
          'but not where the cavity is distorted', critical: true),
      TopicPoint('Combined oral contraceptive or progestogens for cycle '
          'control'),
      TopicPoint('GnRH agonist for 3–6 months with add-back therapy — shrinks '
          'fibroids and corrects anaemia before surgery',
          detail: 'Not a long-term treatment: bone loss, and regrowth on '
              'stopping.'),
      TopicPoint('Oral GnRH antagonist combinations (relugolix, elagolix with '
          'add-back) for longer-term symptom control'),
      TopicPoint('Ulipristal acetate is now restricted in many countries after '
          'reports of serious liver injury', critical: true),
    ]),
    TopicSection('Surgical management', [
      TopicPoint('HYSTEROSCOPIC RESECTION for types 0, 1 and 2',
          detail: 'Watch fluid deficit closely — 1000 mL with hypotonic media, '
              '2500 mL with isotonic, and less in older or comorbid women.'),
      TopicPoint('MYOMECTOMY — laparoscopic, robotic or open — where the '
          'uterus is to be preserved'),
      TopicPoint('HYSTERECTOMY is definitive where family is complete'),
      TopicPoint('Counsel about conversion to hysterectomy and about '
          'transfusion before any myomectomy', critical: true),
      TopicPoint('Consider cell salvage and tranexamic acid for large '
          'myomectomies'),
      TopicPoint('use power morcellation without containment', avoid: true,
          detail: 'It disseminates an occult sarcoma. Use a containment bag, '
              'and counsel explicitly.'),
    ]),
    TopicSection('Uterine artery embolisation', [
      TopicPoint('Preserves the uterus; shorter recovery than surgery'),
      TopicPoint('Effective for bulk and bleeding symptoms'),
      TopicPoint('Fertility outcomes after embolisation remain uncertain — it '
          'is not first choice where pregnancy is planned', critical: true),
      TopicPoint('Risks: post-embolisation syndrome, fibroid expulsion, '
          'infection, premature ovarian insufficiency'),
      TopicPoint('Reintervention rate of roughly 20–30% at five years'),
    ]),
    TopicSection('Fertility', [
      TopicPoint('Submucosal fibroids (types 0–2) reduce fertility, and '
          'removal improves it', critical: true),
      TopicPoint('Intramural fibroids distorting the cavity probably reduce '
          'fertility; removal is reasonable'),
      TopicPoint('Intramural fibroids not distorting the cavity have an '
          'uncertain effect; routine removal is not justified'),
      TopicPoint('Subserosal fibroids do not affect fertility'),
      TopicPoint('Advise a delay of three to six months after myomectomy, and '
          'discuss caesarean where the cavity was breached', critical: true),
    ]),
    TopicSection('Fibroids in pregnancy', [
      TopicPoint('Most do not grow substantially, and most cause no problem'),
      TopicPoint('RED DEGENERATION — second-trimester pain, low-grade fever, '
          'leucocytosis, localised tenderness over the fibroid',
          critical: true,
          detail: 'Manage conservatively: analgesia, hydration, reassurance. '
              'It is self-limiting over days to weeks, and surgery is almost '
              'never the answer.'),
      TopicPoint('Increased risk of malpresentation, preterm birth, abruption, '
          'caesarean and postpartum haemorrhage'),
      TopicPoint('Lower-segment fibroids may obstruct labour'),
      TopicPoint('perform myomectomy at caesarean routinely', avoid: true,
          detail: 'Bleeding can be torrential. The exception is a pedunculated '
              'fibroid on a narrow stalk.'),
    ]),
  ],
  sources: [
    'Munro MG et al. FIGO classification system (PALM-COEIN) and leiomyoma '
        'subclassification. Int J Gynecol Obstet 2011;113:3–13.',
    'NICE NG88 — Heavy menstrual bleeding: assessment and management.',
    'RCOG / BSGE joint guidance on management of uterine fibroids.',
    'ACOG Practice Bulletin 228 — Management of Symptomatic Uterine '
        'Leiomyomas.',
    'FOGSI GCPR — Management of Fibroids.',
  ],
);

const kEndometriosisTopic = ClinicalTopic(
  id: 'endometriosis',
  name: 'Endometriosis',
  subtitle: 'Diagnosis without laparoscopy · rASRM · #Enzian',
  headline: 'Laparoscopy is no longer required before starting treatment, and '
      'normal imaging does not exclude the disease. The average delay to '
      'diagnosis is still measured in years, and most of that delay is caused '
      'by waiting for a picture.',
  keyFacts: [
    ('Diagnosis', 'Clinical — laparoscopy not required to start treatment'),
    ('rASRM stages', 'I minimal · II mild · III moderate · IV severe'),
    ('Stage vs pain', 'Correlates poorly'),
    ('First-line medical', 'NSAIDs, combined pill (continuous), progestogens'),
    ('Dienogest', '2 mg daily'),
    ('Recurrence after surgery', 'Up to 50% at 5 years'),
    ('Endometrioma cystectomy', 'Lowers recurrence, lowers ovarian reserve'),
  ],
  sections: [
    TopicSection('Symptoms', [
      TopicPoint('Dysmenorrhoea, typically progressive and increasingly '
          'unresponsive to analgesia'),
      TopicPoint('Deep dyspareunia'),
      TopicPoint('Chronic pelvic pain, often non-cyclical by the time she '
          'presents'),
      TopicPoint('Cyclical bowel symptoms — dyschezia, tenesmus, rectal '
          'bleeding'),
      TopicPoint('Cyclical urinary symptoms — dysuria, haematuria'),
      TopicPoint('Subfertility'),
      TopicPoint('Fatigue, and a substantial impact on work, study and '
          'relationships that is routinely under-asked about', critical: true),
    ]),
    TopicSection('Diagnosis', [
      TopicPoint('Take a symptom history seriously and start treatment on it — '
          'ESHRE 2022 removed laparoscopy as a diagnostic prerequisite',
          critical: true),
      TopicPoint('Examination: fixed retroverted uterus, adnexal mass, '
          'tenderness or nodularity in the posterior fornix'),
      TopicPoint('Transvaginal ultrasound detects endometrioma and deep '
          'infiltrating disease in trained hands'),
      TopicPoint('MRI for mapping deep disease before surgery'),
      TopicPoint('A normal scan does not exclude superficial peritoneal '
          'disease', critical: true),
      TopicPoint('CA-125 may be raised but is neither sensitive nor specific — '
          'do not use it to diagnose or exclude', critical: true),
    ]),
    TopicSection('Disease patterns', [
      TopicPoint('SUPERFICIAL PERITONEAL — the commonest; poorly visualised on '
          'imaging'),
      TopicPoint('OVARIAN ENDOMETRIOMA — "chocolate cyst"; ground-glass '
          'echogenicity on ultrasound'),
      TopicPoint('DEEP INFILTRATING ENDOMETRIOSIS — beyond 5 mm below the '
          'peritoneum. Uterosacral ligaments, rectovaginal septum, bowel, '
          'bladder, ureter.', critical: true),
      TopicPoint('Extrapelvic — diaphragm, abdominal wall scars, thorax'),
    ]),
    TopicSection('Staging systems', [
      TopicPoint('rASRM I–IV, scored at laparoscopy. Correlates with fertility '
          'but poorly with pain.'),
      TopicPoint('#Enzian describes deep disease by compartment, and '
          'complements rASRM'),
      TopicPoint('Endometriosis Fertility Index predicts non-ART conception '
          'after surgery'),
      TopicPoint('quote a stage as though it predicted her pain', avoid: true),
    ]),
    TopicSection('Medical treatment', [
      TopicPoint('NSAIDs for pain'),
      TopicPoint('Combined oral contraceptive, used continuously to suppress '
          'menstruation'),
      TopicPoint('Progestogens — dienogest 2 mg daily, or medroxyprogesterone '
          'acetate'),
      TopicPoint('Levonorgestrel intrauterine system, especially for '
          'adenomyosis and rectovaginal disease'),
      TopicPoint('GnRH agonist with add-back hormone therapy where first-line '
          'fails', detail: 'Add-back from the outset protects bone and does '
              'not reduce efficacy.'),
      TopicPoint('Oral GnRH antagonists as a newer option'),
      TopicPoint('Medical treatment does not improve fertility and delays '
          'conception — it is for pain', critical: true),
    ]),
    TopicSection('Surgery', [
      TopicPoint('Excision is preferred to ablation for deep disease'),
      TopicPoint('Endometrioma: cystectomy lowers recurrence compared with '
          'drainage, but removes ovarian cortex and lowers reserve — counsel '
          'explicitly where fertility matters', critical: true),
      TopicPoint('Deep infiltrating disease should be operated in a specialist '
          'centre with colorectal and urological support', critical: true),
      TopicPoint('Hysterectomy with excision of disease for completed families '
          'with refractory pain — removing the uterus alone does not treat '
          'endometriosis'),
      TopicPoint('Discuss oophorectomy carefully in young women; the '
          'consequences of surgical menopause are lifelong'),
    ]),
    TopicSection('Fertility and pain management', [
      TopicPoint('Endometriosis Fertility Index guides expectant versus '
          'assisted conception after surgery'),
      TopicPoint('Surgery for endometrioma before IVF is contentious — it may '
          'reduce oocyte yield without improving live birth', critical: true),
      TopicPoint('IVF is effective; consider it early where ovarian reserve is '
          'falling or disease is advanced'),
      TopicPoint('Chronic pain frequently persists after adequate surgery, and '
          'needs a pain-management approach rather than repeat operations',
          critical: true),
      TopicPoint('Multidisciplinary input — pain medicine, physiotherapy, '
          'psychology — is part of the treatment, not a consolation prize'),
    ]),
  ],
  sources: [
    'ESHRE Guideline: Endometriosis, 2022.',
    'NICE NG73 — Endometriosis: diagnosis and management.',
    'ACOG Practice Bulletin 114 — Management of Endometriosis.',
    'Adamson GD, Pasta DJ. Endometriosis fertility index. Fertil Steril '
        '2010;94:1609–1615.',
    'FOGSI GCPR — Endometriosis.',
  ],
);

const kAdenomyosisTopic = ClinicalTopic(
  id: 'adenomyosis',
  name: 'Adenomyosis',
  subtitle: 'MUSA ultrasound features · management',
  headline: 'Adenomyosis is now an ultrasound diagnosis rather than a '
      'histological one made after hysterectomy. The MUSA features are '
      'learnable, and recognising them changes what you offer a woman who has '
      'been told she has "bulky fibroids".',
  keyFacts: [
    ('MRI junctional zone', '≥ 12 mm suggests adenomyosis'),
    ('First-line medical', 'Levonorgestrel intrauterine system'),
    ('Definitive', 'Hysterectomy'),
    ('Coexists with', 'Endometriosis and fibroids, frequently'),
  ],
  sections: [
    TopicSection('Symptoms', [
      TopicPoint('Heavy menstrual bleeding'),
      TopicPoint('Severe dysmenorrhoea, often worsening over years'),
      TopicPoint('Chronic pelvic pain'),
      TopicPoint('A diffusely bulky, globular, tender uterus'),
      TopicPoint('Subfertility, implantation failure and miscarriage'),
      TopicPoint('Commonly coexists with endometriosis and fibroids, which '
          'obscures the diagnosis', critical: true),
    ]),
    TopicSection('MUSA ultrasound features', [
      TopicPoint('Globular uterine enlargement'),
      TopicPoint('Asymmetric myometrial thickening — anterior versus posterior '
          'wall'),
      TopicPoint('Myometrial cysts', critical: true),
      TopicPoint('Hyperechoic islands and subendometrial echogenic lines and '
          'buds'),
      TopicPoint('Fan-shaped shadowing without a discrete mass',
          critical: true,
          detail: 'This distinguishes it from a fibroid, which casts edge '
              'shadows from a defined border.'),
      TopicPoint('Translesional vascularity — vessels pass through, rather '
          'than around, the lesion'),
      TopicPoint('Irregular or interrupted junctional zone'),
    ]),
    TopicSection('Distinguishing it from a fibroid', [
      TopicPoint('Adenomyosis has ill-defined margins and no capsule; a '
          'fibroid has both', critical: true),
      TopicPoint('Vessels pass through adenomyosis; they course around a '
          'fibroid'),
      TopicPoint('Adenomyosis causes diffuse, often asymmetric enlargement; a '
          'fibroid is a discrete mass'),
      TopicPoint('The distinction matters because a hysteroscopic or '
          'laparoscopic approach that works for a fibroid will not work here'),
    ]),
    TopicSection('Medical management', [
      TopicPoint('Levonorgestrel intrauterine system — first line for bleeding '
          'and pain', critical: true),
      TopicPoint('Combined oral contraceptive, used continuously'),
      TopicPoint('Progestogens — dienogest'),
      TopicPoint('GnRH agonists with add-back, usually as a bridge to surgery '
          'or to IVF'),
      TopicPoint('Tranexamic acid and NSAIDs for symptom control'),
      TopicPoint('Expulsion of an intrauterine system is more common in a '
          'markedly enlarged uterus — warn her'),
    ]),
    TopicSection('Interventional and surgical', [
      TopicPoint('Adenomyomectomy for focal disease — technically demanding, '
          'and recurrence is common', critical: true),
      TopicPoint('Uterine artery embolisation — effective, with the same '
          'fertility uncertainty as for fibroids'),
      TopicPoint('High-intensity focused ultrasound where available'),
      TopicPoint('Endometrial ablation is generally ineffective — the disease '
          'is deep in the myometrium', critical: true),
      TopicPoint('Hysterectomy is definitive'),
    ]),
    TopicSection('Fertility considerations', [
      TopicPoint('Associated with implantation failure, miscarriage, preterm '
          'birth and pre-eclampsia'),
      TopicPoint('GnRH agonist pre-treatment before frozen embryo transfer may '
          'improve outcomes'),
      TopicPoint('Weigh conservative surgery carefully — uterine rupture in a '
          'subsequent pregnancy has been reported after extensive '
          'adenomyomectomy', critical: true),
      TopicPoint('Counsel about increased obstetric risk and plan surveillance '
          'accordingly'),
    ]),
  ],
  sources: [
    'Van den Bosch T et al. Terms, definitions and measurements to describe '
        'sonographic features of myometrium and uterine masses: MUSA '
        'consensus. Ultrasound Obstet Gynecol 2015;46:284–298.',
    'Chapron C et al. Diagnosing adenomyosis: an integrated clinical and '
        'imaging approach. Hum Reprod Update 2020;26:392–411.',
    'NICE NG88 — Heavy menstrual bleeding.',
    'FOGSI GCPR — Abnormal Uterine Bleeding.',
  ],
);
