import '../../models/topic.dart';

const kMaternalMedicineTopic = ClinicalTopic(
  id: 'maternal-medicine',
  name: 'Maternal medicine',
  subtitle: 'Cardiac · endocrine · neurological · autoimmune · infection',
  headline: 'Indirect causes now outnumber direct ones in maternal death. The '
      'commonest error is stopping a necessary drug because the woman is '
      'pregnant — uncontrolled epilepsy, asthma and thyroid disease harm the '
      'fetus far more reliably than the treatment does.',
  keyFacts: [
    ('mWHO class IV', 'Pregnancy contraindicated'),
    ('TSH, first trimester', '0.1 – 2.5 mIU/L'),
    ('Levothyroxine in pregnancy', 'Increase dose by 25 – 30%'),
    ('Antithyroid, first trimester', 'Propylthiouracil'),
    ('Epilepsy — folic acid', '5 mg daily'),
    ('Anti-Ro positive', 'Fetal echo 16 – 26 weeks'),
    ('APS in pregnancy', 'Aspirin plus LMWH'),
  ],
  sections: [
    TopicSection('Cardiac disease — the leading indirect cause of death', [
      TopicPoint('Use the modified WHO classification to counsel before '
          'pregnancy, not after conception', critical: true),
      TopicPoint('mWHO I — no detectable increased risk. Small shunts, '
          'repaired simple lesions.'),
      TopicPoint('mWHO II — small increase. Unoperated septal defect, repaired '
          'tetralogy.'),
      TopicPoint('mWHO III — significantly increased risk; expert counselling '
          'and specialist care throughout. Mechanical valve, systemic right '
          'ventricle, Fontan, cyanotic disease, moderate mitral stenosis.'),
      TopicPoint('mWHO IV — pregnancy CONTRAINDICATED; discuss termination if '
          'she conceives', critical: true,
          detail: 'Pulmonary arterial hypertension; severe systemic '
              'ventricular dysfunction; previous peripartum cardiomyopathy '
              'with residual impairment; severe mitral stenosis; severe '
              'symptomatic aortic stenosis; Marfan aorta above 45 mm; severe '
              'coarctation.'),
      TopicPoint('RHEUMATIC HEART DISEASE dominates cardiac disease in Indian '
          'pregnancy, and mitral stenosis is the lesion that decompensates',
          critical: true,
          detail: 'The fixed valve area cannot accommodate the rise in cardiac '
              'output. Tachycardia shortens diastolic filling — control the '
              'rate, and treat atrial fibrillation urgently.'),
      TopicPoint('Peripartum cardiomyopathy — heart failure in the last month '
          'of pregnancy or the first five months postpartum, with no other '
          'cause and an ejection fraction below 45%'),
      TopicPoint('Delivery plan agreed in advance by obstetrics, cardiology '
          'and anaesthesia. Vaginal delivery with a short second stage suits '
          'most; caesarean is for obstetric indications and for aortopathy.'),
    ]),
    TopicSection('Thyroid disease', [
      TopicPoint('Trimester-specific TSH: roughly 0.1–2.5 first, 0.2–3.0 '
          'second, 0.3–3.0 mIU/L third', critical: true),
      TopicPoint('hCG stimulates the TSH receptor, so a suppressed TSH in '
          'early pregnancy is often physiological — check free T4 before '
          'diagnosing thyrotoxicosis', critical: true),
      TopicPoint('Increase levothyroxine by 25–30% as soon as pregnancy is '
          'confirmed, and check TSH every 4 weeks to mid-gestation'),
      TopicPoint('Untreated hypothyroidism causes miscarriage, pre-eclampsia, '
          'abruption and impaired neurodevelopment'),
      TopicPoint('PROPYLTHIOURACIL in the first trimester; switch to '
          'carbimazole afterwards', critical: true,
          detail: 'Carbimazole embryopathy — aplasia cutis, choanal and '
              'oesophageal atresia. Propylthiouracil carries a rare risk of '
              'hepatotoxicity, which is why the switch happens at all.'),
      TopicPoint('Use the lowest dose that keeps free T4 in the upper third of '
          'the normal range — antithyroid drugs cross the placenta and the '
          'fetus is the more sensitive'),
      TopicPoint('Measure TSH receptor antibodies at 18–22 weeks in Graves '
          'disease, current or past — they cross the placenta and cause fetal '
          'thyrotoxicosis even after maternal thyroidectomy', critical: true),
    ]),
    TopicSection('Epilepsy', [
      TopicPoint('SODIUM VALPROATE must not be used in women of childbearing '
          'potential unless no alternative exists and a pregnancy prevention '
          'programme is in place', critical: true,
          detail: 'Neural tube defects in about 10%, and neurodevelopmental '
              'disorder in about 30–40%.'),
      TopicPoint('Lamotrigine and levetiracetam carry the lowest '
          'teratogenic risk and are preferred'),
      TopicPoint('Folic acid 5 mg daily, ideally from before conception'),
      TopicPoint('stop anticonvulsants because she is pregnant', avoid: true,
          detail: 'Sudden unexpected death in epilepsy is a leading cause of '
              'maternal death, and seizures harm the fetus.'),
      TopicPoint('Lamotrigine levels fall substantially in pregnancy through '
          'induced glucuronidation — monitor and increase, then reduce '
          'promptly after delivery to avoid toxicity', critical: true),
      TopicPoint('Vitamin K 1 mg intramuscularly to the neonate — as for every '
          'baby, but particularly with enzyme-inducing drugs'),
      TopicPoint('Safety advice for the postnatal period: change the baby on '
          'the floor, shower rather than bathe, do not bathe the baby alone'),
    ]),
    TopicSection('Asthma and respiratory disease', [
      TopicPoint('Continue inhaled corticosteroids and beta-agonists — '
          'uncontrolled asthma is far more dangerous than the drugs',
          critical: true),
      TopicPoint('A third of women improve, a third worsen, a third are '
          'unchanged'),
      TopicPoint('Treat an acute exacerbation exactly as outside pregnancy, '
          'including oral steroids and magnesium'),
      TopicPoint('Avoid carboprost in postpartum haemorrhage', critical: true),
      TopicPoint('Pregnant women are more vulnerable to influenza and to '
          'varicella pneumonia — vaccinate, and treat early'),
    ]),
    TopicSection('Autoimmune disease', [
      TopicPoint('Plan pregnancy during remission — active lupus at conception '
          'predicts a poor outcome', critical: true),
      TopicPoint('Continue hydroxychloroquine throughout; stopping it '
          'precipitates flares'),
      TopicPoint('Azathioprine, ciclosporin and tacrolimus are compatible; '
          'methotrexate, mycophenolate and cyclophosphamide are not',
          critical: true),
      TopicPoint('ANTIPHOSPHOLIPID SYNDROME — low-dose aspirin plus '
          'low-molecular-weight heparin from a positive pregnancy test',
          critical: true),
      TopicPoint('ANTI-Ro AND ANTI-La antibodies cross the placenta and cause '
          'congenital heart block — serial fetal echocardiography from 16 to '
          '26 weeks', critical: true),
      TopicPoint('Distinguishing a lupus flare from pre-eclampsia is difficult '
          'and consequential: complement falls and dsDNA rises in a flare, '
          'while urate rises in pre-eclampsia'),
    ]),
    TopicSection('Infection', [
      TopicPoint('HIV — antiretroviral therapy for all; an undetectable viral '
          'load at 36 weeks permits vaginal delivery', critical: true,
          detail: 'Viral load above 50 copies/mL: planned caesarean at 38 '
              'weeks. Neonatal prophylaxis in every case.'),
      TopicPoint('HEPATITIS B — tenofovir from 28 weeks where viral load '
          'exceeds 200 000 IU/mL; birth-dose vaccine and immunoglobulin to the '
          'neonate within 12 hours', critical: true),
      TopicPoint('SYPHILIS — benzathine penicillin is the only adequate '
          'treatment; desensitise if allergic. Warn about the '
          'Jarisch-Herxheimer reaction, which can precipitate contractions.',
          critical: true),
      TopicPoint('MALARIA — pregnant women are more susceptible and more '
          'severely affected. Treat promptly; artemisinin combinations are '
          'used in the second and third trimesters.'),
      TopicPoint('TUBERCULOSIS — do not delay treatment because of pregnancy. '
          'Standard first-line therapy is compatible; streptomycin is not.',
          critical: true),
      TopicPoint('Group B streptococcus — intrapartum prophylaxis by the '
          'risk-based or screening strategy your unit uses'),
    ]),
    TopicSection('Renal disease', [
      TopicPoint('Creatinine falls in normal pregnancy — 0.4–0.8 mg/dL. A '
          '"normal" 1.0 is not normal here.', critical: true),
      TopicPoint('Pre-pregnancy counselling by stage: outcomes deteriorate '
          'sharply above a creatinine of 1.5 mg/dL'),
      TopicPoint('Pre-eclampsia is far commoner and much harder to diagnose '
          'against a background of proteinuria'),
      TopicPoint('ACE inhibitors and ARBs are contraindicated — fetal renal '
          'failure, oligohydramnios, skull hypoplasia', critical: true),
      TopicPoint('Treat asymptomatic bacteriuria in pregnancy, which is not '
          'the case outside it — it progresses to pyelonephritis in up to 30%',
          critical: true),
    ]),
  ],
  sources: [
    'ESC Guidelines for the management of cardiovascular diseases during '
        'pregnancy, 2018.',
    'American Thyroid Association Guidelines for the Diagnosis and Management '
        'of Thyroid Disease During Pregnancy and the Postpartum.',
    'MHRA valproate Pregnancy Prevention Programme; NICE NG217 — Epilepsies.',
    'RCOG Green-top Guideline 39 — Management of HIV in Pregnancy.',
    'MBRRACE-UK — Saving Lives, Improving Mothers’ Care.',
    'FOGSI GCPR — Medical Disorders in Pregnancy.',
  ],
);

