import '../../models/trial.dart';

const kWhi = Trial(
  id: 'whi',
  acronym: 'WHI',
  name: "Women's Health Initiative — risks and benefits of oestrogen plus "
      'progestin in healthy postmenopausal women',
  year: 2002,
  journal: 'JAMA 2002;288:321–333',
  setting: '40 clinical centres in the United States',
  population: 'Postmenopausal women aged 50 to 79 with an intact uterus',
  sampleSize: '16 608 women; stopped early at 5.2 years',
  intervention: 'Conjugated equine oestrogen 0.625 mg with '
      'medroxyprogesterone acetate 2.5 mg daily, orally',
  comparator: 'Placebo',
  primaryOutcome: 'Coronary heart disease, with invasive breast cancer as the '
      'primary adverse outcome',
  results: [
    'Breast cancer: HR 1.26 — 8 additional cases per 10 000 women per year.',
    'Coronary heart disease: HR 1.29 — 7 additional events per 10 000 per '
        'year.',
    'Stroke: HR 1.41 — 8 additional per 10 000 per year.',
    'Pulmonary embolism: HR 2.13 — 8 additional per 10 000 per year.',
    'Hip fracture: HR 0.66 — 5 FEWER per 10 000 per year.',
    'Colorectal cancer: HR 0.63 — 6 FEWER per 10 000 per year.',
    'The OESTROGEN-ONLY arm, in hysterectomised women, showed NO increase in '
        'breast cancer — HR 0.77.',
  ],
  limitations: [
    'Mean age 63, and most participants were more than ten years past '
        'menopause — a population in whom hormone therapy is not usually '
        'started.',
    'Tested one oral formulation: conjugated equine oestrogen with '
        'medroxyprogesterone. Transdermal oestradiol with micronised '
        'progesterone has a different risk profile.',
    'Absolute risks were small and were widely reported as relative risks.',
    'Later age-stratified analyses found no increase, and possibly a '
        'reduction, in coronary events among women starting under 60 or '
        'within ten years of menopause.',
  ],
  applicability: 'Its findings apply poorly to the woman most likely to be '
      'prescribed hormone therapy — symptomatic, in her early fifties, close '
      'to menopause, and offered transdermal oestradiol.',
  guidelineImpact: 'Prescribing collapsed worldwide within months. Subsequent '
      'reanalysis produced the "window of opportunity" concept now embedded '
      'in NICE NG23, the British Menopause Society statements and the NAMS '
      'position statement.',
  currentRelevance: 'The most consequential misreading of a trial in modern '
      "women's health. A generation of women were denied effective treatment "
      'on the basis of relative risks from a population they did not '
      'resemble.',
  takeaway: 'Real but small absolute risks, in older women, on one oral '
      'formulation — reported as relative risks and generalised to everyone.',
  category: TrialCategory.gynaecology,
);

const kLacc = Trial(
  id: 'lacc',
  acronym: 'LACC',
  name: 'Minimally Invasive versus Abdominal Radical Hysterectomy for '
      'Cervical Cancer',
  year: 2018,
  journal: 'New England Journal of Medicine 2018;379:1895–1904',
  setting: '33 centres worldwide',
  population: 'Women with stage IA1 (with lymphovascular invasion) to IB1 '
      'cervical carcinoma',
  sampleSize: '631 women; stopped early',
  intervention: 'Minimally invasive radical hysterectomy — laparoscopic or '
      'robotic',
  comparator: 'Open abdominal radical hysterectomy',
  primaryOutcome: 'Disease-free survival at 4.5 years',
  results: [
    'Disease-free survival at 4.5 years: 86.0% minimally invasive versus '
        '96.5% open.',
    'Hazard ratio for recurrence or death: 3.74 (95% CI 1.63–8.58).',
    'Three-year overall survival: 93.8% versus 99.0% — HR for death 6.00.',
    'The trial was stopped early by the data safety monitoring committee.',
  ],
  limitations: [
    'The mechanism remains unproven — the uterine manipulator, CO₂ '
        'insufflation and colpotomy technique have all been proposed.',
    'Surgeon volume and technique varied.',
    'Applies to radical hysterectomy for cervical cancer, and should not be '
        'extrapolated to minimally invasive surgery for endometrial cancer, '
        'where LAP2 and LACE found the opposite.',
  ],
  applicability: 'Directly applicable and immediately practice-changing '
      'wherever radical hysterectomy is performed.',
  guidelineImpact: 'Open abdominal radical hysterectomy returned to being the '
      'standard of care for early cervical cancer. NCCN, ESGO and other '
      'bodies revised their recommendations within months.',
  currentRelevance: 'A rare example of a randomised trial reversing an '
      'established minimally invasive practice, and a caution against '
      'assuming that a less invasive route is oncologically equivalent.',
  takeaway: 'Minimally invasive radical hysterectomy for cervical cancer '
      'nearly quadrupled recurrence. Open is the standard.',
  category: TrialCategory.oncology,
);

