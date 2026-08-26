import '../models/counselling.dart';

/// Spec §58 — the remaining twelve counselling checklists.
const kCounsellingGuides3 = <CounsellingGuide>[
  CounsellingGuide(
    id: 'couns-antenatal-care',
    title: 'Antenatal care',
    setting: 'The booking visit, ideally before 12 weeks.',
    cover: [
      'How many visits, when, and what happens at each — she should leave '
          'knowing the shape of the whole pregnancy',
      'Which scans, when, and what each one is looking for',
      'Which blood tests, and that she will be told the results either way',
      'Iron and folic acid: what they are for, and that the tablets often '
          'cause dark stools and constipation, which is expected',
      'Calcium supplementation where dietary intake is low',
      'Tetanus and diphtheria immunisation schedule',
      'Weight, blood pressure and urine at every visit, and why',
      'Where she plans to give birth, and how she will get there',
      'Who to ring, at any hour, and the number written down',
      'Registration for the government schemes she is entitled to — JSY, '
          'PMMVY, PMSMA',
    ],
    saferWording: [
      ('Everything is normal', 'Everything we have checked today is normal — '
          'and here is what we check next time and why'),
      ('Come back in a month', 'Come back on this date. But come sooner, any '
          'time of day or night, if any of these things happen'),
      ('You are anaemic', 'Your blood is low on iron. That is common and it '
          'is treatable, and treating it now protects you at delivery'),
    ],
    redFlags: [
      'Bleeding from the vagina',
      'Severe headache, blurred vision, or flashing lights',
      'Pain in the upper abdomen, especially on the right',
      'Swelling of the face or hands that comes on quickly',
      'Fever',
      'Reduced or changed fetal movements',
      'Fluid leaking from the vagina',
      'Persistent vomiting, or being unable to keep fluids down',
    ],
    pitfalls: [
      'Giving the schedule but never the reason — attendance falls when the '
          'visit feels like a formality',
      'Assuming literacy. Ask how she would like the information, and use the '
          'MCP card',
      'Counselling her alone when the decision-maker at home is someone else. '
          'Ask who else should hear this',
      'Listing red flags so fast that none are remembered. Three she recalls '
          'beat ten she does not',
    ],
    sources: [
      'WHO recommendations on antenatal care for a positive pregnancy '
          'experience, 2016.',
      'MoHFW Guidelines for Pradhan Mantri Surakshit Matritva Abhiyan; '
          'Maternal and Child Protection Card.',
      'NICE NG201 — Antenatal care.',
      'FOGSI GCPR — Antenatal Care.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-nutrition',
    title: 'Nutrition in pregnancy',
    setting: 'Booking, and revisited at each trimester.',
    cover: [
      'An extra serving a day in the second and third trimester, not eating '
          'for two',
      'Protein sources that are actually available to her — dal, egg, milk, '
          'curd, groundnut, soya — rather than a generic list',
      'Iron-rich foods, and that vitamin C with the meal helps absorption '
          'while tea and coffee with the meal hinder it',
      'Iron and folic acid supplementation, and calcium, per the national '
          'schedule',
      'Iodised salt',
      'Food safety: avoid unpasteurised milk, raw or undercooked egg and '
          'meat, and cut fruit left standing',
      'Weight gain appropriate to her starting BMI',
      'No alcohol; no tobacco in any form, including chewed tobacco and '
          'gutkha',
      'That fasting during festivals or Ramadan is her decision, and what to '
          'watch for if she does',
    ],
    saferWording: [
      ('You must eat more', 'One extra meal a day is enough — about a bowl of '
          'dal and rice more than usual'),
      ('Avoid papaya and pineapple', 'There is no good evidence that ordinary '
          'amounts of any common fruit cause miscarriage'),
      ('You are overweight', 'For your build, gaining around this much over '
          'the pregnancy is what we aim for'),
    ],
    redFlags: [
      'Unable to keep any food or fluid down for more than 24 hours',
      'Losing weight rather than gaining',
      'Extreme tiredness or breathlessness, which may be severe anaemia',
      'Pica — craving and eating soil, chalk or ash',
    ],
    pitfalls: [
      'Prescribing a diet she cannot afford or does not eat. Ask what she '
          'actually eats in a day before advising',
      'Ignoring household food hierarchy — in many homes she eats last and '
          'least. Ask',
      'Treating vegetarian diets as deficient rather than planning within '
          'them',
      'Forgetting that hyperemesis is a medical problem, not a dietary one',
    ],
    sources: [
      'ICMR-NIN Dietary Guidelines for Indians, 2024.',
      'MoHFW Anaemia Mukt Bharat operational guidelines; National Iron Plus '
          'Initiative.',
      'WHO antenatal care recommendations — nutritional interventions, 2016.',
      'FOGSI Nutrition in Pregnancy position statement.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-fetal-movements',
    title: 'Fetal movements',
    setting: 'From around 24 weeks, and at every subsequent visit.',
    cover: [
      'That she will come to know her own baby\'s pattern, and that the '
          'pattern is what matters, not a number',
      'That movements do NOT slow down at the end of pregnancy — this is the '
          'single most dangerous myth in obstetrics',
      'That she should ring immediately if the pattern changes, at any hour',
      'That she will be seen and examined, not advised over the telephone',
      'That she will never be thought a nuisance for coming, and that coming '
          'repeatedly is right, not excessive',
      'That an anterior placenta can make movements harder to feel',
    ],
    saferWording: [
      ('Count ten kicks', 'You do not need to count. You need to notice if it '
          'changes from what is usual for your baby'),
      ('Have a cold drink and lie down, then see', 'Please come in now. Do '
          'not wait to see if it improves'),
      ('Babies move less near the due date', 'Your baby should keep moving '
          'right up to labour. Less movement is never normal'),
    ],
    redFlags: [
      'Any reduction from her usual pattern',
      'Any change in the character of the movements',
      'No movements felt at all — come immediately',
      'A second episode after a first that was checked and cleared',
    ],
    pitfalls: [
      'Giving a kick chart instead of an instruction to attend. Formal '
          'counting has not been shown to reduce stillbirth and delays her',
      'Reassuring on the phone with a heart rate someone found at home',
      'Failing to say "come back again" after a normal assessment — recurrent '
          'episodes carry the higher risk',
    ],
    sources: [
      'RCOG Green-top Guideline 57 — Reduced Fetal Movements.',
      "NHS England Saving Babies' Lives Care Bundle.",
      'Norman JE et al. AFFIRM. Lancet 2018;392:1629–1638.',
      'FOGSI GCPR — Antenatal Fetal Surveillance; MoHFW India Newborn Action '
          'Plan.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-labour-preparation',
    title: 'Preparing for labour',
    setting: 'Third trimester, around 34–36 weeks.',
    cover: [
      'How to recognise labour, and how it differs from false pains',
      'When to come in: regular painful contractions, waters breaking, '
          'bleeding, or reduced movements',
      'That waters breaking means coming in even without pain',
      'The birth plan, and that plans change for good reasons',
      'Pain relief options actually available at her place of birth — being '
          'honest about what is and is not on offer',
      'Who may accompany her, and what a birth companion does',
      'What to bring, and what the hospital provides',
      'Skin-to-skin contact and breastfeeding within the first hour',
      'Delayed cord clamping',
      'What happens if a caesarean becomes necessary',
      'Transport arranged in advance, and the number for the ambulance '
          'service',
    ],
    saferWording: [
      ('Come when the pains are 5 minutes apart', 'Come when the pains are '
          'regular and you cannot talk through them — or straight away if '
          'your waters break or you bleed'),
      ('We will see how it goes', 'Here is the plan, and here are the two or '
          'three things that would make us change it'),
      ('You may need a caesarean', 'Most women in your situation give birth '
          'normally. If we do need to operate, this is what happens and this '
          'is why'),
    ],
    redFlags: [
      'Bleeding',
      'Waters breaking, especially if the fluid is green or brown',
      'Reduced fetal movements',
      'Severe headache or visual disturbance',
      'Continuous severe abdominal pain between contractions',
      'Fever',
    ],
    pitfalls: [
      'Promising pain relief the unit does not have',
      'Discussing the birth plan without the person who will bring her in',
      'Skipping the transport conversation — delay in reaching care remains a '
          'leading contributor to maternal death in India',
      'Presenting caesarean as failure',
    ],
    sources: [
      'WHO recommendations: intrapartum care for a positive childbirth '
          'experience, 2018.',
      'NICE NG235 — Intrapartum care.',
      'MoHFW LaQshya guidelines; Janani Shishu Suraksha Karyakram; '
          'Guidelines for Birth Companion during Labour.',
      'FOGSI GCPR — Labour Care.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-hypertension',
    title: 'Chronic hypertension in pregnancy',
    setting: 'Pre-pregnancy where possible, otherwise at booking.',
    cover: [
      'That her blood pressure was high before pregnancy, and this is '
          'different from pre-eclampsia — though it raises the risk of it',
      'Which of her tablets must change: ACE inhibitors, angiotensin receptor '
          'blockers and most diuretics are stopped',
      'Which are used instead — labetalol, nifedipine, methyldopa',
      'That stopping antihypertensives altogether is more dangerous than '
          'taking the right one',
      'Aspirin 150 mg at night from 12 weeks until 36 weeks to reduce '
          'pre-eclampsia',
      'Calcium supplementation where dietary intake is low',
      'More frequent visits, and growth scans',
      'That delivery is usually planned rather than awaited',
      'That her blood pressure needs review after delivery and lifelong '
          'follow-up',
    ],
    saferWording: [
      ('Your BP tablets are unsafe in pregnancy', 'Two of your tablets need '
          'changing to ones we use in pregnancy. We will do that today, and '
          'you should not stop taking anything before then'),
      ('You have high risk pregnancy', 'Your pregnancy needs closer watching '
          'than most. That is why we see you more often, and it works'),
      ('You will need early delivery', 'We may plan the birth a little early '
          'if your blood pressure or the baby\'s growth tells us to'),
    ],
    redFlags: [
      'Severe headache not relieved by paracetamol',
      'Visual disturbance — blurring, flashing lights',
      'Pain below the ribs, especially on the right',
      'Sudden swelling of face, hands or feet',
      'Vomiting in later pregnancy',
      'Reduced fetal movements',
      'A home reading of 160/110 or above',
    ],
    pitfalls: [
      'Stopping the ACE inhibitor without starting a replacement',
      'Treating a normal reading in the second trimester as resolution — '
          'blood pressure physiologically dips and then rises',
      'Not arranging postnatal review; the risk of later cardiovascular '
          'disease is real and this is the moment she is in the system',
    ],
    sources: [
      'NICE NG133 — Hypertension in pregnancy: diagnosis and management.',
      'ACOG Practice Bulletin 203 — Chronic Hypertension in Pregnancy.',
      'ISSHP classification and management of hypertensive disorders of '
          'pregnancy, 2018.',
      'FOGSI GCPR — Hypertensive Disorders in Pregnancy; MoHFW Guidelines for '
          'Management of Pregnancy Induced Hypertension.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-pph',
    title: 'After a postpartum haemorrhage',
    setting: 'Before discharge, and again at the postnatal visit.',
    cover: [
      'What happened, in plain words, and in what order — she was often '
          'frightened and given no account afterwards',
      'How much blood was lost and what was given, including transfusion',
      'Which procedures were done, and whether the uterus was preserved',
      'Whether she was in intensive care, and why',
      'That anaemia needs treating for weeks, not days, and how',
      'That breastfeeding is usually unaffected, and support if milk is slow',
      'That the risk of recurrence in a future pregnancy is higher, and that '
          'this is manageable with planning',
      'That she should deliver in a facility with blood availability next '
          'time',
      'Contraception and spacing before the next pregnancy',
      'Where a hysterectomy was performed, that this is permanent, and what '
          'it does and does not change',
    ],
    saferWording: [
      ('You lost a lot of blood', 'You bled heavily after the birth. We '
          'stopped it with these treatments, and this is why it happened'),
      ('It might happen again', 'It is more likely to happen again, so next '
          'time we plan for it — that planning works, and most women do well'),
      ('You are fine now', 'You are out of danger. You are still low on '
          'blood, and that is why you feel tired — here is how we fix it'),
    ],
    redFlags: [
      'Heavy bleeding, soaking a pad in under an hour',
      'Passing large clots',
      'Offensive-smelling discharge',
      'Fever',
      'Fainting, dizziness, or breathlessness on minimal effort',
      'Calf pain or swelling, or chest pain — she is at higher risk of clots',
    ],
    pitfalls: [
      'Discharging without any explanation of what happened. This is the '
          'single commonest complaint after a major haemorrhage',
      'Treating the anaemia with a two-week course and no follow-up count',
      'Missing Sheehan syndrome — failure of lactation, amenorrhoea and '
          'fatigue after severe haemorrhage',
      'Not discussing future pregnancy because the conversation is difficult',
    ],
    sources: [
      'RCOG Green-top Guideline 52 — Prevention and Management of Postpartum '
          'Haemorrhage.',
      'WHO recommendations for the prevention and treatment of postpartum '
          'haemorrhage.',
      'MoHFW Guidelines for Prevention and Management of PPH; Anaemia Mukt '
          'Bharat.',
      'FOGSI GCPR — Postpartum Haemorrhage.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-infertility',
    title: 'Infertility — the first consultation',
    setting: 'The couple together, with time set aside.',
    cover: [
      'That infertility is defined as a year of trying without conception, '
          'and six months if she is over 35',
      'That in roughly a third the factor is female, a third male, and a '
          'third both or unexplained — so both partners are investigated',
      'What the investigations are, in what order, and what each one answers',
      'Semen analysis early, because it is simple and often decisive',
      'That age is the strongest single determinant of success, and being '
          'honest about that without cruelty',
      'Weight, smoking, alcohol and tobacco — the changes that actually shift '
          'the odds',
      'Folic acid before conception',
      'Rubella immunity and thyroid status',
      'Realistic timelines, and that treatment is a series of cycles rather '
          'than one attempt',
      'Costs, plainly, before anything is started',
    ],
    saferWording: [
      ('The problem is with your wife', 'We look at both of you, because in '
          'most couples there is more than one factor'),
      ('You are too old', 'Your age does affect the chance each cycle. Here '
          'is what that means for you, and what we can do about the timing'),
      ('Just relax and it will happen', 'Stress does not cause infertility. '
          'What you are feeling is a normal response to a hard situation'),
      ('Unexplained infertility', 'Our tests have not found a cause. That is '
          'not the same as there being nothing wrong, and it is not the same '
          'as no treatment'),
    ],
    redFlags: [
      'Sudden severe pelvic pain during treatment — torsion or OHSS',
      'Abdominal distension, breathlessness or reduced urine after egg '
          'collection',
      'Bleeding with a positive pregnancy test — ectopic risk is raised after '
          'treatment',
      'Fever after any procedure',
    ],
    pitfalls: [
      'Seeing the woman alone. The evaluation is of a couple',
      'Deferring semen analysis while the woman undergoes invasive tests',
      'Promising success rates the unit cannot evidence — the ART Act '
          'requires accurate disclosure',
      'Allowing family pressure in the room to drive the decision. Offer to '
          'see the couple alone',
      'Not naming the emotional cost. Most couples are grieving something '
          'monthly',
    ],
    sources: [
      'NICE CG156 — Fertility problems: assessment and treatment.',
      'ESHRE guideline — Unexplained Infertility.',
      'WHO laboratory manual for the examination and processing of human '
          'semen, 6th edition, 2021.',
      'Assisted Reproductive Technology (Regulation) Act 2021, India; ICMR '
          'National Guidelines for ART Clinics; ISAR recommendations.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-ivf',
    title: 'Before starting IVF',
    setting: 'A dedicated appointment, both partners, before consent.',
    cover: [
      'What happens in a cycle, step by step: down-regulation or antagonist, '
          'stimulation, monitoring, trigger, retrieval, fertilisation, '
          'transfer, luteal support, pregnancy test',
      'How many injections, over how many days, and who gives them',
      'The number of monitoring scans and blood tests',
      'Her realistic live birth rate per cycle, for her age and diagnosis, '
          'stated as a number',
      'That cycles are commonly cancelled, and that this is not failure',
      'That not all eggs fertilise, and not all embryos survive to transfer',
      'Single embryo transfer, and why multiple pregnancy is a complication '
          'rather than a bonus',
      'Freezing: what is frozen, for how long, storage cost, and what happens '
          'if they separate or one dies',
      'OHSS — what it is, how it is prevented, and what to report',
      'The full cost, including drugs, freezing and storage',
      'That the ART Act requires written informed consent and regulates what '
          'may be offered',
    ],
    saferWording: [
      ('IVF success rate is 40%', 'For a woman of your age with your '
          'diagnosis, about this many out of a hundred take a baby home per '
          'cycle. Most people need more than one cycle'),
      ('We will put back two embryos to improve your chances', 'Putting back '
          'one embryo at a time gives a similar chance of a baby overall, and '
          'far fewer complications'),
      ('The cycle failed', 'This cycle did not result in a pregnancy. Here is '
          'what we learned from it, and what we would change'),
    ],
    redFlags: [
      'Abdominal distension, rapid weight gain, reduced urine, or '
          'breathlessness after trigger or retrieval',
      'Severe one-sided pain — ovarian torsion',
      'Fever after retrieval',
      'Heavy bleeding after retrieval or transfer',
      'Pain or bleeding with a positive test — ectopic',
    ],
    pitfalls: [
      'Quoting clinic-wide pregnancy rates rather than her age-specific live '
          'birth rate',
      'Offering add-ons without evidence, and without saying they lack it',
      'Consenting on the day of the procedure',
      'Not planning what happens after an unsuccessful cycle, so the couple '
          'face it unprepared',
      'Skipping the OHSS conversation in exactly the high responders who need '
          'it',
    ],
    sources: [
      'NICE CG156 — Fertility problems.',
      'ESHRE guideline — Ovarian Stimulation for IVF/ICSI, 2019.',
      'HFEA information on treatment add-ons and success rates.',
      'ART (Regulation) Act 2021 and Rules, India; Surrogacy (Regulation) Act '
          '2021; ICMR National Guidelines for ART Clinics.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-endometriosis',
    title: 'Endometriosis',
    setting: 'At diagnosis, or when it is first suspected.',
    cover: [
      'What the condition is, in plain words: tissue like the womb lining '
          'growing outside the womb, which bleeds and scars',
      'That the pain is real and has a physical cause — many women have been '
          'disbelieved for years before this appointment',
      'That the average delay to diagnosis is measured in years, and that she '
          'is not late',
      'That the extent seen at surgery correlates poorly with the severity of '
          'pain',
      'Treatment aims: control pain, preserve fertility, avoid repeated '
          'surgery',
      'Medical options: analgesia, combined hormonal contraception, '
          'progestogens, levonorgestrel intrauterine system, GnRH analogues '
          'with add-back',
      'Surgical options, and that repeated ovarian surgery reduces ovarian '
          'reserve',
      'Fertility: many women conceive; if fertility is the priority, that '
          'changes the treatment order',
      'That hormonal treatment is contraceptive and does not treat '
          'infertility',
      'That hysterectomy is not automatically a cure',
    ],
    saferWording: [
      ('Period pain is normal', 'Pain that stops you working or studying is '
          'not normal, whatever you have been told before'),
      ('Get pregnant, it will cure it', 'Pregnancy often eases symptoms while '
          'it lasts. It is not a treatment, and it is not a reason to have a '
          'child before you want one'),
      ('We will remove everything', 'Removing the womb and ovaries helps some '
          'women and not others, because deposits outside them can still '
          'cause pain'),
      ('Your scan is normal so you are fine', 'A normal scan does not rule '
          'this out. We often treat on the basis of your symptoms'),
    ],
    redFlags: [
      'Sudden severe pain — a ruptured endometrioma or torsion',
      'Cyclical bleeding from the bowel or bladder, or with breathing',
      'Inability to pass urine',
      'Pain uncontrolled by prescribed analgesia',
      'New bowel obstruction symptoms',
    ],
    pitfalls: [
      'Requiring laparoscopic confirmation before offering any treatment',
      'Repeated ovarian cystectomy in a woman who wants children',
      'Treating the pain and never asking about sex, work or mood, where the '
          'real cost usually sits',
      'Not mentioning that GnRH analogues need add-back to protect bone',
    ],
    sources: [
      'ESHRE guideline — Endometriosis, 2022.',
      'NICE NG73 — Endometriosis: diagnosis and management.',
      'RCOG Green-top Guideline 24 — Endometriosis, Investigation and '
          'Management.',
      'FOGSI-ICOG Good Clinical Practice Recommendations on Endometriosis; '
          'Indian Society for Study of Pain guidance on chronic pelvic pain.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-fibroids',
    title: 'Fibroids',
    setting: 'When fibroids are found, whether or not they are symptomatic.',
    cover: [
      'That fibroids are common and benign, and that most need no treatment',
      'That treatment is driven by symptoms, not by size on a scan',
      'Which of her symptoms are actually attributable — heavy bleeding, '
          'pressure, pain, subfertility',
      'That position matters more than size: a small submucous fibroid can '
          'cause more bleeding than a large subserous one',
      'Medical options: tranexamic acid, NSAIDs, levonorgestrel intrauterine '
          'system where the cavity allows, combined hormonal contraception, '
          'GnRH analogues before surgery',
      'Iron replacement, because the anaemia is usually the thing making her '
          'unwell',
      'Surgical options: hysteroscopic resection, myomectomy, hysterectomy',
      'Uterine artery embolisation, and that it is not first choice if she '
          'wants children',
      'That fibroids typically shrink after the menopause',
      'That recurrence after myomectomy is common',
      'In pregnancy: red degeneration, and that most fibroids do not obstruct '
          'labour',
    ],
    saferWording: [
      ('You have a big fibroid, we should remove the uterus', 'The size alone '
          'is not the reason to operate. What matters is what it is doing to '
          'you — let us start there'),
      ('It could turn to cancer', 'Fibroids turning malignant is rare. What '
          'we watch for is rapid growth after the menopause'),
      ('Your uterus is the size of a five-month pregnancy', 'Your womb is '
          'enlarged. Here is what that explains about your symptoms'),
    ],
    redFlags: [
      'Bleeding heavy enough to cause dizziness or breathlessness',
      'Sudden severe abdominal pain — degeneration or torsion of a '
          'pedunculated fibroid',
      'Inability to pass urine',
      'Rapid growth, particularly after the menopause',
      'Any bleeding after the menopause',
    ],
    pitfalls: [
      'Recommending hysterectomy as the opening offer. Unnecessary '
          'hysterectomy is a documented problem in parts of India, and this '
          'conversation is where it starts',
      'Treating the fibroid and ignoring the anaemia',
      'Attributing all her symptoms to the fibroid without excluding '
          'endometrial pathology in a woman over 45',
      'Not asking whether she wants children before choosing the operation',
    ],
    sources: [
      'NICE NG88 — Heavy menstrual bleeding.',
      'RCOG/BSGE joint guidance on management of uterine fibroids.',
      'ACOG Practice Bulletin 228 — Management of Symptomatic Uterine '
          'Leiomyomas.',
      'FOGSI GCPR — Management of Fibroid Uterus; MoHFW advisory on '
          'unnecessary hysterectomies and the National Guidelines to Prevent '
          'Unnecessary Hysterectomies.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-cancer-diagnosis',
    title: 'Giving a gynaecological cancer diagnosis',
    setting: 'In a private room, with time, with someone she chooses present.',
    cover: [
      'Find out what she already knows and what she wants to know, before '
          'telling her anything',
      'Give a warning shot, then the diagnosis in one clear sentence, then '
          'stop and wait',
      'Use the word cancer. Euphemism causes more harm than plainness',
      'The stage if known, and honestly that it is not yet known if it is not',
      'That a multidisciplinary team decides the treatment, and when that '
          'meeting is',
      'The next concrete step, with a date',
      'A written summary and a named contact number',
      'Fertility: whether preservation is possible, and that this must be '
          'decided before treatment starts, not after',
      'That a second opinion is her right and will not offend anyone',
      'What financial support exists — Ayushman Bharat PM-JAY, state schemes, '
          'the Health Minister\'s Cancer Patient Fund',
    ],
    saferWording: [
      ('The biopsy showed some abnormal cells', 'I am sorry — the biopsy '
          'shows this is cancer'),
      ('You have six months', 'I cannot give you a number for one person. '
          'What I can tell you is what usually happens, and how we will keep '
          'checking'),
      ('There is nothing more we can do', 'We cannot cure this. There is a '
          'great deal we can still do, and none of it means abandoning you'),
      ('Do not worry', 'You are right to be frightened. Let me tell you what '
          'happens next'),
    ],
    redFlags: [
      'Heavy vaginal bleeding',
      'Inability to pass urine, or new leg swelling',
      'Severe uncontrolled pain',
      'Fever, particularly during chemotherapy — neutropenic sepsis is an '
          'emergency',
      'Expressed thoughts of self-harm',
    ],
    pitfalls: [
      'Telling the family first and the woman afterwards. She decides who '
          'knows, and how much',
      'Delivering the diagnosis in a corridor or on the phone',
      'Filling the silence. After the word cancer, most people hear nothing '
          'for some seconds — wait',
      'Omitting the fertility discussion in a young woman, when the window '
          'closes at the first cycle of treatment',
      'Assuming she will not understand. Assume she will, and check',
    ],
    sources: [
      'Baile WF et al. SPIKES — a six-step protocol for delivering bad news. '
          'Oncologist 2000;5:302–311.',
      'NICE NG12 — Suspected cancer: recognition and referral.',
      'ESGO/ESMO guidance on communication in gynaecological oncology.',
      'National Cancer Grid of India — communication and consent guidance; '
          'MoHFW National Programme for Prevention and Control of Cancer '
          '(NPCDCS); Ayushman Bharat PM-JAY.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-cancer-treatment',
    title: 'Before gynaecological cancer treatment',
    setting: 'After the multidisciplinary meeting, before consent.',
    cover: [
      'The plan in sequence: surgery, chemotherapy, radiotherapy, or a '
          'combination, and why in that order',
      'The intent — cure, control, or comfort — stated openly',
      'What the operation removes, and what that means for periods, fertility '
          'and hormones',
      'Surgical menopause if the ovaries are removed, and whether hormone '
          'therapy is possible for her',
      'Chemotherapy: how many cycles, how often, and the side effects that '
          'matter — hair, nausea, neuropathy, infection risk',
      'Neutropenic sepsis: that fever during chemotherapy is an emergency and '
          'she must attend the same day, not wait',
      'Radiotherapy: vaginal stenosis, bowel and bladder effects, and the use '
          'of dilators',
      'Lymphoedema after node dissection, and early physiotherapy',
      'Sexual function afterwards, raised by you rather than left to her',
      'Fertility preservation before starting, if relevant',
      'Follow-up schedule, and what symptoms to report between visits',
      'Nutrition, and support for travel and accommodation during treatment',
    ],
    saferWording: [
      ('The treatment is aggressive', 'This treatment is hard, and here is '
          'exactly what it will feel like week by week'),
      ('You will lose your hair', 'You will lose your hair with this drug. It '
          'grows back after treatment. Many women arrange a wig beforehand'),
      ('You will not be able to have children', 'This treatment will end your '
          'ability to carry a pregnancy. Before we start, I want to tell you '
          'what options exist to preserve that, and how quickly we would need '
          'to act'),
      ('Everything went well', 'The surgery went as planned. The final '
          'results come in about ten days, and we will go through them '
          'together'),
    ],
    redFlags: [
      'Fever or rigors during or after chemotherapy — attend immediately',
      'Bleeding, or bruising without injury',
      'Severe vomiting or inability to keep fluids down',
      'New breathlessness, chest pain, or leg swelling',
      'Numbness or weakness in hands or feet',
      'Wound discharge, or increasing abdominal pain after surgery',
      'Inability to pass urine or open bowels',
    ],
    pitfalls: [
      'Consenting for surgery without discussing surgical menopause',
      'Never raising sexual function, so she assumes it cannot be discussed',
      'Handing over a chemotherapy regimen without an emergency card and a '
          '24-hour number',
      'Not asking how she will get to treatment. Distance and cost cause more '
          'incomplete treatment in India than side effects do',
      'Discussing dilators once, in passing, after radiotherapy has already '
          'started',
    ],
    sources: [
      'ESGO-ESTRO-ESP guidelines for the management of endometrial and '
          'cervical carcinoma.',
      'NCCN Clinical Practice Guidelines in Oncology — cervical, ovarian and '
          'uterine neoplasms.',
      'Cancer Research UK / UKONS Acute Oncology guidance on neutropenic '
          'sepsis; NICE CG151.',
      'National Cancer Grid of India — resource-stratified guidelines for '
          'gynaecological cancers; Tata Memorial Centre evidence-based '
          'management manuals.',
    ],
  ),
];
