import '../../models/learning_topic.dart';

const kSexualHealthLearningTopics = <LearningTopic>[
  LearningTopic(
    id: 'lrn-sti',
    title: 'Sexually transmitted infections',
    subtitle: 'Syndromic and aetiological management, and partner treatment',
    category: LearningCategory.sexualHealth,
    competency: 'OG 21.1',
    summary: 'India manages most STIs syndromically, because treating on the '
        'day of presentation reaches more people than treating on the day the '
        'result returns. The consequence of missing them is tubal '
        'infertility, ectopic pregnancy and chronic pain.',
    sections: [
      LearningSection('The syndromic approach', [
        'NACO defines colour-coded kits against syndromes rather than '
            'organisms.',
        'Vaginal or cervical discharge, genital ulcer, lower abdominal pain, '
            'inguinal bubo, urethral discharge and scrotal swelling are the '
            'syndromes.',
        'The advantage is same-visit treatment; the cost is over-treatment '
            'and no organism-specific data.',
        'Use aetiological diagnosis where testing is available and results '
            'will return in time to act.',
      ]),
      LearningSection('Chlamydia and gonorrhoea', [
        'Frequently asymptomatic in women, which is why they cause damage '
            'silently.',
        'Cervicitis, urethritis, and ascending infection causing pelvic '
            'inflammatory disease.',
        'Nucleic acid amplification testing where available.',
        'Gonorrhoea has developed extensive antimicrobial resistance — follow '
            'current national guidance rather than older regimens, and use '
            'ceftriaxone-based treatment.',
        'Test of cure for gonorrhoea.',
        'Complications: tubal infertility, ectopic pregnancy, chronic pelvic '
            'pain, Fitz-Hugh-Curtis perihepatitis, and neonatal conjunctivitis '
            'and pneumonia.',
      ]),
      LearningSection('Syphilis', [
        'PRIMARY — a single painless indurated ulcer, the chancre, which '
            'heals spontaneously and is therefore missed.',
        'SECONDARY — a rash characteristically involving palms and soles, '
            'condylomata lata, and mucous patches.',
        'LATENT, then TERTIARY — gummata, cardiovascular and neurological '
            'disease.',
        'Non-treponemal tests (VDRL, RPR) for screening and for monitoring '
            'response; treponemal tests confirm and stay positive for life.',
        'Benzathine penicillin is the treatment; in pregnancy it is the only '
            'regimen that treats the fetus, and penicillin allergy requires '
            'desensitisation.',
        'Warn about the Jarisch-Herxheimer reaction, which in pregnancy can '
            'precipitate contractions and fetal distress.',
      ]),
      LearningSection('Genital ulcer disease and others', [
        'HERPES SIMPLEX — multiple painful vesicles and ulcers; the '
            'commonest cause of genital ulceration.',
        'CHANCROID — painful ragged ulcers with suppurative inguinal nodes.',
        'LYMPHOGRANULOMA VENEREUM — a transient ulcer followed by painful '
            'buboes, with the groove sign.',
        'DONOVANOSIS — beefy red granulomatous ulcers; historically endemic '
            'in parts of India.',
        'TRICHOMONAS — frothy discharge, and the only common STI among the '
            'vaginitides.',
        'Painful ulcers suggest herpes or chancroid; painless suggests '
            'syphilis or donovanosis. This is a useful first split.',
      ]),
      LearningSection('Principles that apply to all of them', [
        'PARTNER NOTIFICATION AND TREATMENT. Without it she is reinfected, '
            'and this is the step most often omitted.',
        'Offer a full screen including HIV, syphilis and hepatitis B.',
        'Abstinence or condoms until both partners complete treatment.',
        'Confidentiality, and a private consultation.',
        'Consider safeguarding and sexual violence, particularly in '
            'adolescents — an STI in a minor triggers POCSO obligations.',
        'Counsel on condoms and offer contraception.',
        'Do not moralise. Judgemental care reduces attendance, and the people '
            'who stop attending are the ones who transmit.',
      ]),
    ],
    keyPoints: [
      'India manages most STIs syndromically so that treatment happens on the '
          'day of presentation.',
      'Chlamydia and gonorrhoea are commonly asymptomatic in women and cause '
          'silent tubal damage.',
      'Painful ulcer suggests herpes or chancroid; painless suggests syphilis '
          'or donovanosis.',
      'Benzathine penicillin is the only regimen that treats the fetus in '
          'syphilis.',
      'Partner treatment is part of the treatment, not an optional extra.',
    ],
    related: [
      'algo-pelvic-sepsis',
      'algo-ectopic',
      'infertility',
      'vulval-disorders',
      'immunisation',
    ],
    sources: [
      'NACO National Guidelines on Prevention, Management and Control of '
          'Reproductive Tract Infections and Sexually Transmitted Infections.',
      'WHO guidelines for the management of symptomatic sexually transmitted '
          'infections, 2021.',
      'BASHH UK national guidelines; CDC STI Treatment Guidelines.',
      'National Medical Commission postgraduate curriculum; Protection of '
          'Children from Sexual Offences Act 2012.',
    ],
  ),
  LearningTopic(
    id: 'lrn-vaginitis',
    title: 'Vaginal discharge and vaginitis',
    subtitle: 'Physiological, bacterial vaginosis, candida, trichomonas',
    category: LearningCategory.sexualHealth,
    competency: 'OG 21.2',
    summary: 'Most discharge is physiological or bacterial vaginosis, and '
        'most is treated as candida. Getting the diagnosis right avoids '
        'repeated ineffective antifungals and the missed diagnoses that hide '
        'behind them.',
    sections: [
      LearningSection('Physiological discharge', [
        'Varies across the cycle — clearer and more copious around '
            'ovulation, thicker in the luteal phase.',
        'Increases in pregnancy and with combined hormonal contraception.',
        'White or clear, non-offensive, and not associated with itch, '
            'soreness or bleeding.',
        'Reassurance and an explanation of normal variation is the '
            'treatment.',
      ]),
      LearningSection('Bacterial vaginosis', [
        'The commonest cause of abnormal discharge. Not an infection so much '
            'as a loss of lactobacilli with overgrowth of anaerobes.',
        'Thin, grey-white, homogeneous discharge with a fishy odour, '
            'characteristically without itch or inflammation.',
        'Amsel criteria: three of four — characteristic discharge, pH above '
            '4.5, positive whiff test with potassium hydroxide, and clue '
            'cells on microscopy.',
        'Treat with metronidazole, orally or vaginally.',
        'Associated with preterm birth, late miscarriage and postoperative '
            'infection.',
        'Partner treatment is not routinely required.',
        'Recurrence is common; avoid douching and vaginal washes, which are '
            'a cause rather than a cure.',
      ]),
      LearningSection('Vulvovaginal candidiasis', [
        'Thick, white, curdy discharge with prominent ITCH, soreness and '
            'superficial dyspareunia; the vulva is erythematous and may be '
            'fissured.',
        'pH remains normal, at or below 4.5 — this is the quickest bedside '
            'discriminator from bacterial vaginosis and trichomonas.',
        'Treat with a topical or oral azole. Oral fluconazole is avoided in '
            'pregnancy, where topical treatment is used.',
        'Recurrent candidiasis — four or more episodes a year — needs '
            'confirmation on culture and an induction-and-maintenance '
            'regimen.',
        'Look for diabetes and immunosuppression in recurrent disease.',
        'Not sexually transmitted; routine partner treatment is unnecessary.',
      ]),
      LearningSection('Trichomoniasis', [
        'A sexually transmitted protozoan.',
        'Frothy, yellow-green, offensive discharge with vulvovaginal '
            'soreness; pH is raised.',
        'The strawberry cervix is characteristic but seen in a minority.',
        'Diagnose on wet mount microscopy, culture or NAAT.',
        'Treat with metronidazole, AND TREAT THE PARTNER.',
        'Associated with preterm birth and with increased HIV acquisition.',
        'Offer a full sexual health screen.',
      ]),
      LearningSection('When discharge is not vaginitis', [
        'Cervicitis from chlamydia or gonorrhoea — examine the cervix.',
        'Retained tampon or other foreign body — offensive, often blood '
            'stained, and easily found on speculum.',
        'Cervical polyp or ectropion.',
        'CERVICAL CARCINOMA — offensive blood-stained discharge in a woman '
            'who has not had screening.',
        'Atrophic vaginitis after the menopause.',
        'In a prepubertal child, offensive or bloody discharge is a foreign '
            'body or abuse until proven otherwise.',
        'Fistula — continuous watery leakage after obstructed labour or '
            'pelvic surgery.',
      ]),
    ],
    keyPoints: [
      'Vaginal pH is the fastest discriminator: normal in candida, raised in '
          'BV and trichomonas.',
      'BV has odour without itch; candida has itch without odour.',
      'Treat the partner in trichomonas; not routinely in BV or candida.',
      'Examine the cervix — cancer and cervicitis present as discharge.',
      'Bloody or offensive discharge in a child means foreign body or abuse.',
    ],
    related: ['lrn-sti', 'proc-pap', 'vulval-disorders', 'menopause'],
    sources: [
      'NACO National Guidelines on RTI/STI management, including syndromic '
          'kits.',
      'BASHH national guidelines on bacterial vaginosis, vulvovaginal '
          'candidiasis and trichomoniasis.',
      'WHO guidelines for the management of symptomatic sexually transmitted '
          'infections, 2021.',
      'National Medical Commission postgraduate curriculum; FOGSI GCPR — '
          'Vaginal Discharge.',
    ],
  ),
  LearningTopic(
    id: 'lrn-hiv-pptct',
    title: 'HIV in pregnancy and PPTCT',
    subtitle: 'Prevention of parent-to-child transmission, as India runs it',
    category: LearningCategory.sexualHealth,
    competency: 'OG 21.3',
    summary: 'With antiretroviral therapy, appropriate delivery planning and '
        'infant prophylaxis, transmission falls from around a quarter to '
        'under a few percent. Nearly all residual transmission follows late '
        'or absent diagnosis.',
    sections: [
      LearningSection('Testing', [
        'HIV testing is offered to every pregnant woman under the national '
            'PPTCT programme, with opt-out consent and pre- and post-test '
            'information.',
        'Retest in the third trimester in high-prevalence settings or where '
            'ongoing risk exists.',
        'Test the partner.',
        'Confidentiality is absolute; disclosure to family without her '
            'consent is a breach and a documented cause of women '
            'disengaging from care.',
      ]),
      LearningSection('Antenatal management', [
        'Lifelong antiretroviral therapy for every pregnant woman regardless '
            'of CD4 count — this is the core of Option B+, which India '
            'follows.',
        'Start as soon as possible; the earlier viral suppression is '
            'achieved, the lower the transmission risk.',
        'Monitor viral load, and adherence, which is the practical '
            'determinant of success.',
        'Screen for and treat co-infections: tuberculosis, syphilis, '
            'hepatitis B and C.',
        'Avoid invasive procedures such as amniocentesis where possible, and '
            'if required perform them with the viral load suppressed.',
      ]),
      LearningSection('Delivery', [
        'Mode of delivery is decided by the viral load near term.',
        'Suppressed viral load: vaginal birth is appropriate, and caesarean '
            'confers no additional benefit.',
        'High or unknown viral load: planned caesarean before labour and '
            'before membrane rupture reduces transmission.',
        'Avoid prolonged rupture of membranes, fetal scalp electrodes, fetal '
            'blood sampling, and routine episiotomy.',
        'Avoid artificial rupture of membranes unless indicated.',
        'Intrapartum zidovudine where the viral load is high or unknown.',
      ]),
      LearningSection('The infant and feeding', [
        'Infant antiretroviral prophylaxis per the national protocol, started '
            'promptly after birth.',
        'Early infant diagnosis by virological testing on the national '
            'schedule; antibody testing is uninterpretable in early infancy '
            'because of maternal antibody.',
        'INDIA RECOMMENDS EXCLUSIVE BREASTFEEDING for six months with '
            'maternal antiretroviral therapy and infant prophylaxis, because '
            'replacement feeding in most Indian settings carries a higher '
            'combined risk of death from diarrhoea and malnutrition.',
        'Mixed feeding is the highest-risk pattern and must be avoided — '
            'exclusive, either way.',
        'Follow national guidance here rather than importing '
            'high-income-country advice.',
      ]),
      LearningSection('Afterwards', [
        'Continue antiretroviral therapy lifelong.',
        'Contraception: discuss interactions between some antiretrovirals and '
            'hormonal contraception; condoms in addition, for transmission.',
        'Partner testing and treatment; treatment as prevention.',
        'Link her to ongoing ART services before discharge — the transition '
            'from maternity to HIV care is where women are lost.',
      ]),
    ],
    keyPoints: [
      'Option B+: lifelong ART for every pregnant woman regardless of CD4.',
      'Mode of delivery is decided by viral load, not by HIV status alone.',
      'India recommends exclusive breastfeeding with maternal ART — do not '
          'import different advice.',
      'Mixed feeding is the highest-risk pattern.',
      'Infant diagnosis is virological; antibody tests are uninterpretable '
          'early.',
    ],
    related: ['immunisation', 'couns-breastfeeding', 'caesarean', 'lrn-sti'],
    sources: [
      'NACO National Guidelines for Prevention of Parent to Child '
          'Transmission of HIV and National Technical Guidelines on ART.',
      'WHO consolidated guidelines on HIV prevention, testing, treatment, '
          'service delivery and monitoring, 2021.',
      'BHIVA guidelines for the management of HIV in pregnancy and '
          'postpartum.',
      'NACO guidelines on HIV and infant feeding; MoHFW Infant and Young '
          'Child Feeding guidelines.',
    ],
  ),
  LearningTopic(
    id: 'lrn-hpv-vaccination',
    title: 'HPV and vaccination',
    subtitle: 'Natural history, and the vaccine that prevents a cancer',
    category: LearningCategory.sexualHealth,
    competency: 'OG 22.1',
    summary: 'Persistent infection with a high-risk human papillomavirus is '
        'necessary for cervical cancer. That makes cervical cancer one of the '
        'few malignancies that vaccination can largely prevent.',
    sections: [
      LearningSection('Natural history', [
        'HPV infection is extremely common and most infections clear '
            'spontaneously within about two years.',
        'PERSISTENT infection with a high-risk type is the requirement for '
            'progression.',
        'Types 16 and 18 account for around 70% of cervical cancers '
            'worldwide.',
        'Low-risk types 6 and 11 cause anogenital warts and recurrent '
            'respiratory papillomatosis, not cancer.',
        'Progression from persistent infection through CIN to invasion takes '
            'years to decades, which is what makes screening effective.',
        'Cofactors: smoking, immunosuppression including HIV, long-term '
            'combined oral contraception, and high parity.',
        'HPV also causes vulval, vaginal, anal and oropharyngeal cancer.',
      ]),
      LearningSection('Vaccines', [
        'Bivalent (16, 18), quadrivalent (6, 11, 16, 18) and nonavalent '
            '(adding 31, 33, 45, 52, 58) preparations exist.',
        'CERVAVAC, an indigenously developed quadrivalent vaccine, was '
            'licensed in India and substantially changes affordability.',
        'Prophylactic, not therapeutic — the vaccine prevents acquisition and '
            'does not treat established infection or disease.',
        'Greatest benefit before sexual debut.',
      ]),
      LearningSection('Schedule and eligibility', [
        'Target age is 9–14 years, where a two-dose schedule is used.',
        'Three doses are used from 15 years, and in immunocompromised '
            'individuals including those with HIV.',
        'WHO has recognised that a single dose provides comparable protection '
            'in the target age group, which many programmes have adopted to '
            'extend coverage.',
        'Catch-up vaccination is offered in older adolescents and young '
            'women, with declining benefit as exposure rises.',
        'Vaccinating boys reduces transmission and prevents HPV-related '
            'disease in men.',
        'Not recommended in pregnancy — defer, but no intervention is needed '
            'if given inadvertently.',
      ]),
      LearningSection('Vaccination does not replace screening', [
        'Current vaccines do not cover every oncogenic type.',
        'Vaccinated women still require cervical screening, though at '
            'extended intervals in some programmes.',
        'India\'s cervical cancer burden remains among the highest in the '
            'world, and coverage of both vaccination and screening is the '
            'limiting factor rather than the availability of either.',
        'Counter the common objections directly: the vaccine does not '
            'encourage sexual activity, and the safety record across hundreds '
            'of millions of doses is well established.',
      ]),
    ],
    keyPoints: [
      'Persistent high-risk HPV is necessary for cervical cancer; types 16 '
          'and 18 cause around 70%.',
      'The vaccine is prophylactic — it does not treat existing infection.',
      'Target age 9–14 with two doses; three from 15 and in '
          'immunocompromise.',
      'CERVAVAC is India\'s indigenous quadrivalent vaccine.',
      'Vaccinated women still need screening.',
    ],
    related: ['proc-pap', 'proc-colposcopy', 'figo-cervix-2018',
        'immunisation'],
    sources: [
      'WHO position paper on human papillomavirus vaccines, 2022.',
      'WHO Global Strategy to Accelerate the Elimination of Cervical Cancer, '
          '2020.',
      'Indian Academy of Pediatrics Advisory Committee on Vaccines '
          'recommendations; Government of India licensure of CERVAVAC '
          '(quadrivalent HPV vaccine).',
      'FOGSI GCPR — Cervical Cancer Screening and HPV Vaccination; National '
          'Cancer Grid of India cervical cancer guidelines.',
    ],
  ),
  LearningTopic(
    id: 'lrn-adolescent-gynae',
    title: 'Adolescent gynaecology',
    subtitle: 'Puberty, confidentiality, and the law about minors',
    category: LearningCategory.sexualHealth,
    competency: 'OG 20.1',
    summary: 'Adolescents present with different conditions, different fears '
        'and a different legal frame. Getting consent and confidentiality '
        'right is as clinically important as the diagnosis.',
    sections: [
      LearningSection('Normal puberty', [
        'The usual sequence in girls is thelarche, then pubarche, then the '
            'growth spurt, then menarche.',
        'Menarche typically follows breast budding by about two to three '
            'years.',
        'Tanner staging describes breast and pubic hair development '
            'separately.',
        'Cycles are commonly anovulatory and irregular for the first one to '
            'two years, which explains much adolescent bleeding.',
        'PRECOCIOUS puberty: development before 8 years. DELAYED: no breast '
            'development by 13, or no menarche by 15.',
      ]),
      LearningSection('Common presentations', [
        'Heavy menstrual bleeding — usually anovulatory, but a coagulopathy '
            'is found in a significant proportion presenting at menarche. '
            'Screen for von Willebrand disease when bleeding is heavy from '
            'the first period.',
        'Dysmenorrhoea — treat it, and do not dismiss it.',
        'Primary amenorrhoea.',
        'PCOS — diagnose cautiously, because irregular cycles and acne are '
            'normal in early adolescence; the Rotterdam criteria are applied '
            'differently here and polycystic morphology is not used.',
        'Vaginal discharge.',
        'Obstructive anomalies presenting with cyclical pain.',
        'Contraception and emergency contraception.',
        'Pregnancy, wanted or otherwise.',
      ]),
      LearningSection('Consent, confidentiality and the law in India', [
        'Confidentiality is the default, and adolescents will not disclose '
            'without it — say so explicitly at the start.',
        'Offer part of every consultation without a parent present.',
        'The age of consent to sexual activity in India is 18. Any sexual '
            'activity involving a person under 18 is an offence under POCSO, '
            'regardless of apparent consent.',
        'POCSO imposes a MANDATORY REPORTING duty on anyone, including '
            'clinicians, who has knowledge of a sexual offence against a '
            'minor. This duty overrides confidentiality.',
        'Explain the limits of confidentiality before she discloses, not '
            'after — otherwise she experiences the report as a betrayal.',
        'Contraception may lawfully be provided to a minor in her best '
            'interests; the reporting duty concerns the offence, not the '
            'provision of care.',
        'For termination in a minor, guardian consent is required under the '
            'MTP Act, and POCSO reporting applies.',
      ]),
      LearningSection('How to conduct the consultation', [
        'Speak to her, not about her.',
        'Explain everything in plain language and check understanding.',
        'Examination is often unnecessary — a diagnosis of primary '
            'dysmenorrhoea rarely requires a pelvic examination, and a '
            'speculum examination is almost never appropriate in a girl who '
            'is not sexually active.',
        'Where internal examination is genuinely required in a child, it is '
            'done under anaesthesia.',
        'Consider safeguarding in every adolescent presentation: ask about '
            'safety at home and about coercion.',
        'Ask about school attendance — it is the practical measure of how '
            'much the condition is costing her.',
      ]),
    ],
    keyPoints: [
      'Menarche follows breast budding by two to three years; early cycles '
          'are anovulatory.',
      'Heavy bleeding from the very first period suggests a coagulopathy.',
      'POCSO imposes mandatory reporting for sexual activity involving anyone '
          'under 18, overriding confidentiality.',
      'Explain the limits of confidentiality before she discloses.',
      'Speculum examination is almost never appropriate in a girl who is not '
          'sexually active.',
    ],
    related: [
      'pcos',
      'algo-aub',
      'contraception',
      'lrn-amenorrhoea',
      'lrn-mullerian-anomalies',
    ],
    sources: [
      'Protection of Children from Sexual Offences (POCSO) Act 2012 and '
          'Rules; Medical Termination of Pregnancy Act 1971 as amended 2021.',
      'RCOG and British Society for Paediatric and Adolescent Gynaecology '
          'guidance.',
      'MoHFW Rashtriya Kishor Swasthya Karyakram (adolescent health '
          'programme) operational guidelines.',
      'FOGSI adolescent gynaecology recommendations; National Medical '
          'Commission postgraduate curriculum.',
    ],
  ),
  LearningTopic(
    id: 'lrn-sexual-violence-care',
    title: 'Care after sexual violence',
    subtitle: 'Clinical care first, forensic care alongside, consent '
        'throughout',
    category: LearningCategory.sexualHealth,
    competency: 'OG 23.1',
    summary: 'The clinician\'s duty is treatment, evidence collection with '
        'consent, and documentation that will withstand a court. Refusing to '
        'examine or treat a survivor is unlawful in India.',
    sections: [
      LearningSection('Legal duties in India', [
        'Section 357C of the Code of Criminal Procedure obliges all '
            'hospitals, public and private, to provide free first aid and '
            'medical treatment to survivors of sexual violence.',
        'Refusing treatment is a punishable offence.',
        'A survivor may be examined and treated without a police requisition '
            '— she does not need to have filed a complaint.',
        'She may consent to treatment and decline the forensic examination, '
            'or the reverse. Both are her choice.',
        'For a minor, POCSO applies with mandatory reporting.',
        'The two-finger test is prohibited: it is unscientific, degrading, '
            'and has been held by the Supreme Court to have no evidentiary '
            'value. Any reference to "habituation to sexual intercourse" is '
            'improper.',
      ]),
      LearningSection('Immediate care', [
        'Treat physical injuries first; life-threatening injury takes '
            'precedence over evidence.',
        'Provide a private, quiet space and a support person of her '
            'choosing.',
        'Explain each step and obtain informed consent for each — '
            'examination, evidence collection, treatment and reporting are '
            'separate consents.',
        'Do not require her to repeat the history to multiple clinicians.',
      ]),
      LearningSection('Prophylaxis', [
        'EMERGENCY CONTRACEPTION — as soon as possible; a copper IUD is an '
            'option where appropriate and acceptable.',
        'HIV POST-EXPOSURE PROPHYLAXIS — ideally within 72 hours, for 28 '
            'days, per NACO protocol.',
        'Presumptive treatment for gonorrhoea, chlamydia and trichomonas.',
        'Hepatitis B vaccination, with immunoglobulin where indicated.',
        'Tetanus prophylaxis for wounds.',
        'Pregnancy test, and a plan for follow-up testing.',
      ]),
      LearningSection('Documentation and evidence', [
        'Record her account in her own words, in quotation marks, without '
            'interpretation.',
        'Describe injuries factually with site, size and shape — do not '
            'speculate about causation or consent.',
        'Never write opinions about whether intercourse was consensual; that '
            'is not a medical finding.',
        'Follow the MoHFW medico-legal proforma; maintain the chain of '
            'custody for samples.',
        'Note the absence of injury explicitly, and record that its absence '
            'does not exclude assault — most sexual assaults leave no genital '
            'injury, and courts need this stated.',
      ]),
      LearningSection('Follow-up and support', [
        'Repeat HIV, syphilis and hepatitis testing at the intervals in the '
            'protocol.',
        'Pregnancy testing, and access to safe abortion under the MTP Act, '
            'for which survivors of assault are an explicit Rule 3B category '
            'up to 24 weeks.',
        'Mental health support — post-traumatic stress, depression and '
            'suicidality are common.',
        'Link to One Stop Centres and legal support services.',
        'Give her the choice about police involvement in every adult case, '
            'and be explicit about where the law removes that choice.',
      ]),
    ],
    keyPoints: [
      'All hospitals must provide free treatment; refusal is an offence.',
      'A police requisition is not required to examine or treat.',
      'The two-finger test is prohibited and has no evidentiary value.',
      'HIV post-exposure prophylaxis within 72 hours, for 28 days.',
      'Absence of injury does not exclude assault — record that explicitly.',
    ],
    related: ['contraception', 'lrn-sti', 'mtp-act', 'lrn-abortion-care',
        'lrn-hiv-pptct'],
    sources: [
      'MoHFW Guidelines and Protocols: Medico-legal Care for Survivors and '
          'Victims of Sexual Violence, Government of India.',
      'Code of Criminal Procedure section 357C; Criminal Law (Amendment) Act '
          '2013; Protection of Children from Sexual Offences Act 2012.',
      'NACO guidelines on HIV post-exposure prophylaxis.',
      'WHO clinical management of rape and intimate partner violence '
          'survivors, 2019.',
    ],
  ),
  LearningTopic(
    id: 'lrn-fgm',
    title: 'Female genital mutilation',
    subtitle: 'Classification, complications, and deinfibulation',
    category: LearningCategory.sexualHealth,
    competency: 'OG 23.2',
    summary: 'Partial or total removal of the external genitalia for '
        'non-medical reasons. It has no health benefit, causes lifelong '
        'harm, and the clinician\'s role is recognition, respectful care and '
        'deinfibulation where indicated.',
    sections: [
      LearningSection('WHO classification', [
        'TYPE I — clitoridectomy: removal of the clitoral glans or prepuce.',
        'TYPE II — excision: removal of the clitoral glans and labia minora, '
            'with or without the labia majora.',
        'TYPE III — infibulation: narrowing of the vaginal opening by '
            'creating a covering seal, with or without removal of the '
            'clitoris. This is the type with the greatest obstetric '
            'consequence.',
        'TYPE IV — all other harmful procedures including pricking, '
            'piercing, incising, scraping and cauterisation.',
      ]),
      LearningSection('Complications', [
        'IMMEDIATE — haemorrhage, severe pain, shock, infection, tetanus, '
            'urinary retention, and death.',
        'GENITOURINARY — recurrent urinary infection, obstructed flow, '
            'calculus formation, dysuria.',
        'GYNAECOLOGICAL — haematocolpos, dysmenorrhoea, keloid and epidermoid '
            'inclusion cysts, apareunia and dyspareunia.',
        'OBSTETRIC — obstructed second stage, extensive perineal tearing, '
            'anterior tears, postpartum haemorrhage, and fistula.',
        'PSYCHOLOGICAL — post-traumatic stress, anxiety, depression, and '
            'sexual dysfunction.',
      ]),
      LearningSection('Antenatal and intrapartum care', [
        'Ask sensitively and without judgement; use neutral language and, '
            'where she prefers it, her own term for the practice.',
        'Examine and classify the type, and document it.',
        'Discuss DEINFIBULATION for type III — it can be performed '
            'antenatally, ideally in the second trimester, in the first stage '
            'of labour, or at delivery. Antenatal is generally preferable '
            'because it can be planned.',
        'Use a professional interpreter, never a family member.',
        'Anterior episiotomy may be required in addition to, or instead of, a '
            'posterior one.',
        'Anticipate difficult catheterisation and difficult vaginal '
            'examination.',
        'RE-INFIBULATION AFTER DELIVERY MUST NOT BE PERFORMED. It is a '
            'further act of mutilation.',
      ]),
      LearningSection('Legal and safeguarding position', [
        'FGM is not a lawful medical procedure anywhere, and medicalisation '
            '— performing it in a clinical setting — is explicitly opposed by '
            'WHO and by every professional body.',
        'It is prohibited by law in many countries; where no specific statute '
            'exists, it is prosecutable as grievous hurt or under child '
            'protection law.',
        'In India the practice occurs in some communities, and it is '
            'addressed under general criminal law and the POCSO Act where a '
            'child is involved.',
        'Consider risk to daughters and other children in the family, and '
            'follow local safeguarding procedures.',
        'Never perform, never re-infibulate, and never refer for it.',
      ]),
    ],
    keyPoints: [
      'Type III infibulation carries the greatest obstetric risk.',
      'Deinfibulation is best planned antenatally, in the second trimester.',
      'Re-infibulation after delivery must never be performed.',
      'Use a professional interpreter, never a family member.',
      'Consider risk to other children in the family.',
    ],
    related: [
      'proc-perineal-repair',
      'vulval-disorders',
      'urogynaecology',
      'anat-perineum',
    ],
    sources: [
      'WHO guidelines on the management of health complications from female '
          'genital mutilation, 2016; WHO classification of FGM.',
      'RCOG Green-top Guideline 53 — Female Genital Mutilation and its '
          'Management.',
      'Protection of Children from Sexual Offences Act 2012, India; Indian '
          'Penal Code provisions on grievous hurt.',
      'National Medical Commission postgraduate curriculum.',
    ],
  ),
];