const kSolo1 = Trial(
  id: 'solo1',
  acronym: 'SOLO-1',
  name: 'Maintenance Olaparib in Patients with Newly Diagnosed Advanced '
      'Ovarian Cancer and a BRCA Mutation',
  year: 2018,
  journal: 'New England Journal of Medicine 2018;379:2495–2505',
  setting: '118 centres in 15 countries',
  population: 'Newly diagnosed advanced high-grade serous or endometrioid '
      'ovarian cancer with a germline or somatic BRCA1/2 mutation, in '
      'response after platinum-based chemotherapy',
  sampleSize: '391 patients',
  intervention: 'Olaparib 300 mg twice daily for up to 2 years',
  comparator: 'Placebo',
  primaryOutcome: 'Progression-free survival',
  results: [
    'Progression or death: hazard ratio 0.30 (95% CI 0.23–0.41) — a 70% '
        'reduction.',
    'Median progression-free survival not reached with olaparib versus 13.8 '
        'months with placebo.',
    'At 5 years: 48% versus 21% free of progression, despite treatment '
        'stopping at 2 years.',
    'Seven-year overall survival: 67.0% versus 46.5%.',
  ],
  adverseEvents: [
    'Nausea, fatigue and anaemia — the commonest',
    'Grade 3 or higher anaemia in 22%',
    'Myelodysplastic syndrome or acute myeloid leukaemia in about 1%',
  ],
  limitations: [
    'Restricted to BRCA-mutated disease; homologous recombination deficient '
        'and proficient populations were addressed by later trials.',
    'Cost and access are the dominant limitations in most of the world.',
    'Two years of treatment produced benefit persisting to five, but the '
        'optimal duration is not established.',
  ],
  applicability: 'Requires BRCA testing to be available, which is the '
      'rate-limiting step in much of India. Testing every woman with '
      'high-grade serous ovarian cancer is now the standard, and is what '
      'makes the treatment possible.',
  guidelineImpact: 'Established PARP inhibitor maintenance as first-line in '
      'BRCA-mutated advanced ovarian cancer, and made universal BRCA testing '
      'at diagnosis a guideline recommendation.',
  takeaway: 'Two years of olaparib maintenance after first-line chemotherapy '
      'in BRCA-mutated ovarian cancer cuts progression by 70%, with benefit '
      'lasting years after the drug stops.',
  category: TrialCategory.oncology,
);

const kPortec3 = Trial(
  id: 'portec3',
  acronym: 'PORTEC-3',
  name: 'Adjuvant chemoradiotherapy versus radiotherapy alone in high-risk '
      'endometrial cancer',
  year: 2018,
  journal: 'The Lancet Oncology 2018;19:295–309; updated Lancet Oncol '
      '2019;20:1273',
  setting: '103 centres in 6 countries',
  population: 'High-risk endometrial cancer — stage I grade 3 with deep '
      'invasion or lymphovascular invasion, stage II or III, or serous or '
      'clear cell histology',
  sampleSize: '660 women',
  intervention: 'Chemoradiotherapy — cisplatin during radiotherapy, then '
      'carboplatin and paclitaxel',
  comparator: 'Pelvic radiotherapy alone',
  primaryOutcome: 'Overall survival and failure-free survival at 5 years',
  results: [
    'Five-year overall survival: 81.4% with chemoradiotherapy versus 76.1% '
        'with radiotherapy alone — HR 0.70 (95% CI 0.51–0.97) on updated '
        'analysis.',
    'Five-year failure-free survival: 76.5% versus 69.1% — HR 0.70.',
    'The benefit was concentrated in stage III disease and in serous '
        'histology.',
    'Molecular subgroup analysis showed p53-abnormal tumours derived the '
        'greatest benefit, while POLE-mutated tumours did excellently with '
        'either arm.',
  ],
  adverseEvents: [
    'Substantially more grade 3 or higher toxicity during treatment — 60% '
        'versus 12%',
    'Persistent peripheral neuropathy at 2 years in a minority',
  ],
  limitations: [
    'Considerable added toxicity for a modest absolute survival gain in the '
        'whole population.',
    'Molecular classification was applied retrospectively, so the subgroup '
        'findings are hypothesis-generating.',
  ],
  applicability: 'The molecular analysis is what matters most now — it '
      'supports treating by molecular subgroup rather than by stage and '
      'histology alone, which is what FIGO 2023 formalised.',
  guidelineImpact: 'Chemoradiotherapy became standard for stage III and for '
      'serous endometrial cancer. The molecular findings contributed directly '
      'to the FIGO 2023 staging revision.',
  takeaway: 'Adding chemotherapy to radiotherapy helps high-risk endometrial '
      'cancer, and the molecular subgroup predicts who actually benefits.',
  category: TrialCategory.oncology,
);
