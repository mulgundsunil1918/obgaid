import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// Anaemia in pregnancy (§9) — severity, the Ganzoni iron deficit, and what to
/// give.
///
/// This screen carries more weight in India than anywhere else: more than half
/// of Indian pregnant women are anaemic, and anaemia is what converts a
/// survivable postpartum haemorrhage into a fatal one.
class AnaemiaScreen extends StatefulWidget {
  const AnaemiaScreen({super.key});
  @override
  State<AnaemiaScreen> createState() => _AnaemiaScreenState();
}

class _AnaemiaScreenState extends State<AnaemiaScreen> {
  final _hb = TextEditingController();
  final _weight = TextEditingController();
  final _targetHb = TextEditingController(text: '11');
  int _trimester = 2;
  bool _postpartum = false;

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

  /// WHO thresholds, as adopted by Anemia Mukt Bharat.
  double get _threshold => _postpartum ? 10.0 : (_trimester == 2 ? 10.5 : 11.0);

  (Band, String, String) _grade(double hb) {
    if (hb < 4) {
      return (Band.critical, 'Very severe anaemia',
          'Hb below 4 g/dL. Cardiac failure is likely. Transfuse; involve '
              'medicine and critical care.');
    }
    if (hb < 7) {
      return (Band.critical, 'Severe anaemia',
          'Hb below 7 g/dL. Intravenous iron is not enough on its own near '
              'term — consider transfusion, and plan delivery in a unit with '
              'blood available.');
    }
    if (hb < 10) {
      return (Band.alert, 'Moderate anaemia',
          'Hb 7–9.9 g/dL. Intravenous iron is preferred over oral, '
              'particularly beyond 30 weeks when there is not time for oral '
              'iron to work.');
    }
    if (hb < _threshold) {
      return (Band.watch, 'Mild anaemia',
          'Oral iron with follow-up in 4 weeks. Escalate to intravenous iron '
              'if there is no response or she cannot tolerate it.');
    }
    return (Band.good, 'Not anaemic',
        'Above the threshold of $_threshold g/dL for this stage. Continue '
            'routine supplementation.');
  }

