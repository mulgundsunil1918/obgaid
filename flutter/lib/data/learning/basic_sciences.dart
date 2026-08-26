import '../../models/learning_topic.dart';

const kBasicScienceLearningTopics = <LearningTopic>[
  LearningTopic(
    id: 'lrn-genital-embryology',
    title: 'Embryology of the female genital tract',
    subtitle: 'Two duct systems, and which one survives',
    category: LearningCategory.basicSciences,
    competency: 'OG 2.1',
    summary: 'The female tract is the default pathway: it develops when the '
        'signals that would suppress it are absent. Understanding which duct '
        'forms what explains almost every congenital anomaly.',
    sections: [
      LearningSection('The two duct systems', [
        'MESONEPHRIC (Wolffian) ducts form the male internal tract — '
            'epididymis, vas deferens, seminal vesicle — under testosterone.',
        'PARAMESONEPHRIC (Müllerian) ducts form the female internal tract — '
            'fallopian tubes, uterus, cervix and the upper two-thirds of the '
            'vagina.',
        'Both are present in every early embryo. Which persists depends on '
            'what the gonad secretes.',
      ]),
      LearningSection('The default pathway', [
        'SRY on the Y chromosome directs the indifferent gonad to become a '
            'testis.',
        'Sertoli cells secrete ANTI-MÜLLERIAN HORMONE, which causes Müllerian '
            'regression.',
        'Leydig cells secrete testosterone, which maintains the Wolffian '
            'ducts.',
        'Dihydrotestosterone, from testosterone via 5-alpha-reductase, '
            'masculinises the external genitalia.',
        'Without SRY there is no AMH and no testosterone, so the Müllerian '
            'ducts persist and the Wolffian ducts regress. Female development '
            'requires no active signal.',
        'This explains androgen insensitivity syndrome: a 46,XY individual '
            'with functioning testes has AMH — so no uterus — and '
            'testosterone that cannot act — so female external genitalia.',
      ]),
      LearningSection('Formation of the uterus and vagina', [
        'The paired Müllerian ducts grow caudally and fuse in the midline.',
        'Fusion creates a single cavity with an intervening septum.',
        'The septum is then resorbed.',
        'Failure of fusion gives bicornuate and didelphys uteri; failure of '
            'resorption gives the septate uterus.',
        'The upper two-thirds of the vagina is Müllerian; the lower third '
            'derives from the urogenital sinus via the sinovaginal bulbs.',
        'Failure of canalisation at that junction gives a transverse vaginal '
            'septum or an imperforate hymen.',
      ]),
      LearningSection('Why the kidneys matter', [
        'The mesonephric duct guides Müllerian duct migration.',
        'A Müllerian anomaly therefore frequently accompanies a renal '
            'anomaly — agenesis, ectopia or duplication.',
        'This is why renal imaging is mandatory whenever a uterine anomaly is '
            'found.',
        'The ureteric bud arises from the mesonephric duct, which is the '
            'anatomical reason for the association.',
      ]),
      LearningSection('Remnants worth knowing', [
        'GARTNER DUCT CYST — a Wolffian remnant in the anterolateral vaginal '
            'wall.',
        'Epoophoron and paroophoron — Wolffian remnants in the mesosalpinx.',
        'HYDATID OF MORGAGNI — a Müllerian remnant at the fimbrial end, and a '
            'common site of torsion.',
      ]),
    ],
    keyPoints: [
      'Female development is the default; it needs no active signal.',
      'AMH from Sertoli cells causes Müllerian regression — its absence is '
          'why the uterus forms.',
      'Upper two-thirds of the vagina is Müllerian; the lower third is '
          'urogenital sinus.',
      'Müllerian anomalies associate with renal anomalies because the '
          'mesonephric duct guides migration.',
    ],
    related: ['lrn-mullerian-anomalies', 'lrn-amenorrhoea', 'anat-ureter'],
    sources: [
      'Sadler TW. Langman\'s Medical Embryology.',
      'Standring S (ed). Gray\'s Anatomy, 42nd edition.',
      'Grimbizis GF et al. ESHRE/ESGE consensus on the classification of '
          'female genital tract congenital anomalies. Hum Reprod '
          '2013;28:2032–2044.',
      'National Medical Commission — Competency-Based Postgraduate Curriculum '
          'for MD Obstetrics and Gynaecology.',
    ],
  ),
  LearningTopic(
    id: 'lrn-menstrual-cycle',
    title: 'The menstrual cycle',
    subtitle: 'Ovarian and endometrial, and the feedback that switches',
    category: LearningCategory.basicSciences,
    competency: 'OG 2.3',
    summary: 'The cycle is two coordinated cycles — ovarian and endometrial — '
        'driven by a feedback system that switches from negative to positive '
        'and back. That switch is the single most examined idea in '
        'reproductive physiology.',
    sections: [
      LearningSection('Ovarian cycle — follicular phase', [
        'Variable in length; it is this phase, not the luteal, that accounts '
            'for cycle length variation.',
        'Falling progesterone and oestradiol at the end of the previous cycle '
            'release FSH from negative feedback.',
        'FSH recruits a cohort of antral follicles.',
        'Granulosa cells aromatise androgens to oestradiol — the '
            'two-cell, two-gonadotrophin model: LH drives thecal androgen '
            'production, FSH drives granulosa aromatisation.',
        'Rising oestradiol and inhibin B suppress FSH, so only the follicle '
            'with the most FSH receptors survives — the dominant follicle. '
            'The rest become atretic.',
      ]),
      LearningSection('The LH surge and ovulation', [
        'Once oestradiol exceeds roughly 200 pg/mL and is sustained for about '
            '48 hours, feedback SWITCHES FROM NEGATIVE TO POSITIVE.',
        'This triggers the LH surge.',
        'Ovulation follows about 36 hours after the onset of the surge, and '
            'about 10–12 hours after its peak — which is what fertility '
            'tracking and trigger injections are timed against.',
        'The oocyte completes meiosis I and arrests in metaphase II.',
      ]),
      LearningSection('Luteal phase', [
        'FIXED at about 14 days — this is why ovulation is dated backwards '
            'from the next period, not forwards from the last.',
        'The corpus luteum secretes progesterone and oestradiol.',
        'Progesterone raises basal body temperature by about 0.3–0.5 °C, '
            'which is the basis of temperature-based fertility awareness.',
        'Without hCG the corpus luteum regresses at about day 9–11 after '
            'ovulation, progesterone falls, and menstruation follows.',
        'hCG from an implanting embryo rescues it — the luteo-placental '
            'shift occurs at around 7–9 weeks, after which the placenta takes '
            'over.',
      ]),
      LearningSection('Endometrial cycle', [
        'PROLIFERATIVE — oestrogen-driven; glands elongate and become '
            'straight, stroma proliferates, spiral arterioles grow.',
        'SECRETORY — progesterone-driven; glands become tortuous with '
            'subnuclear vacuoles, stroma becomes oedematous and then '
            'decidualised.',
        'MENSTRUAL — progesterone withdrawal causes spiral arteriole '
            'vasoconstriction, ischaemia, and shedding of the functional '
            'layer. The basal layer is retained and regenerates.',
        'Prostaglandin release during shedding causes the myometrial '
            'contraction of dysmenorrhoea.',
      ]),
      LearningSection('Clinical consequences', [
        'A fixed luteal phase means a short cycle is a short follicular '
            'phase.',
        'Anovulation means no progesterone, hence unopposed oestrogen, hence '
            'irregular bleeding and — over time — endometrial hyperplasia.',
        'A mid-luteal progesterone, taken 7 days before the expected period '
            'rather than on a fixed day 21, confirms ovulation.',
        'Combined hormonal contraception works chiefly by suppressing the LH '
            'surge.',
      ]),
    ],
    keyPoints: [
      'The luteal phase is fixed at about 14 days; the follicular phase '
          'varies.',
      'Feedback switches from negative to positive once oestradiol is high '
          'and sustained — that switch causes the LH surge.',
      'Ovulation is about 36 hours after the onset of the LH surge.',
      'Two-cell, two-gonadotrophin: LH makes androgen in theca, FSH '
          'aromatises it in granulosa.',
      'Mid-luteal progesterone is taken 7 days before the expected period, '
          'not on day 21.',
    ],
    related: ['pcos', 'infertility', 'lrn-amenorrhoea', 'contraception',
        'lrn-endometrial-hyperplasia'],
    sources: [
      'Speroff L, Fritz MA. Clinical Gynecologic Endocrinology and '
          'Infertility.',
      'Endocrine Society and ESHRE guidance on ovulatory disorders.',
      'Munro MG et al. FIGO classification of abnormal uterine bleeding. Int '
          'J Gynaecol Obstet 2011;113:3–13.',
      'National Medical Commission postgraduate curriculum; Dutta DC. '
          'Textbook of Gynecology.',
    ],
  ),
  LearningTopic(
    id: 'lrn-pregnancy-physiology',
    title: 'Physiological changes in pregnancy',
    subtitle: 'System by system, and why the reference ranges move',
    category: LearningCategory.basicSciences,
    competency: 'OG 2.4',
    summary: 'Almost every physiological variable changes in pregnancy, which '
        'is why a result that is normal outside pregnancy can be dangerously '
        'abnormal within it. These changes explain most obstetric '
        'misinterpretation.',
    sections: [
      LearningSection('Cardiovascular', [
        'Cardiac output rises about 30–50%, mostly by the end of the second '
            'trimester, through increased stroke volume then heart rate.',
        'Systemic vascular resistance falls, so blood pressure DIPS in the '
            'second trimester and returns toward baseline by term. A normal '
            'reading at 24 weeks in a chronic hypertensive may be '
            'misleading.',
        'Aortocaval compression from about 20 weeks — hence left lateral '
            'tilt.',
        'Cardiac output peaks IMMEDIATELY AFTER DELIVERY through '
            'autotransfusion from the contracting uterus. This is when '
            'cardiac disease decompensates.',
        'A systolic flow murmur and mild ankle oedema are physiological; a '
            'diastolic murmur is not.',
      ]),
      LearningSection('Haematological', [
        'Plasma volume rises about 50%, red cell mass about 25%.',
        'The disproportion produces physiological dilutional anaemia — a '
            'lower haemoglobin without iron deficiency.',
        'White cell count rises, further in labour, so leucocytosis alone '
            'does not diagnose infection.',
        'Platelets fall slightly; gestational thrombocytopenia is common and '
            'benign.',
        'Prothrombotic state: fibrinogen and factors VIII, IX and X rise, '
            'protein S falls, and acquired activated protein C resistance '
            'develops.',
        'D-dimer rises physiologically and is useless for excluding '
            'thromboembolism.',
      ]),
      LearningSection('Respiratory', [
        'Tidal volume rises about 40%, driven by progesterone; respiratory '
            'rate changes little.',
        'This produces a compensated RESPIRATORY ALKALOSIS with a low PaCO2 '
            'and a compensatory fall in bicarbonate.',
        'A "normal" PaCO2 in a breathless pregnant woman suggests '
            'exhaustion.',
        'Functional residual capacity falls while oxygen consumption rises, '
            'so she desaturates rapidly on apnoea — which is why intubation '
            'in pregnancy is more dangerous.',
        'Physiological dyspnoea is common and must be distinguished from '
            'pathology.',
      ]),
      LearningSection('Renal and hepatic', [
        'Renal plasma flow and GFR rise 40–50%, so urea, creatinine and urate '
            'all FALL. A creatinine of 1.0 mg/dL is not mildly raised — it '
            'represents substantial loss of reserve.',
        'Glycosuria is common and does not indicate diabetes.',
        'Physiological hydronephrosis, right more than left.',
        'ALKALINE PHOSPHATASE RISES from the placenta and is not evidence of '
            'liver disease.',
        'ALT and AST upper limits are LOWER in pregnancy — a "normal" ALT of '
            '40 in the third trimester is abnormal.',
        'Albumin falls, so total calcium falls while ionised calcium is '
            'unchanged.',
      ]),
      LearningSection('Endocrine and other', [
        'hCG cross-reacts at the TSH receptor, so TSH falls in the first '
            'trimester with a mildly raised free T4.',
        'Thyroid-binding globulin rises, so total thyroid hormones rise; use '
            'trimester-specific ranges.',
        'Insulin resistance rises through human placental lactogen, cortisol '
            'and progesterone — the basis of gestational diabetes.',
        'Prolactin rises throughout, but lactation is inhibited until the '
            'placenta is delivered.',
        'Gastro-oesophageal sphincter tone falls and gastric emptying is '
            'delayed in labour — hence aspiration risk.',
        'Ligamentous laxity from relaxin, and a shifted centre of gravity.',
      ]),
    ],
    keyPoints: [
      'Blood pressure dips in the second trimester and returns by term.',
      'Cardiac output peaks immediately after delivery, not during it.',
      'Plasma volume rises more than red cell mass — hence physiological '
          'anaemia.',
      'GFR rises, so a normal-looking creatinine may represent real '
          'impairment.',
      'Alkaline phosphatase rises from the placenta; ALT limits are lower, '
          'not higher.',
    ],
    related: ['haemodynamics', 'lab-reference', 'anaemia', 'creatinine',
        'lrn-vte-pregnancy'],
    sources: [
      'Abbassi-Ghanavati M et al. Pregnancy and laboratory studies: a '
          'reference table for clinicians. Obstet Gynecol 2009;114:1326–1331.',
      'Soma-Pillay P et al. Physiological changes in pregnancy. Cardiovasc J '
          'Afr 2016;27:89–94.',
      'RCOG Green-top Guideline 37a; NICE NG133.',
      'National Medical Commission postgraduate curriculum; Dutta DC. '
          'Textbook of Obstetrics.',
    ],
  ),
  LearningTopic(
    id: 'lrn-placenta',
    title: 'The placenta',
    subtitle: 'Development, transfer, and endocrine function',
    category: LearningCategory.basicSciences,
    competency: 'OG 2.5',
    summary: 'The placenta is an endocrine organ and a transfer interface. '
        'Defective trophoblastic invasion in the first half of pregnancy '
        'underlies both pre-eclampsia and much fetal growth restriction.',
    sections: [
      LearningSection('Development', [
        'The blastocyst implants around day 6–7; the trophoblast '
            'differentiates into cytotrophoblast and syncytiotrophoblast.',
        'Extravillous trophoblast invades the decidua and the spiral '
            'arteries.',
        'TROPHOBLASTIC INVASION OCCURS IN TWO WAVES — the first up to about '
            '12 weeks, the second between about 16 and 20 weeks.',
        'Invasion converts the spiral arteries into wide, flaccid, '
            'low-resistance vessels that are no longer responsive to '
            'vasoconstriction.',
        'INADEQUATE conversion leaves high-resistance vessels and '
            'underperfusion — the basis of pre-eclampsia and placental fetal '
            'growth restriction. It also explains why a raised uterine artery '
            'pulsatility index predicts both.',
        'It also explains why aspirin must start before 16 weeks: it acts '
            'on the second wave, and after that there is little left to '
            'modify.',
      ]),
      LearningSection('Transfer mechanisms', [
        'SIMPLE DIFFUSION — oxygen, carbon dioxide, water, most drugs.',
        'FACILITATED DIFFUSION — glucose, via GLUT transporters.',
        'ACTIVE TRANSPORT — amino acids, iron, calcium, iodine, water-soluble '
            'vitamins.',
        'PINOCYTOSIS — immunoglobulin G, which is why passive immunity is '
            'transferred and why maternal vaccination protects the newborn.',
        'IgG transfer is greatest in the third trimester, which is why '
            'preterm infants are more vulnerable and why maternal vaccination '
            'is timed to precede it.',
        'Heparin and insulin do not cross; warfarin does.',
      ]),
      LearningSection('Endocrine function', [
        'hCG — maintains the corpus luteum until the luteo-placental shift; '
            'peaks around 8–10 weeks; cross-reacts at the TSH receptor.',
        'HUMAN PLACENTAL LACTOGEN — antagonises insulin, mobilises maternal '
            'free fatty acids to spare glucose for the fetus. This is the '
            'principal cause of gestational diabetes.',
        'PROGESTERONE — placental from the luteo-placental shift; maintains '
            'uterine quiescence.',
        'OESTROGENS — placental production requires fetal adrenal precursors, '
            'so the fetoplacental unit is a functional whole.',
        'CRH — rises exponentially toward term and has been implicated in '
            'the timing of labour.',
      ]),
      LearningSection('Clinically important variants', [
        'SUCCENTURIATE LOBE — risk of retained lobe and postpartum '
            'haemorrhage, and of vasa praevia.',
        'CIRCUMVALLATE placenta — associated with bleeding and preterm birth.',
        'BATTLEDORE and VELAMENTOUS cord insertion — the latter carries the '
            'vasa praevia risk.',
        'PLACENTA ACCRETA SPECTRUM — deficient decidua, usually at a '
            'caesarean scar.',
        'Placental examination after delivery is part of the third stage: '
            'check completeness, membranes, cord vessels — a two-vessel cord '
            'prompts assessment for other anomalies.',
      ]),
    ],
    keyPoints: [
      'Two waves of trophoblastic invasion, the second at 16–20 weeks.',
      'Failed conversion of spiral arteries underlies pre-eclampsia and '
          'placental FGR.',
      'Aspirin must start before 16 weeks because it acts on the second '
          'wave.',
      'IgG crosses by pinocytosis, mostly in the third trimester — the basis '
          'of maternal vaccination.',
      'Human placental lactogen drives the insulin resistance of gestational '
          'diabetes.',
    ],
    related: ['algo-fgr', 'algo-severe-htn', 'aspre', 'gdm', 'immunisation',
        'lrn-aph-praevia'],
    sources: [
      'Burton GJ, Jauniaux E. Pathophysiology of placental-derived fetal '
          'growth restriction. Am J Obstet Gynecol 2018;218:S745–S761.',
      'Rolnik DL et al. ASPRE. N Engl J Med 2017;377:613–622.',
      'RCOG Green-top Guideline 27a — Placenta Praevia and Placenta Accreta.',
      'National Medical Commission postgraduate curriculum; FOGSI GCPR — '
          'Hypertensive Disorders in Pregnancy.',
    ],
  ),
  LearningTopic(
    id: 'lrn-fetal-circulation',
    title: 'Fetal circulation and transition at birth',
    subtitle: 'Three shunts, and what closes them',
    category: LearningCategory.basicSciences,
    competency: 'OG 2.6',
    summary: 'The fetal circulation is arranged to deliver the best-oxygenated '
        'blood to the brain and heart while bypassing the lungs. Birth '
        'reverses the pressure gradients that hold that arrangement in place.',
    sections: [
      LearningSection('The three shunts', [
        'DUCTUS VENOSUS — carries oxygenated umbilical venous blood past the '
            'liver to the inferior vena cava.',
        'FORAMEN OVALE — directs that stream from the right atrium to the '
            'left atrium, and hence to the coronary and cerebral circulation.',
        'DUCTUS ARTERIOSUS — shunts blood from the pulmonary artery to the '
            'descending aorta, bypassing the unventilated lungs.',
        'Pulmonary vascular resistance is HIGH in fetal life and systemic '
            'resistance is LOW because of the placenta. The shunts follow '
            'those gradients.',
      ]),
      LearningSection('Oxygen distribution', [
        'Umbilical vein blood is the most oxygenated in the fetus, at around '
            '80% saturation.',
        'Preferential streaming delivers it to the brain and myocardium.',
        'The descending aorta receives less well-oxygenated blood, which is '
            'why the lower body grows less when supply is limited.',
        'Fetal haemoglobin has a higher oxygen affinity, shifting the '
            'dissociation curve to the left, which favours uptake at the '
            'placenta.',
        'The double Bohr and double Haldane effects assist transfer at the '
            'placental interface.',
      ]),
      LearningSection('Transition at birth', [
        'The first breaths expand the lungs and PULMONARY VASCULAR '
            'RESISTANCE FALLS sharply.',
        'Clamping the cord removes the low-resistance placental bed, so '
            'SYSTEMIC RESISTANCE RISES.',
        'Increased pulmonary venous return raises left atrial pressure above '
            'right, and the foramen ovale closes functionally.',
        'Rising arterial oxygen and falling prostaglandin cause the ductus '
            'arteriosus to constrict — functionally within hours, '
            'anatomically over days to weeks.',
        'The ductus venosus closes over the following days.',
        'Anatomical remnants: ligamentum venosum, fossa ovalis, ligamentum '
            'arteriosum, and the medial umbilical ligaments.',
      ]),
      LearningSection('Clinical consequences', [
        'DEFERRED CORD CLAMPING for at least 60 seconds increases neonatal '
            'blood volume and iron stores and reduces the need for '
            'transfusion in the preterm.',
        'Prostaglandin maintains ductal patency — which is why prostaglandin '
            'E is infused in duct-dependent congenital heart disease, and why '
            'indometacin closes a persistent duct.',
        'Maternal NSAIDs in the third trimester can constrict the ductus in '
            'utero — this is why indometacin tocolysis is avoided beyond '
            'about 32 weeks.',
        'Failure of transition gives persistent pulmonary hypertension of the '
            'newborn, in which resistance stays high and right-to-left '
            'shunting continues.',
        'Asphyxia, acidosis, hypothermia and hypoglycaemia all raise '
            'pulmonary vascular resistance and impede transition — which is '
            'why thermal care and glucose matter at resuscitation.',
      ]),
    ],
    keyPoints: [
      'Fetal pulmonary resistance is high and systemic is low; birth reverses '
          'both.',
      'Ductus venosus, foramen ovale and ductus arteriosus are the three '
          'shunts.',
      'Fetal haemoglobin shifts the dissociation curve left, favouring '
          'placental uptake.',
      'Prostaglandin keeps the duct open — hence PGE for duct-dependent '
          'lesions and NSAID caution in late pregnancy.',
      'Defer cord clamping at least 60 seconds where the baby is stable.',
    ],
    related: ['apgar', 'score-apgar', 'algo-preterm-labour', 'algo-ctg',
        'fetal-medicine'],
    sources: [
      'Rudolph AM. Congenital Diseases of the Heart: Clinical-Physiological '
          'Considerations.',
      'WHO guideline on delayed umbilical cord clamping, 2014.',
      'NICE NG235 — Intrapartum care; NICE NG25 — Preterm labour and birth.',
      'National Medical Commission postgraduate curriculum; MoHFW India '
          'Newborn Action Plan; Indian Academy of Pediatrics NRP guidance.',
    ],
  ),
];
