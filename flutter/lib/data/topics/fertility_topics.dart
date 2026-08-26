import '../../models/topic.dart';

const kInfertilityTopic = ClinicalTopic(
  id: 'infertility',
  name: 'Infertility',
  subtitle: 'Evaluation · ovarian reserve · WHO 2021 semen criteria',
  headline: 'Investigate both partners from the start. Male factor contributes '
      'to about half of all cases, and a semen analysis is faster, cheaper and '
      'less invasive than anything asked of the woman — yet it is routinely '
      'the last test ordered.',
  keyFacts: [
    ('Definition', '12 months of regular unprotected intercourse'),
    ('Investigate at 6 months if', 'Woman over 35, or a known cause'),
    ('Ovulation confirmed by', 'Mid-luteal progesterone > 30 nmol/L (10 ng/mL)'),
    ('Low ovarian reserve — AMH', '< 5.4 pmol/L (0.76 ng/mL)'),
    ('Low ovarian reserve — AFC', '≤ 4'),
    ('Semen concentration (WHO 2021)', '≥ 16 million/mL'),
    ('Progressive motility', '≥ 30%'),
    ('Normal morphology', '≥ 4%'),
  ],
  sections: [
    TopicSection('Definition and when to start', [
      TopicPoint('Failure to conceive after 12 months of regular unprotected '
          'intercourse — two to three times a week'),
      TopicPoint('Investigate after 6 months where the woman is over 35',
          critical: true),
      TopicPoint('Investigate immediately where there is a known cause: '
          'amenorrhoea, previous pelvic inflammatory disease, known tubal '
          'disease, undescended testes, previous chemotherapy'),
      TopicPoint('Primary — never conceived. Secondary — a previous pregnancy '
          'of any outcome.'),
      TopicPoint('investigate the woman alone', avoid: true,
          detail: 'Male factor is present in roughly half of couples, alone or '
              'in combination.'),
    ]),
    TopicSection('History that changes management', [
      TopicPoint('Duration, and coital frequency and timing — a surprising '
          'proportion of "infertility" is mistimed or infrequent intercourse',
          critical: true),
      TopicPoint('Menstrual history: regularity, flow, dysmenorrhoea'),
      TopicPoint('Previous pregnancies and their outcomes'),
      TopicPoint('Pelvic infection, sexually transmitted infection, previous '
          'pelvic or abdominal surgery'),
      TopicPoint('Medical conditions, medications, smoking, alcohol, weight'),
      TopicPoint('Male: previous paternity, testicular maldescent, torsion, '
          'mumps orchitis, hernia repair, chemotherapy, anabolic steroid use, '
          'heat exposure', critical: true),
      TopicPoint('Anabolic steroids and exogenous testosterone suppress '
          'spermatogenesis and are frequently not volunteered — ask directly',
          critical: true),
    ]),
    TopicSection('Confirming ovulation', [
      TopicPoint('Mid-luteal progesterone, taken 7 days before the expected '
          'period — day 21 in a 28-day cycle, later in a longer one'),
      TopicPoint('Above 30 nmol/L (10 ng/mL) confirms ovulation'),
      TopicPoint('A regular cycle with premenstrual symptoms is itself good '
          'evidence of ovulation'),
      TopicPoint('rely on basal body temperature charting', avoid: true,
          detail: 'It is retrospective, stressful and unreliable.'),
      TopicPoint('Investigate anovulation: TSH, prolactin, androgens, FSH, LH '
          'and a PCOS assessment'),
    ]),
    TopicSection('Ovarian reserve', [
      TopicPoint('ANTI-MÜLLERIAN HORMONE — cycle-independent, the most '
          'reliable single marker', critical: true,
          detail: 'Low below 5.4 pmol/L (0.76 ng/mL); high above 25 pmol/L '
              '(3.5 ng/mL), which flags hyperstimulation risk.'),
      TopicPoint('ANTRAL FOLLICLE COUNT — 2–10 mm follicles across both '
          'ovaries, days 2–5. Low at 4 or fewer; high above 16.'),
      TopicPoint('FSH and oestradiol on days 2–5 — FSH above 8.9 IU/L suggests '
          'reduced reserve; a raised oestradiol can falsely normalise an FSH'),
      TopicPoint('Reserve predicts the response to stimulation, not the '
          'chance of natural conception', critical: true,
          detail: 'A low AMH in a woman of 30 does not mean she cannot '
              'conceive. It means she will yield fewer eggs in IVF.'),
      TopicPoint('POSEIDON criteria classify poor responders by age and by '
          'prior response, which guides protocol choice'),
    ]),
    TopicSection('Tubal and uterine assessment', [
      TopicPoint('HYSTEROSALPINGOGRAPHY where there is no suspicion of '
          'comorbidity — it is also therapeutic, with a modest rise in '
          'conception in the months afterwards'),
      TopicPoint('HyCoSy as a radiation-free alternative'),
      TopicPoint('LAPAROSCOPY AND DYE where endometriosis or adhesions are '
          'suspected — it allows treatment at the same sitting',
          critical: true),
      TopicPoint('Transvaginal ultrasound for uterine anomaly, fibroids, '
          'endometrioma and hydrosalpinx'),
      TopicPoint('Saline infusion sonography or hysteroscopy for the cavity'),
      TopicPoint('Hydrosalpinx halves IVF success — salpingectomy or proximal '
          'occlusion before treatment restores it', critical: true),
      TopicPoint('Screen for chlamydia before any uterine instrumentation'),
    ]),
    TopicSection('Semen analysis — WHO 2021 (6th edition) lower limits', [
      TopicPoint('Semen volume ≥ 1.4 mL'),
      TopicPoint('Sperm concentration ≥ 16 million per mL'),
      TopicPoint('Total sperm number ≥ 39 million per ejaculate'),
      TopicPoint('Total motility ≥ 42%'),
      TopicPoint('Progressive motility ≥ 30%'),
      TopicPoint('Normal morphology ≥ 4%'),
      TopicPoint('Vitality ≥ 54%'),
      TopicPoint('These are 5th centile values from fertile men, not a '
          'threshold between fertile and infertile', critical: true),
      TopicPoint('Abstinence of 2–7 days; repeat an abnormal result after 3 '
          'months, because a spermatogenic cycle takes about 72 days',
          critical: true),
    ]),
    TopicSection('Investigating the abnormal semen analysis', [
      TopicPoint('AZOOSPERMIA — distinguish obstructive from '
          'non-obstructive', critical: true,
          detail: 'FSH, LH and testosterone; testicular volume; a normal FSH '
              'with normal testes suggests obstruction.'),
      TopicPoint('Karyotype and Y-chromosome microdeletion testing in severe '
          'oligozoospermia or non-obstructive azoospermia'),
      TopicPoint('Cystic fibrosis gene testing where the vas deferens is '
          'absent', critical: true),
      TopicPoint('Scrotal ultrasound for varicocele, and transrectal '
          'ultrasound for ejaculatory duct obstruction'),
      TopicPoint('Surgical sperm retrieval — TESA, TESE, micro-TESE — with '
          'ICSI'),
      TopicPoint('Correct reversible causes: stop anabolic steroids, treat '
          'infection, address obesity, heat and smoking'),
    ]),
    TopicSection('Lifestyle — the part that is free', [
      TopicPoint('Weight: both extremes reduce fertility. A BMI above 30 '
          'reduces conception and worsens IVF outcomes.', critical: true),
      TopicPoint('Smoking reduces fertility in both partners and accelerates '
          'ovarian ageing'),
      TopicPoint('Alcohol: limit in both partners'),
      TopicPoint('Folic acid 400 µg daily, or 5 mg where BMI is above 30, '
          'diabetes, epilepsy on medication, or a previous neural tube defect',
          critical: true),
      TopicPoint('Rubella immunity check, and vaccinate before conception '
          'where non-immune'),
      TopicPoint('Timing: intercourse every 2–3 days covers the fertile window '
          'without the pressure of ovulation prediction'),
    ]),
  ],
  sources: [
    'NICE NG257 — Fertility problems: assessment and treatment (replaced CG156).',
    'WHO Laboratory Manual for the Examination and Processing of Human Semen, '
        '6th edition, 2021.',
    'ESHRE guideline on ovarian stimulation; POSEIDON criteria.',
    'FOGSI GCPR — Infertility.',
  ],
);

