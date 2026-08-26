import '../models/safety_case.dart';

/// Spec §56 — the remaining twelve categories.
///
/// Every case here is a composite assembled from published confidential
/// enquiries and incident literature. None describes a single real patient,
/// and none carries anything by which one could be identified.
const kSafetyCases2 = <SafetyCase>[
  SafetyCase(
    id: 'case-mgso4-overdose',
    title: 'The loading dose that was given twice',
    category: SafetyCategory.wrongDose,
    presentation: 'A woman with severe pre-eclampsia at 34 weeks was started '
        'on magnesium sulphate in the emergency department and transferred to '
        'the labour ward.',
    timeline: [
      ('0 min', 'Magnesium sulphate 4 g loading dose given intravenously in '
          'the emergency department.'),
      ('20 min', 'Transferred to the labour ward. Verbal handover given in '
          'the corridor while the trolley moved.'),
      ('35 min', 'Labour ward team, seeing no infusion running and finding no '
          'entry on the drug chart, gave a 4 g loading dose.'),
      ('70 min', 'Nursing staff noted absent patellar reflexes. Observations '
          'had not been repeated since arrival.'),
      ('85 min', 'Respiratory rate 9. She became drowsy and difficult to '
          'rouse.'),
      ('90 min', 'Calcium gluconate given, infusion stopped, anaesthetist '
          'called. She recovered over the following hour.'),
    ],
    criticalEvent: 'A second loading dose of magnesium sulphate given because '
        'the first was documented nowhere.',
    whatWentWrong: [
      'The first dose was given in a department that used a different drug '
          'chart, and the chart did not travel with her.',
      'Handover happened while moving, with no structured tool and no '
          'read-back.',
      'The receiving team treated absence of documentation as absence of '
          'treatment.',
      'Reflexes and respiratory rate were not checked before the second dose '
          '— the one observation that would have raised doubt.',
      'Calcium gluconate was not immediately to hand.',
    ],
    contributingFactors: [
      'Transfer between departments with separate prescribing systems.',
      'Corridor handover, with no quiet moment and no checklist.',
      'A busy labour ward with staff covering two areas.',
      'Magnesium is given by both departments, so neither assumed ownership.',
    ],
    warningSigns: [
      'Loss of patellar reflexes — the earliest reliable sign.',
      'Respiratory rate falling below 12.',
      'Drowsiness or slurred speech.',
      'Urine output below 30 mL per hour, which raises levels without any '
          'extra dose.',
      'Flushing, nausea and a feeling of warmth during administration.',
    ],
    correctResponse: [
      'Stop the infusion immediately.',
      'Calcium gluconate 1 g intravenously over 10 minutes.',
      'Airway support, oxygen, and call the anaesthetist.',
      'Check serum magnesium, urea and creatinine.',
      'Continuous monitoring until reflexes return and respiration is normal.',
    ],
    prevention: [
      'One drug chart that travels with the woman, whichever department '
          'started the treatment.',
      'Structured handover — SBAR — in a place where both parties can hear, '
          'with read-back of every drug given.',
      'Ask "has she had magnesium already?" as a required question before '
          'loading, not an optional one.',
      'Reflexes, respiratory rate and urine output checked and recorded '
          'before every dose and hourly thereafter.',
      'Calcium gluconate stocked wherever magnesium is stocked.',
      'Halve or omit the maintenance dose in renal impairment.',
    ],
    learningPoints: [
      'No entry on a chart is not evidence that a drug was not given. It is '
          'evidence that a chart was not filled in.',
      'Magnesium toxicity announces itself in a strict order: reflexes, then '
          'respiration, then cardiac. The first is free to check.',
      'The transfer between two teams is where the double dose lives, in '
          'every reported version of this incident.',
      'Calcium gluconate in the cupboard on the other side of the hospital is '
          'not an antidote.',
    ],
    sources: [
      'MBRRACE-UK — Saving Lives, Improving Mothers\' Care.',
      'NICE NG133 — Hypertension in pregnancy.',
      'Altman D et al. Magpie Trial. Lancet 2002;359:1877–1890.',
      'WHO recommendations on prevention and treatment of pre-eclampsia and '
          'eclampsia.',
      'MoHFW Guidelines for Management of Pregnancy Induced Hypertension; '
          'FOGSI GCPR on hypertensive disorders.',
    ],
  ),
  SafetyCase(
    id: 'case-oxytocin-route',
    title: 'The bolus that was meant to be an infusion',
    category: SafetyCategory.wrongRoute,
    presentation: 'A woman in the second stage of labour with an oxytocin '
        'infusion running for augmentation.',
    timeline: [
      ('0 min', 'Delivery of the baby. Active management of the third stage '
          'commenced.'),
      ('1 min', 'A syringe drawn up on the trolley, labelled only "oxy", was '
          'given as a rapid intravenous bolus. It contained 10 units.'),
      ('2 min', 'Sudden profound hypotension, tachycardia and flushing. She '
          'reported chest tightness.'),
      ('4 min', 'Emergency call. Fluids, left lateral tilt, and vasopressor '
          'given.'),
      ('25 min', 'Blood pressure recovered. Transferred to high dependency '
          'for observation.'),
    ],
    criticalEvent: 'Oxytocin given as an undiluted rapid intravenous bolus '
        'rather than a slow injection or infusion.',
    whatWentWrong: [
      'A syringe was labelled with an abbreviation and no dose, no diluent '
          'and no route.',
      'The syringe was drawn up by one person and given by another.',
      'Rapid bolus administration of oxytocin causes vasodilatation and '
          'hypotension, which is well described and avoidable.',
      'The infusion already running was not accounted for before the extra '
          'dose.',
    ],
    contributingFactors: [
      'Multiple syringes on one trolley during an active delivery.',
      'Time pressure at the moment of birth.',
      'Local practice of pre-drawing drugs "to be ready".',
      'Look-alike ampoules stored together.',
    ],
    warningSigns: [
      'Any syringe not labelled with drug, dose, diluent, route and time.',
      'A drug drawn up by someone other than the person giving it.',
      'Sudden hypotension and flushing immediately after administration.',
      'Chest tightness or a feeling of impending doom.',
    ],
    correctResponse: [
      'Stop administration.',
      'Left lateral position, oxygen, and a rapid fluid bolus.',
      'Call for anaesthetic help.',
      'Vasopressor for persistent hypotension.',
      'Consider the differential — amniotic fluid embolism and anaphylaxis '
          'look similar at this moment.',
      'Retain the ampoule and syringe for review.',
    ],
    prevention: [
      'Never give oxytocin as a rapid undiluted intravenous bolus. Slow '
          'injection or infusion only.',
      'Label every syringe with drug, dose, diluent, route and time — no '
          'abbreviations.',
      'The person who draws it up gives it, or hands it over with a spoken '
          'read-back.',
      'Store oxytocin apart from look-alike ampoules, and keep it '
          'refrigerated where the product requires it.',
      'Carbetocin as a single-dose alternative where heat stability and '
          'single administration reduce the risk.',
    ],
    learningPoints: [
      'Route and rate are part of the dose. A correct number given the wrong '
          'way is still a medication error.',
      'Unlabelled syringes are the commonest single root cause in drug '
          'incidents in theatre and on labour ward.',
      'Sudden cardiovascular collapse after an oxytocic is not always '
          'amniotic fluid embolism — check what was actually given.',
    ],
    sources: [
      'WHO recommendations: uterotonics for the prevention of postpartum '
          'haemorrhage, 2018.',
      'RCOG Green-top Guideline 52 — Prevention and Management of Postpartum '
          'Haemorrhage.',
      'NPSA/NHS England alerts on injectable medicines and syringe labelling.',
      'MoHFW Guidelines for Prevention and Management of PPH; Indian Society '
          'of Anaesthesiologists guidance on safe injectable practice.',
    ],
  ),
  SafetyCase(
    id: 'case-escalation-delayed',
    title: 'The registrar who was told but did not come',
    category: SafetyCategory.delayedEscalation,
    presentation: 'A woman readmitted on day 4 after caesarean section with '
        'abdominal pain and vomiting, seen by a first-year doctor overnight.',
    timeline: [
      ('22:00', 'Admitted. Pulse 108, blood pressure 104/62, temperature '
          '37.8 °C. Analgesia and antiemetic given.'),
      ('01:00', 'Pulse 118. Documented as "settling, review in the morning".'),
      ('03:00', 'Pulse 126, blood pressure 92/50. Registrar telephoned and '
          'told "she is tachycardic but comfortable". Advice given by '
          'telephone to give fluids.'),
      ('05:00', 'Pulse 134, not passing urine. Registrar telephoned again; '
          'came to review.'),
      ('06:30', 'Taken to theatre. Faecal peritonitis from a bowel injury.'),
      ('Day 12', 'Discharged from intensive care after a stormy course.'),
    ],
    criticalEvent: 'Seven hours of documented deterioration managed by '
        'telephone advice, without anyone senior laying hands on her.',
    whatWentWrong: [
      'A track-and-trigger score was recorded but never totalled, so the '
          'threshold that should have compelled attendance was never crossed '
          'on paper.',
      'The word "comfortable" was allowed to outweigh a pulse of 126.',
      'Telephone advice was given and accepted as review.',
      'Each observation was read alone rather than as a trend across seven '
          'hours.',
      'The junior doctor did not feel able to insist, and no one asked them '
          'to escalate further.',
    ],
    contributingFactors: [
      'A single junior covering both the gynaecology ward and the labour '
          'ward.',
      'A steep hierarchy in which asking twice feels like a complaint.',
      'A registrar occupied in theatre with no one designated to cover the '
          'wards.',
      'Observations charted on paper with no automatic scoring.',
    ],
    warningSigns: [
      'A rising pulse across hours, whatever the individual value.',
      'Narrowing pulse pressure.',
      'Reduced urine output.',
      'Pain out of proportion, or requiring escalating analgesia.',
      'Vomiting and abdominal distension after caesarean.',
      'A nurse or junior who is worried and cannot say precisely why.',
    ],
    correctResponse: [
      'Calculate the early warning score every time, and act on the total.',
      'A score that triggers means a bedside review, not telephone advice.',
      'Escalate again if the picture does not improve — the second call is '
          'not a failure.',
      'Sepsis six where infection is possible.',
      'Erect chest and abdominal imaging, and early surgical opinion, for '
          'post-caesarean peritonism.',
      'Any member of staff may escalate over the head of the person who '
          'declined to come.',
    ],
    prevention: [
      'MEOWS or an equivalent chart, scored and totalled, on every '
          'obstetric and gynaecology inpatient.',
      'A written escalation policy naming who attends at which score, and in '
          'what time.',
      'An explicit route to bypass a colleague who does not respond, used '
          'without blame.',
      'Consultant availability made real rather than nominal overnight.',
      'Handover of any patient who triggered, even once, during the shift.',
    ],
    learningPoints: [
      'Telephone advice is not review. Confidential enquiries return to this '
          'sentence repeatedly.',
      'Tachycardia in a postoperative woman is the finding most often '
          'explained away and least often benign.',
      'The system must let the most junior person in the building bring the '
          'most senior to the bedside.',
      'Escalation policies that exist on paper and not in culture change '
          'nothing.',
    ],
    sources: [
      'MBRRACE-UK — Saving Lives, Improving Mothers\' Care.',
      'NICE NG51 — Sepsis: recognition, diagnosis and early management.',
      'RCOG Green-top Guideline 56 — Maternal Collapse in Pregnancy and the '
          'Puerperium.',
      'National Patient Safety Implementation Framework, MoHFW India; '
          'NABH standards on clinical escalation.',
    ],
  ),
  SafetyCase(
    id: 'case-eclampsia-headache',
    title: 'The headache treated as migraine',
    category: SafetyCategory.delayedRecognitionEclampsia,
    presentation: 'A primigravida at 37 weeks attended twice in three days '
        'with headache and vomiting, with a history of migraine recorded at '
        'booking.',
    timeline: [
      ('Day 1', 'Attended with headache. Blood pressure 148/94. Urine not '
          'tested. Discharged with analgesia and a diagnosis of migraine.'),
      ('Day 3, 09:00', 'Returned with headache and vomiting. Blood pressure '
          '156/98. Urinalysis 2+ protein. Bloods sent. Advised to wait for '
          'results.'),
      ('Day 3, 12:00', 'Reported flashing lights to a member of staff in the '
          'waiting area. Not recorded.'),
      ('Day 3, 13:20', 'Generalised tonic-clonic seizure in the waiting '
          'room.'),
      ('Day 3, 13:25', 'Magnesium sulphate given, airway secured, transferred '
          'to labour ward.'),
      ('Day 3, 15:10', 'Delivered by caesarean. Platelets 68, ALT 240 — HELLP '
          'syndrome.'),
    ],
    criticalEvent: 'An eclamptic seizure in a waiting area, in a woman with '
        'documented hypertension, proteinuria and visual symptoms.',
    whatWentWrong: [
      'A pre-existing diagnosis of migraine anchored the assessment and '
          'stopped further thought.',
      'Urine was not tested at the first attendance, which is the single '
          'cheapest test in the pathway.',
      'A second attendance with the same symptom was treated as a repeat '
          'rather than as escalation.',
      'Visual symptoms reported to a non-clinical member of staff were not '
          'passed on.',
      'She was left waiting for blood results without observation or '
          'treatment.',
    ],
    contributingFactors: [
      'Booking history reviewed once and then relied upon.',
      'Triage in an area with no clinical observation.',
      'Blood pressure readings in the 140s and 150s treated as '
          'unremarkable in a busy department.',
      'No system flagging a repeat attendance with the same complaint.',
    ],
    warningSigns: [
      'Headache in the second half of pregnancy that is new, severe, or '
          'different from her usual.',
      'Headache not relieved by simple analgesia.',
      'Visual disturbance — flashing lights, blurring, scotoma.',
      'Epigastric or right upper quadrant pain.',
      'Vomiting in late pregnancy without another explanation.',
      'Brisk reflexes and clonus.',
      'Any repeat attendance with the same symptom.',
    ],
    correctResponse: [
      'Blood pressure and urinalysis in every pregnant woman with a '
          'headache, every time.',
      'Full pre-eclampsia bloods, and observe her while they are processed.',
      'Antihypertensive treatment for a systolic of 160 or a diastolic of '
          '110, within an hour.',
      'Magnesium sulphate for eclampsia, and for severe pre-eclampsia with '
          'neurological signs.',
      'Deliver — it is the only definitive treatment.',
      'Continue magnesium for 24 hours after the last seizure or after '
          'delivery.',
    ],
    prevention: [
      'A standing rule that pregnancy plus headache equals blood pressure '
          'plus urinalysis, before any diagnosis is made.',
      'Never diagnose migraine in pregnancy for the first time without '
          'excluding pre-eclampsia.',
      'Flag repeat attendances automatically and require senior review.',
      'Teach reception and support staff that visual symptoms in pregnancy '
          'must be passed on immediately.',
      'Observed waiting areas for women awaiting pre-eclampsia bloods.',
    ],
    learningPoints: [
      'A known diagnosis is the most effective way to hide a new one.',
      'Eclampsia is still frequently preceded by symptoms that were '
          'reported and not acted on.',
      'The second attendance is the warning. Treat it as new information, '
          'not as reassurance.',
      'A urine dipstick costs almost nothing and is repeatedly the missing '
          'step.',
    ],
    sources: [
      'MBRRACE-UK — Saving Lives, Improving Mothers\' Care.',
      'NICE NG133 — Hypertension in pregnancy.',
      'RCOG Green-top Guideline 10A — Management of Severe Pre-eclampsia and '
          'Eclampsia.',
      'ISSHP classification and management of hypertensive disorders of '
          'pregnancy, 2018.',
      'MoHFW Guidelines for Management of Pregnancy Induced Hypertension; '
          'FOGSI GCPR on hypertensive disorders.',
    ],
  ),
  SafetyCase(
    id: 'case-ctg-baseline-drift',
    title: 'The trace everyone looked at and nobody read',
    category: SafetyCategory.ctgFailure,
    presentation: 'A woman in spontaneous labour at term with an oxytocin '
        'infusion for augmentation and a rising temperature.',
    timeline: [
      ('20:00', 'CTG commenced. Baseline 135, variability normal, no '
          'decelerations.'),
      ('22:00', 'Baseline 150. Recorded as "reassuring". Oxytocin increased.'),
      ('23:30', 'Baseline 162, reduced variability, shallow late '
          'decelerations. Temperature 37.9 °C. Recorded as "CTG satisfactory, '
          'continue".'),
      ('00:45', 'Fresh eyes review not performed. Contractions 6 in 10.'),
      ('01:30', 'Prolonged deceleration. Oxytocin stopped. Emergency '
          'caesarean called.'),
      ('02:05', 'Delivered. Cord arterial pH 6.94. Admitted for therapeutic '
          'hypothermia.'),
    ],
    criticalEvent: 'A baseline that rose by nearly 30 beats over three hours, '
        'each hourly reading recorded as normal because each was read alone.',
    whatWentWrong: [
      'The trace was assessed hourly and never compared with the trace three '
          'hours earlier.',
      'A rising baseline inside the normal range was called normal, when the '
          'trend was the finding.',
      'Maternal pyrexia and tachysystole were both present and neither was '
          'treated.',
      'Oxytocin was increased while the trace was deteriorating.',
      'No fresh-eyes review by a second clinician took place.',
    ],
    contributingFactors: [
      'Hourly documentation stickers that record a snapshot and invite '
          'snapshot thinking.',
      'Two women in labour with one midwife between them.',
      'A culture in which increasing oxytocin is the default response to slow '
          'progress.',
      'Maternal pyrexia attributed to epidural without considering '
          'chorioamnionitis.',
    ],
    warningSigns: [
      'A baseline rising progressively, even within 110–160.',
      'Reducing variability over successive hours.',
      'Decelerations appearing where there were none.',
      'Maternal pyrexia or tachycardia.',
      'Tachysystole — more than 5 contractions in 10 minutes.',
      'Any need to increase oxytocin in the presence of a changing trace.',
    ],
    correctResponse: [
      'Read the whole trace, from the beginning, against the clinical '
          'picture.',
      'Stop or reduce oxytocin when the trace changes.',
      'Treat the pyrexia and consider chorioamnionitis.',
      'Left lateral position, fluids, vaginal examination to exclude cord '
          'prolapse.',
      'Fresh-eyes review by a second clinician at least hourly.',
      'Escalate to a senior obstetrician, and consider delivery.',
    ],
    prevention: [
      'Mandatory structured review — DR C BRaVADO — with the previous hours '
          'in view.',
      'Fresh-eyes review built into the shift, not left to be requested.',
      'A rule that oxytocin is never increased while the trace is '
          'deteriorating.',
      'Regular multidisciplinary CTG training with real traces, including '
          'ones that ended badly.',
      'Paired cord gases on every delivery, so the feedback loop exists.',
    ],
    learningPoints: [
      'The trend is the finding. A trace read in one-hour slices will miss '
          'gradual hypoxia every time.',
      'A rising baseline within the normal range is often the first sign of '
          'infection or evolving hypoxia.',
      'Oxytocin has no reverse gear once damage is done — stop it early.',
      'Fresh eyes work only if the second clinician looks at the whole trace, '
          'not the last ten minutes.',
    ],
    sources: [
      'NICE NG229 — Fetal monitoring in labour.',
      'Ayres-de-Campos D et al. FIGO consensus guidelines on intrapartum '
          'fetal monitoring. Int J Gynecol Obstet 2015;131:13–24.',
      'RCOG — Each Baby Counts.',
      'FOGSI-ICOG GCPR — Intrapartum Fetal Surveillance; MoHFW Dakshata '
          'guidelines.',
    ],
  ),
  SafetyCase(
    id: 'case-decision-delivery',
    title: 'Thirty-eight minutes to theatre',
    category: SafetyCategory.delayedCaesarean,
    presentation: 'A category 1 caesarean called for a sustained fetal '
        'bradycardia in a woman with a working epidural.',
    timeline: [
      ('00:00', 'Bradycardia to 70. Conservative measures started.'),
      ('00:03', 'Decision for category 1 caesarean. Emergency call put out.'),
      ('00:09', 'Theatre occupied by an elective case that had overrun. No '
          'second theatre staffed overnight.'),
      ('00:16', 'Anaesthetist arrived; consent and transfer commenced.'),
      ('00:24', 'Arrived in theatre. Epidural topped up rather than '
          'converting to general anaesthesia.'),
      ('00:38', 'Delivered. Cord arterial pH 6.88.'),
    ],
    criticalEvent: 'Thirty-eight minutes from decision to delivery in a '
        'category 1 caesarean.',
    whatWentWrong: [
      'No second theatre was staffed, and the first was occupied by elective '
          'work running late at night.',
      'The category was called but the whole team did not act to that '
          'category — several steps proceeded at routine pace.',
      'Time was spent topping up an epidural when general anaesthesia would '
          'have been faster.',
      'Nobody was keeping and calling the time aloud.',
      'The neonatal team were informed late.',
    ],
    contributingFactors: [
      'Elective lists scheduled without protected emergency capacity.',
      'Single-theatre working overnight.',
      'Escalation to the consultant on call happened after the decision '
          'rather than with it.',
      'No rehearsed drill for the transfer itself, which took eight minutes.',
    ],
    warningSigns: [
      'A bradycardia not recovering by three minutes.',
      'Theatre occupied when an emergency is likely — a foreseeable state, '
          'not an accident.',
      'A team moving at normal pace after a category 1 call.',
      'Anyone asking "how long has it been?" and nobody knowing.',
    ],
    correctResponse: [
      'Call the category out loud, and have one person announce elapsed time '
          'every two minutes.',
      'Move to theatre while consenting and preparing — not afterwards.',
      'General anaesthesia where regional cannot be established fast enough.',
      'Category 1 target is 30 minutes; a bradycardia should aim well inside '
          'that.',
      'Alert the neonatal team at the moment of decision.',
      'Paired cord gases, and a debrief afterwards regardless of outcome.',
    ],
    prevention: [
      'Protected emergency theatre capacity at all hours, with staff '
          'identified by name each shift.',
      'Regular multidisciplinary drills including the physical transfer.',
      'Elective lists that finish with emergency cover intact.',
      'Audit decision-to-delivery interval continuously, and review every '
          'breach.',
      'A designated timekeeper role in every obstetric emergency.',
    ],
    learningPoints: [
      'Decision-to-delivery interval is a property of the system, not of the '
          'obstetrician who made the decision.',
      'The transfer to theatre is usually the longest single segment and the '
          'least rehearsed.',
      'Calling category 1 changes nothing unless everyone changes pace.',
      'A theatre occupied by elective work at 2 am is a decision someone made '
          'earlier that day.',
    ],
    sources: [
      'RCOG/RCOA Classification of Urgency of Caesarean Section.',
      'NICE NG192 — Caesarean birth.',
      'RCOG — Each Baby Counts.',
      'MoHFW LaQshya guidelines on labour room quality improvement; FOGSI '
          'GCPR on caesarean section.',
    ],
  ),
  SafetyCase(
    id: 'case-language-barrier',
    title: 'The interpreter who was her husband',
    category: SafetyCategory.communicationFailure,
    presentation: 'A woman with limited proficiency in the language of the '
        'unit, attending for induction of labour, whose husband interpreted '
        'throughout.',
    timeline: [
      ('Day 1', 'Consent for induction taken with the husband interpreting. '
          'She signed.'),
      ('Day 1, evening', 'Reported pain to a midwife by gesture. Husband, '
          'asked to interpret, said she was "fine".'),
      ('Day 2, 02:00', 'Found distressed. A telephone interpreter was '
          'obtained.'),
      ('Day 2, 02:20', 'Through the interpreter she described severe '
          'continuous abdominal pain that had been present for six hours, and '
          'said she had not understood that she could ask for pain relief.'),
      ('Day 2, 02:40', 'Examination and CTG showed a picture consistent with '
          'abruption. Delivered by emergency caesarean.'),
    ],
    criticalEvent: 'Six hours of severe pain not communicated, because the '
        'only route to the clinical team ran through a family member.',
    whatWentWrong: [
      'A family member was used as interpreter for consent and for clinical '
          'assessment.',
      'Consent was recorded as obtained when it could not be shown she '
          'understood.',
      'Non-verbal distress was noted and not investigated.',
      'No professional interpreting service was offered until the middle of '
          'the night.',
      'Pain relief options were never conveyed in a language she read or '
          'spoke.',
    ],
    contributingFactors: [
      'Interpreting services perceived as slow or unavailable out of hours.',
      'An assumption that a spouse is a neutral conduit.',
      'Written information available in only one language.',
      'Staff discomfort in insisting on an interpreter when the family '
          'declines one.',
    ],
    warningSigns: [
      'A woman who does not speak directly to staff.',
      'Answers that come only through a relative.',
      'Non-verbal signs of pain or distress that do not match what is '
          'reported.',
      'Consent obtained quickly for a complex procedure.',
      'A relative who answers before she has spoken.',
    ],
    correctResponse: [
      'Use a professional interpreter for consent and for every clinical '
          'assessment.',
      'Speak to her, look at her, and allow time for the interpretation.',
      'Offer at least one conversation without family present.',
      'Assess pain with a tool that does not depend on shared language.',
      'Document which interpreter was used and how.',
    ],
    prevention: [
      'Telephone interpreting available 24 hours and known to every member '
          'of staff.',
      'A rule that family members do not interpret for consent, capacity, '
          'safeguarding or clinical assessment.',
      'Written information and consent forms in the languages the unit '
          'actually serves.',
      'Pictorial pain scales at every bedside.',
      'Record language and interpreting need at booking, and act on it.',
    ],
    learningPoints: [
      'An interpreter with an interest in the answer is not an interpreter.',
      'In multilingual settings this is not an occasional problem — it is a '
          'daily one, and it is a recurring theme in maternal death enquiries '
          'concerning migrant women.',
      'Consent signed without understanding is not consent.',
      'Pain that is not asked about in a language she speaks will not be '
          'reported.',
    ],
    sources: [
      'MBRRACE-UK — Saving Lives, Improving Mothers\' Care, chapters on '
          'women with language barriers.',
      'GMC — Decision making and consent, 2020.',
      'WHO recommendations: intrapartum care for a positive childbirth '
          'experience, 2018.',
      'MoHFW Guidelines on Respectful Maternity Care; NABH standards on '
          'patient rights and informed consent.',
    ],
  ),
  SafetyCase(
    id: 'case-handover-lost',
    title: 'The plan that did not survive the shift change',
    category: SafetyCategory.handoverFailure,
    presentation: 'A woman at 39 weeks admitted with a scarred uterus for '
        'induction, with a documented plan for continuous monitoring and no '
        'oxytocin.',
    timeline: [
      ('08:00', 'Consultant plan documented: previous two caesareans, '
          'continuous CTG, no oxytocin augmentation, low threshold for '
          'caesarean.'),
      ('20:00', 'Night shift handover. Twelve women handed over in eleven '
          'minutes. The plan was summarised as "for induction".'),
      ('23:00', 'Slow progress. Oxytocin commenced by a doctor who had not '
          'read the notes.'),
      ('01:15', 'Sudden fetal bradycardia, constant abdominal pain, loss of '
          'station.'),
      ('01:40', 'Laparotomy. Uterine rupture confirmed.'),
    ],
    criticalEvent: 'Oxytocin started in a woman with two previous caesareans, '
        'against an explicit written plan that was not handed over.',
    whatWentWrong: [
      'A twelve-patient handover in eleven minutes conveyed labels, not '
          'plans.',
      'The critical instruction was a negative — "no oxytocin" — and '
          'negatives are the first thing lost in a summary.',
      'The plan was in the notes but not on the board, the chart, or the '
          'handover sheet.',
      'The prescribing doctor did not read the antenatal record.',
      'Nothing in the drug chart flagged the contraindication.',
    ],
    contributingFactors: [
      'Handover held in a corridor with interruptions.',
      'No structured handover tool.',
      'High-acuity unit with staff arriving mid-handover.',
      'A culture in which augmentation for slow progress is near-automatic.',
    ],
    warningSigns: [
      'Any handover that does not state the specific plan for a high-risk '
          'woman.',
      'A previous caesarean not mentioned in the first sentence about her.',
      'A doctor prescribing without the notes in front of them.',
      'Constant pain between contractions, breakthrough pain through a '
          'working epidural, or loss of station.',
    ],
    correctResponse: [
      'Structured handover for every woman: situation, background, '
          'assessment, recommendation, and the explicit plan.',
      'State prohibitions positively and prominently — "uterine scar, '
          'oxytocin contraindicated".',
      'Read the plan before prescribing anything in labour.',
      'Suspect rupture on constant pain plus bradycardia and go to theatre.',
    ],
    prevention: [
      'A written handover sheet carrying the plan, not just the diagnosis.',
      'High-risk plans displayed on the labour ward board and on the front '
          'of the notes.',
      'Alerts in the prescribing record for a scarred uterus.',
      'Protected, uninterrupted handover time, with a board round for '
          'high-risk women.',
      'A rule that any change to a consultant plan is discussed with a '
          'consultant.',
    ],
    learningPoints: [
      'Handover is a clinical procedure with a failure rate, and it deserves '
          'the same rigour as any other.',
      'Instructions phrased as prohibitions are the most likely to be lost.',
      'A plan that lives only in the notes will not reach the person who '
          'needs it at 23:00.',
      'Uterine rupture presents as pain that does not go away between '
          'contractions.',
    ],
    sources: [
      'RCOG Green-top Guideline 45 — Birth After Previous Caesarean Birth.',
      'RCOG — Improving Patient Safety: Risk Management for Maternity and '
          'Gynaecology.',
      'WHO Patient Safety Solutions — Communication During Patient Handovers.',
      'MoHFW LaQshya guidelines; NABH standards on clinical handover; FOGSI '
          'GCPR on VBAC.',
    ],
  ),
  SafetyCase(
    id: 'case-blood-loss-undocumented',
    title: 'The estimate that nobody wrote down',
    category: SafetyCategory.documentationFailure,
    presentation: 'A woman who had a postpartum haemorrhage in the delivery '
        'room, transferred to the postnatal ward the same evening.',
    timeline: [
      ('Delivery', 'Estimated blood loss recorded as "moderate". No volume '
          'documented. Uterotonics given but not charted.'),
      ('+2 h', 'Transferred to the postnatal ward. Verbal handover mentioned '
          '"a bit of a bleed".'),
      ('+6 h', 'Felt faint on standing. Pulse 112. Attributed to fatigue.'),
      ('+9 h', 'Collapsed on the way to the bathroom. Haemoglobin 5.8 g/dL.'),
      ('+10 h', 'Transfused four units. Ongoing bleeding from atony '
          'controlled with a balloon.'),
    ],
    criticalEvent: 'A significant haemorrhage that could not be recognised as '
        'significant because it was never quantified anywhere.',
    whatWentWrong: [
      'Blood loss was described in a word rather than measured in '
          'millilitres.',
      'Uterotonics given were not charted, so the postnatal team did not know '
          'she had needed them.',
      'The postnatal team had no baseline against which to judge her '
          'symptoms.',
      'Tachycardia at six hours was attributed to fatigue without a '
          'haemoglobin.',
      'No postnatal observations schedule was set for a woman who had bled.',
    ],
    contributingFactors: [
      'Visual estimation of blood loss, which systematically underestimates.',
      'A busy delivery room with documentation deferred to later.',
      'Separate delivery and postnatal records.',
      'Postnatal wards with high patient-to-staff ratios.',
    ],
    warningSigns: [
      'Blood loss described in adjectives rather than numbers.',
      'Uterotonics given beyond routine active management.',
      'Any tachycardia in the postnatal period.',
      'Dizziness or faintness on standing.',
      'A soft or high uterus on palpation.',
      'Shock index — pulse divided by systolic pressure — of 0.9 or above.',
    ],
    correctResponse: [
      'Weigh swabs and use a calibrated drape. Record a number.',
      'Chart every uterotonic at the time it is given.',
      'Set an explicit observation schedule for any woman who bled.',
      'Check haemoglobin, and act on symptoms rather than waiting for it.',
      'Palpate the uterus and act on atony immediately.',
    ],
    prevention: [
      'Calibrated drapes at every birth, and swab weighing as routine.',
      'A single record that follows her from delivery room to postnatal '
          'ward.',
      'A defined threshold that triggers a written postnatal plan.',
      'Shock index charted alongside routine observations.',
      'Audit the difference between estimated and measured loss, and show '
          'the unit its own numbers.',
    ],
    learningPoints: [
      'What is not measured cannot be handed over, and what is not handed '
          'over cannot be acted on.',
      'Visual estimation understates loss by a large and predictable margin, '
          'and worst at the volumes that matter.',
      'Young healthy women compensate until they do not. The pulse rises '
          'before the pressure falls.',
      'Documentation is not administration; here it was the clinical failure '
          'itself.',
    ],
    sources: [
      'RCOG Green-top Guideline 52 — Prevention and Management of Postpartum '
          'Haemorrhage.',
      'Gallos I et al. E-MOTIVE. N Engl J Med 2023;389:11–21.',
      'WHO recommendations on prevention and treatment of postpartum '
          'haemorrhage.',
      'MoHFW Guidelines for Prevention and Management of PPH; Anaemia Mukt '
          'Bharat; FOGSI GCPR on PPH.',
    ],
  ),
  SafetyCase(
    id: 'case-bladder-injury',
    title: 'The bladder found on day three',
    category: SafetyCategory.surgicalComplication,
    presentation: 'A woman undergoing repeat caesarean section with dense '
        'adhesions from two previous operations.',
    timeline: [
      ('Operation', 'Difficult dissection of the bladder from the lower '
          'segment. Bleeding controlled. No cystoscopy performed. Catheter '
          'removed at 12 hours.'),
      ('Day 1', 'Passing small volumes of urine. Abdominal discomfort '
          'attributed to surgery.'),
      ('Day 2', 'Abdominal distension, minimal urine output, rising '
          'creatinine.'),
      ('Day 3', 'Clear fluid leaking from the wound. Creatinine of the fluid '
          'far exceeded serum.'),
      ('Day 3', 'Return to theatre. A bladder injury was found and repaired. '
          'Catheter for 14 days.'),
    ],
    criticalEvent: 'An unrecognised bladder injury during a difficult repeat '
        'caesarean, diagnosed three days later.',
    whatWentWrong: [
      'The bladder was not tested at the end of a difficult dissection.',
      'The catheter was removed early in a woman at high risk of urinary '
          'tract injury.',
      'Oliguria and distension were attributed to normal postoperative '
          'recovery.',
      'Rising creatinine was noted without asking why.',
      'Clear wound fluid was not tested for creatinine until day 3.',
    ],
    contributingFactors: [
      'Dense adhesions, which raise the risk and also make recognition '
          'harder.',
      'Operating late at night with a tired team.',
      'No routine practice of bladder testing after difficult dissection.',
      'Postoperative review by staff who had not been present at the '
          'operation.',
    ],
    warningSigns: [
      'Difficult bladder dissection, or bleeding from the bladder base.',
      'Blood-stained urine in the catheter bag during surgery.',
      'Gas in the catheter bag during laparoscopy.',
      'Low urine output after surgery.',
      'Abdominal distension, ileus, or persistent pain.',
      'Rising creatinine, or clear fluid from the wound or vagina.',
    ],
    correctResponse: [
      'Where injury is suspected, fill the bladder with dyed saline and look, '
          'or perform cystoscopy.',
      'Repair in two layers with absorbable suture, and confirm it is '
          'watertight.',
      'Leave the catheter in for 7–14 days depending on the site and '
          'difficulty of repair.',
      'Involve urology for trigonal or ureteric involvement.',
      'Send any suspicious fluid for creatinine — the answer is immediate.',
    ],
    prevention: [
      'Fill the bladder before starting where adhesions are expected, so the '
          'upper border is visible.',
      'Sharp dissection in the correct plane rather than blunt separation.',
      'A low threshold for testing at the end of a difficult case — an '
          'injury found now is a repair, found later it is a fistula.',
      'Senior presence for repeat caesarean with known dense adhesions.',
      'Consider preoperative ureteric stents where placenta accreta '
          'spectrum is suspected.',
    ],
    learningPoints: [
      'The complication is not the error. Failing to look for it after a '
          'difficult dissection is.',
      'An injury recognised during the operation is a simple repair; one '
          'recognised on day 3 risks fistula and reoperation.',
      'Clear fluid from a wound after pelvic surgery is urine until '
          'creatinine says otherwise.',
      'Removing the catheter early after a difficult dissection removes the '
          'one thing that would have told you.',
    ],
    sources: [
      'RCOG Green-top Guideline 27a — Placenta Praevia and Placenta Accreta.',
      'NICE NG192 — Caesarean birth.',
      'RCOG Consent Advice — Caesarean section, including bladder and '
          'ureteric injury.',
      'FOGSI GCPR — Caesarean Section; Urological Society of India guidance '
          'on iatrogenic urinary tract injury.',
    ],
  ),
  SafetyCase(
    id: 'case-retained-swab',
    title: 'The count that was called correct',
    category: SafetyCategory.retainedProducts,
    presentation: 'A woman who had a postpartum haemorrhage after vaginal '
        'delivery, managed with vaginal packing in the delivery room and '
        'later taken to theatre.',
    timeline: [
      ('22:40', 'Vaginal packing inserted in the delivery room during an '
          'emergency. Swabs from a separate pack, not entered on the theatre '
          'count.'),
      ('23:20', 'Taken to theatre. Count started fresh in theatre. Declared '
          'correct at the end.'),
      ('Day 2', 'Discharged.'),
      ('Day 9', 'Returned with offensive vaginal discharge and fever.'),
      ('Day 9', 'Examination under anaesthesia found a retained vaginal pack. '
          'Removed; treated for endometritis.'),
    ],
    criticalEvent: 'A vaginal pack inserted during an emergency outside '
        'theatre, never entered on any count, and left in place for nine '
        'days.',
    whatWentWrong: [
      'Items used in an emergency outside theatre were not counted at all.',
      'The theatre count began fresh, so it was correct and meaningless.',
      'No documentation recorded that a pack had been inserted, or when it '
          'was due for removal.',
      'Discharge occurred without an examination.',
      'No handover mentioned the pack.',
    ],
    contributingFactors: [
      'An emergency in a room without a counting protocol.',
      'Different staff at insertion and removal.',
      'Multiple changes of personnel through the night.',
      'A belief that counting applies only to theatre.',
    ],
    warningSigns: [
      'Any pack or swab inserted outside theatre.',
      'A count declared correct without accounting for items brought from '
          'elsewhere.',
      'Offensive discharge, fever, or pelvic pain after delivery.',
      'Discharge planned without a documented removal.',
    ],
    correctResponse: [
      'Count and document every swab and pack wherever it is used, '
          'including the delivery room.',
      'Record insertion, the number of items, and the intended removal time, '
          'prominently.',
      'Use radio-opaque swabs, and image if a count is uncertain.',
      'Examine before discharge where anything was inserted.',
      'Treat suspected retained material as an examination under '
          'anaesthesia, not a bedside look.',
    ],
    prevention: [
      'One count that spans the whole episode, not one that restarts in '
          'theatre.',
      'A visible sticker or wristband when a pack is in situ, with the '
          'removal time.',
      'Radio-opaque materials only, everywhere.',
      'Retained foreign object treated as a never event with mandatory '
          'reporting and review.',
      'Include the delivery room in the surgical safety checklist culture.',
    ],
    learningPoints: [
      'A correct count only means the items in that count are accounted for.',
      'Emergencies outside theatre are where retained items originate, '
          'because that is where counting protocols do not reach.',
      'Insertion without a documented removal plan is the actual error.',
      'Anyone can ask "is there a pack in?" before discharge, and someone '
          'should.',
    ],
    sources: [
      'WHO Surgical Safety Checklist and Guidelines for Safe Surgery.',
      'NHS England Never Events policy and framework — retained foreign '
          'object post procedure.',
      'RCOG Green-top Guideline 52 — Postpartum Haemorrhage.',
      'NABH accreditation standards on surgical counts and never events; '
          'MoHFW LaQshya labour room standards.',
    ],
  ),
  SafetyCase(
    id: 'case-wrong-blood',
    title: 'The unit that was hung without a check',
    category: SafetyCategory.wrongBloodProduct,
    presentation: 'A woman bleeding after caesarean section, with two women '
        'in adjacent theatres both receiving blood.',
    timeline: [
      ('01:05', 'Major haemorrhage protocol activated. Cross-matched units '
          'collected for two patients simultaneously.'),
      ('01:12', 'A unit was hung. The bedside check was performed by one '
          'person, verbally, while assisting at the operation.'),
      ('01:20', 'Sudden hypotension, tachycardia, and oozing from the wound '
          'and cannula sites. Transfusion continued for a further two '
          'minutes, attributed to surgical bleeding.'),
      ('01:24', 'Haemoglobinuria noted in the catheter bag. Transfusion '
          'stopped.'),
      ('01:30', 'Acute haemolytic reaction managed. She required intensive '
          'care and had transient renal impairment.'),
    ],
    criticalEvent: 'An ABO-incompatible unit transfused because the bedside '
        'check was performed by one distracted person.',
    whatWentWrong: [
      'The final bedside check — the only step that catches this error — was '
          'performed by one person, not two, and while doing something else.',
      'Blood for two patients was collected and stored together.',
      'The first signs were attributed to ongoing surgical bleeding.',
      'The transfusion continued after the reaction had begun.',
    ],
    contributingFactors: [
      'Two simultaneous major haemorrhages in one theatre suite.',
      'An anaesthetised patient, who cannot report the symptoms that would '
          'otherwise raise alarm.',
      'Verbal identity checking rather than checking against the wristband.',
      'Fridges and trolleys shared between cases.',
    ],
    warningSigns: [
      'Blood for more than one patient in the same place at the same time.',
      'A bedside check by a single person, or performed away from the '
          'bedside.',
      'Unexplained hypotension, tachycardia or fever during transfusion.',
      'Oozing from cannula sites — disseminated intravascular coagulation.',
      'Dark urine or haemoglobinuria.',
      'In an awake patient: loin pain, chest pain, rigors, or a sense of '
          'dread.',
    ],
    correctResponse: [
      'Stop the transfusion immediately and keep the line open with saline.',
      'Check the unit against the wristband there and then.',
      'Call for senior anaesthetic help; support blood pressure and urine '
          'output.',
      'Send the unit, the giving set and fresh samples back to the '
          'laboratory.',
      'Monitor for renal failure and disseminated intravascular '
          'coagulation.',
      'Report through the haemovigilance system.',
    ],
    prevention: [
      'Two-person, positive, bedside identity check against the wristband — '
          'no exceptions for emergencies.',
      'Only one patient\'s blood in the room at any time.',
      'Electronic identification where available.',
      'Group O RhD-negative emergency units for immediate need, so no one '
          'has to rush a check.',
      'Regular transfusion drills within major haemorrhage training.',
    ],
    learningPoints: [
      'The bedside check is the last and only barrier. Every other step is '
          'clerical; this one is clinical.',
      'ABO-incompatible transfusion is overwhelmingly a bedside '
          'identification failure, not a laboratory one.',
      'Under anaesthesia the patient cannot tell you, so hypotension and '
          'oozing must be considered as a reaction, not only as surgery.',
      'Emergency is exactly when the check is skipped and exactly when it '
          'matters.',
    ],
    sources: [
      'Serious Hazards of Transfusion (SHOT) annual reports.',
      'British Society for Haematology — Guideline on the Administration of '
          'Blood Components.',
      'RCOG Green-top Guideline 47 — Blood Transfusion in Obstetrics.',
      'National Blood Transfusion Council of India — Standards for Blood '
          'Banks and Transfusion Services; NACO haemovigilance guidance; '
          'Haemovigilance Programme of India.',
    ],
  ),
];
