import 'package:flutter/material.dart';
import '../../widgets/reference_note.dart';

class ScanGuide {
  const ScanGuide({
    required this.name,
    required this.timing,
    required this.purpose,
    required this.measured,
    required this.lookingFor,
    this.note,
  });

  final String name;
  final String timing;
  final String purpose;
  final List<String> measured;
  final List<String> lookingFor;
  final String? note;
}

const _scans = <ScanGuide>[
  ScanGuide(
    name: 'Early pregnancy / viability scan',
    timing: '6 – 8 weeks',
    purpose:
        'Confirm that the pregnancy is intrauterine, viable, and how many '
        'there are. Usually done for pain, bleeding, or an uncertain LMP.',
    measured: [
      'Gestational sac — mean sac diameter',
      'Yolk sac — present from about 5.5 weeks',
      'Crown–rump length',
      'Fetal cardiac activity — visible from a CRL of about 2 mm',
      'Number of sacs and, in twins, chorionicity',
    ],
    lookingFor: [
      'Intrauterine versus ectopic implantation — an empty uterus with a '
          'positive test and hCG above the discriminatory zone is ectopic '
          'until proven otherwise',
      'Non-viability: CRL ≥ 7 mm with no cardiac activity, or mean sac '
          'diameter ≥ 25 mm with no embryo',
      'Subchorionic haematoma',
      'Chorionicity in multiples — the lambda and T signs are easiest to see '
          'now and become unreliable after 14 weeks',
      'Adnexal masses, corpus luteum, fibroids',
    ],
    note: 'Chorionicity determined at this scan governs the entire '
        'surveillance plan for a twin pregnancy. If it is missed here it '
        'often cannot be recovered.',
  ),
  ScanGuide(
    name: 'Dating & nuchal translucency scan',
    timing: '11+0 – 13+6 weeks (CRL 45 – 84 mm)',
    purpose:
        'Establish the definitive EDD and perform first-trimester aneuploidy '
        'screening. The window is narrow and non-negotiable.',
    measured: [
      'Crown–rump length — dating',
      'Nuchal translucency — measured in a mid-sagittal plane, neutral neck, '
          'calipers on-to-on',
      'Nasal bone — present or absent',
      'Ductus venosus a-wave',
      'Tricuspid regurgitation',
      'Uterine artery Doppler — pre-eclampsia risk',
    ],
    lookingFor: [
      'NT above the 95th centile (roughly ≥ 3.5 mm) — raises the risk of '
          'aneuploidy, cardiac defects and genetic syndromes even when the '
          'karyotype is normal',
      'Absent nasal bone, reversed a-wave, tricuspid regurgitation — each '
          'shifts the likelihood ratio',
      'Early structural anomalies: acrania, exomphalos, megacystis, '
          'body-stalk anomaly',
      'Combined risk with free β-hCG and PAPP-A',
      'High uterine artery PI — candidate for aspirin prophylaxis',
    ],
    note: 'Aspirin 150 mg at night, started before 16 weeks, substantially '
        'reduces preterm pre-eclampsia in screen-positive women (ASPRE). The '
        'window closes at 16 weeks — this scan is what identifies them.',
  ),
  ScanGuide(
    name: 'Anomaly scan (TIFFA)',
    timing: '18 – 22 weeks, ideally 19 – 20',
    purpose:
        'A systematic structural survey of the fetus, plus placental '
        'localisation and cervical assessment.',
    measured: [
      'Full biometry — BPD, HC, AC, FL',
      'Head: ventricles, cavum septi pellucidi, cerebellum, cisterna magna, '
          'nuchal fold',
      'Face: orbits, profile, lips and palate',
      'Chest: four-chamber view, outflow tracts, three-vessel and trachea view',
      'Abdomen: stomach, kidneys, bladder, cord insertion, vessel count',
      'Spine: longitudinal and transverse through its whole length',
      'Limbs: all long bones, hands and feet',
      'Placental site and its relationship to the internal os',
      'Amniotic fluid; cervical length where indicated',
    ],
    lookingFor: [
      'Major structural anomalies across every system',
      'Soft markers — echogenic bowel, echogenic intracardiac focus, '
          'pyelectasis, short femur, choroid plexus cysts',
      'Placenta praevia or a low-lying placenta; suspicion of accreta in a '
          'woman with a previous caesarean',
      'Short cervix (≤ 25 mm) — the trigger for progesterone or cerclage',
      'Early growth restriction',
    ],
    note: 'This is the scan that matters most legally in India. Findings are '
        'recorded in Form F, and the sex of the fetus must not be disclosed, '
        'recorded in a disclosable form, or hinted at by word or gesture.',
  ),
  ScanGuide(
    name: 'Growth scan',
    timing: '28 – 32 weeks, and 34 – 36 weeks',
    purpose:
        'Assess fetal growth, liquor and placental function in the third '
        'trimester.',
    measured: [
      'Biometry — BPD, HC, AC, FL, with estimated fetal weight and centile',
      'Amniotic fluid — AFI and deepest vertical pocket',
      'Umbilical artery Doppler — PI, RI, end-diastolic flow',
      'Middle cerebral artery Doppler — PI and peak systolic velocity',
      'Cerebroplacental ratio',
      'Placental position, grade and any evidence of abruption',
      'Presentation',
    ],
    lookingFor: [
      'Fetal growth restriction — EFW or AC below the 10th centile, and more '
          'importantly a falling centile across serial scans',
      'Absent or reversed end-diastolic flow in the umbilical artery',
      'Brain sparing — falling MCA PI and a cerebroplacental ratio below 1',
      'Macrosomia and its implications for mode of delivery',
      'Oligo- or polyhydramnios',
      'Malpresentation, in time for external cephalic version',
    ],
    note: 'A single small measurement is far less informative than a growth '
        'trajectory. Where growth restriction is suspected, the interval '
        'between scans should be at least two weeks, otherwise measurement '
        'error dominates the change.',
  ),
  ScanGuide(
    name: 'Doppler studies',
    timing: 'From 20 weeks, as indicated',
    purpose:
        'Assess placental resistance and fetal cardiovascular adaptation. This '
        'is the tool that decides timing of delivery in growth restriction.',
    measured: [
      'Umbilical artery — PI, RI, S/D ratio, end-diastolic flow',
      'Middle cerebral artery — PI, and peak systolic velocity for anaemia',
      'Cerebroplacental ratio — MCA PI divided by UA PI',
      'Ductus venosus — a-wave',
      'Uterine artery — PI and notching',
    ],
    lookingFor: [
      'Raised umbilical artery PI — placental insufficiency',
      'Absent end-diastolic flow, then reversed — a deteriorating sequence',
      'MCA PSV above 1.5 multiples of the median — fetal anaemia, the '
          'indication for cordocentesis or intrauterine transfusion',
      'Cerebroplacental ratio below 1 — redistribution',
      'Reversed ductus venosus a-wave — a late, ominous sign usually '
          'prompting delivery',
    ],
  ),
  ScanGuide(
    name: 'Cervical length assessment',
    timing: '16 – 24 weeks in women at risk',
    purpose:
        'Predict spontaneous preterm birth and select women for progesterone '
        'or cerclage.',
    measured: [
      'Cervical length — transvaginal, empty bladder, no undue probe pressure',
      'Funnelling of the internal os',
      'Response to transfundal pressure',
    ],
    lookingFor: [
      'Cervical length ≤ 25 mm before 24 weeks — vaginal progesterone',
      'Length below 10 mm, or a history of loss with a short cervix — '
          'consider cerclage',
      'Funnelling and dynamic change during the examination',
    ],
    note: 'Transabdominal measurement systematically overestimates cervical '
        'length. If the cervix looks short abdominally, confirm it '
        'transvaginally before acting.',
  ),
  ScanGuide(
    name: 'Fetal echocardiography',
    timing: '18 – 22 weeks, repeated at 28 – 32 if indicated',
    purpose:
        'Detailed cardiac assessment where risk is raised. Congenital heart '
        'disease is the commonest major anomaly and the most frequently '
        'missed.',
    measured: [
      'Situs and cardiac axis',
      'Four-chamber view',
      'Left and right ventricular outflow tracts',
      'Three-vessel and three-vessel-trachea views',
      'Aortic and ductal arches',
      'Pulmonary and systemic venous return',
      'Rhythm and rate',
    ],
    lookingFor: [
      'Structural defects — septal defects, transposition, tetralogy, '
          'hypoplastic left heart, coarctation',
      'Arrhythmia',
      'Pericardial effusion and signs of hydrops',
    ],
    note: 'Indications include pre-gestational diabetes, a raised nuchal '
        'translucency, a family history of congenital heart disease, '
        'teratogen exposure, monochorionic twins, and any abnormal '
        'four-chamber view on the anomaly scan.',
  ),
  ScanGuide(
    name: 'Biophysical profile',
    timing: 'Third trimester, as a test of fetal wellbeing',
    purpose:
        'A composite assessment used when the cardiotocograph is equivocal or '
        'when surveillance is needed in a high-risk pregnancy.',
    measured: [
      'Fetal breathing movements — 2 points',
      'Gross body movements — 2 points',
      'Fetal tone — 2 points',
      'Amniotic fluid volume — 2 points',
      'Reactive cardiotocograph — 2 points',
    ],
    lookingFor: [
      '8 – 10: normal; repeat as scheduled',
      '6: equivocal; repeat within 24 hours',
      '4 or below: consider delivery, weighing gestation against the finding',
      'Oligohydramnios in isolation still warrants assessment for delivery',
    ],
    note: 'The parameters are lost in a predictable order as hypoxia '
        'progresses — cardiotocograph reactivity and breathing go first, then '
        'movement, then tone. Fluid volume reflects chronic rather than acute '
        'compromise.',
  ),
];