const kOhssTopic = ClinicalTopic(
  id: 'ohss',
  name: 'IVF & OHSS',
  subtitle: 'Stimulation · classification · management',
  headline: 'Ovarian hyperstimulation is now largely preventable. An '
      'antagonist protocol with a GnRH agonist trigger and a freeze-all '
      'strategy comes close to eliminating the severe form — and where it does '
      'occur, thromboembolism is what kills, not the ascites.',
  keyFacts: [
    ('Retrieval timing', '34 – 36 hours after trigger'),
    ('High AMH — OHSS risk', '> 3.4 ng/mL'),
    ('High AFC — OHSS risk', '> 24'),
    ('Severe OHSS haematocrit', '> 45%'),
    ('Critical OHSS haematocrit', '> 55%'),
    ('Cabergoline prophylaxis', '0.5 mg daily for 8 days'),
    ('Thromboprophylaxis', 'Mandatory in severe OHSS'),
    ('Early vs late OHSS', 'Before 9 days vs 10 days or more after trigger'),
  ],
  sections: [
    TopicSection('Stimulation protocols', [
      TopicPoint('ANTAGONIST — now the default. Shorter, more flexible, and '
          'permits a GnRH agonist trigger.', critical: true),
      TopicPoint('LONG AGONIST — downregulation from the mid-luteal phase of '
          'the preceding cycle. Still used in endometriosis and in some poor '
          'responders.'),
      TopicPoint('SHORT or FLARE AGONIST — exploits the initial gonadotrophin '
          'surge; used in poor responders.'),
      TopicPoint('Gonadotrophin dose is set by age, AMH, AFC and previous '
          'response — not by a standard starting dose'),
      TopicPoint('Monitor with serial ultrasound and oestradiol'),
    ]),
    TopicSection('Trigger, retrieval and transfer', [
      TopicPoint('hCG trigger 5000–10 000 IU, 34–36 hours before retrieval'),
      TopicPoint('GnRH AGONIST TRIGGER in an antagonist cycle nearly '
          'eliminates severe OHSS', critical: true,
          detail: 'It requires a freeze-all or intensive luteal support, '
              'because the luteal phase is otherwise inadequate.'),
      TopicPoint('Oocyte retrieval transvaginally under ultrasound guidance'),
      TopicPoint('ICSI for male factor or previous fertilisation failure — it '
          'confers no benefit in unexplained infertility', critical: true),
      TopicPoint('Blastocyst (day 5) transfer generally gives higher live '
          'birth rates than cleavage-stage'),
      TopicPoint('SINGLE embryo transfer wherever possible', critical: true,
          detail: 'Multiple pregnancy is the single greatest avoidable risk of '
              'assisted conception, for mother and babies alike.'),
      TopicPoint('Luteal support with vaginal progesterone'),
    ]),
    TopicSection('OHSS risk factors', [
      TopicPoint('Polycystic ovary syndrome', critical: true),
      TopicPoint('Young age and low body mass index'),
      TopicPoint('High AMH — above 3.4 ng/mL'),
      TopicPoint('High antral follicle count — above 24'),
      TopicPoint('Previous OHSS'),
      TopicPoint('Rapidly rising or very high oestradiol'),
      TopicPoint('More than 20–24 follicles, or more than 20 oocytes '
          'retrieved'),
      TopicPoint('hCG trigger, and hCG for luteal support'),
      TopicPoint('Pregnancy — and multiple pregnancy above all — which is why '
          'late OHSS is the more dangerous form', critical: true),
    ]),
    TopicSection('Classification', [
      TopicPoint('MILD — abdominal bloating and mild pain; ovaries under 8 cm'),
      TopicPoint('MODERATE — moderate pain, nausea and vomiting, ascites on '
          'ultrasound; ovaries 8–12 cm'),
      TopicPoint('SEVERE — clinical ascites with or without hydrothorax, '
          'oliguria, haematocrit above 45%, hypoproteinaemia; ovaries over '
          '12 cm', critical: true),
      TopicPoint('CRITICAL — tense ascites or large hydrothorax, haematocrit '
          'above 55%, white cell count above 25 000, oliguria or anuria, '
          'thromboembolism, acute respiratory distress', critical: true),
    ]),
    TopicSection('Prevention', [
      TopicPoint('Antagonist protocol with a GnRH agonist trigger',
          critical: true),
      TopicPoint('Freeze-all, deferring transfer to a later natural or '
          'medicated cycle'),
      TopicPoint('Cabergoline 0.5 mg daily for 8 days from the day of trigger'),
      TopicPoint('Metformin in women with PCOS undergoing stimulation'),
      TopicPoint('Lower starting gonadotrophin dose in high responders'),
      TopicPoint('Coasting, or cycle cancellation, where response is extreme'),
      TopicPoint('use hCG for luteal support in a high responder', avoid: true),
    ]),
    TopicSection('Recognition and assessment', [
      TopicPoint('Abdominal distension and pain after stimulation, with '
          'nausea, vomiting and reduced urine output'),
      TopicPoint('Dyspnoea from ascites or hydrothorax'),
      TopicPoint('Weigh her and measure abdominal girth daily'),
      TopicPoint('Full blood count with haematocrit, urea and electrolytes, '
          'liver function, albumin, coagulation'),
      TopicPoint('Ultrasound for ovarian size and ascites'),
      TopicPoint('Pregnancy test — late OHSS means a conception cycle and a '
          'longer, more severe course', critical: true),
      TopicPoint('perform a pelvic examination on enlarged ovaries',
          avoid: true,
          detail: 'They rupture and they torse. Assess by ultrasound.'),
    ]),
    TopicSection('Management', [
      TopicPoint('MILD to MODERATE — outpatient. Oral fluids to thirst, '
          'paracetamol, daily weight and girth, and clear instructions on when '
          'to return.'),
      TopicPoint('avoid NSAIDs', avoid: true,
          detail: 'Renal perfusion is already compromised.'),
      TopicPoint('SEVERE — admit. Intravenous crystalloid, human albumin where '
          'hypoproteinaemic, strict fluid balance and hourly urine output.',
          critical: true),
      TopicPoint('THROMBOPROPHYLAXIS with low-molecular-weight heparin is '
          'mandatory in severe OHSS', critical: true,
          detail: 'Continue until resolution, and through the first trimester '
              'where she is pregnant. Thrombosis occurs at unusual sites — '
              'jugular and subclavian veins — and is the commonest cause of '
              'death.'),
      TopicPoint('Paracentesis for tense ascites or respiratory compromise — '
          'it relieves symptoms and improves renal perfusion'),
      TopicPoint('give diuretics before restoring intravascular volume',
          avoid: true,
          detail: 'She is haemoconcentrated and intravascularly depleted '
              'despite the ascites.'),
      TopicPoint('Critical care involvement for critical OHSS'),
    ]),
    TopicSection('Admission criteria', [
      TopicPoint('Severe abdominal pain or peritonism'),
      TopicPoint('Intractable nausea and vomiting'),
      TopicPoint('Severe or tense ascites'),
      TopicPoint('Oliguria or anuria'),
      TopicPoint('Haematocrit above 45%'),
      TopicPoint('Hyponatraemia or hyperkalaemia'),
      TopicPoint('Dyspnoea or hypoxia'),
      TopicPoint('Abnormal liver function'),
      TopicPoint('White cell count above 25 000'),
      TopicPoint('Inability to manage at home, or no reliable access to care',
          critical: true),
    ]),
    TopicSection('Fertility preservation', [
      TopicPoint('Oocyte or embryo cryopreservation before gonadotoxic '
          'treatment'),
      TopicPoint('Ovarian tissue cryopreservation where there is no time to '
          'stimulate, or in prepubertal girls'),
      TopicPoint('GnRH agonist during chemotherapy offers some ovarian '
          'protection, but is not a substitute for cryopreservation'),
      TopicPoint('Refer before the first cycle of chemotherapy — delay closes '
          'the option', critical: true),
      TopicPoint('Sperm cryopreservation is quick, cheap and should be offered '
          'to every man before gonadotoxic treatment'),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 5 — The Management of Ovarian Hyperstimulation '
        'Syndrome.',
    'NICE NG257 — Fertility problems (replaced CG156).',
    'ESHRE guideline on ovarian stimulation for IVF/ICSI.',
    'HFEA guidance on multiple births and single embryo transfer.',
    'Indian Society for Assisted Reproduction (ISAR) practice '
        'recommendations; Assisted Reproductive Technology (Regulation) Act '
        '2021, Government of India.',
  ],
);
