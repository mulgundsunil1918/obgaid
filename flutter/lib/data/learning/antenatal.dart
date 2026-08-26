import '../../models/learning_topic.dart';

const kAntenatalLearningTopics = <LearningTopic>[
  LearningTopic(
    id: 'lrn-aph-praevia',
    title: 'Antepartum haemorrhage and placenta praevia',
    subtitle: 'Praevia, accreta spectrum, vasa praevia',
    category: LearningCategory.antenatal,
    competency: 'OG 9.1',
    summary: 'Bleeding after 24 weeks. The first rule is that no digital '
        'vaginal examination is performed until placenta praevia has been '
        'excluded, because the examining finger can precipitate torrential '
        'haemorrhage.',
    sections: [
      LearningSection('Causes', [
        'PLACENTA PRAEVIA — painless bleeding, a soft non-tender uterus, and '
            'a high or malpresenting fetus.',
        'PLACENTAL ABRUPTION — painful bleeding, a tender woody uterus, and '
            'loss that may be largely concealed.',
        'VASA PRAEVIA — bleeding at membrane rupture with rapid fetal '
            'compromise. The blood is fetal, so a small volume is '
            'catastrophic.',
        'LOCAL causes — cervical ectropion, polyp, cervicitis, and cervical '
            'carcinoma. These are found by speculum, which is why speculum is '
            'safe and digital is not.',
        'Uterine rupture.',
        'Unexplained, which remains common and is still associated with '
            'growth restriction and preterm birth.',
      ]),
      LearningSection('Placenta praevia', [
        'The placenta covers or lies close to the internal os. Terminology '
            'has simplified to "praevia" where it covers the os and '
            '"low-lying" where the edge is within 20 mm of it.',
        'Risk factors: previous caesarean, previous praevia, multiparity, '
            'advanced maternal age, multiple pregnancy, smoking, and assisted '
            'conception.',
        'Most low-lying placentas at the anomaly scan resolve as the lower '
            'segment forms — rescan at around 32 and again at 36 weeks.',
        'Transvaginal ultrasound is safe and more accurate than transabdominal '
            'for locating the placental edge.',
        'Delivery by caesarean, usually planned around 36–37 weeks, earlier '
            'if bleeding.',
        'Anticipate haemorrhage: cross-matched blood, senior obstetrician and '
            'anaesthetist, and a plan for the uterus that will not contract '
            'over a lower-segment placental bed.',
      ]),
      LearningSection('Placenta accreta spectrum', [
        'Abnormal placental adherence — accreta, increta and percreta by '
            'depth of invasion.',
        'The dominant risk factor is a previous caesarean with an anterior '
            'placenta praevia, and risk rises with each additional caesarean. '
            'This is why the rising caesarean rate matters.',
        'Diagnosed antenatally by ultrasound, with MRI where the picture is '
            'unclear or posterior.',
        'Plan delivery in a centre with blood bank, interventional radiology '
            'and surgical support, usually 34–36 weeks.',
        'Do not attempt piecemeal removal. Leave the placenta in situ and '
            'proceed to hysterectomy, or use a planned conservative approach '
            'in a unit set up for it.',
      ]),
      LearningSection('Vasa praevia', [
        'Fetal vessels run in the membranes across the internal os, '
            'unprotected by placenta or cord.',
        'Associated with velamentous cord insertion, succenturiate lobe, '
            'low-lying placenta, multiple pregnancy and IVF.',
        'Painless bleeding at membrane rupture with acute fetal compromise or '
            'a sinusoidal trace.',
        'Where diagnosed antenatally, admit around 30–32 weeks, give steroids '
            'and deliver by planned caesarean before labour — this converts a '
            'high perinatal mortality into a good outcome.',
      ]),
      LearningSection('Initial management of any APH', [
        'Assess maternal haemodynamics first; the visible loss understates '
            'the true loss.',
        'Large-bore access, full blood count, coagulation, cross-match, '
            'Kleihauer where relevant.',
        'NO digital vaginal examination until praevia is excluded.',
        'Speculum is permitted and is how local causes are found.',
        'CTG once viable.',
        'Anti-D within 72 hours if rhesus negative, dose guided by Kleihauer.',
        'Steroids if preterm delivery is likely; magnesium for '
            'neuroprotection where very preterm.',
      ]),
    ],
    keyPoints: [
      'No digital examination in APH until praevia is excluded — speculum is '
          'safe.',
      'Praevia bleeds painlessly; abruption is painful with a woody uterus.',
      'Accreta risk is driven by previous caesarean plus anterior praevia.',
      'In vasa praevia the blood is fetal, so a small loss can be fatal.',
      'Anti-D within 72 hours, dose guided by Kleihauer.',
    ],
    related: [
      'algo-abruption',
      'algo-pph',
      'rh-negative',
      'caesarean',
      'proc-balloon',
    ],
    sources: [
      'RCOG Green-top Guideline 27a — Placenta Praevia and Placenta Accreta; '
          '27b — Vasa Praevia; 63 — Antepartum Haemorrhage.',
      'FIGO consensus guidelines on placenta accreta spectrum disorders, '
          '2019.',
      'NICE NG192 — Caesarean birth.',
      'National Medical Commission postgraduate curriculum; FOGSI GCPR — '
          'Antepartum Haemorrhage; MoHFW Guidelines for Prevention and '
          'Management of PPH.',
    ],
  ),
  LearningTopic(
    id: 'lrn-multiple-pregnancy',
    title: 'Multiple pregnancy',
    subtitle: 'Chorionicity first, and everything that follows from it',
    category: LearningCategory.antenatal,
    competency: 'OG 10.1',
    summary: 'Determining chorionicity in the first trimester is the single '
        'most important act in twin care. It decides surveillance, the '
        'complications to look for, and the timing of delivery.',
    sections: [
      LearningSection('Determining chorionicity', [
        'Best done between 11+0 and 13+6 weeks, when the membrane insertion '
            'is clearest.',
        'LAMBDA or twin-peak sign, with a thick membrane — dichorionic.',
        'T-SIGN, with a thin membrane — monochorionic.',
        'Discordant fetal sex proves dichorionicity.',
        'Label and document the twins consistently, and in the same way at '
            'every scan — otherwise serial growth data become uninterpretable.',
        'Where chorionicity cannot be determined, manage as monochorionic.',
      ]),
      LearningSection('Why chorionicity matters', [
        'Monochorionic twins share a placenta with vascular anastomoses, so '
            'they can transfuse one another.',
        'Perinatal mortality and morbidity are substantially higher in '
            'monochorionic than dichorionic pregnancies.',
        'Monochorionic monoamniotic twins additionally risk cord entanglement '
            'and are delivered early by caesarean.',
      ]),
      LearningSection('Surveillance', [
        'DICHORIONIC — growth and wellbeing scans about every four weeks from '
            'around 20 weeks.',
        'MONOCHORIONIC — fortnightly from 16 weeks, because the shared '
            'circulation complications develop quickly.',
        'Monochorionic surveillance must include middle cerebral artery peak '
            'systolic velocity, or twin anaemia polycythaemia sequence will '
            'be missed.',
      ]),
      LearningSection('Complications', [
        'TWIN-TWIN TRANSFUSION SYNDROME — polyhydramnios in one sac and '
            'oligohydramnios in the other, staged by Quintero. Fetoscopic '
            'laser is the treatment.',
        'TWIN ANAEMIA POLYCYTHAEMIA SEQUENCE — a large inter-twin haemoglobin '
            'difference without the liquor discordance, so it is invisible '
            'without Doppler.',
        'SELECTIVE FETAL GROWTH RESTRICTION — weight discordance above about '
            '25% with one twin small.',
        'TWIN REVERSED ARTERIAL PERFUSION sequence.',
        'Single fetal death: in a monochorionic pair this risks death or '
            'neurological injury in the survivor through acute transfusion.',
        'Maternal: hyperemesis, anaemia, pre-eclampsia, gestational diabetes, '
            'preterm birth, postpartum haemorrhage from an overdistended '
            'uterus.',
      ]),
      LearningSection('Delivery', [
        'Timing: broadly around 37 weeks for uncomplicated dichorionic, '
            '36 weeks for monochorionic diamniotic, and 32–34 weeks by '
            'caesarean for monoamniotic.',
        'Vaginal birth is reasonable where the first twin is cephalic and '
            'there is no other indication for caesarean (Barrett, Twin Birth '
            'Study).',
        'Continuous monitoring of both twins in labour.',
        'Have an experienced operator present for the second twin, and '
            'ultrasound in the room.',
        'Active management of the third stage and anticipation of postpartum '
            'haemorrhage.',
      ]),
      LearningSection('Common errors', [
        'Not establishing chorionicity in the first trimester, after which it '
            'becomes unreliable.',
        'Scanning monochorionic twins four-weekly like dichorionic ones.',
        'Omitting MCA Doppler and missing TAPS.',
        'Inconsistent labelling of the twins between scans.',
      ]),
    ],
    keyPoints: [
      'Determine chorionicity at 11+0 to 13+6 weeks; if uncertain, manage as '
          'monochorionic.',
      'Lambda sign means dichorionic; T-sign means monochorionic.',
      'Monochorionic twins need fortnightly scans from 16 weeks with MCA '
          'Doppler.',
      'TAPS has normal liquor in both sacs — Doppler is the only way to find '
          'it.',
    ],
    related: ['quintero', 'senat-ttts', 'fetal-medicine', 'algo-pph'],
    sources: [
      'NICE NG137 — Twin and triplet pregnancy.',
      'RCOG Green-top Guideline 51 — Management of Monochorionic Twin '
          'Pregnancy.',
      'ISUOG Practice Guidelines — role of ultrasound in twin pregnancy.',
      'Barrett JFR et al. Twin Birth Study. N Engl J Med 2013;369:1295–1305.',
      'National Medical Commission postgraduate curriculum; FOGSI GCPR — '
          'Multiple Pregnancy.',
    ],
  ),
  LearningTopic(
    id: 'lrn-liquor-disorders',
    title: 'Disorders of amniotic fluid',
    subtitle: 'Polyhydramnios and oligohydramnios',
    category: LearningCategory.antenatal,
    competency: 'OG 11.2',
    summary: 'Amniotic fluid volume is a readout of fetal swallowing and '
        'fetal urine output. Too much suggests the fetus is not swallowing; '
        'too little suggests it is not producing urine, or the membranes have '
        'ruptured.',
    sections: [
      LearningSection('Measurement', [
        'DEEPEST VERTICAL POCKET — the preferred single measure in singleton '
            'pregnancy, and the required one in twins.',
        'AMNIOTIC FLUID INDEX — the sum of four quadrants. Using AFI rather '
            'than DVP diagnoses more oligohydramnios and leads to more '
            'induction without improving outcomes (Nabhan and Abdelmoula, '
            'Cochrane).',
        'Oligohydramnios: DVP under 2 cm, or AFI under 5 cm.',
        'Polyhydramnios: DVP over 8 cm, or AFI over 24–25 cm.',
      ]),
      LearningSection('Oligohydramnios — causes', [
        'Ruptured membranes — exclude this first, with a speculum.',
        'Placental insufficiency and fetal growth restriction, through '
            'redistribution away from the kidneys.',
        'Fetal renal causes: bilateral renal agenesis, multicystic dysplastic '
            'kidneys, posterior urethral valves in a male fetus.',
        'Post-term pregnancy.',
        'Maternal drugs — NSAIDs and ACE inhibitors.',
        'Early severe oligohydramnios causes pulmonary hypoplasia and limb '
            'contractures, the Potter sequence.',
      ]),
      LearningSection('Polyhydramnios — causes', [
        'Idiopathic in a large proportion, particularly when mild.',
        'Maternal diabetes — check glucose in every case.',
        'Anything that prevents swallowing: oesophageal or duodenal atresia, '
            'and neuromuscular or central nervous system anomalies.',
        'Fetal anaemia, including from red cell alloimmunisation and '
            'parvovirus infection.',
        'Twin-twin transfusion syndrome, in the recipient sac.',
        'Congenital infection.',
      ]),
      LearningSection('Assessment and management', [
        'Detailed anatomy survey in both, looking specifically for the causes '
            'above.',
        'Glucose tolerance testing in polyhydramnios.',
        'Middle cerebral artery Doppler for fetal anaemia.',
        'Consider infection screening.',
        'Polyhydramnios: watch for preterm labour, malpresentation, cord '
            'prolapse at membrane rupture, and postpartum haemorrhage from '
            'uterine overdistension.',
        'Amnioreduction only for maternal symptoms; indometacin is rarely '
            'used and not beyond about 32 weeks because of ductal '
            'constriction.',
        'Oligohydramnios: manage the underlying cause, with delivery timed by '
            'growth and Doppler rather than by fluid volume alone.',
        'Alert the neonatal team where an anomaly is suspected — a baby with '
            'oesophageal atresia should not be fed before the diagnosis is '
            'excluded.',
      ]),
    ],
    keyPoints: [
      'Use deepest vertical pocket, not AFI — AFI over-diagnoses and drives '
          'unnecessary induction.',
      'Exclude ruptured membranes before investigating oligohydramnios.',
      'Check glucose in every case of polyhydramnios.',
      'Polyhydramnios predisposes to cord prolapse at membrane rupture and to '
          'postpartum haemorrhage.',
    ],
    related: ['usg', 'algo-fgr', 'algo-pprom', 'gdm', 'algo-cord-prolapse'],
    sources: [
      'Nabhan AF, Abdelmoula YA. Amniotic fluid index versus single deepest '
          'vertical pocket. Cochrane Database Syst Rev 2008.',
      'ISUOG Practice Guidelines — ultrasound assessment of fetal biometry '
          'and growth.',
      'NICE NG201 — Antenatal care.',
      'National Medical Commission postgraduate curriculum; FOGSI GCPR — '
          'Fetal Surveillance; ICMR guidance on congenital anomaly '
          'surveillance.',
    ],
  ),
  LearningTopic(
    id: 'lrn-post-term',
    title: 'Post-term pregnancy',
    subtitle: 'Surveillance, and the case for induction at 41 weeks',
    category: LearningCategory.antenatal,
    competency: 'OG 11.3',
    summary: 'Stillbirth risk rises from around 40 weeks and accelerates '
        'thereafter. Accurate first-trimester dating is what makes the whole '
        'conversation meaningful, because most true post-term pregnancy is '
        'mis-dated pregnancy.',
    sections: [
      LearningSection('Definitions', [
        'TERM spans 37+0 to 41+6.',
        'POST-TERM is 42+0 weeks and beyond.',
        'Late term is 41+0 to 41+6.',
        'First-trimester crown-rump length dating reduces the diagnosis of '
            'post-term pregnancy substantially, because menstrual dating '
            'overestimates.',
      ]),
      LearningSection('Risks', [
        'Stillbirth and early neonatal death, rising with each week beyond '
            '40.',
        'Meconium-stained liquor and meconium aspiration.',
        'Macrosomia, shoulder dystocia and birth injury.',
        'Oligohydramnios and cord compression.',
        'Placental insufficiency and the dysmature or postmature baby — dry, '
            'peeling skin, reduced subcutaneous fat, long nails, meconium '
            'staining.',
        'Maternal: more assisted delivery, caesarean, perineal trauma and '
            'postpartum haemorrhage.',
      ]),
      LearningSection('Management', [
        'Offer a membrane sweep from around 40 weeks in a nulliparous woman '
            'and 41 in a parous woman.',
        'Offer induction from 41+0 to 42+0. The ARRIVE trial additionally '
            'showed that elective induction at 39 weeks in low-risk '
            'nulliparous women did not increase caesarean rates.',
        'Where she declines induction, offer increased surveillance from 42 '
            'weeks — twice-weekly CTG and assessment of amniotic fluid — while '
            'being honest that surveillance reduces but does not remove the '
            'risk.',
        'Document the discussion and her decision.',
      ]),
      LearningSection('Common errors', [
        'Calling a pregnancy post-term on menstrual dates when an early scan '
            'disagreed.',
        'Offering induction without discussing the alternative, or offering '
            'expectant management without discussing the rising stillbirth '
            'risk.',
        'Using amniotic fluid index rather than deepest pocket, which '
            'generates spurious oligohydramnios and unnecessary induction.',
      ]),
    ],
    keyPoints: [
      'Post-term means 42+0 and beyond; 41+0 to 41+6 is late term.',
      'First-trimester CRL dating is what prevents most false diagnoses.',
      'Offer induction between 41+0 and 42+0.',
      'Surveillance is an alternative that reduces, but does not remove, the '
          'risk.',
    ],
    related: ['dating', 'induction', 'arrive', 'algo-shoulder-dystocia'],
    sources: [
      'NICE NG207 — Inducing labour.',
      'Middleton P et al. Induction of labour at or beyond 37 weeks. Cochrane '
          'Database Syst Rev 2020.',
      'Grobman WA et al. ARRIVE. N Engl J Med 2018;379:513–523.',
      'National Medical Commission postgraduate curriculum; FOGSI GCPR — '
          'Induction of Labour.',
    ],
  ),
  LearningTopic(
    id: 'lrn-obstetric-cholestasis',
    title: 'Intrahepatic cholestasis of pregnancy',
    subtitle: 'Itching without a rash, and what the bile acids decide',
    category: LearningCategory.antenatal,
    competency: 'OG 14.3',
    summary: 'Pruritus without a rash in the second half of pregnancy, with '
        'raised bile acids and no other cause. The clinically important '
        'question is the peak bile acid concentration, because that is what '
        'the stillbirth risk tracks.',
    sections: [
      LearningSection('Presentation', [
        'Itching, typically worse at night and often worst on the palms and '
            'soles.',
        'NO primary rash — excoriations from scratching are secondary and are '
            'expected.',
        'Usually third trimester, though it can be earlier.',
        'Dark urine, pale stools and jaundice in a minority.',
        'Resolves rapidly after delivery, which is part of the diagnosis.',
      ]),
      LearningSection('Diagnosis', [
        'Raised serum bile acids, with raised transaminases in many.',
        'Remember that the upper limit for ALT is LOWER in pregnancy, so a '
            '"normal" result may be abnormal.',
        'Alkaline phosphatase rises physiologically from the placenta and is '
            'not evidence of liver disease.',
        'Exclude other causes: viral hepatitis, Epstein-Barr and '
            'cytomegalovirus, autoimmune liver disease, gallstones, '
            'pre-eclampsia and acute fatty liver of pregnancy.',
        'A liver ultrasound where the picture is atypical.',
      ]),
      LearningSection('Risks', [
        'Stillbirth risk is concentrated in severe disease. Pooled analysis '
            'shows the risk rises substantially once peak bile acids reach '
            'about 100 micromol/L (Ovadia et al., Lancet 2019).',
        'Spontaneous and iatrogenic preterm birth.',
        'Meconium-stained liquor.',
        'Maternal fat malabsorption and, rarely, vitamin K deficient '
            'bleeding.',
        'Recurrence in a future pregnancy is common.',
      ]),
      LearningSection('Management', [
        'Serial bile acids and liver function, with the frequency guided by '
            'severity.',
        'Ursodeoxycholic acid improves maternal itching. The PITCHES trial '
            'found it did NOT improve perinatal outcomes, so it is offered '
            'for symptoms rather than promised as protection.',
        'Emollients and antihistamines for symptom relief.',
        'Vitamin K where the prothrombin time is prolonged or steatorrhoea is '
            'present.',
        'Timing of birth is guided by peak bile acid concentration: around '
            '38–39 weeks for mild disease, earlier as severity rises, and '
            'delivery at around 35–36 weeks where the peak exceeds about 100 '
            'micromol/L.',
        'Postnatal review at least 6–8 weeks later to confirm resolution — '
            'persistent abnormality means underlying liver disease.',
        'Avoid oestrogen-containing contraception until liver function has '
            'normalised.',
      ]),
    ],
    keyPoints: [
      'Itching without a rash, worst on palms and soles, in the second half '
          'of pregnancy.',
      'The ALT upper limit is lower in pregnancy; alkaline phosphatase rises '
          'physiologically.',
      'Stillbirth risk rises materially above about 100 micromol/L.',
      'PITCHES showed ursodeoxycholic acid does not improve perinatal '
          'outcomes — it treats her itch.',
      'Confirm resolution postnatally.',
    ],
    related: ['lab-reference', 'maternal-medicine', 'induction', 'formulary'],
    sources: [
      'RCOG Green-top Guideline 43 — Intrahepatic Cholestasis of Pregnancy.',
      'Ovadia C et al. Association of adverse perinatal outcomes with bile '
          'acid levels. Lancet 2019;393:899–909.',
      'Chappell LC et al. PITCHES. Lancet 2019;394:849–860.',
      'National Medical Commission postgraduate curriculum; FOGSI GCPR — '
          'Medical Disorders in Pregnancy.',
    ],
  ),
  LearningTopic(
    id: 'lrn-infections-pregnancy',
    title: 'Infections in pregnancy',
    subtitle: 'Screened, treated, and the ones that harm the fetus',
    category: LearningCategory.antenatal,
    competency: 'OG 14.5',
    summary: 'Some infections matter because they harm the mother, some '
        'because they cross the placenta, and some because they are acquired '
        'at delivery. The management differs accordingly.',
    sections: [
      LearningSection('Routinely screened in India', [
        'HIV — offered to every pregnant woman under the national programme, '
            'with treatment for the mother and prophylaxis for the infant.',
        'Syphilis — screened and treated with benzathine penicillin, which is '
            'the only regimen that reliably treats the fetus. Penicillin '
            'allergy requires desensitisation rather than substitution.',
        'Hepatitis B — surface antigen screening, with birth-dose vaccine and '
            'immunoglobulin for the infant, and maternal antiviral therapy '
            'where the viral load is high.',
        'Asymptomatic bacteriuria — treated, because it progresses to '
            'pyelonephritis and preterm birth.',
        'Rubella immunity is assessed so that non-immune women are vaccinated '
            'postnatally — the vaccine is live and is not given in pregnancy.',
      ]),
      LearningSection('Congenital infections', [
        'CYTOMEGALOVIRUS — the commonest congenital infection. '
            'Sensorineural hearing loss, microcephaly, intracranial '
            'calcification, growth restriction.',
        'TOXOPLASMOSIS — transmission risk rises with gestation while '
            'severity falls. Hydrocephalus, chorioretinitis, intracranial '
            'calcification.',
        'RUBELLA — cataracts, sensorineural deafness and cardiac defects, '
            'with risk highest in the first trimester.',
        'PARVOVIRUS B19 — fetal anaemia and hydrops. Monitor with middle '
            'cerebral artery peak systolic velocity; intrauterine transfusion '
            'is curative.',
        'ZIKA — microcephaly and other central nervous system injury.',
        'VARICELLA — congenital varicella syndrome if maternal infection is '
            'before 28 weeks; neonatal varicella if it occurs around '
            'delivery.',
      ]),
      LearningSection('Acquired around delivery', [
        'GROUP B STREPTOCOCCUS — intrapartum benzylpenicillin for those with '
            'risk factors or a positive screen. India uses a risk-based '
            'approach in most settings rather than universal screening.',
        'HERPES SIMPLEX — primary infection in the third trimester is an '
            'indication for caesarean; recurrent disease carries a much lower '
            'risk.',
        'HEPATITIS B and HIV, as above.',
        'Chorioamnionitis, which is an indication to deliver.',
      ]),
      LearningSection('Endemic in India', [
        'MALARIA — Plasmodium falciparum sequesters in the placenta and '
            'causes growth restriction with a normal peripheral film. Screen '
            'and treat per the national programme.',
        'TUBERCULOSIS — treat, do not defer. Standard first-line therapy is '
            'used; streptomycin is avoided.',
        'DENGUE — higher risk of haemorrhage and preterm birth; peripartum '
            'infection is the highest-risk window. Paracetamol only, never '
            'NSAIDs.',
        'HEPATITIS E — sporadic and epidemic, with a substantially higher '
            'case fatality in pregnancy, particularly in the third trimester.',
      ]),
      LearningSection('Common errors', [
        'Substituting a non-penicillin antibiotic in a penicillin-allergic '
            'woman with syphilis — the fetus remains untreated.',
        'Giving a live vaccine in pregnancy.',
        'Deferring tuberculosis treatment until after delivery.',
        'Attributing fever to a urinary tract infection without considering '
            'chorioamnionitis or malaria.',
      ]),
    ],
    keyPoints: [
      'Benzathine penicillin is the only reliable fetal treatment for '
          'syphilis; desensitise rather than substitute.',
      'CMV is the commonest congenital infection.',
      'Parvovirus causes fetal anaemia — MCA Doppler, and transfusion is '
          'curative.',
      'Malaria in the placenta causes growth restriction with a normal '
          'peripheral film.',
      'Hepatitis E carries a much higher case fatality in pregnancy.',
    ],
    related: [
      'immunisation',
      'algo-sepsis',
      'maternal-medicine',
      'algo-fgr',
      'fetal-medicine',
    ],
    sources: [
      'RCOG Green-top Guidelines 13 (Chickenpox in Pregnancy), 36 '
          '(Prevention of Early-onset Group B Streptococcal Disease), 54a and '
          '54b (Malaria in Pregnancy).',
      'WHO recommendations on antenatal care, 2016; WHO guidelines on syphilis '
          'screening and treatment.',
      'NACO National Guidelines for Prevention of Parent-to-Child '
          'Transmission of HIV and National Guidelines on RTI/STI; MoHFW '
          'National Vector Borne Disease Control Programme and National TB '
          'Elimination Programme guidance; FOGSI GCPR — Infections in '
          'Pregnancy.',
    ],
  ),
  LearningTopic(
    id: 'lrn-obesity-pregnancy',
    title: 'Obesity in pregnancy',
    subtitle: 'Risk that compounds, and the practical problems it creates',
    category: LearningCategory.antenatal,
    competency: 'OG 14.6',
    summary: 'Raised body mass index increases almost every obstetric risk '
        'and simultaneously makes each one harder to detect and to treat. '
        'Asian populations meet metabolic risk at lower BMI thresholds, which '
        'changes where the lines sit in India.',
    sections: [
      LearningSection('Thresholds', [
        'WHO international cut-offs: overweight 25 and obesity 30 kg/m².',
        'For Asian Indian populations, revised consensus thresholds are '
            'lower — overweight from about 23 and obesity from about 25 kg/m² '
            '— because cardiometabolic risk appears at a lower BMI.',
        'Record BMI at booking from measured height and weight, not reported '
            'values.',
      ]),
      LearningSection('Risks', [
        'MATERNAL — gestational diabetes, pre-eclampsia, venous '
            'thromboembolism, caesarean and wound infection, postpartum '
            'haemorrhage, anaesthetic difficulty.',
        'FETAL — congenital anomaly including neural tube defects, '
            'macrosomia, stillbirth, and shoulder dystocia.',
        'NEONATAL — hypoglycaemia, and higher rates of admission.',
        'LONGER TERM — childhood obesity in the offspring.',
      ]),
      LearningSection('Practical difficulties', [
        'Ultrasound image quality falls, so anomaly detection is lower and a '
            'repeat scan is often needed.',
        'Fundal height and fetal palpation become unreliable — rely on '
            'ultrasound for growth.',
        'Fetal movements are perceived later and less clearly.',
        'Blood pressure measurement needs a correctly sized large cuff; a '
            'standard cuff overestimates.',
        'Venous access, regional anaesthesia and surgery are all more '
            'difficult; involve anaesthetics antenatally rather than on the '
            'day.',
      ]),
      LearningSection('Management', [
        'Folic acid 5 mg daily preconception and through the first trimester.',
        'Vitamin D supplementation.',
        'Aspirin 150 mg from 12 weeks where other pre-eclampsia risk factors '
            'coexist.',
        'Screen for gestational diabetes.',
        'Weight-gain targets appropriate to the starting BMI — less gain is '
            'recommended at higher BMI, and weight loss is not a goal in '
            'pregnancy.',
        'VTE risk assessment at booking, on any admission and postnatally, '
            'with weight-adjusted low-molecular-weight heparin.',
        'Growth scans in the third trimester.',
        'Anaesthetic review antenatally where BMI is high.',
        'Discuss weight before the next pregnancy — the interpregnancy '
            'interval is the realistic window for change.',
      ]),
    ],
    keyPoints: [
      'Asian Indian thresholds are lower: overweight from about 23, obesity '
          'from about 25 kg/m².',
      'Folic acid 5 mg, not 400 micrograms.',
      'Use a large cuff — a standard cuff overestimates blood pressure.',
      'Fundal height is unreliable; use ultrasound for growth.',
      'Heparin doses are weight-adjusted.',
    ],
    related: ['anthropometry', 'weight-gain', 'gdm', 'vte-risk', 'caesarean'],
    sources: [
      'RCOG Green-top Guideline 72 — Care of Women with Obesity in Pregnancy.',
      'WHO Expert Consultation. Appropriate body-mass index for Asian '
          'populations. Lancet 2004;363:157–163.',
      'Misra A et al. Consensus statement for diagnosis of obesity and '
          'abdominal obesity for Asian Indians. J Assoc Physicians India '
          '2009;57:163–170.',
      'National Medical Commission postgraduate curriculum; ICMR-NIN Dietary '
          'Guidelines for Indians 2024; FOGSI GCPR — Obesity in Pregnancy.',
    ],
  ),
  LearningTopic(
    id: 'lrn-vte-pregnancy',
    title: 'Venous thromboembolism in pregnancy',
    subtitle: 'Prophylaxis, diagnosis, and why D-dimer is useless here',
    category: LearningCategory.antenatal,
    competency: 'OG 14.4',
    summary: 'Pregnancy is a prothrombotic state throughout and for weeks '
        'after delivery. Thromboembolism remains a leading direct cause of '
        'maternal death, and most of those deaths follow a risk assessment '
        'that was never done.',
    sections: [
      LearningSection('Why the risk rises', [
        'All three arms of Virchow triad are affected.',
        'HYPERCOAGULABILITY — rising fibrinogen and factors VIII, IX and X, '
            'falling protein S, and acquired activated protein C resistance.',
        'STASIS — venous dilatation and compression of the left iliac vein by '
            'the gravid uterus, which is why most obstetric DVT is left-sided '
            'and iliofemoral.',
        'ENDOTHELIAL INJURY — at delivery, and more so at caesarean.',
        'The risk is highest in the puerperium, not in pregnancy.',
      ]),
      LearningSection('Risk assessment and prophylaxis', [
        'Assess at booking, on every admission, after any change, and again '
            'after delivery.',
        'Risk factors include previous VTE, thrombophilia, age, obesity, '
            'parity, smoking, immobility, hyperemesis, multiple pregnancy, '
            'pre-eclampsia, caesarean, prolonged labour, haemorrhage and '
            'infection.',
        'Low-molecular-weight heparin is the agent of choice — it does not '
            'cross the placenta.',
        'Doses are weight-adjusted.',
        'Warfarin is teratogenic in the first trimester and crosses the '
            'placenta; direct oral anticoagulants are avoided.',
        'Stop prophylaxis appropriately around regional anaesthesia and '
            'restart afterwards per protocol.',
      ]),
      LearningSection('Diagnosis', [
        'D-DIMER RISES PHYSIOLOGICALLY IN PREGNANCY and cannot be used to '
            'exclude VTE. This is the single most common diagnostic error.',
        'Suspected DVT: compression duplex ultrasound. If negative but '
            'suspicion remains, anticoagulate and repeat.',
        'Suspected PE: chest X-ray first, then CTPA or ventilation-perfusion '
            'scanning.',
        'Do not withhold imaging because of radiation. The fetal dose from '
            'either is small, and an undiagnosed pulmonary embolism is far '
            'more dangerous. Explain the relative breast and fetal doses and '
            'let her choose where both are available.',
        'Start treatment on clinical suspicion, before imaging confirms it.',
      ]),
      LearningSection('Treatment', [
        'Therapeutic weight-adjusted low-molecular-weight heparin.',
        'Continue for the remainder of the pregnancy and for at least six '
            'weeks postnatally, with a minimum total duration of three '
            'months.',
        'Massive PE with haemodynamic compromise: involve critical care; '
            'thrombolysis is used where the alternative is death.',
        'Both heparin and warfarin are compatible with breastfeeding.',
        'Postnatal haematology review, and counselling for future pregnancies '
            'and for oestrogen-containing contraception, which is then '
            'contraindicated.',
      ]),
    ],
    keyPoints: [
      'D-dimer cannot exclude VTE in pregnancy.',
      'Most obstetric DVT is left-sided and iliofemoral.',
      'Risk is highest in the puerperium.',
      'Treat on suspicion; do not wait for imaging.',
      'Never withhold a CTPA or V/Q scan because she is pregnant.',
    ],
    related: ['vte-risk', 'score-vte', 'score-caprini', 'formulary',
        'lab-reference'],
    sources: [
      'RCOG Green-top Guideline 37a — Reducing the Risk of Thrombosis and '
          'Embolism during Pregnancy and the Puerperium; 37b — Thrombosis and '
          'Embolism during Pregnancy and the Puerperium: Acute Management.',
      'MBRRACE-UK — Saving Lives, Improving Mothers\' Care.',
      'NICE NG158 — Venous thromboembolic diseases.',
      'National Medical Commission postgraduate curriculum; FOGSI GCPR — '
          'Thromboprophylaxis in Obstetrics and Gynaecology.',
    ],
  ),
];
