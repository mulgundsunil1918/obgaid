import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

class _Factor {
  const _Factor(this.id, this.label, this.score, {this.detail});
  final String id;
  final String label;
  final int score;
  final String? detail;
}

/// Venous thromboembolism risk (RCOG Green-top 37a), for §24 and §12.
///
/// Thromboembolism remains a leading direct cause of maternal death, and it is
/// the one that a scoring sheet genuinely prevents.
class VteRiskScreen extends StatefulWidget {
  const VteRiskScreen({super.key});
  @override
  State<VteRiskScreen> createState() => _VteRiskScreenState();
}

class _VteRiskScreenState extends State<VteRiskScreen> {
  bool _postnatal = false;
  final _selected = <String>{};

  static const _preExisting = [
    _Factor('prev-vte-unprovoked', 'Previous VTE, except a single event '
        'related to major surgery', 4,
        detail: 'Requires antenatal LMWH regardless of other factors'),
    _Factor('prev-vte-surgery',
        'Previous VTE provoked by major surgery', 3),
    _Factor('high-thrombophilia', 'Known high-risk thrombophilia', 3,
        detail: 'Antithrombin deficiency, protein C or S deficiency, '
            'homozygous factor V Leiden, compound heterozygote, '
            'antiphospholipid syndrome'),
    _Factor('comorbidity', 'Medical comorbidity', 3,
        detail: 'Cancer, heart failure, active SLE, inflammatory bowel '
            'disease, inflammatory polyarthropathy, nephrotic syndrome, type 1 '
            'diabetes with nephropathy, sickle cell disease, current '
            'intravenous drug use'),
    _Factor('low-thrombophilia-fh',
        'Low-risk thrombophilia WITH a family history of VTE', 3),
    _Factor('family-history',
        'Family history of unprovoked or oestrogen-related VTE in a '
        'first-degree relative', 1),
    _Factor('low-thrombophilia',
        'Known low-risk thrombophilia, no family history', 1),
    _Factor('age35', 'Age over 35', 1),
    _Factor('bmi30', 'BMI 30 – 39', 1),
    _Factor('bmi40', 'BMI 40 or above', 2),
    _Factor('parity3', 'Parity 3 or more', 1),
    _Factor('smoker', 'Smoker', 1),
    _Factor('varicose', 'Gross varicose veins', 1),
  ];

  static const _obstetric = [
    _Factor('preeclampsia', 'Pre-eclampsia in the current pregnancy', 1),
    _Factor('art', 'ART or IVF — antenatal only', 1),
    _Factor('multiple', 'Multiple pregnancy', 1),
    _Factor('lscs-labour', 'Caesarean section in labour', 2),
    _Factor('lscs-elective', 'Elective caesarean section', 1),
    _Factor('operative', 'Mid-cavity or rotational operative delivery', 1),
    _Factor('prolonged', 'Prolonged labour, over 24 hours', 1),
    _Factor('pph', 'PPH over 1 litre, or transfusion', 1),
    _Factor('preterm', 'Preterm birth before 37 weeks, this pregnancy', 1),
    _Factor('stillbirth', 'Stillbirth in the current pregnancy', 1),
  ];

  static const _transient = [
    _Factor('surgery', 'Any surgical procedure in pregnancy or the '
        'puerperium', 3,
        detail: 'Except immediate perineal repair'),
    _Factor('hyperemesis', 'Hyperemesis', 3),
    _Factor('ohss', 'OHSS — first trimester only', 4),
    _Factor('infection', 'Current systemic infection', 1),
    _Factor('immobility', 'Immobility or dehydration', 1),
  ];

  int get _total {
    var t = 0;
    for (final f in [..._preExisting, ..._obstetric, ..._transient]) {
      if (_selected.contains(f.id)) t += f.score;
    }
    return t;
  }

