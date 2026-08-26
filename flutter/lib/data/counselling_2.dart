import '../models/counselling.dart';

const kCounsellingGuides2 = <CounsellingGuide>[
  CounsellingGuide(
    id: 'couns-induction',
    title: 'Induction of labour',
    setting: 'Antenatal clinic when induction is first proposed, not on the '
        'day',
    cover: [
      'Why induction is being offered for her specifically, not in general.',
      'What will actually happen, in order, and roughly how long each stage '
          'takes.',
      'That it often takes two or three days from the first pessary to the '
          'birth, and that the early part is mostly waiting.',
      'That contractions after induction may feel stronger and start more '
          'abruptly than in spontaneous labour.',
      'That she will need continuous monitoring once oxytocin is running.',
      'That induction does not increase her chance of caesarean — the older '
          'teaching was wrong.',
      'What happens if the first attempt does not work.',
      'That she can decline, and what expectant management with monitoring '
          'would involve instead.',
    ],
    saferWording: [
      ('"We need to induce you"',
          '"I\'d like to talk about bringing your labour on, and why I think '
              'it would be safer for you and the baby. It\'s your decision, '
              'and I\'ll tell you what happens either way."'),
      ('"Induction increases your chance of a caesarean"',
          '"That used to be what we thought. The evidence now says it '
              'doesn\'t — if anything it slightly reduces it."'),
      ('"It should be quick"',
          '"For a first baby, expect two to three days from the first pessary '
              'to the birth. Most of that is waiting rather than labouring. '
              'Bring things to do, and bring someone with you."'),
    ],
    redFlags: [
      'Contractions coming more often than five in ten minutes',
      'Constant pain that does not ease between contractions',
      'Any bleeding',
      'Reduced fetal movements',
      'The pessary coming out',
    ],
    pitfalls: [
      'Raising it for the first time on the day of admission.',
      'Describing the process without describing the timescale — the '
          'commonest source of distress is the waiting nobody mentioned.',
      'Not saying explicitly that she can decline.',
      'Failing to mention that a scarred uterus changes the method.',
    ],
    sources: [
      'NICE NG207 — Inducing labour.',
      'FOGSI GCPR — Induction of Labour.',
      'Grobman WA et al. ARRIVE trial. N Engl J Med 2018;379:513.',
      'WHO recommendations: induction of labour at or beyond term.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-preeclampsia',
    title: 'Pre-eclampsia',
    setting: 'At diagnosis, and again before discharge after delivery',
    cover: [
      'That it is a condition of the placenta, and that delivery is the only '
          'cure.',
      'That treating her blood pressure protects her from stroke; it does not '
          'treat the underlying condition.',
      'The symptoms that mean she must come in the same day.',
      'Why she needs blood tests and scans more often than she expected.',
      'That magnesium sulphate, if needed, prevents fits — and that it will '
          'make her feel hot and unwell for a while.',
      'The plan for delivery: when, why, and by what route.',
      'That her blood pressure often gets WORSE for a few days after birth, '
          'not better.',
      'That she needs a six-week check, and that this raises her lifelong '
          'cardiovascular risk.',
      'That aspirin from before 16 weeks next time cuts the risk '
          'substantially.',
    ],
    saferWording: [
      ('"Your blood pressure is a bit high"',
          '"You have pre-eclampsia. It\'s a condition of the placenta that '
              'affects your blood pressure and can affect your kidneys, liver '
              'and the baby\'s growth. We can manage it, but the only thing '
              'that cures it is delivering the baby."'),
      ('"Come back if you feel unwell"',
          '"A headache that painkillers don\'t shift, seeing spots or '
              'flashing lights, pain under your right ribs, vomiting, or '
              'sudden swelling — any of those, come straight in, day or '
              'night."'),
      ('"You\'re fine now the baby\'s out"',
          '"Your blood pressure often gets worse for three to five days after '
              'birth, and fits can happen for the first time after you go '
              'home. Keep taking the tablets and keep the appointments."'),
    ],
    redFlags: [
      'Severe headache unrelieved by paracetamol',
      'Visual disturbance — spots, flashing lights, blurring',
      'Pain under the right ribs or in the epigastrium',
      'Vomiting',
      'Sudden swelling of face, hands or feet',
      'Reduced fetal movements',
      'Breathlessness',
    ],
    pitfalls: [
      'Calling it "a bit of high blood pressure" and losing her attention.',
      'Not warning that the postpartum period is more dangerous than she '
          'expects.',
      'Failing to mention aspirin for the next pregnancy, and the 16-week '
          'window.',
      'Not connecting it to her long-term cardiovascular risk — this is a '
          'lifelong risk marker, and nobody tells her.',
    ],
    sources: [
      'NICE NG133 — Hypertension in pregnancy.',
      'FOGSI-ICOG GCPR — Hypertensive Disorders of Pregnancy.',
      'ACOG Practice Bulletin 222; NICE NG133 — Hypertension in pregnancy (RCOG Green-top 10A is archived).',
      'Rolnik DL et al. ASPRE trial. N Engl J Med 2017;377:613.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-caesarean',
    title: 'Caesarean section',
    setting: 'Antenatally for a planned caesarean; in labour, briefly and '
        'clearly, for an emergency',
    cover: [
      'Why a caesarean is being recommended for her.',
      'What the operation involves, and that she will usually be awake.',
      'That her partner can normally be with her for a spinal.',
      'Recovery: pain for a week or two, no driving until comfortable, no '
          'heavy lifting for six weeks.',
      'The specific risks: bleeding, infection, injury to bladder or bowel, '
          'clots, and the need for a blood transfusion.',
      'What it means for future pregnancies — praevia, placenta growing into '
          'the scar, adhesions, and that these risks rise with each '
          'caesarean.',
      'That she can plan a vaginal birth next time, and the numbers for that.',
      'Early skin-to-skin and breastfeeding are both possible after '
          'caesarean.',
    ],
    saferWording: [
      ('"We need to do a caesarean now"',
          'In an emergency: "The baby needs to be born quickly and the safest '
              'way is an operation. I\'ll explain everything properly '
              'afterwards, but right now we need to move." Then do explain '
              'afterwards — properly, and more than once.'),
      ('"It\'s a very safe operation"',
          '"It\'s a common operation and usually straightforward. The risks I '
              'have to tell you about are bleeding, infection, damage to the '
              'bladder, and clots — and that each caesarean makes the next '
              'pregnancy a bit more complicated."'),
      ('"Too posh to push"',
          'Never. Maternal request is a legitimate reason, and it deserves '
              'the same careful discussion as any other indication.'),
    ],
    redFlags: [
      'Increasing wound pain, redness or discharge',
      'Fever',
      'Heavy vaginal bleeding',
      'Calf pain, swelling or breathlessness',
      'Burning on passing urine, or inability to pass urine',
    ],
    pitfalls: [
      'Taking consent during a contraction and calling it informed.',
      'Not returning afterwards to explain what happened and why — women '
          'remember the absence of that conversation for years.',
      'Omitting the future-pregnancy consequences, which are the risks she is '
          'least likely to have thought about.',
      'Assuming she cannot breastfeed or hold the baby in theatre.',
    ],
    sources: [
      'NICE NG192 — Caesarean birth.',
      'RCOG Consent Advice 7 — Caesarean Section.',
      'FOGSI GCPR — Caesarean Section.',
      'ACOG Committee Opinion 761 — Cesarean Delivery on Maternal Request.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-breastfeeding',
    title: 'Breastfeeding',
    setting: 'Antenatally, in the first hours after birth, and before '
        'discharge',
    cover: [
      'Skin-to-skin immediately after birth, and the first feed within the '
          'first hour.',
      'That colostrum is small in volume and that this is normal, not '
          'insufficiency.',
      'How to tell the baby is getting enough: wet and dirty nappies, weight '
          'trend, and audible swallowing.',
      'Feeding on demand, eight to twelve times in 24 hours, including at '
          'night.',
      'Positioning and attachment — most pain is a latch problem, not an '
          'inevitability.',
      'That the milk "coming in" around day three can be uncomfortable.',
      'Where to get help, and that it is available.',
      'That almost all medicines are compatible, and that she should ask '
          'rather than stop.',
      'Exclusive breastfeeding for six months is the recommendation.',
    ],
    saferWording: [
      ('"Breast is best"',
          '"Breastfeeding has real benefits for both of you, and I\'ll help '
              'you make it work. If it doesn\'t work out, we\'ll sort out '
              'something else and your baby will be fine."'),
      ('"You don\'t have enough milk"',
          '"In the first few days there is only a small amount, and that is '
              'exactly right — a newborn\'s stomach is the size of a cherry. '
              'The volume comes in around day three."'),
      ('"It shouldn\'t hurt"',
          '"Some tenderness in the first days is common, but sharp pain or '
              'cracked nipples almost always means the latch needs adjusting, '
              'and that is fixable. Let\'s look at it together."'),
      ('"You\'ll have to stop breastfeeding to take that"',
          'Check first. Very few drugs genuinely require stopping, and '
              'unnecessary interruption is a common and avoidable cause of '
              'weaning.'),
    ],
    redFlags: [
      'Fewer than six wet nappies a day after day five',
      'Weight loss beyond 10% of birth weight, or no regain by two weeks',
      'A jaundiced, sleepy baby who will not feed',
      'A red, painful, hot area on the breast with fever — mastitis',
      'Cracked or bleeding nipples',
    ],
    pitfalls: [
      'Moralising. It raises anxiety and reduces the chance she asks for '
          'help.',
      'Advising a mother to stop breastfeeding for a drug without checking '
          'LactMed.',
      'Not warning about day-three engorgement, so she concludes something is '
          'wrong.',
      'Discharging without anyone having watched a full feed.',
    ],
    sources: [
      'WHO / UNICEF Baby Friendly Hospital Initiative; WHO guideline on '
          'protecting, promoting and supporting breastfeeding.',
      'MoHFW Government of India — MAA (Mothers\' Absolute Affection) '
          'programme; Infant and Young Child Feeding guidelines.',
      'NICE NG194 — Postnatal care.',
      'NIH LactMed database for medication compatibility.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-ectopic',
    title: 'Ectopic pregnancy',
    setting: 'Early pregnancy unit, in a private room, sitting down',
    cover: [
      'Say it plainly: the pregnancy is growing in the wrong place and cannot '
          'continue.',
      'That it is nobody\'s fault and could not have been prevented.',
      'Why it is dangerous — the tube can rupture and bleed.',
      'The options she actually has: watching with blood tests, methotrexate, '
          'or surgery, and which are open to her.',
      'If methotrexate: that it takes weeks, that she must attend for blood '
          'tests, and that she must avoid pregnancy for three months.',
      'If surgery: whether the tube is likely to be removed, and what that '
          'means for future fertility.',
      'That most women with one tube conceive normally afterwards.',
      'That she needs an early scan at six to seven weeks in the next '
          'pregnancy.',
      'Anti-D if she is Rhesus negative.',
    ],
    saferWording: [
      ('"It\'s an ectopic, we need to operate"',
          '"I\'m sorry. The pregnancy has settled in your tube instead of '
              'your womb, and it can\'t survive there. It\'s also dangerous '
              'for you, so we do need to treat it. Let me explain what the '
              'options are."'),
      ('"We\'ll have to take the tube out"',
          '"We may need to remove that tube. If your other tube is healthy, '
              'that usually doesn\'t reduce your chance of getting pregnant '
              'much at all."'),
      ('"At least it wasn\'t a real pregnancy"',
          'Never say this. It was her pregnancy and this is a loss. '
              'Acknowledge it.'),
    ],
    redFlags: [
      'Severe or one-sided abdominal pain',
      'Shoulder tip pain',
      'Feeling faint or collapsing',
      'Heavy vaginal bleeding',
      'Pain on opening the bowels',
    ],
    pitfalls: [
      'Focusing entirely on the medical urgency and never naming the loss.',
      'Starting methotrexate without checking she can attend for follow-up '
          'blood tests.',
      'Not warning about separation pain around days three to seven, so she '
          'presents terrified.',
      'Forgetting anti-D.',
      'Not arranging the early scan for next time.',
    ],
    sources: [
      'NICE NG126 — Ectopic pregnancy and miscarriage.',
      'RCOG Green-top Guideline 21 — Diagnosis and Management of Ectopic '
          'Pregnancy.',
      'FOGSI GCPR — Early Pregnancy Complications.',
      'ACOG Practice Bulletin 193 — Tubal Ectopic Pregnancy.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-pcos',
    title: 'PCOS',
    setting: 'At diagnosis, with time — this is a lifelong diagnosis',
    cover: [
      'What the diagnosis means, and that "polycystic" describes follicles, '
          'not cysts.',
      'That it is common, affecting roughly one woman in ten.',
      'The three things it affects: periods, androgen symptoms, and '
          'metabolism.',
      'That it does not mean she cannot conceive — most women with PCOS do.',
      'Why she needs a glucose tolerance test now and every one to three '
          'years.',
      'That a 5–10% weight loss restores ovulation in a substantial '
          'proportion, and improves everything else.',
      'That hirsutism treatment takes at least six months to show and needs '
          'to be continued.',
      'Why she needs a bleed at least every three to four months, even if she '
          'is not trying to conceive.',
      'That South Asian women develop the metabolic consequences at a lower '
          'BMI and younger age.',
    ],
    saferWording: [
      ('"You have cysts on your ovaries"',
          '"They aren\'t cysts. They\'re small immature follicles — eggs that '
              'started developing and stopped. The name is misleading and '
              'frightens people unnecessarily."'),
      ('"You\'ll have trouble getting pregnant"',
          '"You may need help with ovulation, and most women with PCOS who '
              'want a baby have one. Let\'s deal with that when you\'re ready '
              'rather than now."'),
      ('"Just lose weight"',
          '"Weight loss helps more than any tablet I can give you, and PCOS '
              'makes losing weight harder than it is for other people. That '
              'isn\'t a lack of willpower — it\'s the condition. Let\'s find '
              'what is realistic."'),
      ('"Your periods are irregular, that\'s all"',
          '"Going months without a period matters, because the lining keeps '
              'building up. We need a bleed every three to four months to '
              'protect it."'),
    ],
    redFlags: [
      'Heavy or prolonged bleeding after months of amenorrhoea',
      'Rapid onset of hirsutism or voice deepening — needs urgent assessment',
      'Symptoms of diabetes — thirst, frequency, weight loss',
      'Low mood or thoughts of self-harm',
    ],
    pitfalls: [
      'Delivering the diagnosis with the word "cysts" and no explanation.',
      'Making weight the entire consultation.',
      'Not screening for depression and anxiety, which are markedly more '
          'common and routinely missed.',
      'Failing to explain the endometrial protection rationale, so she stops '
          'the pill when she is not trying to conceive.',
      'Applying European BMI thresholds to a South Asian woman.',
    ],
    sources: [
      'International Evidence-Based Guideline for the Assessment and '
          'Management of PCOS, 2023.',
      'FOGSI-ICOG GCPR on PCOS.',
      'Legro RS et al. N Engl J Med 2014;371:119.',
      'ICMR — guidance on Asian-Indian BMI and waist thresholds.',
    ],
  ),
  CounsellingGuide(
    id: 'couns-menopause',
    title: 'Menopause and hormone therapy',
    setting: 'A dedicated appointment — this rarely fits into five minutes',
    cover: [
      'That over 45 with typical symptoms, no blood test is needed.',
      'Which of her symptoms are menopausal, and which need separate '
          'investigation.',
      'That vasomotor symptoms usually last several years, and genitourinary '
          'symptoms do not resolve at all — they progress.',
      'What hormone therapy can and cannot do for her.',
      'The breast cancer risk in absolute numbers, not relative.',
      'That transdermal oestrogen carries no extra clot risk, unlike tablets.',
      'That she needs a progestogen if she still has a uterus.',
      'That vaginal oestrogen is a separate question and is safe long-term, '
          'including for most women after breast cancer.',
      'That there is no arbitrary time limit on treatment.',
      'That she may still need contraception.',
    ],
    saferWording: [
      ('"HRT causes breast cancer"',
          '"Combined HRT slightly increases breast cancer risk — roughly one '
              'extra case per thousand women per year of use. For comparison, '
              'that\'s similar to the effect of being overweight, or drinking '
              'a couple of units of alcohol a day."'),
      ('"You should come off HRT after five years"',
          '"There\'s no fixed limit. We review it every year and you decide, '
              'weighing how you feel against the risks. Plenty of women stay '
              'on it well into their sixties."'),
      ('"It\'s just the menopause, you\'ll get through it"',
          '"These symptoms are treatable, and there\'s no prize for enduring '
              'them. Let\'s talk about what would help."'),
      ('"You had breast cancer, so there\'s nothing I can offer"',
          '"Systemic HRT isn\'t an option, but vaginal oestrogen usually is, '
              'even on most breast cancer treatment — and there are '
              'non-hormonal options for the flushes. Let me speak to your '
              'oncologist."'),
    ],
    redFlags: [
      'Any bleeding after 12 months of no periods',
      'Unscheduled bleeding after the first six months on HRT',
      'New breast lump',
      'Calf pain, swelling, or breathlessness on oral HRT',
      'Severe headache with visual symptoms',
    ],
    pitfalls: [
      'Quoting relative risks from the WHI to a symptomatic fifty-year-old — '
          'the trial\'s mean age was 63 on one oral formulation.',
      'Adding a progestogen to vaginal oestrogen. It is not needed.',
      'Setting an arbitrary stop date.',
      'Assuming she no longer needs contraception.',
      'Not asking about sexual function, which she is unlikely to raise '
          'unprompted.',
    ],
    sources: [
      'NICE NG23 — Menopause: diagnosis and management.',
      'British Menopause Society consensus statements.',
      'Indian Menopause Society — clinical practice recommendations.',
      "NAMS 2022 Hormone Therapy Position Statement; Women's Health "
          'Initiative, JAMA 2002;288:321.',
    ],
  ),
];
