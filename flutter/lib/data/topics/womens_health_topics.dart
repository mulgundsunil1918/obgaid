import '../../models/topic.dart';

const kContraceptionTopic = ClinicalTopic(
  id: 'contraception',
  name: 'Contraception',
  subtitle: 'Methods · WHO MEC · missed pills · emergency',
  headline: 'Effectiveness in the clinic is not effectiveness in the leaflet. '
      'The combined pill fails in about 7 women per 100 per year in typical '
      'use and 0.3 in perfect use; an implant fails in 0.1 either way, because '
      'there is nothing to forget.',
  keyFacts: [
    ('Implant', '0.1% typical failure'),
    ('LNG-IUS', '0.1 – 0.4%'),
    ('Copper IUD', '0.8% typical'),
    ('Injectable (DMPA)', '4% typical'),
    ('Combined pill', '7% typical, 0.3% perfect'),
    ('Male condom', '13% typical, 2% perfect'),
    ('Vasectomy', '0.15%'),
    ('Female sterilisation', '0.5%'),
  ],
  sections: [
    TopicSection('WHO Medical Eligibility Criteria', [
      TopicPoint('CATEGORY 1 — no restriction'),
      TopicPoint('CATEGORY 2 — advantages generally outweigh risks; use it'),
      TopicPoint('CATEGORY 3 — risks usually outweigh advantages; use only if '
          'nothing better is available, and with follow-up', critical: true),
      TopicPoint('CATEGORY 4 — unacceptable health risk; do not use',
          critical: true),
      TopicPoint('Category 4 for the combined pill includes: migraine with '
          'aura at any age; blood pressure 160/100 or above; current or past '
          'venous thromboembolism; known thrombogenic mutation; current breast '
          'cancer; severe cirrhosis or liver tumour; major surgery with '
          'prolonged immobilisation; smoking 15 or more a day at age 35 or '
          'over; ischaemic heart disease or stroke.', critical: true),
      TopicPoint('Breastfeeding under 6 weeks postpartum is category 4 for the '
          'combined pill'),
    ]),
    TopicSection('Long-acting reversible methods', [
      TopicPoint('ETONOGESTREL IMPLANT — 3 years, the most effective '
          'reversible method. Irregular bleeding is the commonest reason for '
          'removal; warn about it at insertion.', critical: true),
      TopicPoint('LEVONORGESTREL IUS — 5–8 years depending on device. Reduces '
          'menstrual loss by around 90%; also treats heavy bleeding, '
          'adenomyosis and endometrial hyperplasia, and provides endometrial '
          'protection with menopausal hormone therapy.'),
      TopicPoint('COPPER IUD — 5–10 years, hormone-free. Makes periods heavier '
          'and more painful.'),
      TopicPoint('Expulsion risk is highest in the first three months, and '
          'higher with immediate postpartum insertion'),
      TopicPoint('Perforation risk about 1–2 per 1000, higher in breastfeeding '
          'women'),
      TopicPoint('Exclude pregnancy and sexually transmitted infection before '
          'insertion'),
    ]),
    TopicSection('Short-acting methods', [
      TopicPoint('COMBINED ORAL CONTRACEPTIVE — 21/7, 24/4, or continuous. '
          'Continuous or extended use avoids withdrawal symptoms and is '
          'perfectly safe.'),
      TopicPoint('PROGESTOGEN-ONLY PILL — desogestrel inhibits ovulation and '
          'has a 12-hour window; traditional progestogen-only pills have a '
          '3-hour window.', critical: true),
      TopicPoint('DMPA INJECTABLE — every 12–13 weeks. Delays return of '
          'fertility by up to a year, and causes reversible bone density loss.',
          detail: 'Delivered in India through the Antara programme.'),
      TopicPoint('CENTCHROMAN (ormeloxifene) — a non-steroidal weekly '
          'contraceptive available in India as Chhaya',
          critical: true,
          detail: '30 mg twice weekly for 12 weeks, then weekly. Non-hormonal, '
              'so it suits women who cannot take oestrogen. Delayed or absent '
              'periods are common and expected. This method exists in almost '
              'no other national programme.'),
      TopicPoint('CONDOMS — the only method that also prevents sexually '
          'transmitted infection'),
    ]),
    TopicSection('Missed combined pills', [
      TopicPoint('ONE pill missed, under 48 hours since the last: take it now, '
          'continue as usual, no extra precautions needed'),
      TopicPoint('TWO OR MORE missed, 48 hours or more: take the most recent '
          'pill, continue, and use condoms for 7 days', critical: true),
      TopicPoint('Missed in WEEK 1 with unprotected sex in the previous 7 days '
          '— consider emergency contraception', critical: true),
      TopicPoint('Missed in WEEK 3 — omit the pill-free interval and run '
          'straight into the next packet'),
      TopicPoint('Vomiting within 2 hours, or severe diarrhoea, counts as a '
          'missed pill'),
    ]),
    TopicSection('Emergency contraception', [
      TopicPoint('COPPER IUD is the most effective — over 99% — within 120 '
          'hours of unprotected sex, or up to 5 days after the earliest '
          'expected ovulation', critical: true,
          detail: 'It also provides ongoing contraception, and is the only '
              'method whose efficacy is unaffected by weight.'),
      TopicPoint('ULIPRISTAL 30 mg within 120 hours. More effective than '
          'levonorgestrel.',
          detail: 'Avoid if she has used hormonal contraception in the past 7 '
              'days, and delay restarting it for 5 days afterwards.'),
      TopicPoint('LEVONORGESTREL 1.5 mg within 72 hours, with reduced efficacy '
          'to 96 hours'),
      TopicPoint('Double the levonorgestrel dose to 3 mg if BMI is above 26 or '
          'weight above 70 kg', critical: true),
      TopicPoint('Emergency contraception does not work once ovulation has '
          'occurred — it delays ovulation rather than preventing implantation',
          critical: true),
      TopicPoint('Offer ongoing contraception at the same visit; a pregnancy '
          'test in 3 weeks if the next period is late or unusually light'),
    ]),
    TopicSection('Postpartum and breastfeeding', [
      TopicPoint('Contraception is needed from day 21 in women who are not '
          'breastfeeding'),
      TopicPoint('Progestogen-only pill and implant can start at any time, '
          'including immediately after birth, in breastfeeding women'),
      TopicPoint('Combined pill: avoid before 6 weeks if breastfeeding; before '
          '3 weeks in anyone, because of venous thromboembolism risk',
          critical: true),
      TopicPoint('Intrauterine device: within 48 hours of birth, or after 4 '
          'weeks',
          detail: 'Postpartum IUCD insertion is a major plank of the Indian '
              'family planning programme.'),
      TopicPoint('Lactational amenorrhoea is 98% effective only if all three '
          'hold: under 6 months, fully breastfeeding, and amenorrhoeic',
          critical: true),
    ]),
    TopicSection('Permanent methods', [
      TopicPoint('Female sterilisation — laparoscopic or minilaparotomy; '
          'failure about 1 in 200 lifetime'),
      TopicPoint('Salpingectomy rather than tubal occlusion where acceptable, '
          'as it also reduces ovarian cancer risk', critical: true),
      TopicPoint('Vasectomy is safer, simpler and more effective than female '
          'sterilisation, and remains markedly under-used in India',
          critical: true),
      TopicPoint('Vasectomy needs a post-procedure semen analysis before it is '
          'relied upon'),
      TopicPoint('Counsel about permanence and about regret, which is highest '
          'in women sterilised young or at the time of a caesarean'),
      TopicPoint('Document consent carefully; sterilisation consent is '
          'governed by specific standards in India', critical: true),
    ]),
    TopicSection('Drug interactions', [
      TopicPoint('Enzyme-inducing drugs reduce the efficacy of oral, patch, '
          'ring and implant methods', critical: true,
          detail: 'Rifampicin and rifabutin, carbamazepine, phenytoin, '
              'phenobarbital, topiramate, some antiretrovirals, and St John\'s '
              'wort.'),
      TopicPoint('Intrauterine methods and DMPA are unaffected — they are the '
          'right choice alongside enzyme inducers', critical: true),
      TopicPoint('Rifampicin affects contraception for 28 days after stopping'),
      TopicPoint('Lamotrigine levels fall on the combined pill, and rise in '
          'the pill-free week'),
      TopicPoint('Broad-spectrum antibiotics that are not enzyme inducers do '
          'NOT reduce efficacy', critical: true),
    ]),
  ],
  sources: [
    'WHO Medical Eligibility Criteria for Contraceptive Use, 5th edition.',
    'FSRH UK Medical Eligibility Criteria and method-specific guidance.',
    'Ministry of Health & Family Welfare, Government of India — Family '
        'Planning reference manuals; Antara and Chhaya programme guidelines.',
    'Trussell J. Contraceptive failure in the United States. Contraception '
        '2011;83:397–404.',
    'FOGSI GCPR — Contraception.',
  ],
);