  @override
  Widget build(BuildContext context) {
    final hb = _v(_hb);
    final wt = _v(_weight);
    final target = _v(_targetHb) ?? 11;

    // Ganzoni: deficit (mg) = weight × (target Hb − actual Hb) × 2.4 + stores.
    // The 2.4 comes from the iron content of haemoglobin and blood volume as a
    // fraction of body weight; the 500 mg is the store to be replenished.
    double? deficit;
    if (hb != null && wt != null && target > hb) {
      deficit = wt * (target - hb) * 2.4 + (wt >= 35 ? 500 : 15 * wt);
    }

    // Roughly 3–4 mL/kg of packed cells raises haemoglobin by 1 g/dL.
    double? transfusionVolume;
    if (hb != null && wt != null && target > hb) {
      transfusionVolume = wt * (target - hb) * 4;
    }

    return CalcScaffold(
      title: 'Anaemia in pregnancy',
      subtitle: 'Severity · Ganzoni · IV iron',
      children: [
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'Haemoglobin',
                  unit: 'g/dL',
                  controller: _hb,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'Weight',
                  unit: 'kg',
                  controller: _weight,
                  onChanged: (_) => setState(() {}))),
        ]),
        NumField(
            label: 'Target haemoglobin',
            unit: 'g/dL',
            controller: _targetHb,
            onChanged: (_) => setState(() {})),
        ScoreChoice<int>(
          label: 'Stage',
          value: _postpartum ? 4 : _trimester,
          options: const [
            (1, 'First trimester'),
            (2, 'Second trimester'),
            (3, 'Third trimester'),
            (4, 'Postpartum'),
          ],
          onChanged: (v) => setState(() {
            _postpartum = v == 4;
            if (v != 4) _trimester = v;
          }),
        ),
        if (hb != null)
          Builder(builder: (_) {
            final (band, title, advice) = _grade(hb);
            return ResultCard(
              headline: title,
              band: band,
              caption: advice,
              rows: [
                ('Haemoglobin', '${hb.toStringAsFixed(1)} g/dL'),
                ('Threshold for this stage', '$_threshold g/dL'),
                if (deficit != null)
                  ('Ganzoni total iron deficit', '${deficit.round()} mg'),
                if (deficit != null)
                  ('Iron stores included',
                      wt! >= 35 ? '500 mg' : '${(15 * wt).round()} mg'),
                if (transfusionVolume != null)
                  ('If transfusing',
                      '≈ ${transfusionVolume.round()} mL packed cells'),
              ],
            );
          }),
        const SectionLabel('WHO / Anemia Mukt Bharat grading'),
        const _GradeRow('Not anaemic', '≥ 11 g/dL (≥ 10.5 in 2nd trimester)'),
        const _GradeRow('Mild', '10 – 10.9 g/dL'),
        const _GradeRow('Moderate', '7 – 9.9 g/dL'),
        const _GradeRow('Severe', '< 7 g/dL'),
        const _GradeRow('Very severe', '< 4 g/dL'),

        const SectionLabel('Intravenous iron'),
        const _IronRow('Iron sucrose',
            '200 mg per dose, up to three doses a week, maximum 600 mg weekly',
            'The workhorse in Indian practice. Safe from the second trimester. '
            'Needs multiple visits.'),
        const _IronRow('Ferric carboxymaltose',
            'Up to 20 mg/kg, maximum 1000 mg in a single sitting, repeat after '
            'a week if the deficit demands it',
            'One or two visits instead of six. Avoid in the first trimester — '
            'safety data are limited. Watch for hypophosphataemia.'),
        const _IronRow('Ferric derisomaltose',
            'Up to 20 mg/kg in a single infusion',
            'Where available; same first-trimester caution.'),
        const _IronRow('Oral iron',
            '100–200 mg elemental iron daily, or alternate-day dosing',
            'Alternate-day dosing raises absorption by lowering hepcidin, and '
            'is better tolerated. Give with vitamin C; avoid tea, coffee, '
            'calcium and antacids within two hours.'),

        const SectionLabel('When to choose what'),
        const _Advice('Oral iron',
            'Mild anaemia, before 30 weeks, tolerating tablets. Recheck at 4 '
            'weeks — expect a rise of about 1 g/dL.'),
        const _Advice('Intravenous iron',
            'Moderate or severe anaemia; beyond 30 weeks; oral iron not '
            'tolerated, not absorbed, or not working; malabsorption; '
            'postpartum anaemia.'),
        const _Advice('Transfusion',
            'Haemoglobin below 7 g/dL near term, cardiac decompensation, '
            'active bleeding, or anaemia with a haemodynamic effect. Iron does '
            'not work fast enough when she is bleeding.'),

        const SectionLabel('Look for the cause'),
        const _Advice('Investigate beyond iron',
            'Peripheral smear, ferritin, and where indicated B12, folate, '
            'haemoglobin electrophoresis for thalassaemia and sickle cell, '
            'stool for hookworm, and screening for chronic disease. In India, '
            'iron deficiency and haemoglobinopathy frequently coexist, and '
            'giving iron alone to a thalassaemia trait carrier does nothing.'),

        const ReferenceNote(
          sources: [
            'Ganzoni AM. Intravenous iron-dextran: therapeutic and '
                'experimental possibilities. Schweiz Med Wochenschr '
                '1970;100:301–303.',
            'WHO. Haemoglobin concentrations for the diagnosis of anaemia and '
                'assessment of severity. WHO/NMH/NHD/MNM/11.1.',
            'Anemia Mukt Bharat — Operational Guidelines, Ministry of Health & '
                'Family Welfare, Government of India.',
            'FOGSI GCPR — Anaemia in Pregnancy.',
            'RCOG Green-top Guideline 47 — Blood Transfusion in Obstetrics.',
            'Stoffel NU et al. Iron absorption from oral iron supplements '
                'given on consecutive versus alternate days. Lancet Haematol '
                '2017;4:e524–e533.',
          ],
          caveat: 'The Ganzoni formula estimates the total deficit to be '
              'replaced, not a single dose. Divide it across the licensed '
              'maximum for whichever preparation is used, and recheck the '
              'haemoglobin at 4 weeks rather than assuming the arithmetic '
              'worked.',
        ),
        ContentFooter(meta: ContentRegistry.metaFor('anaemia')!),
      ],
    );
  }

  @override
  void dispose() {
    for (final c in [_hb, _weight, _targetHb]) {
      c.dispose();
    }
    super.dispose();
  }
}

class _GradeRow extends StatelessWidget {
  const _GradeRow(this.grade, this.range);
  final String grade;
  final String range;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(grade, style: const TextStyle(fontSize: 12.5)),
          Text(range,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
        ]),
      );
}

class _IronRow extends StatelessWidget {
  const _IronRow(this.name, this.dose, this.note);
  final String name;
  final String dose;
  final String note;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name,
              style:
                  const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700)),
          Text(dose, style: const TextStyle(fontSize: 12, height: 1.4)),
          Text(note,
              style: TextStyle(
                  fontSize: 11.5,
                  height: 1.4,
                  color: Theme.of(context).colorScheme.onSurfaceVariant)),
        ]),
      );
}

class _Advice extends StatelessWidget {
  const _Advice(this.title, this.body);
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 11),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700)),
          Text(body,
              style: TextStyle(
                  fontSize: 11.5,
                  height: 1.45,
                  color: Theme.of(context).colorScheme.onSurfaceVariant)),
        ]),
      );
}
