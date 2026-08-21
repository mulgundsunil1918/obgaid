import '../models/reference_data.dart';

/// Trimester-specific laboratory reference ranges (spec §47).
const kLabPanels = <LabPanel>[
  LabPanel('Haematology', [
    LabAnalyte(
      name: 'Haemoglobin',
      unit: 'g/dL',
      nonPregnant: '12.0 – 15.5',
      first: '11.6 – 13.9',
      second: '9.7 – 14.8',
      third: '9.5 – 15.0',
      direction: LabDirection.falls,
      note: 'Physiological dilution, not anaemia. WHO thresholds for anaemia '
          'in pregnancy are 11 g/dL in the first and third trimesters and '
          '10.5 in the second.',
    ),
    LabAnalyte(
      name: 'White cell count',
      unit: '× 10⁹/L',
      nonPregnant: '4.0 – 11.0',
      first: '5.7 – 13.6',
      second: '5.6 – 14.8',
      third: '5.9 – 16.9',
      direction: LabDirection.rises,
      note: 'Rises further in labour, to 20–30 × 10⁹/L, and after '
          'corticosteroids. A leucocytosis alone does not diagnose infection '
          'in a labouring woman.',
    ),
    LabAnalyte(
      name: 'Platelets',
      unit: '× 10⁹/L',
      nonPregnant: '150 – 400',
      first: '174 – 391',
      second: '155 – 409',
      third: '146 – 429',
      direction: LabDirection.falls,
      note: 'Gestational thrombocytopenia affects up to 10% and is benign. '
          'Below 100 × 10⁹/L, look for pre-eclampsia, HELLP, ITP or TTP.',
    ),
    LabAnalyte(
      name: 'Ferritin',
      unit: 'ng/mL',
      nonPregnant: '15 – 150',
      first: '6 – 130',
      second: '2 – 230',
      third: '0 – 116',
      direction: LabDirection.falls,
      note: 'Below 30 ng/mL indicates iron deficiency in pregnancy — a higher '
          'threshold than outside it. Ferritin is an acute-phase reactant and '
          'is falsely raised by infection.',
    ),
  ]),
  LabPanel('Biochemistry', [
    LabAnalyte(
      name: 'Creatinine',
      unit: 'mg/dL',
      nonPregnant: '0.5 – 0.9',
      first: '0.4 – 0.7',
      second: '0.4 – 0.8',
      third: '0.4 – 0.9',
      direction: LabDirection.falls,
      note: 'Glomerular filtration rises 40–50%. A creatinine of 1.0 mg/dL is '
          'not "just high" in pregnancy — it represents substantial loss of '
          'renal reserve.',
    ),
    LabAnalyte(
      name: 'Urea',
      unit: 'mg/dL',
      nonPregnant: '13 – 45',
      first: '7 – 12',
      second: '3 – 13',
      third: '3 – 11',
      direction: LabDirection.falls,
    ),
    LabAnalyte(
      name: 'Urate',
      unit: 'mg/dL',
      nonPregnant: '2.5 – 5.6',
      first: '2.0 – 4.2',
      second: '2.4 – 4.9',
      third: '3.1 – 6.3',
      direction: LabDirection.rises,
      note: 'Rises with gestation. A rough bedside guide is that urate in '
          'mg/dL approximates gestational age in weeks divided by 10. A urate '
          'above that for gestation supports pre-eclampsia.',
    ),
    LabAnalyte(
      name: 'Alkaline phosphatase',
      unit: 'U/L',
      nonPregnant: '33 – 96',
      first: '17 – 88',
      second: '25 – 126',
      third: '38 – 229',
      direction: LabDirection.rises,
      note: 'The rise is placental in origin and continues to term. It is NOT '
          'evidence of liver disease, and mistaking it for such is the '
          'commonest misreading of an obstetric liver panel.',
    ),
    LabAnalyte(
      name: 'ALT',
      unit: 'U/L',
      nonPregnant: '7 – 41',
      first: '3 – 30',
      second: '2 – 33',
      third: '2 – 25',
      direction: LabDirection.falls,
      note: 'Upper limits are LOWER in pregnancy. A "normal" ALT of 40 in the '
          'third trimester is abnormal and should prompt assessment for '
          'pre-eclampsia, HELLP and cholestasis.',
    ),
    LabAnalyte(
      name: 'Albumin',
      unit: 'g/L',
      nonPregnant: '41 – 53',
      first: '31 – 51',
      second: '26 – 45',
      third: '23 – 42',
      direction: LabDirection.falls,
    ),
    LabAnalyte(
      name: 'Bile acids (fasting)',
      unit: 'µmol/L',
      nonPregnant: '0 – 10',
      first: '0 – 10',
      second: '0 – 10',
      third: '0 – 10',
      direction: LabDirection.unchanged,
      note: 'Intrahepatic cholestasis of pregnancy above 10–19; severe above '
          '40, where stillbirth risk rises. Above 100 µmol/L the risk is '
          'substantial and delivery is usually planned by 35–36 weeks.',
    ),
    LabAnalyte(
      name: 'Sodium',
      unit: 'mmol/L',
      nonPregnant: '136 – 146',
      first: '133 – 148',
      second: '129 – 148',
      third: '130 – 148',
      direction: LabDirection.falls,
    ),
    LabAnalyte(
      name: 'Bicarbonate',
      unit: 'mmol/L',
      nonPregnant: '22 – 30',
      first: '20 – 24',
      second: '20 – 24',
      third: '20 – 24',
      direction: LabDirection.falls,
      note: 'Compensation for the physiological respiratory alkalosis of '
          'pregnancy. A "normal" bicarbonate of 24 in a breathless pregnant '
          'woman may mask a metabolic acidosis.',
    ),
  ]),
  LabPanel('Coagulation', [
    LabAnalyte(
      name: 'Fibrinogen',
      unit: 'g/L',
      nonPregnant: '2.3 – 4.5',
      first: '2.4 – 5.1',
      second: '2.9 – 5.4',
      third: '3.7 – 6.2',
      direction: LabDirection.rises,
      note: 'The single most important range on this screen. A fibrinogen of '
          '2.5 g/L reads as normal on a standard report and is LOW for a '
          'bleeding woman at term — it predicts progression to severe '
          'postpartum haemorrhage.',
    ),
    LabAnalyte(
      name: 'D-dimer',
      unit: 'mg/L',
      nonPregnant: '< 0.5',
      first: '0.05 – 0.95',
      second: '0.32 – 1.29',
      third: '0.13 – 1.7',
      direction: LabDirection.rises,
      note: 'Rises throughout pregnancy and is useless for excluding venous '
          'thromboembolism. Image instead — do not withhold a necessary CTPA '
          'or V/Q scan because she is pregnant.',
    ),
    LabAnalyte(
      name: 'Prothrombin time',
      unit: 'seconds',
      nonPregnant: '12.7 – 15.4',
      first: '9.7 – 13.5',
      second: '9.5 – 13.4',
      third: '9.6 – 12.9',
      direction: LabDirection.falls,
    ),
    LabAnalyte(
      name: 'APTT',
      unit: 'seconds',
      nonPregnant: '26.3 – 39.4',
      first: '24.3 – 38.9',
      second: '24.2 – 38.1',
      third: '24.7 – 35.0',
      direction: LabDirection.falls,
      note: 'Pregnancy is a prothrombotic state. Protein S falls markedly, '
          'and activated protein C resistance rises.',
    ),
  ]),
  LabPanel('Endocrine', [
    LabAnalyte(
      name: 'TSH',
      unit: 'mIU/L',
      nonPregnant: '0.34 – 4.25',
      first: '0.1 – 2.5',
      second: '0.2 – 3.0',
      third: '0.3 – 3.0',
      direction: LabDirection.falls,
      note: 'hCG cross-stimulates the TSH receptor in the first trimester, so '
          'a suppressed TSH there is often physiological. Check free T4 before '
          'diagnosing thyrotoxicosis.',
    ),
    LabAnalyte(
      name: 'Free T4',
      unit: 'ng/dL',
      nonPregnant: '0.8 – 1.7',
      first: '0.8 – 1.2',
      second: '0.6 – 1.0',
      third: '0.5 – 0.9',
      direction: LabDirection.falls,
    ),
    LabAnalyte(
      name: 'Total T4',
      unit: 'µg/dL',
      nonPregnant: '5.4 – 11.7',
      first: '6.5 – 10.1',
      second: '7.5 – 10.3',
      third: '6.3 – 9.7',
      direction: LabDirection.rises,
      note: 'Thyroid-binding globulin rises under oestrogen, so total hormone '
          'rises while free hormone does not. Use free T4.',
    ),
  ]),
];
