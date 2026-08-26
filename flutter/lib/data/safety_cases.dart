import '../models/safety_case.dart';
import 'safety_cases_2.dart';

/// Anonymised composite cases. None describes an identifiable patient.
const _core = <SafetyCase>[
  SafetyCase(
    id: 'case-pph-drape',
    title: 'The blood loss nobody measured',
    category: SafetyCategory.delayedRecognitionPph,
    presentation: 'A 27-year-old para 3 delivered spontaneously at term after '
        'a four-hour labour augmented with oxytocin. Blood loss at delivery '
        'was recorded as "moderate".',
    timeline: [
      ('14:10', 'Spontaneous vaginal delivery. Oxytocin 10 IU IM given.'),
      ('14:25', 'Placenta delivered complete. Loss estimated visually at '
          '300 mL. Pad changed.'),
      ('14:50', 'Pulse 104, blood pressure 118/70. Recorded, not escalated.'),
      ('15:20', 'Further pad change. Loss "moderate". Pulse 116, blood '
          'pressure 106/62.'),
      ('15:45', 'Woman feels faint on sitting. Pulse 128, blood pressure '
          '84/50.'),
      ('15:50', 'Emergency call. Uterus atonic. Estimated cumulative loss on '
          'weighing swabs: 2100 mL.'),
    ],
    criticalEvent: 'Two litres of blood were lost across ninety minutes '
        'without anyone recognising it, because each individual pad change '
        'looked unremarkable and none of it was measured.',
    whatWentWrong: [
      'Blood loss was estimated visually rather than measured with a '
          'calibrated drape or weighed swabs.',
      'Loss was recorded as separate episodes and never summed.',
      'A rising pulse with a falling blood pressure was documented three times '
          'and acted on once.',
      'Shock index reached 0.98 at 14:50 and 1.52 at 15:45; it was never '
          'calculated.',
    ],
    contributingFactors: [
      'Busy labour ward with a shift handover at 15:00.',
      'No calibrated drape available on the unit.',
      'Observations charted on paper without a track-and-trigger score.',
      'The woman was well and talking, which was read as reassurance.',
    ],
    warningSigns: [
      'Tachycardia preceding any fall in blood pressure.',
      'Repeated pad changes described qualitatively.',
      'Augmented labour and high parity — both atony risk factors.',
      'Feeling faint on sitting up, which is a late sign and was the first one '
          'acted upon.',
    ],
    correctResponse: [
      'Use a calibrated drape from delivery in every woman, not only those '
          'considered high risk.',
      'Weigh swabs and sum cumulative loss on a single running total.',
      'Calculate shock index on every set of observations after delivery — HR '
          'divided by systolic pressure, abnormal at 0.9.',
      'Escalate on the trend, not on a single reading.',
      'Give the whole E-MOTIVE bundle at once rather than sequentially.',
    ],
    prevention: [
      'Calibrated drapes as standard for every birth.',
      'A postpartum track-and-trigger chart that calculates shock index.',
      'A single cumulative loss total rather than episodic estimates.',
      'Handover protocol that explicitly transfers running blood loss.',
    ],
    learningPoints: [
      'Visual estimation understates blood loss by 30–50%, and the error grows '
          'as the loss grows.',
      'A young woman compensates until she does not. Blood pressure is a late '
          'sign.',
      'Loss recorded in episodes is loss that never gets added up.',
      'The E-MOTIVE trial reduced severe haemorrhage by 60% largely by '
          'measuring loss objectively.',
    ],
    sources: [
      'Gallos I et al. E-MOTIVE trial. N Engl J Med 2023;389:11–21.',
      'MBRRACE-UK — Saving Lives, Improving Mothers\' Care.',
      'RCOG Green-top Guideline 52.',
      'MoHFW Government of India — Maternal Death Surveillance and Response '
          'guidelines; LaQshya labour room quality standards.',
    ],
  ),
  SafetyCase(
    id: 'case-methylergometrine',
    title: 'The uterotonic that was contraindicated',
    category: SafetyCategory.medicationError,
    presentation: 'A 31-year-old primigravida with pre-eclampsia, on '
        'labetalol, delivered at 37 weeks. Her blood pressure on admission was '
        '158/104.',
    timeline: [
      ('02:40', 'Spontaneous vaginal delivery. Oxytocin 10 IU IM given.'),
      ('02:55', 'Brisk bleeding, uterus poorly contracted.'),
      ('02:58', 'Methylergometrine 0.2 mg IM given by the attending midwife '
          'as the next drug on the ward protocol card.'),
      ('03:10', 'Blood pressure 196/118. Severe headache.'),
      ('03:18', 'Generalised tonic-clonic seizure.'),
    ],
    criticalEvent: 'An ergot alkaloid was given to a woman with pre-eclampsia, '
        'precipitating a hypertensive crisis and eclamptic seizure.',
    whatWentWrong: [
      'Methylergometrine is absolutely contraindicated in hypertension and '
          'pre-eclampsia. It was given as the routine second-line uterotonic.',
      'The ward protocol card listed the uterotonic ladder without listing '
          'contraindications alongside it.',
      'Her blood pressure was not checked before the drug was given.',
      'No magnesium sulphate had been started despite severe-range '
          'hypertension on admission.',
    ],
    contributingFactors: [
      'Night shift, single midwife, obstetrician in theatre.',
      'The protocol card was designed for speed and omitted contraindications.',
      'Pre-eclampsia was documented in the notes but not on the delivery '
          'summary the midwife was working from.',
    ],
    warningSigns: [
      'Documented pre-eclampsia and severe-range hypertension on admission.',
      'Already on an antihypertensive.',
      'Magnesium sulphate not commenced despite meeting criteria.',
    ],
    correctResponse: [
      'Check the blood pressure before giving any uterotonic beyond oxytocin.',
      'Use carboprost as the second-line agent in hypertensive disease, unless '
          'she is asthmatic.',
      'Misoprostol 800 µg sublingual is a further alternative.',
      'Start magnesium sulphate for severe pre-eclampsia before delivery, not '
          'after a seizure.',
    ],
    prevention: [
      'Print contraindications on the uterotonic protocol card beside every '
          'drug.',
      'Flag pre-eclampsia prominently on the intrapartum record.',
      'Build the contraindication into the drug chart or electronic '
          'prescribing.',
      'Regular skills drills that include choosing between uterotonics rather '
          'than reciting them in order.',
    ],
    learningPoints: [
      'A uterotonic ladder printed without its contraindications is an '
          'accident waiting to happen.',
      'Methylergometrine: contraindicated in hypertension. Carboprost: '
          'contraindicated in asthma. Both are absolute.',
      'Magnesium sulphate is not an antihypertensive and does not replace one — '
          'but it should have been running.',
      'The drug given in an emergency is the one on the card. Get the card '
          'right.',
    ],
    sources: [
      'RCOG Green-top Guideline 52.',
      'MBRRACE-UK confidential enquiry themes on medication safety.',
      'FOGSI GCPR — Hypertensive Disorders of Pregnancy.',
      'MoHFW Government of India — Maternal Death Surveillance and Response.',
    ],
  ),
  SafetyCase(
    id: 'case-sepsis-rr',
    title: 'The respiratory rate nobody charted',
    category: SafetyCategory.delayedRecognitionSepsis,
    presentation: 'A 24-year-old readmitted on day 4 after caesarean section '
        'with abdominal pain and feeling generally unwell. Temperature 37.4 °C.',
    timeline: [
      ('09:00', 'Admitted. Pulse 112, blood pressure 108/64, temperature '
          '37.4 °C. Respiratory rate not recorded.'),
      ('11:30', 'Reviewed. "Looks unwell but observations stable." Oral '
          'antibiotics started.'),
      ('14:00', 'Pulse 124. Respiratory rate not recorded. Passed small '
          'amount of urine.'),
      ('17:30', 'Confused and drowsy. Respiratory rate finally counted at 32. '
          'Blood pressure 82/44.'),
      ('17:45', 'Sepsis Six commenced. Lactate 5.8 mmol/L. Group A '
          'Streptococcus subsequently grown from blood cultures.'),
    ],
    criticalEvent: 'Eight and a half hours passed between arrival and the '
        'first respiratory rate, by which time she was in septic shock.',
    whatWentWrong: [
      'Respiratory rate — the earliest and most sensitive sign of '
          'deterioration — was never counted until she was obtunded.',
      'Absence of fever was read as absence of sepsis. Hypothermia and '
          'normothermia are more ominous than pyrexia.',
      'Oral rather than intravenous antibiotics, and well outside the first '
          'hour.',
      'MEOWS chart was in the notes but incompletely filled.',
      'Tachycardia of 112 rising to 124 was documented and not acted upon.',
    ],
    contributingFactors: [
      'Respiratory rate is the observation most often omitted on busy wards.',
      'A young, previously well woman who was still talking.',
      'Postoperative pain was assumed to explain the tachycardia.',
      'No senior review until she deteriorated visibly.',
    ],
    warningSigns: [
      'Persistent and rising tachycardia.',
      'Reduced urine output.',
      '"Looks unwell" recorded by an experienced nurse — a documented gestalt '
          'that carries real predictive weight.',
      'Recent surgery, which is a portal of entry.',
    ],
    correctResponse: [
      'Count and record the respiratory rate on every set of observations.',
      'Complete the MEOWS chart and act on the trigger.',
      'Sepsis Six within one hour: oxygen, cultures, intravenous antibiotics, '
          'fluids, lactate, urine output.',
      'Add clindamycin where Group A streptococcal infection is possible — it '
          'suppresses toxin production.',
      'Senior review for any woman whose observations trigger, whatever her '
          'appearance.',
    ],
    prevention: [
      'Make respiratory rate a mandatory field that cannot be left blank.',
      'Audit MEOWS completion, not just its presence in the notes.',
      'Educate that afebrile sepsis is commoner in obstetrics than febrile '
          'sepsis in the deteriorating patient.',
      'Low threshold for intravenous antibiotics in postoperative readmission.',
    ],
    learningPoints: [
      'Respiratory rate is the vital sign that changes first and is recorded '
          'least.',
      'Group A Streptococcus remains a leading cause of maternal sepsis death '
          'and can kill within hours.',
      'Young women compensate. By the time the blood pressure falls, the '
          'reserve has gone.',
      '"Looks unwell" from an experienced clinician is data, and should be '
          'escalated as such.',
    ],
    sources: [
      'RCOG Green-top Guideline 64b — Bacterial Sepsis following Pregnancy.',
      'NICE NG51 — Sepsis.',
      'MBRRACE-UK — Saving Lives, Improving Mothers\' Care.',
      'FOGSI GCPR — Maternal Sepsis; MoHFW Maternal Death Surveillance and '
          'Response.',
    ],
  ),
  SafetyCase(
    id: 'case-vte-omitted',
    title: 'The prophylaxis that was never restarted',
    category: SafetyCategory.vteFailure,
    presentation: 'A 36-year-old with BMI 34, para 2, delivered by emergency '
        'caesarean in labour after a prolonged induction, complicated by a '
        '1300 mL postpartum haemorrhage.',
    timeline: [
      ('Day 0', 'Emergency caesarean. Enoxaparin withheld appropriately '
          'because of active bleeding.'),
      ('Day 1', 'Bleeding settled. Enoxaparin not prescribed — the drug chart '
          'entry from before surgery had been crossed off.'),
      ('Day 3', 'Discharged. Discharge summary listed no anticoagulant.'),
      ('Day 11', 'Presented to the emergency department with pleuritic chest '
          'pain and breathlessness. CT pulmonary angiogram confirmed bilateral '
          'pulmonary emboli.'),
    ],
    criticalEvent: 'Thromboprophylaxis was correctly withheld during active '
        'bleeding and then never restarted, and the omission survived '
        'discharge.',
    whatWentWrong: [
      'No system prompted review of the withheld dose once bleeding stopped.',
      'The VTE risk assessment was completed on admission and never repeated '
          'after delivery, despite the score rising substantially.',
      'Her postnatal score was at least 6 — age over 35, BMI above 30, '
          'emergency caesarean in labour, prolonged labour, haemorrhage over '
          'a litre.',
      'The discharge summary was not cross-checked against the risk '
          'assessment.',
    ],
    contributingFactors: [
      'A crossed-off drug chart entry reads as a decision rather than as a '
          'pending action.',
      'VTE assessment treated as an admission task rather than a repeated one.',
      'Discharge completed by a clinician who had not been involved in the '
          'delivery.',
    ],
    warningSigns: [
      'Every one of her risk factors was documented somewhere in the notes.',
      'The withheld dose was never given an explicit review time.',
    ],
    correctResponse: [
      'Reassess VTE risk after every delivery, not only at booking.',
      'When withholding a dose, record the time at which the decision will be '
          'reviewed.',
      'Restart 6–12 hours after caesarean once haemostasis is secure, and at '
          'least 4 hours after epidural catheter removal.',
      'Continue for at least 10 days postnatally where the score is 2 or more, '
          'and for 6 weeks where it is high.',
      'Cross-check the discharge summary against the risk assessment.',
    ],
    prevention: [
      'Mandatory postnatal VTE reassessment before the discharge summary can '
          'be completed.',
      'Electronic prescribing that flags a withheld dose for review rather '
          'than cancelling it.',
      'Haemorrhage itself raises the score — build that into the chart.',
      'Audit the proportion of eligible women discharged on prophylaxis.',
    ],
    learningPoints: [
      'Thromboembolism remains a leading direct cause of maternal death, and '
          'is the one most reliably prevented by a checklist.',
      'A correctly withheld dose becomes an error the moment nobody schedules '
          'its review.',
      'Postpartum haemorrhage both delays prophylaxis and increases the need '
          'for it.',
      'Discharge is the commonest point at which prophylaxis is lost.',
    ],
    sources: [
      'RCOG Green-top Guideline 37a.',
      'MBRRACE-UK — Saving Lives, Improving Mothers\' Care.',
      'FOGSI GCPR — Thromboprophylaxis in Obstetrics and Gynaecology.',
    ],
  ),
];


/// Every §56 case, core and the remaining categories.
List<SafetyCase> get kSafetyCases => [..._core, ...kSafetyCases2];
