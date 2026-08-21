import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// Insulin dosing in pregnancy (§8).
///
/// Requirement climbs through pregnancy as placental hormones drive insulin
/// resistance, then collapses the moment the placenta is delivered. Both
/// halves of that curve are on this screen, because the postpartum fall is
/// where women get hypoglycaemic on a dose that was correct an hour earlier.
class InsulinScreen extends StatefulWidget {
  const InsulinScreen({super.key});
  @override
  State<InsulinScreen> createState() => _InsulinScreenState();
}

class _InsulinScreenState extends State<InsulinScreen> {
  final _weight = TextEditingController();
  final _currentGlucose = TextEditingController();
  final _targetGlucose = TextEditingController(text: '100');
  int _trimester = 2;

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

  /// Units/kg/day. Resistance roughly doubles between conception and term.
  double get _factor => switch (_trimester) {
        1 => 0.7,
        2 => 0.8,
        _ => 1.0,
      };

  @override
  Widget build(BuildContext context) {
    final wt = _v(_weight);
    final tdd = wt == null ? null : wt * _factor;

    // 1800 rule for rapid-acting analogues; 500 rule for carbohydrate.
    final isf = tdd == null ? null : 1800 / tdd;
    final carbRatio = tdd == null ? null : 500 / tdd;

    final cur = _v(_currentGlucose);
    final tgt = _v(_targetGlucose) ?? 100;
    double? correction;
    if (isf != null && cur != null && cur > tgt) {
      correction = (cur - tgt) / isf;
    }

    return CalcScaffold(
      title: 'Insulin in pregnancy',
      subtitle: 'Total daily dose · basal-bolus · correction',
      children: [
        NumField(
            label: 'Current weight',
            unit: 'kg',
            controller: _weight,
            onChanged: (_) => setState(() {})),
        ScoreChoice<int>(
          label: 'Trimester',
          value: _trimester,
          options: const [
            (1, 'First — 0.7 u/kg'),
            (2, 'Second — 0.8 u/kg'),
            (3, 'Third — 0.9–1.0 u/kg'),
          ],
          onChanged: (v) => setState(() => _trimester = v),
        ),
        if (tdd != null)
          ResultCard(
            headline: '${tdd.round()} units/day',
            band: Band.neutral,
            caption: 'Starting total daily dose. Titrate against her actual '
                'readings — this is a place to begin, not a prescription.',
            rows: [
              ('Basal (50%)', '${(tdd * 0.5).round()} units — long-acting, '
                  'usually at bedtime'),
              ('Bolus total (50%)', '${(tdd * 0.5).round()} units, divided '
                  'across meals'),
              ('Per meal', '${(tdd * 0.5 / 3).round()} units before each of '
                  'three meals'),
              if (isf != null)
                ('Insulin sensitivity factor',
                    '1 unit drops glucose by ≈ ${isf.round()} mg/dL '
                        '(1800 ÷ TDD)'),
              if (carbRatio != null)
                ('Carbohydrate ratio',
                    '1 unit covers ≈ ${carbRatio.round()} g carbohydrate '
                        '(500 ÷ TDD)'),
            ],
          ),
        const SectionLabel('Correction dose'),
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'Current glucose',
                  unit: 'mg/dL',
                  controller: _currentGlucose,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'Target',
                  unit: 'mg/dL',
                  controller: _targetGlucose,
                  onChanged: (_) => setState(() {}))),
        ]),
        if (correction != null)
          ResultCard(
            headline: '${correction.toStringAsFixed(1)} units',
            band: Band.watch,
            caption: 'Correction dose of rapid-acting insulin, on top of any '
                'meal bolus.',
            rows: [
              ('Formula', '(current − target) ÷ sensitivity factor'),
              ('Sensitivity factor', '${isf!.round()} mg/dL per unit'),
            ],
            note: 'Do not stack corrections. Wait at least 3–4 hours before '
                'giving another — rapid-acting insulin is still working.',
          ),
        const SectionLabel('Glycaemic targets in pregnancy'),
        const _Target('Fasting', '< 95 mg/dL (5.3 mmol/L)'),
        const _Target('1 hour post-meal', '< 140 mg/dL (7.8 mmol/L)'),
        const _Target('2 hours post-meal', '< 120 mg/dL (6.7 mmol/L)'),
        const _Target('HbA1c', '< 6.0–6.5%, where achievable without '
            'hypoglycaemia'),

        const SectionLabel('Postpartum — the dangerous transition'),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFB3261E).withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: const Color(0xFFB3261E).withValues(alpha: 0.4)),
          ),
          child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Insulin requirement falls the moment the placenta is out.',
                    style: TextStyle(
                        fontSize: 12.5,
                        height: 1.5,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: 8),
                Text(
                    'Gestational diabetes — stop insulin at delivery.\n\n'
                    'Pre-existing type 1 or type 2 — drop immediately to the '
                    'pre-pregnancy dose, or to roughly 50% of the late-'
                    'pregnancy dose if that is unknown.\n\n'
                    'Breastfeeding lowers requirement further. Check glucose '
                    'before and after feeds in the first days.',
                    style: TextStyle(fontSize: 12, height: 1.55)),
              ]),
        ),

        const SectionLabel('Hypoglycaemia — the rule of 15'),
        const _Step('Glucose below 70 mg/dL: give 15 g of fast-acting '
            'carbohydrate — 3–4 glucose tablets, 150 mL of juice, or a '
            'tablespoon of sugar.'),
        const _Step('Recheck after 15 minutes. Repeat if still below 70.'),
        const _Step('Once above 70, give a snack containing complex '
            'carbohydrate and protein if the next meal is more than an hour '
            'away.'),
        const _Step('If she is unconscious or unable to swallow: glucagon 1 mg '
            'intramuscularly, or 25 mL of 50% dextrose intravenously.'),

        const ReferenceNote(
          sources: [
            'NICE NG3 — Diabetes in pregnancy: management from preconception '
                'to the postnatal period.',
            'ACOG Practice Bulletin 190 — Gestational Diabetes Mellitus; '
                'Practice Bulletin 201 — Pregestational Diabetes Mellitus.',
            'ADA Standards of Care — Management of Diabetes in Pregnancy.',
            'FOGSI–ICOG GCPR on Gestational Diabetes Mellitus.',
            'The 1800 and 500 rules are long-standing clinical conventions for '
                'rapid-acting analogues, not trial-derived constants.',
          ],
          caveat: 'Weight-based starting doses are a beginning, not a target. '
              'Requirement in pregnancy varies several-fold between women and '
              'changes week to week. Titrate against her own readings, and '
              'involve a diabetes team where one is available.',
        ),
        ContentFooter(meta: ContentRegistry.metaFor('insulin')!),
      ],
    );
  }

  @override
  void dispose() {
    for (final c in [_weight, _currentGlucose, _targetGlucose]) {
      c.dispose();
    }
    super.dispose();
  }
}

class _Target extends StatelessWidget {
  const _Target(this.when, this.value);
  final String when;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(when, style: const TextStyle(fontSize: 12.5)),
          Text(value,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
        ]),
      );
}

class _Step extends StatelessWidget {
  const _Step(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('•  ',
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          Expanded(
              child:
                  Text(text, style: const TextStyle(fontSize: 12, height: 1.5))),
        ]),
      );
}