  @override
  Widget build(BuildContext context) {
    final t = _total;
    final mandatory = _selected.contains('prev-vte-unprovoked') ||
        _selected.contains('high-thrombophilia');

    final (band, headline, advice) = _postnatal
        ? (t >= 2
            ? (Band.alert, 'Thromboprophylaxis indicated',
                'At least 10 days of low-molecular-weight heparin after birth.')
            : (Band.good, 'No routine prophylaxis',
                'Early mobilisation and avoidance of dehydration. Reassess if '
                    'she is readmitted or immobilised.'))
        : mandatory
            ? (Band.critical, 'Prophylaxis from the first trimester',
                'Previous unprovoked VTE or high-risk thrombophilia mandates '
                    'antenatal LMWH irrespective of the total score, and often '
                    'higher-dose or therapeutic anticoagulation. Discuss with '
                    'haematology.')
            : t >= 4
                ? (Band.alert, 'Prophylaxis from the first trimester',
                    'Score of 4 or more — start LMWH early in pregnancy and '
                        'continue for 6 weeks postpartum.')
                : t == 3
                    ? (Band.watch, 'Prophylaxis from 28 weeks',
                        'Score of 3 — start LMWH at 28 weeks and continue for '
                            '6 weeks postpartum.')
                    : (Band.good, 'No routine antenatal prophylaxis',
                        'Mobilise, avoid dehydration, and reassess at every '
                            'admission and after delivery.');

    return CalcScaffold(
      title: 'VTE risk',
      subtitle: 'RCOG Green-top 37a',
      children: [
        SegmentedButton<bool>(
          segments: const [
            ButtonSegment(value: false, label: Text('Antenatal')),
            ButtonSegment(value: true, label: Text('Postnatal')),
          ],
          selected: {_postnatal},
          onSelectionChanged: (s) => setState(() => _postnatal = s.first),
        ),
        const SizedBox(height: 8),
        Text(
          _postnatal
              ? 'Reassess after every birth. A score of 2 or more means at '
                  'least 10 days of low-molecular-weight heparin.'
              : 'Assess at booking, at every antenatal admission, and again '
                  'after delivery.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),
        const SectionLabel('Pre-existing risk factors'),
        ..._preExisting.map(_tile),
        const SectionLabel('Obstetric risk factors'),
        ..._obstetric.map(_tile),
        const SectionLabel('Transient risk factors'),
        ..._transient.map(_tile),
        ResultCard(
          headline: 'Score $t — $headline',
          band: band,
          caption: advice,
          rows: _postnatal
              ? const [
                  ('Score 2 or more', 'At least 10 days of LMWH'),
                  ('Admitted 3 days or more, or readmitted',
                      'Consider LMWH regardless of score'),
                ]
              : const [
                  ('Score 4 or more', 'LMWH from the first trimester'),
                  ('Score 3', 'LMWH from 28 weeks'),
                  ('Score below 3', 'Mobilise, avoid dehydration'),
                ],
        ),
        const SectionLabel('Enoxaparin prophylactic dose by booking weight'),
        const _DoseRow('Under 50 kg', '20 mg daily'),
        const _DoseRow('50 – 90 kg', '40 mg daily'),
        const _DoseRow('91 – 130 kg', '60 mg daily'),
        const _DoseRow('131 – 170 kg', '80 mg daily'),
        const _DoseRow('Over 170 kg', '0.6 mg/kg/day'),
        const SectionLabel('Practical points'),
        const _Point('Stop LMWH at the onset of labour or 24 hours before a '
            'planned caesarean.'),
        const _Point('Regional anaesthesia needs 12 hours after a prophylactic '
            'dose and 24 hours after a therapeutic one.'),
        const _Point('Restart 4–6 hours after vaginal birth, 6–12 hours after '
            'caesarean, and at least 4 hours after removing an epidural '
            'catheter.'),
        const _Point('LMWH does not cross the placenta and is safe in '
            'breastfeeding.'),
        const _Point('Warfarin is teratogenic in the first trimester and '
            'crosses the placenta — it is reserved for mechanical heart valves '
            'after specialist discussion.'),
        const _Point('Direct oral anticoagulants are not recommended in '
            'pregnancy or breastfeeding.'),
        const ReferenceNote(
          sources: [
            'RCOG Green-top Guideline 37a — Reducing the Risk of Venous '
                'Thromboembolism during Pregnancy and the Puerperium.',
            'RCOG Green-top Guideline 37b — Thromboembolic Disease in '
                'Pregnancy and the Puerperium: Acute Management.',
            'MBRRACE-UK — Saving Lives, Improving Mothers’ Care.',
          ],
          caveat: 'The score is a floor, not a ceiling. Clinical judgement may '
              'justify prophylaxis below the threshold, and a woman with '
              'previous VTE needs a haematology plan rather than a score.',
        ),
        ContentFooter(meta: ContentRegistry.metaFor('vte-risk')!),
      ],
    );
  }

  Widget _tile(_Factor f) {
    final on = _selected.contains(f.id);
    return CheckboxListTile(
      value: on,
      onChanged: (v) => setState(() {
        if (v ?? false) {
          _selected.add(f.id);
        } else {
          _selected.remove(f.id);
        }
      }),
      title: Text(f.label, style: const TextStyle(fontSize: 12.5, height: 1.35)),
      subtitle: f.detail == null
          ? null
          : Text(f.detail!,
              style: TextStyle(
                  fontSize: 11,
                  height: 1.35,
                  color: Theme.of(context).colorScheme.onSurfaceVariant)),
      secondary: Text('+${f.score}',
          style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.primary)),
      dense: true,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}

class _DoseRow extends StatelessWidget {
  const _DoseRow(this.weight, this.dose);
  final String weight;
  final String dose;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(weight, style: const TextStyle(fontSize: 12.5)),
          Text(dose,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
        ]),
      );
}

class _Point extends StatelessWidget {
  const _Point(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('•  ',
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          Expanded(
              child: Text(text,
                  style: const TextStyle(fontSize: 12, height: 1.5))),
        ]),
      );
}
