import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// Gestational weight gain against the IOM 2009 ranges (§4).
class WeightGainScreen extends StatefulWidget {
  const WeightGainScreen({super.key});
  @override
  State<WeightGainScreen> createState() => _WeightGainScreenState();
}

class _WeightGainScreenState extends State<WeightGainScreen> {
  final _prePregWeight = TextEditingController();
  final _height = TextEditingController();
  final _currentWeight = TextEditingController();
  final _gaWeeks = TextEditingController();
  bool _twins = false;

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

  /// IOM 2009 total gain and second/third-trimester rate, by pre-pregnancy BMI.
  ({String cat, double lo, double hi, double rateLo, double rateHi}) _target(
      double bmi) {
    if (_twins) {
      // The twin ranges are provisional; the IOM gives none for underweight.
      if (bmi < 18.5) {
        return (cat: 'Underweight', lo: 17, hi: 25, rateLo: 0.6, rateHi: 0.8);
      }
      if (bmi < 25) {
        return (cat: 'Normal weight', lo: 17, hi: 25, rateLo: 0.6, rateHi: 0.8);
      }
      if (bmi < 30) {
        return (cat: 'Overweight', lo: 14, hi: 23, rateLo: 0.5, rateHi: 0.7);
      }
      return (cat: 'Obese', lo: 11, hi: 19, rateLo: 0.4, rateHi: 0.6);
    }
    if (bmi < 18.5) {
      return (cat: 'Underweight', lo: 12.5, hi: 18, rateLo: 0.44, rateHi: 0.58);
    }
    if (bmi < 25) {
      return (cat: 'Normal weight', lo: 11.5, hi: 16, rateLo: 0.35, rateHi: 0.50);
    }
    if (bmi < 30) {
      return (cat: 'Overweight', lo: 7, hi: 11.5, rateLo: 0.23, rateHi: 0.33);
    }
    return (cat: 'Obese', lo: 5, hi: 9, rateLo: 0.17, rateHi: 0.27);
  }

  @override
  Widget build(BuildContext context) {
    final pre = _v(_prePregWeight);
    final h = _v(_height);
    final cur = _v(_currentWeight);
    final ga = _v(_gaWeeks);

    double? bmi;
    if (pre != null && h != null && h > 0) bmi = pre / math.pow(h / 100, 2);

    Widget? result;
    if (bmi != null && cur != null && ga != null && ga > 0) {
      final t = _target(bmi);
      final gained = cur - pre!;
      // First trimester allowance is 0.5–2 kg for everyone; the weekly rate
      // applies from 14 weeks.
      final weeksInRate = math.max(0.0, ga - 13);
      final expectedLo = 0.5 + t.rateLo * weeksInRate;
      final expectedHi = 2.0 + t.rateHi * weeksInRate;

      final (band, verdict) = gained < expectedLo
          ? (Band.watch, 'Below the expected range for this gestation')
          : gained > expectedHi
              ? (Band.alert, 'Above the expected range for this gestation')
              : (Band.good, 'Within the expected range for this gestation');

      result = ResultCard(
        headline: '${gained >= 0 ? '+' : ''}${gained.toStringAsFixed(1)} kg',
        band: band,
        caption: verdict,
        rows: [
          ('Pre-pregnancy BMI',
              '${bmi.toStringAsFixed(1)} — ${t.cat}'),
          ('Expected by ${ga.toStringAsFixed(0)} weeks',
              '${expectedLo.toStringAsFixed(1)} – ${expectedHi.toStringAsFixed(1)} kg'),
          ('Total gain target (${_twins ? 'twins' : 'singleton'})',
              '${t.lo} – ${t.hi} kg'),
          ('Weekly rate, 2nd–3rd trimester',
              '${t.rateLo} – ${t.rateHi} kg/week'),
          ('First trimester allowance', '0.5 – 2 kg'),
        ],
        note: gained < expectedLo
            ? 'Inadequate gain is associated with fetal growth restriction, '
                'preterm birth and low birth weight. Review dietary intake, '
                'hyperemesis, and screen for anaemia and thyroid disease.'
            : gained > expectedHi
                ? 'Excessive gain is associated with macrosomia, gestational '
                    'diabetes, pre-eclampsia, caesarean birth and postpartum '
                    'weight retention.'
                : null,
      );
    }

    return CalcScaffold(
      title: 'Gestational weight gain',
      subtitle: 'IOM 2009 ranges',
      children: [
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'Pre-pregnancy weight',
                  unit: 'kg',
                  controller: _prePregWeight,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'Height',
                  unit: 'cm',
                  controller: _height,
                  onChanged: (_) => setState(() {}))),
        ]),
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'Current weight',
                  unit: 'kg',
                  controller: _currentWeight,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'Gestation',
                  unit: 'weeks',
                  controller: _gaWeeks,
                  onChanged: (_) => setState(() {}))),
        ]),
        SwitchListTile(
          value: _twins,
          onChanged: (v) => setState(() => _twins = v),
          title: const Text('Twin pregnancy'),
          subtitle: const Text('IOM twin ranges are provisional'),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        if (result != null) result,
        const SectionLabel('IOM 2009 — singleton'),
        const _RangeRow('Underweight — BMI < 18.5', '12.5 – 18 kg', '0.44 – 0.58 kg/wk'),
        const _RangeRow('Normal — BMI 18.5–24.9', '11.5 – 16 kg', '0.35 – 0.50 kg/wk'),
        const _RangeRow('Overweight — BMI 25–29.9', '7 – 11.5 kg', '0.23 – 0.33 kg/wk'),
        const _RangeRow('Obese — BMI ≥ 30', '5 – 9 kg', '0.17 – 0.27 kg/wk'),
        const SectionLabel('IOM 2009 — twins (provisional)'),
        const _RangeRow('Normal weight', '17 – 25 kg', '—'),
        const _RangeRow('Overweight', '14 – 23 kg', '—'),
        const _RangeRow('Obese', '11 – 19 kg', '—'),
        const ReferenceNote(
          sources: [
            'Institute of Medicine (US) and National Research Council. Weight '
                'Gain During Pregnancy: Reexamining the Guidelines. '
                'Washington DC: National Academies Press, 2009.',
            'ACOG Committee Opinion 548 — Weight Gain During Pregnancy '
                '(reaffirmed).',
          ],
          caveat: 'The IOM ranges were derived in a largely North American '
              'population and use WHO BMI categories. Where Asia-Pacific '
              'thresholds are used for classification, the same woman may fall '
              'into a different band — record which criteria were applied. The '
              'IOM gives no separate range for underweight twin pregnancies; '
              'the normal-weight range is used here as the closest available '
              'guide.',
        ),
        ContentFooter(meta: ContentRegistry.metaFor('weight-gain')!),
      ],
    );
  }

  @override
  void dispose() {
    for (final c in [_prePregWeight, _height, _currentWeight, _gaWeeks]) {
      c.dispose();
    }
    super.dispose();
  }
}

class _RangeRow extends StatelessWidget {
  const _RangeRow(this.cat, this.total, this.rate);
  final String cat;
  final String total;
  final String rate;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(children: [
          Expanded(
              flex: 5,
              child: Text(cat,
                  style: const TextStyle(fontSize: 12, height: 1.35))),
          Expanded(
              flex: 3,
              child: Text(total,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w700))),
          Expanded(
              flex: 4,
              child: Text(rate,
                  style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).colorScheme.onSurfaceVariant))),
        ]),
      );
}
