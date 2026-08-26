import '../../models/drug.dart';

const kPembrolizumab = Drug(
  id: 'pembrolizumab',
  generic: 'Pembrolizumab',
  drugClass: 'Immune checkpoint inhibitor · anti-PD-1 immunotherapy',
  mechanism: 'A monoclonal antibody that blocks PD-1 on T cells, preventing '
      'its engagement by tumour PD-L1. The tumour loses the brake it has been '
      'applying to the immune response, and the patient\'s own T cells attack '
      'it. Because the mechanism is release of immune restraint rather than '
      'direct cytotoxicity, both the benefits and the toxicities are '
      'immunological.',
  indications: [
    'Mismatch repair deficient or MSI-high advanced or recurrent endometrial '
        'carcinoma, with or without lenvatinib',
    'With chemotherapy for primary advanced or recurrent endometrial '
        'carcinoma (NRG-GY018, RUBY)',
    'With chemotherapy, with or without bevacizumab, in persistent, recurrent '
        'or metastatic cervical carcinoma expressing PD-L1 (KEYNOTE-826)',
    'With chemoradiotherapy in locally advanced cervical carcinoma '
        '(KEYNOTE-A18)',
    'MSI-high or mismatch repair deficient solid tumours after prior therapy',
  ],
  doses: [
    DrugDose(
      indication: 'Gynaecological malignancy',
      dose: '200 mg every 3 weeks, or 400 mg every 6 weeks',
      route: 'Intravenous infusion over 30 minutes',
      max: 'Usually up to 2 years, or until progression or unacceptable '
          'toxicity',
      notes: 'A flat dose, not by body surface area. Give through a '
          '0.2–5 micron in-line filter and do not co-administer with other '
          'drugs in the same line.',
    ),
  ],
  doseAdjustments: [
    'No reduction for toxicity — the dose is held or stopped, not lowered.',
    'Withhold for grade 2 immune-related toxicity; treat with '
        'corticosteroids and resume once resolved to grade 1 or less.',
    'Permanently discontinue for grade 3 or 4 immune-related toxicity, other '
        'than endocrinopathy controlled on replacement.',
    'No adjustment for mild or moderate renal or hepatic impairment.',
  ],
  contraindications: [
    'Known severe hypersensitivity to pembrolizumab',
    'Pregnancy',
    'Active autoimmune disease requiring systemic immunosuppression is a '
        'strong relative contraindication — discuss with the '
        'multidisciplinary team',
    'Allogeneic haematopoietic stem cell transplant history — relative, '
        'because of graft-versus-host disease risk',
  ],
  warnings: [
    'IMMUNE-RELATED ADVERSE EVENTS can affect any organ, may present months '
        'after starting, and may occur after treatment has stopped. Give the '
        'patient an alert card and make sure every clinician who sees her '
        'knows she is on a checkpoint inhibitor.',
    'Immune-related pneumonitis, colitis, hepatitis, nephritis and '
        'myocarditis can be fatal. Investigate new symptoms as '
        'immune-related until proven otherwise rather than attributing them '
        'to progression or infection.',
    'Endocrinopathies — hypothyroidism, hyperthyroidism, hypophysitis, '
        'adrenal insufficiency and type 1 diabetes — are common and often '
        'permanent. Adrenal crisis is the one that kills quickly.',
    'Diarrhoea in a patient on a checkpoint inhibitor is immune colitis until '
        'excluded. Do not simply give loperamide.',
    'Patient selection depends on mismatch repair or MSI testing, and on '
        'PD-L1 where the indication requires it. Universal mismatch repair '
        'testing of endometrial carcinoma is what makes this treatment '
        'reachable.',
    'Steroids are the treatment for immune toxicity; they do not appear to '
        'abolish antitumour efficacy when used for that purpose.',
  ],
  adverseEffects: [
    'Fatigue — very common',
    'Pruritus and rash, including rare severe cutaneous reactions',
    'Diarrhoea and immune-mediated colitis',
    'Hypothyroidism and hyperthyroidism',
    'Nausea, decreased appetite, arthralgia',
    'Immune-mediated pneumonitis',
    'Immune-mediated hepatitis',
    'Hypophysitis and adrenal insufficiency',
    'Type 1 diabetes with ketoacidosis',
    'Nephritis',
    'Myocarditis, myositis and neurological events — uncommon and serious',
    'Infusion reactions',
  ],
  interactions: [
    'Avoid systemic corticosteroids and immunosuppressants before starting '
        'where possible, since they may reduce efficacy. Steroids given to '
        'treat immune toxicity are a different matter and should not be '
        'withheld.',
    'No significant cytochrome P450 interactions — it is an antibody.',
    'Live vaccines are avoided during treatment.',
  ],
  monitoring: [
    'Thyroid function before each cycle or at least regularly',
    'Liver and renal function, and glucose, before each cycle',
    'Full blood count',
    'Cortisol where fatigue, hypotension or hyponatraemia appear',
    'Oxygen saturation and a low threshold for chest imaging with any new '
        'respiratory symptom',
    'Troponin and ECG where myocarditis is suspected',
    'Ask at every visit about bowel frequency, breathlessness and fatigue',
  ],
  pregnancy: DrugSafety(
    summary: 'Contraindicated. IgG4 antibodies cross the placenta from the '
        'second trimester, and PD-1 blockade disrupts maternal-fetal immune '
        'tolerance, causing fetal loss in animal models. Effective '
        'contraception is required during treatment and for 4 months '
        'afterwards.',
    points: [
      'Confirm a negative pregnancy test before starting.',
      'Discuss fertility preservation before treatment where relevant.',
    ],
  ),
  lactation: DrugSafety(
    summary: 'Avoid during treatment and for 4 months after the last dose. '
        'Human data are absent.',
    source: 'LactMed; manufacturer summary of product characteristics.',
  ),
  fertility: 'Effects on human fertility are unknown. Where the woman may '
      'wish to conceive, raise fertility preservation before treatment '
      'starts — the window closes with the first cycle.',
  references: [
    'Colombo N et al. KEYNOTE-826. N Engl J Med 2021;385:1856–1867.',
    'Eskander RN et al. NRG-GY018. N Engl J Med 2023;388:2159–2170.',
    'Mirza MR et al. RUBY. N Engl J Med 2023;388:2145–2158.',
    'Lorusso D et al. KEYNOTE-A18. Lancet 2024;403:1341–1350.',
    'ESMO Clinical Practice Guidelines on the management of toxicities from '
        'immunotherapy.',
    'National Cancer Grid of India — resource-stratified guidelines for '
        'endometrial and cervical cancer; ICMR consensus documents; Tata '
        'Memorial Centre evidence-based management manuals.',
  ],
);

