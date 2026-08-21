import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// Estimated fetal weight by the Hadlock regressions, with a percentile from
/// the Hadlock 1991 in-utero growth reference.
///
/// The formula used is chosen by which biometry is actually entered — a scan
/// that only captured AC and FL should still produce an answer rather than a
/// blank screen.
class EfwScreen extends StatefulWidget {
  const EfwScreen({super.key});
  @override
  State<EfwScreen> createState() => _EfwScreenState();
}

class _EfwScreenState extends State<EfwScreen> {
  final _bpd = TextEditingController();
  final _hc = TextEditingController();
  final _ac = TextEditingController();
  final _fl = TextEditingController();
  final _gaW = TextEditingController();
  final _gaD = TextEditingController();

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

  /// Standard normal CDF via Abramowitz & Stegun 7.1.26 for erf.
  static double _phi(double z) {
    final sign = z < 0 ? -1.0 : 1.0;
    final x = z.abs() / math.sqrt2;
    const a1 = 0.254829592, a2 = -0.284496736, a3 = 1.421413741;
    const a4 = -1.453152027, a5 = 1.061405429, p = 0.3275911;
    final t = 1.0 / (1.0 + p * x);
    final y = 1.0 -
        (((((a5 * t + a4) * t) + a3) * t + a2) * t + a1) * t * math.exp(-x * x);
    return 0.5 * (1.0 + sign * y);
  }

  /// Hadlock 1991: median EFW for a given gestational age.
  static double _medianEfw(double gaWeeks) =>
      math.exp(0.578 + 0.332 * gaWeeks - 0.00354 * gaWeeks * gaWeeks);

  ({double efw, String formula})? get _efw {
    final bpd = _v(_bpd), hc = _v(_hc), ac = _v(_ac), fl = _v(_fl);
    if (ac == null || fl == null) return null;

    double log10Efw;
    String formula;

    if (bpd != null && hc != null) {
      log10Efw = 1.3596 -
          0.00386 * ac * fl +
          0.0064 * hc +
          0.00061 * bpd * ac +
          0.0424 * ac +
          0.174 * fl;
      formula = 'Hadlock 4 — BPD, HC, AC, FL';
    } else if (hc != null) {
      log10Efw = 1.326 -
          0.00326 * ac * fl +
          0.0107 * hc +
          0.0438 * ac +
          0.158 * fl;
      formula = 'Hadlock 3 — HC, AC, FL';
    } else if (bpd != null) {
      log10Efw = 1.335 -
          0.0034 * ac * fl +
          0.0316 * bpd +
          0.0457 * ac +
          0.1623 * fl;
      formula = 'Hadlock 2 — BPD, AC, FL';
    } else {
      log10Efw = 1.304 + 0.05281 * ac + 0.1938 * fl - 0.004 * ac * fl;
      formula = 'Hadlock 1 — AC, FL';
    }
    return (efw: math.pow(10, log10Efw).toDouble(), formula: formula);
  }

  double? get _gaWeeks {
    final w = int.tryParse(_gaW.text.trim());
    if (w == null) return null;
    final d = int.tryParse(_gaD.text.trim()) ?? 0;
    return w + d / 7.0;
  }

  @override
  Widget build(BuildContext context) {
    final result = _efw;
    final ga = _gaWeeks;

    double? percentile;
    double? median;
    if (result != null && ga != null && ga >= 20 && ga <= 42) {
      median = _medianEfw(ga);
      // Hadlock's published percentiles sit at roughly ±20% of the median at
      // the 10th and 90th, which is an SD of 0.155 × median.
      final sd = 0.155 * median;
      percentile = _phi((result.efw - median) / sd) * 100;
    }

    Band band = Band.neutral;
    String caption = 'Enter AC and FL to calculate.';
    if (result != null) {
      caption = result.formula;
      if (percentile != null) {
        if (percentile < 3) {
          band = Band.critical;
          caption = 'Severe SGA — below the 3rd centile';
        } else if (percentile < 10) {
          band = Band.alert;
          caption = 'Small for gestational age — below the 10th centile';
        } else if (percentile > 97) {
          band = Band.alert;
          caption = 'Severe LGA — above the 97th centile';
        } else if (percentile > 90) {
          band = Band.watch;
          caption = 'Large for gestational age — above the 90th centile';
        } else {
          band = Band.good;
          caption = 'Appropriate for gestational age';
        }
      }
    }

    return CalcScaffold(
      title: 'Estimated fetal weight',
      subtitle: 'Hadlock · with growth centile',
      children: [
        const SectionLabel('Biometry', topPad: 0),
        Text('AC and FL are required. Adding HC and BPD selects a more '
            'precise Hadlock formula automatically.',
            style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 14),
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'BPD',
                  unit: 'cm',
                  controller: _bpd,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'HC',
                  unit: 'cm',
                  controller: _hc,
                  onChanged: (_) => setState(() {}))),
        ]),
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'AC *',
                  unit: 'cm',
                  controller: _ac,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'FL *',
                  unit: 'cm',
                  controller: _fl,
                  onChanged: (_) => setState(() {}))),
        ]),
        const SectionLabel('Gestational age (for the centile)'),
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'GA',
                  unit: 'weeks',
                  controller: _gaW,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: '',
                  unit: 'days',
                  controller: _gaD,
                  onChanged: (_) => setState(() {}))),
        ]),
        if (result != null)
          ResultCard(
            headline: '${result.efw.round()} g',
            band: band,
            caption: caption,
            rows: [
              ('Formula used', result.formula),
              if (percentile != null)
                ('Centile', '${percentile.toStringAsFixed(1)}th'),
              if (median != null)
                ('Median for GA', '${median.round()} g'),
              if (median != null)
                ('10th centile', '${(median * 0.801).round()} g'),
              if (median != null)
                ('90th centile', '${(median * 1.199).round()} g'),
              if (result.efw >= 4000)
                ('Macrosomia', result.efw >= 4500
                    ? '≥ 4500 g — counsel on shoulder dystocia and mode of delivery'
                    : '≥ 4000 g'),
            ],
            note: percentile == null
                ? 'Enter a gestational age between 20 and 42 weeks to get a centile.'
                : null,
          ),
        const ReferenceNote(
          sources: [
            'Hadlock FP et al. Estimation of fetal weight with the use of head, '
                'body, and femur measurements. Am J Obstet Gynecol 1985.',
            'Hadlock FP et al. In utero analysis of fetal growth: a sonographic '
                'weight standard. Radiology 1991;181:129–133.',
            'SGA / LGA thresholds: below 10th and above 90th centile; severe at '
                '3rd and 97th.',
          ],
          caveat: 'Hadlock is a North American reference. INTERGROWTH-21st and '
              'customised (GROW) charts are alternatives where a population-'
              'specific standard matters — both are planned for Phase 2. '
              'Ultrasound EFW carries a typical error of ±10–15%.',
        ),
        ContentFooter(meta: ContentRegistry.metaFor('efw')!),
      ],
    );
  }

  @override
  void dispose() {
    for (final c in [_bpd, _hc, _ac, _fl, _gaW, _gaD]) {
      c.dispose();
    }
    super.dispose();
  }
}