const kMenopauseTopic = ClinicalTopic(
  id: 'menopause',
  name: 'Menopause',
  subtitle: 'Diagnosis · MHT · premature ovarian insufficiency',
  headline: 'In a woman over 45 with typical symptoms, menopause is a clinical '
      'diagnosis and FSH adds nothing. Below 40 the question is entirely '
      'different — that is premature ovarian insufficiency, and hormone '
      'therapy there is replacement rather than treatment.',
  keyFacts: [
    ('Definition', '12 months of amenorrhoea'),
    ('Median age, India', '~46 – 47 years, earlier than in the West'),
    ('POI', 'Before 40, with FSH > 25 IU/L on two occasions 4 weeks apart'),
    ('Over 45 with typical symptoms', 'No FSH needed'),
    ('Uterus present', 'Oestrogen MUST be opposed by a progestogen'),
    ('Window of opportunity', 'Start under 60, or within 10 years of menopause'),
    ('POI — continue MHT until', 'At least the average age of menopause'),
  ],
  sections: [
    TopicSection('Diagnosis', [
      TopicPoint('Over 45 with vasomotor symptoms and irregular periods — '
          'diagnose clinically', critical: true),
      TopicPoint('measure FSH in a woman over 45', avoid: true,
          detail: 'It fluctuates wildly in the perimenopause and a normal '
              'result misleads.'),
      TopicPoint('Aged 40–45: FSH may help where the picture is atypical'),
      TopicPoint('Under 40: FSH above 25 IU/L on two occasions at least four '
          'weeks apart establishes premature ovarian insufficiency',
          critical: true),
      TopicPoint('FSH is uninterpretable while on combined hormonal '
          'contraception'),
      TopicPoint('Investigate POI properly — karyotype, fragile X premutation, '
          'adrenal and thyroid antibodies', critical: true),
    ]),
    TopicSection('Symptoms', [
      TopicPoint('Vasomotor — hot flushes and night sweats, in around 75%'),
      TopicPoint('Sleep disturbance, often the most disabling'),
      TopicPoint('Mood change, anxiety, low mood; brain fog and memory '
          'complaints'),
      TopicPoint('Genitourinary syndrome of menopause — vaginal dryness, '
          'soreness, dyspareunia, urinary urgency and recurrent infection',
          critical: true,
          detail: 'Unlike vasomotor symptoms, this does not improve with time. '
              'It progresses, and it needs treating indefinitely.'),
      TopicPoint('Reduced libido'),
      TopicPoint('Joint and muscle aches; skin and hair change'),
    ]),
    TopicSection('Menopausal hormone therapy — the essentials', [
      TopicPoint('Oestrogen alone only if she has had a hysterectomy',
          critical: true),
      TopicPoint('Oestrogen PLUS a progestogen if the uterus is present — '
          'unopposed oestrogen causes endometrial hyperplasia and carcinoma',
          critical: true),
      TopicPoint('Sequential regimen in the perimenopause; continuous combined '
          'once more than a year past the last period'),
      TopicPoint('TRANSDERMAL oestrogen carries no excess venous '
          'thromboembolism risk, unlike oral', critical: true,
          detail: 'Preferred with obesity, migraine, hypertriglyceridaemia, '
              'gallbladder disease, or any VTE risk factor.'),
      TopicPoint('Micronised progesterone appears to carry a lower breast '
          'cancer risk than synthetic progestogens'),
      TopicPoint('A levonorgestrel intrauterine system provides endometrial '
          'protection and contraception at once'),
      TopicPoint('Testosterone may be added for persistent low sexual desire '
          'once oestrogen is optimised'),
    ]),
    TopicSection('Risks and benefits — what to actually say', [
      TopicPoint('Breast cancer: combined therapy carries a small increased '
          'risk that rises with duration — roughly one extra case per 1000 '
          'women per year of use', critical: true,
          detail: 'Oestrogen-only therapy carries little or no increase. For '
              'context, the excess is comparable to that from obesity or from '
              'drinking two units of alcohol a day.'),
      TopicPoint('Venous thromboembolism: increased with oral, not with '
          'transdermal'),
      TopicPoint('Stroke: small increase with oral oestrogen; not with '
          'transdermal at standard dose'),
      TopicPoint('Coronary disease: no increase, and probably a reduction, '
          'when started under 60 or within 10 years of menopause',
          critical: true),
      TopicPoint('Bone: substantial reduction in fracture, which persists '
          'while she takes it'),
      TopicPoint('There is no arbitrary time limit on duration. Review '
          'annually and let her decide.', critical: true),
    ]),
    TopicSection('Contraindications', [
      TopicPoint('Current, past or suspected breast cancer', critical: true),
      TopicPoint('Known or suspected oestrogen-dependent malignancy'),
      TopicPoint('Undiagnosed abnormal vaginal bleeding — investigate first',
          critical: true),
      TopicPoint('Untreated endometrial hyperplasia'),
      TopicPoint('Active or recent venous thromboembolism, unless '
          'anticoagulated'),
      TopicPoint('Active arterial thromboembolic disease — angina, myocardial '
          'infarction, stroke'),
      TopicPoint('Active liver disease with deranged function'),
      TopicPoint('Untreated thrombophilia'),
    ]),
    TopicSection('Non-hormonal options', [
      TopicPoint('SSRIs and SNRIs — venlafaxine, escitalopram, paroxetine'),
      TopicPoint('give paroxetine or fluoxetine to a woman on tamoxifen',
          avoid: true,
          detail: 'They inhibit CYP2D6 and reduce conversion of tamoxifen to '
              'its active metabolite.'),
      TopicPoint('Gabapentin, particularly for night-time flushes'),
      TopicPoint('Clonidine — modest benefit, poorly tolerated'),
      TopicPoint('Fezolinetant, a neurokinin-3 receptor antagonist, where '
          'available'),
      TopicPoint('Cognitive behavioural therapy has good evidence for flushes, '
          'sleep and mood'),
      TopicPoint('advise against MHT purely because she had breast cancer '
          'without discussing vaginal oestrogen separately', avoid: true),
    ]),
    TopicSection('Genitourinary syndrome — treat it separately', [
      TopicPoint('Vaginal oestrogen is effective, safe long-term, and has '
          'minimal systemic absorption', critical: true),
      TopicPoint('It does NOT require a progestogen, whatever the uterine '
          'status', critical: true),
      TopicPoint('It can be used alongside systemic MHT'),
      TopicPoint('It may be used after breast cancer, after discussion with '
          'the oncologist — including in most women on aromatase inhibitors'),
      TopicPoint('Vaginal DHEA (prasterone) and oral ospemifene are '
          'alternatives'),
      TopicPoint('Non-hormonal moisturisers and lubricants help but do not '
          'reverse atrophy'),
      TopicPoint('Symptoms return within weeks of stopping — this is '
          'long-term treatment', critical: true),
    ]),
    TopicSection('Premature ovarian insufficiency', [
      TopicPoint('Hormone therapy until at least the average age of menopause '
          '— this is replacement, not optional symptom relief', critical: true),
      TopicPoint('The risk-benefit calculation from trials in women over 50 '
          'does not apply', critical: true),
      TopicPoint('Either MHT or a combined oral contraceptive; MHT is '
          'generally preferred for bone'),
      TopicPoint('Bone density assessment and adequate calcium and vitamin D'),
      TopicPoint('Cardiovascular risk assessment'),
      TopicPoint('Spontaneous pregnancy occurs in about 5% — discuss '
          'contraception if pregnancy is not wanted', critical: true),
      TopicPoint('Fertility counselling and psychological support; the '
          'diagnosis is often devastating and is frequently delivered badly'),
    ]),
  ],
  sources: [
    'NICE NG23 — Menopause: diagnosis and management.',
    'British Menopause Society consensus statements.',
    'ESHRE Guideline: Management of Women with Premature Ovarian '
        'Insufficiency.',
    'The 2022 Hormone Therapy Position Statement of The North American '
        'Menopause Society.',
    'Indian Menopause Society — clinical practice recommendations.',
  ],
);