const kBevacizumab = Drug(
  id: 'bevacizumab',
  generic: 'Bevacizumab',
  drugClass: 'Anti-VEGF monoclonal antibody · targeted anti-angiogenic '
      'therapy',
  mechanism: 'Binds circulating vascular endothelial growth factor A, '
      'preventing it from activating VEGF receptors on endothelium. The '
      'tumour cannot build the disordered vasculature it depends on, and the '
      'existing abnormal vessels normalise, which also improves delivery of '
      'cytotoxic drugs. The same mechanism explains the toxicity profile: '
      'anything that depends on endothelial repair — wounds, bowel, kidney '
      'and blood pressure control — is affected.',
  indications: [
    'With carboplatin and paclitaxel, then as maintenance, in advanced '
        'epithelial ovarian, fallopian tube and primary peritoneal carcinoma '
        '(GOG-0218, ICON7)',
    'Platinum-sensitive and platinum-resistant recurrent ovarian carcinoma '
        '(OCEANS, AURELIA)',
    'With chemotherapy in persistent, recurrent or metastatic cervical '
        'carcinoma (GOG-240)',
    'With olaparib as maintenance in homologous-recombination-deficient '
        'ovarian carcinoma (PAOLA-1)',
  ],
  doses: [
    DrugDose(
      indication: 'Ovarian carcinoma, first line and maintenance',
      dose: '7.5 mg/kg every 3 weeks, or 15 mg/kg every 3 weeks depending on '
          'the regimen',
      route: 'Intravenous infusion',
      max: 'Up to 15–22 months of maintenance depending on protocol',
      notes: 'First infusion over 90 minutes; if tolerated, 60 then 30 '
          'minutes. Dose is by body weight.',
    ),
    DrugDose(
      indication: 'Cervical carcinoma',
      dose: '15 mg/kg every 3 weeks with chemotherapy',
      route: 'Intravenous infusion',
    ),
  ],
  doseAdjustments: [
    'No dose reduction is recommended — treatment is interrupted or stopped.',
    'STOP at least 28 days before elective surgery, and do not restart until '
        'at least 28 days afterwards and the wound has fully healed.',
    'Withhold for severe hypertension until controlled.',
    'Withhold for proteinuria of 2 g or more in 24 hours until it falls below '
        'that.',
  ],
  contraindications: [
    'Pregnancy and breastfeeding',
    'Untreated central nervous system metastases with haemorrhage risk',
    'Recent haemoptysis',
    'Surgery within the previous 28 days, or an unhealed wound',
    'Bowel obstruction or recent gastrointestinal perforation',
  ],
  warnings: [
    'GASTROINTESTINAL PERFORATION — the complication that matters most in '
        'gynaecological oncology, because bowel is often involved by disease '
        'or by previous surgery. Any new abdominal pain must be investigated '
        'urgently, not treated as constipation.',
    'Wound dehiscence and impaired healing. The 28-day rule either side of '
        'surgery exists for this reason and is frequently broken.',
    'Fistula formation — enterovaginal, vesicovaginal and rectovaginal — '
        'particularly after pelvic radiotherapy.',
    'Arterial thromboembolism, including stroke and myocardial infarction.',
    'Hypertension, sometimes severe; and proteinuria progressing to nephrotic '
        'syndrome.',
    'Haemorrhage, and posterior reversible encephalopathy syndrome.',
  ],
  adverseEffects: [
    'Hypertension — very common',
    'Proteinuria',
    'Fatigue and asthenia',
    'Epistaxis',
    'Impaired wound healing',
    'Venous and arterial thromboembolism',
    'Gastrointestinal perforation and fistula',
    'Headache, and posterior reversible encephalopathy syndrome (rare)',
    'Congestive cardiac failure',
    'Osteonecrosis of the jaw (rare)',
  ],
  interactions: [
    'Increases the risk of bleeding with anticoagulants, though '
        'anticoagulation is not an absolute contraindication.',
    'Additive nephrotoxicity with other nephrotoxic drugs.',
    'No cytochrome P450 interactions — it is an antibody.',
  ],
  monitoring: [
    'Blood pressure before every infusion, and at home between them',
    'Urine dipstick for protein before every infusion; quantify if 2+ or '
        'more',
    'Ask specifically about abdominal pain, change in bowel habit, and any '
        'vaginal leakage of urine or stool',
    'Full blood count and renal function',
    'Review the surgical plan at every cycle so the 28-day window is '
        'protected',
  ],
  pregnancy: DrugSafety(
    summary: 'Contraindicated. VEGF is essential to fetal angiogenesis, and '
        'inhibition is embryotoxic and teratogenic in animal studies. '
        'Effective contraception is required during treatment and for 6 '
        'months afterwards.',
  ),
  lactation: DrugSafety(
    summary: 'Avoid during treatment and for 6 months after the last dose.',
    source: 'LactMed; manufacturer summary of product characteristics.',
  ),
  fertility: 'Ovarian failure has been reported and may not be reversible. '
      'Discuss this and fertility preservation before starting in a woman who '
      'may wish to conceive.',
  references: [
    'Burger RA et al. GOG-0218. N Engl J Med 2011;365:2473–2483.',
    'Perren TJ et al. ICON7. N Engl J Med 2011;365:2484–2496.',
    'Tewari KS et al. GOG-240. N Engl J Med 2014;370:734–743.',
    'Ray-Coquard I et al. PAOLA-1. N Engl J Med 2019;381:2416–2428.',
    'ESGO-ESMO consensus conference recommendations on ovarian cancer.',
    'National Cancer Grid of India — ovarian and cervical cancer guidelines; '
        'Tata Memorial Centre evidence-based management manuals.',
  ],
);
