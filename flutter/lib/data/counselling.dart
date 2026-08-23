import '../models/counselling.dart';

const kCounsellingGuides = <CounsellingGuide>[
  CounsellingGuide(
    id: 'couns-warning-signs',
    title: 'Antenatal warning signs',
    setting: 'Every antenatal visit, and before discharge from any admission',
    cover: [
      'Reduced or changed fetal movements — she should never wait until '
          'morning.',
      'Vaginal bleeding of any amount.',
      'Leaking fluid.',
      'Severe or persistent headache, visual disturbance or flashing lights.',
      'Pain under the ribs on the right side.',
      'Sudden swelling of the face, hands or feet.',
      'Fever, or feeling generally unwell.',
      'Regular painful contractions before 37 weeks.',
      'Burning on passing urine, or loin pain.',
    ],
    saferWording: [
      ('"Let us know if baby\'s movements reduce"',
          '"If your baby moves less than usual, or the pattern changes, ring '
              'the labour ward straight away — at any hour. Do not wait until '
              'the morning, and do not wait for your next appointment."'),
      ('"Watch out for pre-eclampsia symptoms"',
          '"A bad headache that painkillers don\'t shift, seeing spots or '
              'flashing lights, or pain under your right ribs — any of those, '
              'come in the same day."'),
      ('"Come back if you\'re worried"',
          '"If something feels wrong to you, that is reason enough to ring. '
              'You will not be wasting our time."'),
    ],
    redFlags: [
      'Reduced fetal movements',
      'Any bleeding',
      'Headache with visual disturbance',
      'Right upper quadrant pain',
      'Fever',
      'Contractions before 37 weeks',
    ],
    pitfalls: [
      'Giving the list once at booking and never repeating it.',
      'Telling her to "count kicks to ten" — formal kick counting has not been '
          'shown to improve outcomes and can falsely reassure.',
      'Not asking whether she has a phone, transport and money to come in.',
    ],
    sources: [
      'RCOG Green-top Guideline 57 — Reduced Fetal Movements.',
      'NICE NG201 — Antenatal care.',
      'MoHFW Government of India — Pradhan Mantri Surakshit Matritva Abhiyan '
          'antenatal counselling materials.',
      'MBRRACE-UK — recurring themes on missed warning signs.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-vbac',
    title: 'VBAC versus repeat caesarean',
    setting: 'Antenatal clinic, ideally by 28 weeks, revisited at 36',
    cover: [
      'About three in four women who try for a vaginal birth after one '
          'caesarean achieve it.',
      'The risk of the scar giving way is about 1 in 200 in spontaneous '
          'labour.',
      'That risk roughly doubles or trebles if labour is induced, and is '
          'highest with prostaglandins.',
      'A planned repeat caesarean nearly removes the scar risk, but each '
          'caesarean makes the next pregnancy more complicated — placenta '
          'praevia, placenta accreta, adhesions.',
      'The most dangerous route of all is an emergency caesarean during '
          'labour, which is what happens if VBAC is attempted and fails.',
      'She will need continuous monitoring in labour, and a drip in her hand.',
      'The decision can be changed at any point, including on the day.',
    ],
    saferWording: [
      ('"The risk of rupture is 0.5%"',
          '"Out of 200 women who go into labour with a scar like yours, one '
              'will have the scar give way. That means 199 will not."'),
      ('"VBAC has a 75% success rate"',
          '"Three out of four women in your position give birth vaginally. One '
              'in four ends up needing a caesarean anyway."'),
      ('"Repeat caesarean is safer"',
          '"A planned caesarean is very safe for this pregnancy. What it costs '
              'you is in future pregnancies — the more caesareans, the higher '
              'the chance the placenta grows into the scar, which is '
              'serious."'),
    ],
    redFlags: [
      'Constant tummy pain between contractions in labour',
      'Pain over the scar',
      'An epidural that suddenly stops working',
      'Any bleeding in labour',
    ],
    pitfalls: [
      'Quoting relative risks rather than absolute numbers.',
      'Presenting the choice as though only one option were reasonable.',
      'Failing to say honestly what the unit can and cannot provide — a unit '
          'without immediate theatre and blood changes the calculation.',
      'Leaving the conversation until she is in labour.',
    ],
    sources: [
      'RCOG Green-top Guideline 45 — Birth After Previous Caesarean Birth.',
      'ACOG Practice Bulletin 205.',
      'Landon MB et al. N Engl J Med 2004;351:2581.',
      'FOGSI GCPR — Vaginal Birth After Caesarean.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-gdm',
    title: 'Gestational diabetes',
    setting: 'At diagnosis, and again at the first review',
    cover: [
      'This is a condition of pregnancy, not diabetes for life — but it '
          'raises her lifetime risk substantially.',
      'The aim is to keep the baby from growing too large and to avoid '
          'problems at birth.',
      'Diet and activity come first; about seven in ten women manage on that '
          'alone.',
      'If tablets or insulin are needed, that is not a failure — it is how the '
          'placenta behaves in the last weeks.',
      'Insulin does not cross to the baby.',
      'What the targets are, and how to test.',
      'She will need extra growth scans.',
      'Delivery is usually planned by around 40 weeks, earlier if on '
          'treatment.',
      'Testing again 6–12 weeks after birth, and then yearly.',
    ],
    saferWording: [
      ('"You have diabetes"',
          '"Pregnancy hormones have stopped your body using insulin properly. '
              'It almost always settles after the baby is born."'),
      ('"You failed your sugar test"',
          '"The test showed your sugars are higher than we want them in '
              'pregnancy. Nothing you did caused this."'),
      ('"You need to go on insulin"',
          '"Your placenta is working against your insulin more strongly as '
              'pregnancy goes on. Adding insulin now is expected, not a sign '
              'anything has gone wrong."'),
    ],
    redFlags: [
      'Reduced fetal movements',
      'Sugars persistently above target despite treatment',
      'Symptoms of low sugar if on insulin — shaky, sweaty, confused',
    ],
    pitfalls: [
      'Language that implies blame — "failed", "non-compliant", "poor '
          'control".',
      'Not explaining that insulin requirement falls sharply the moment the '
          'placenta is delivered.',
      'Failing to arrange the postpartum glucose test, which is the commonest '
          'omission in the whole pathway.',
    ],
    sources: [
      'NICE NG3 — Diabetes in pregnancy.',
      'MoHFW National Guidelines for GDM (DIPSI).',
      'Crowther CA et al. ACHOIS, N Engl J Med 2005;352:2477.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-miscarriage',
    title: 'Miscarriage and early pregnancy loss',
    setting: 'Early pregnancy unit, in a private room, with time',
    cover: [
      'Say the words plainly — "I am very sorry, the scan shows the pregnancy '
          'has ended." Avoid euphemism.',
      'That nothing she did caused it, and nothing she could have done would '
          'have prevented it.',
      'That most early losses are due to a chromosomal problem in that '
          'pregnancy, and do not predict the next one.',
      'The three options: expectant, medical and surgical management, with '
          'what each involves and how long it takes.',
      'What bleeding and pain to expect, and what is too much.',
      'That most women who have one miscarriage go on to have a normal '
          'pregnancy.',
      'Anti-D if she is Rhesus negative and it is indicated.',
      'When to try again — whenever they feel ready; there is no medical need '
          'to wait.',
    ],
    saferWording: [
      ('"The pregnancy is not viable"',
          '"I am so sorry. The scan shows the baby has died."'),
      ('"It was a blighted ovum"',
          '"The pregnancy sac formed but the baby did not develop. That '
              'happens because of a problem in the pregnancy itself, not '
              'because of anything you did."'),
      ('"At least you know you can get pregnant"',
          'Do not say this. Acknowledge the loss: "This is a real loss and it '
              'is alright to grieve it."'),
    ],
    redFlags: [
      'Bleeding soaking more than two pads an hour',
      'Fever',
      'Severe or one-sided pain',
      'Feeling faint',
    ],
    pitfalls: [
      'Delivering the news standing in a scan room with the door open.',
      'Rushing to the management decision before she has absorbed the news.',
      'Minimising — "it was very early", "these things happen".',
      'Forgetting anti-D.',
      'Not offering follow-up or a contact number.',
    ],
    sources: [
      'NICE NG126 — Ectopic pregnancy and miscarriage.',
      'RCOG Green-top Guideline 22 — Anti-D prophylaxis.',
      'FOGSI GCPR — Early Pregnancy Complications.',
      'RCOG — Good Practice on management of early pregnancy loss.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-postpartum-contraception',
    title: 'Postpartum contraception',
    setting: 'Antenatally where possible, and before discharge',
    cover: [
      'Fertility can return from three weeks after birth if she is not fully '
          'breastfeeding.',
      'Breastfeeding is only reliable contraception if she is under six '
          'months, feeding fully, and has had no period — all three.',
      'The implant and progestogen-only pill can start straight away, '
          'including while breastfeeding.',
      'An intrauterine device can go in within 48 hours of birth or after four '
          'weeks — not in between.',
      'The combined pill should wait until six weeks if breastfeeding, and '
          'three weeks in anyone, because of clot risk.',
      'Spacing pregnancies by at least 18–24 months lowers the risk of '
          'preterm birth and of scar problems.',
      'Sterilisation is permanent — decide it in advance, never in labour.',
    ],
    saferWording: [
      ('"You should use contraception"',
          '"Your fertility can come back within three weeks, before your '
              'periods return — so it is worth deciding now rather than '
              'later."'),
      ('"Breastfeeding will protect you"',
          '"Breastfeeding only protects you if the baby is under six months, '
              'feeding day and night with nothing else, and your periods have '
              'not come back. If any one of those changes, you need something '
              'else."'),
      ('"Shall we tie your tubes while we are in there?"',
          'Do not raise permanent sterilisation for the first time in labour '
              'or on the operating table. Consent taken then is not valid '
              'consent.'),
    ],
    redFlags: [
      'Heavy bleeding or offensive discharge after starting any method',
      'Missing IUCD threads',
      'Calf pain or breathlessness on the combined pill',
    ],
    pitfalls: [
      'Leaving the conversation to the postnatal ward, when she is exhausted.',
      'Assuming she will return for a six-week visit — many do not.',
      'Not offering the postpartum IUCD, which is free and available at the '
          'birth she is already attending.',
      'Taking sterilisation consent during labour.',
    ],
    sources: [
      'FSRH Clinical Guideline — Contraception After Pregnancy.',
      'WHO Medical Eligibility Criteria, 5th edition.',
      'MoHFW — Postpartum IUCD reference manual.',
    ],
  ),
];