const kUrogynaeTopic = ClinicalTopic(
  id: 'urogynaecology',
  name: 'Urogynaecology',
  subtitle: 'Incontinence · prolapse · POP-Q · fistula',
  headline: 'Supervised pelvic floor muscle training for at least three months '
      'is first-line for stress incontinence and for prolapse, and it works. '
      'Surgery offered before it has been properly tried is surgery offered '
      'too early.',
  keyFacts: [
    ('POP-Q stage 0', 'No prolapse'),
    ('Stage I', 'Leading edge > 1 cm above the hymen'),
    ('Stage II', 'Within 1 cm above or below the hymen'),
    ('Stage III', '> 1 cm below the hymen, not fully everted'),
    ('Stage IV', 'Complete eversion'),
    ('Abnormal post-void residual', '> 100 – 150 mL'),
    ('Pelvic floor training', 'Supervised, ≥ 3 months, first line'),
    ('Recurrent UTI', '≥ 2 in 6 months, or ≥ 3 in 12'),
  ],
  sections: [
    TopicSection('POP-Q in practice', [
      TopicPoint('Six points measured relative to the hymen: Aa and Ba '
          'anteriorly, C and D apically, Bp and Ap posteriorly'),
      TopicPoint('Plus genital hiatus, perineal body and total vaginal length'),
      TopicPoint('Negative numbers are above the hymen, positive below it'),
      TopicPoint('Point D is omitted after hysterectomy'),
      TopicPoint('Measure at maximum Valsalva, with the prolapse at its '
          'fullest descent', critical: true),
      TopicPoint('Stage does not correlate well with symptoms — a stage II '
          'prolapse may be highly symptomatic and a stage III barely noticed',
          critical: true),
    ]),
    TopicSection('Types of incontinence', [
      TopicPoint('STRESS — leakage on cough, sneeze, laugh or exertion. '
          'Urethral sphincter or support failure.'),
      TopicPoint('URGENCY — leakage preceded by a sudden compelling need. '
          'Detrusor overactivity.'),
      TopicPoint('MIXED — both. Treat the more bothersome component first.',
          critical: true),
      TopicPoint('OVERFLOW — chronic retention with dribbling. Check the '
          'post-void residual before assuming anything else.', critical: true),
      TopicPoint('CONTINUOUS leakage suggests a fistula until proven '
          'otherwise', critical: true),
    ]),
    TopicSection('Assessment', [
      TopicPoint('History, including obstetric history, and the effect on her '
          'life'),
      TopicPoint('Examination: prolapse assessment, cough stress test, pelvic '
          'floor contraction strength'),
      TopicPoint('Three-day bladder diary — fluid intake, voids, volumes, '
          'leakage episodes', critical: true),
      TopicPoint('Urinalysis and culture to exclude infection'),
      TopicPoint('Post-void residual by bladder scan'),
      TopicPoint('Validated symptom questionnaires — ICIQ-UI, ICIQ-OAB, '
          'POP-SS'),
      TopicPoint('Urodynamics only where surgery is planned or the diagnosis '
          'is unclear — not routinely before conservative treatment',
          critical: true),
    ]),
    TopicSection('Stress incontinence', [
      TopicPoint('Supervised pelvic floor muscle training, at least eight '
          'contractions three times daily, for a minimum of three months',
          critical: true),
      TopicPoint('Weight loss where BMI is above 30; treat constipation and '
          'chronic cough; reduce caffeine'),
      TopicPoint('Duloxetine as second-line where surgery is declined — poorly '
          'tolerated, with high discontinuation'),
      TopicPoint('Mid-urethral sling — effective, but synthetic mesh is '
          'restricted or paused in several countries; counsel explicitly and '
          'document', critical: true),
      TopicPoint('Colposuspension and autologous fascial sling as '
          'mesh-free alternatives'),
      TopicPoint('Urethral bulking agents — less effective, less invasive, '
          'repeatable'),
    ]),
    TopicSection('Overactive bladder and urgency incontinence', [
      TopicPoint('Bladder training for at least six weeks'),
      TopicPoint('Reduce caffeine; adjust fluid intake, neither restricting '
          'severely nor overloading'),
      TopicPoint('Antimuscarinics — solifenacin, tolterodine, darifenacin'),
      TopicPoint('give antimuscarinics to a frail older woman without '
          'weighing anticholinergic burden', avoid: true,
          detail: 'They worsen cognition and are associated with dementia risk '
              'in long-term use.'),
      TopicPoint('MIRABEGRON, a beta-3 agonist, is preferred in older and '
          'frail women — but monitor blood pressure', critical: true),
      TopicPoint('Vaginal oestrogen for postmenopausal women; it helps urgency '
          'as well as dryness'),
      TopicPoint('Botulinum toxin, percutaneous tibial nerve stimulation, or '
          'sacral neuromodulation for refractory symptoms',
          detail: 'Warn that botulinum toxin may require clean intermittent '
              'self-catheterisation.'),
    ]),
    TopicSection('Pelvic organ prolapse', [
      TopicPoint('Asymptomatic prolapse needs no treatment', critical: true),
      TopicPoint('Pelvic floor muscle training for symptomatic stage I–II'),
      TopicPoint('Vaginal pessary — ring, shelf or Gellhorn. Effective, '
          'reversible, and appropriate at any age.',
          detail: 'Review every 4–6 months; use vaginal oestrogen alongside to '
              'prevent erosion.'),
      TopicPoint('Surgery: anterior or posterior colporrhaphy; vaginal '
          'hysterectomy; sacrospinous fixation; sacrocolpopexy for vault '
          'prolapse'),
      TopicPoint('Uterine-preserving surgery is an option where she wishes to '
          'keep the uterus'),
      TopicPoint('Occult stress incontinence may be unmasked after prolapse '
          'repair — warn her beforehand', critical: true),
    ]),
    TopicSection('Recurrent urinary tract infection', [
      TopicPoint('Two or more in six months, or three or more in twelve'),
      TopicPoint('Confirm with culture; exclude a residual, stones and a '
          'fistula'),
      TopicPoint('Vaginal oestrogen in postmenopausal women — one of the most '
          'effective interventions available', critical: true),
      TopicPoint('Behavioural measures: fluid intake, voiding after '
          'intercourse'),
      TopicPoint('Methenamine hippurate as an antibiotic-sparing option'),
      TopicPoint('Antibiotic prophylaxis — continuous or post-coital — where '
          'other measures fail'),
      TopicPoint('D-mannose and cranberry have weak evidence; they are not a '
          'substitute for assessment'),
    ]),
    TopicSection('Obstetric fistula', [
      TopicPoint('Almost always the consequence of prolonged obstructed '
          'labour, and therefore almost always preventable', critical: true),
      TopicPoint('Continuous, uncontrollable urinary or faecal leakage after '
          'birth'),
      TopicPoint('Vesicovaginal is commonest; rectovaginal and ureterovaginal '
          'also occur'),
      TopicPoint('Confirm with examination and a dye test; assess for '
          'associated injuries — foot drop, amenorrhoea, vaginal stenosis'),
      TopicPoint('Refer to a specialist fistula centre; repair is usually '
          'delayed around three months to allow inflammation to settle'),
      TopicPoint('Prolonged catheter drainage alone heals a proportion of '
          'small, early fistulae'),
      TopicPoint('The social consequences — abandonment, isolation, loss of '
          'livelihood — are often greater than the physical ones, and need '
          'addressing alongside', critical: true),
      TopicPoint('Prevention is timely access to caesarean, which is where the '
          'effort belongs'),
    ]),
  ],
  sources: [
    'NICE NG123 — Urinary incontinence and pelvic organ prolapse in women.',
    'Bump RC et al. The standardization of terminology of female pelvic organ '
        'prolapse and pelvic floor dysfunction. Am J Obstet Gynecol '
        '1996;175:10–17.',
    'IUGA/ICS joint report on the terminology for female pelvic floor '
        'dysfunction.',
    'WHO — Obstetric fistula: guiding principles for clinical management.',
    'FOGSI GCPR — Urogynaecology.',
  ],
);