const kFetalMedicineTopic = ClinicalTopic(
  id: 'fetal-medicine',
  name: 'Fetal medicine',
  subtitle: 'Screening · diagnosis · fetal therapy',
  headline: 'Cell-free DNA is a screening test, not a diagnostic one. Its '
      'positive predictive value depends entirely on the prior risk — a '
      '"positive" result in a low-risk 25-year-old is more often a false '
      'positive than a true one, and must never be acted on without '
      'confirmation.',
  keyFacts: [
    ('Combined test', '11+0 – 13+6 weeks · CRL 45 – 84 mm'),
    ('Detection, combined test', '~85 – 90% at 5% false-positive rate'),
    ('Quadruple test', '15 – 20 weeks · ~75 – 80% detection'),
    ('cfDNA detection, trisomy 21', '> 99%'),
    ('CVS', 'From 11 weeks · loss ~0.2% above background'),
    ('Amniocentesis', 'From 15 weeks · loss ~0.1 – 0.2%'),
    ('Cordocentesis', 'Loss 1 – 2%'),
    ('MCA-PSV for anaemia', '> 1.5 multiples of the median'),
  ],
  sections: [
    TopicSection('Screening for aneuploidy', [
      TopicPoint('COMBINED TEST at 11+0 to 13+6 weeks — nuchal translucency, '
          'free β-hCG and PAPP-A, with maternal age'),
      TopicPoint('Additional markers refine the risk: absent nasal bone, '
          'reversed ductus venosus a-wave, tricuspid regurgitation'),
      TopicPoint('QUADRUPLE TEST at 15–20 weeks where the window for the '
          'combined test has closed — AFP, hCG, unconjugated oestriol and '
          'inhibin A'),
      TopicPoint('CELL-FREE DNA — over 99% detection for trisomy 21, with a '
          'very low false-positive rate', critical: true),
      TopicPoint('treat a positive cfDNA result as diagnostic', avoid: true,
          detail: 'Positive predictive value falls with prior risk, and false '
              'positives arise from confined placental mosaicism, a vanishing '
              'twin, maternal mosaicism and, occasionally, maternal '
              'malignancy. Confirm by CVS or amniocentesis before any '
              'irreversible decision.'),
      TopicPoint('cfDNA fails to give a result in 1–5% of cases — a "no call" '
          'is itself associated with aneuploidy and needs review, not simply '
          'a repeat', critical: true),
      TopicPoint('A raised nuchal translucency with a normal karyotype still '
          'warrants detailed anatomy and fetal echocardiography',
          critical: true),
    ]),
    TopicSection('Diagnostic testing', [
      TopicPoint('CHORIONIC VILLUS SAMPLING from 11 weeks — earlier result, '
          'and earlier options'),
      TopicPoint('perform CVS before 10 weeks', avoid: true,
          detail: 'Limb reduction defects have been reported with very early '
              'sampling.'),
      TopicPoint('AMNIOCENTESIS from 15 weeks'),
      TopicPoint('Quantitative fluorescence PCR gives the common trisomies in '
          '24–48 hours; microarray follows for copy number variants'),
      TopicPoint('Exome sequencing where there is a structural anomaly with a '
          'normal microarray'),
      TopicPoint('Anti-D for Rhesus-negative women after any invasive '
          'procedure', critical: true),
      TopicPoint('Counsel about the procedure-related loss rate before, not '
          'after, consent'),
    ]),
    TopicSection('Structural anomalies — the high-yield associations', [
      TopicPoint('CNS — ventriculomegaly, agenesis of the corpus callosum, '
          'Dandy-Walker malformation, neural tube defects, holoprosencephaly',
          detail: 'Ventriculomegaly demands a search for infection, '
              'haemorrhage and aneuploidy.'),
      TopicPoint('CARDIAC — the commonest major anomaly and the most '
          'frequently missed. An abnormal four-chamber view or outflow tract '
          'needs formal fetal echocardiography.', critical: true),
      TopicPoint('RENAL — pelviureteric junction obstruction, multicystic '
          'dysplastic kidney, posterior urethral valves',
          detail: 'Bilateral disease with anhydramnios carries a lethal '
              'pulmonary hypoplasia risk.'),
      TopicPoint('GASTROINTESTINAL — duodenal atresia (the double bubble, '
          'strongly associated with trisomy 21), oesophageal atresia, bowel '
          'obstruction'),
      TopicPoint('ABDOMINAL WALL — gastroschisis (no membrane, usually '
          'isolated, good prognosis) versus exomphalos (membrane-covered, '
          'strongly associated with aneuploidy and syndromes)',
          critical: true),
      TopicPoint('SKELETAL DYSPLASIA — measure all long bones, assess thoracic '
          'circumference for lethality, look at the skull and spine'),
      TopicPoint('THORACIC — congenital pulmonary airway malformation, '
          'diaphragmatic hernia, pleural effusion'),
      TopicPoint('FACIAL — cleft lip and palate, micrognathia; look for '
          'associated anomalies'),
      TopicPoint('An isolated anomaly is rarely isolated until the whole fetus '
          'has been examined and the karyotype is known', critical: true),
    ]),
    TopicSection('Fetal therapy', [
      TopicPoint('INTRAUTERINE TRANSFUSION for fetal anaemia — MCA peak '
          'systolic velocity above 1.5 multiples of the median, or hydrops',
          critical: true,
          detail: 'Causes: red cell alloimmunisation, parvovirus B19, '
              'fetomaternal haemorrhage, alpha-thalassaemia major.'),
      TopicPoint('TWIN-TO-TWIN TRANSFUSION SYNDROME — monochorionic '
          'diamniotic twins with a polyhydramnios–oligohydramnios sequence, '
          'staged by Quintero I–V', critical: true,
          detail: 'Fetoscopic laser ablation of the placental anastomoses is '
              'the treatment of choice from stage II, and is superior to '
              'serial amnioreduction.'),
      TopicPoint('TWIN ANAEMIA-POLYCYTHAEMIA SEQUENCE — a discordance in '
          'MCA-PSV without the amniotic fluid discordance of TTTS; may follow '
          'laser therapy'),
      TopicPoint('TWIN REVERSED ARTERIAL PERFUSION — an acardiac twin '
          'perfused by the pump twin. Cord occlusion or radiofrequency '
          'ablation where the pump twin is at risk.'),
      TopicPoint('SELECTIVE FETAL GROWTH RESTRICTION in monochorionic twins, '
          'classified by umbilical artery Doppler pattern'),
      TopicPoint('Vesicoamniotic and thoracoamniotic shunting in selected '
          'obstructive uropathy and effusion'),
      TopicPoint('Fetoscopic or open repair of spina bifida improves motor '
          'outcome and reduces shunting, at a cost in maternal morbidity and '
          'preterm birth — the MOMS trial'),
      TopicPoint('EXIT procedure where the airway will be obstructed at birth'),
      TopicPoint('All of this belongs in a fetal medicine centre. The referral '
          'is the intervention that matters most.', critical: true),
    ]),
    TopicSection('Counselling', [
      TopicPoint('Give the diagnosis in a quiet room, with her partner present '
          'if she wishes, and repeat it in writing'),
      TopicPoint('Involve the relevant paediatric subspecialty early — parents '
          'want to know what life will look like, not only what the scan '
          'shows'),
      TopicPoint('Set out all options neutrally, including continuation, '
          'palliative care planning and termination'),
      TopicPoint('In India, termination beyond 24 weeks for fetal abnormality '
          'requires State Medical Board approval — start that process early '
          'rather than late', critical: true),
      TopicPoint('Offer genetic counselling and discuss recurrence risk'),
      TopicPoint('Arrange postmortem or placental histology discussion where '
          'the pregnancy ends'),
    ]),
  ],
  sources: [
    'ISUOG Practice Guidelines — mid-trimester fetal ultrasound scan; '
        'invasive procedures; role of ultrasound in twin pregnancy.',
    'RCOG Green-top Guideline 8 — Amniocentesis and Chorionic Villus Sampling.',
    'NHS Fetal Anomaly Screening Programme standards.',
    'Adzick NS et al. MOMS trial. N Engl J Med 2011;364:993–1004.',
    'Senat MV et al. Endoscopic laser surgery versus serial amnioreduction for '
        'severe twin-to-twin transfusion syndrome. N Engl J Med '
        '2004;351:136–144.',
    'Mari G et al. N Engl J Med 2000;342:9–14.',
  ],
);