class UsgGuideScreen extends StatelessWidget {
  const UsgGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Ultrasound guide'),
            Text('Every scan in pregnancy — when, what, why',
                style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 18),
            decoration: BoxDecoration(
              color: const Color(0xFFB3261E).withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: const Color(0xFFB3261E).withValues(alpha: 0.35)),
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.gavel_outlined,
                  size: 17, color: Color(0xFFB3261E)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Every prenatal scan in India requires Form F, completed '
                  'before the procedure. The sex of the fetus must not be '
                  'disclosed by word, sign, or any other manner.',
                  style: TextStyle(
                      fontSize: 12,
                      height: 1.5,
                      color: cs.onSurface.withValues(alpha: 0.85)),
                ),
              ),
            ]),
          ),
          ..._scans.map((s) => _ScanCard(scan: s)),
          const ReferenceNote(
            sources: [
              'ISUOG Practice Guidelines — performance of first-trimester fetal '
                  'ultrasound scan; mid-trimester fetal ultrasound scan; fetal '
                  'Doppler; fetal echocardiography.',
              'RCOG / NHS Fetal Anomaly Screening Programme standards.',
              'Nicolaides KH et al. ASPRE trial. N Engl J Med 2017;377:613–622.',
              'FOGSI–ICOG recommendations on antenatal ultrasound.',
            ],
            caveat: 'Timing windows are the ones at which the examination is '
                'valid, not merely conventional. A nuchal translucency measured '
                'outside 11+0 to 13+6 weeks cannot be used for risk '
                'calculation at all.',
          ),
        ],
      ),
    );
  }
}

class _ScanCard extends StatelessWidget {
  const _ScanCard({required this.scan});
  final ScanGuide scan;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(scan.name,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(scan.timing,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: cs.primary)),
          ),
          children: [
            Text(scan.purpose,
                style: const TextStyle(fontSize: 12.5, height: 1.55)),
            const SizedBox(height: 14),
            _Block(label: 'What is measured', items: scan.measured, cs: cs),
            const SizedBox(height: 12),
            _Block(label: 'What you are looking for', items: scan.lookingFor, cs: cs),
            if (scan.note != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cs.primaryContainer.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(scan.note!,
                    style: const TextStyle(fontSize: 12, height: 1.5)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Block extends StatelessWidget {
  const _Block({required this.label, required this.items, required this.cs});
  final String label;
  final List<String> items;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label.toUpperCase(),
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.7,
              color: cs.onSurfaceVariant)),
      const SizedBox(height: 7),
      ...items.map((i) => Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('•  ', style: TextStyle(color: cs.primary, height: 1.5)),
              Expanded(
                  child: Text(i,
                      style: const TextStyle(fontSize: 12, height: 1.5))),
            ]),
          )),
    ]);
  }
}
