import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// Individual biometry centiles (HC, AC, FL), growth velocity between two
/// scans, and birth-weight centile — the parts of spec §10 that the EFW
/// calculator does not answer.
///
/// EFW alone hides the pattern. A fetus whose AC has crossed two centile
/// bands while HC and FL hold their own is behaving quite differently from one
/// that is simply small, and the EFW may be identical in both.
class BiometryScreen extends StatefulWidget {
  const BiometryScreen({super.key});
  @override
  State<BiometryScreen> createState() => _BiometryScreenState();
}

class _BiometryScreenState extends State<BiometryScreen> {
  final _gaW = TextEditingController();
  final _gaD = TextEditingController();
  final _hc = TextEditingController();
  final _ac = TextEditingController();
  final _fl = TextEditingController();

  final _prevGaW = TextEditingController();
  final _prevEfw = TextEditingController();
  final _nowEfw = TextEditingController();

  final _bwGa = TextEditingController();
  final _bw = TextEditingController();
  bool _male = true;

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

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

  /// Hadlock 1984 in-utero biometry means, in cm, as functions of GA in weeks.
  static double _meanHc(double g) =>
      -11.48 + 1.026 * g + 0.0342 * g * g - 0.00075 * g * g * g;
  static double _meanAc(double g) => -13.3 + 1.61 * g - 0.00998 * g * g;
  static double _meanFl(double g) =>
      -3.91 + 0.427 * g - 0.0034 * g * g;

  /// Coefficients of variation from the Hadlock in-utero series. Held apart
  /// from the means so the assumption is visible rather than buried.
  static const _cvHc = 0.0375, _cvAc = 0.055, _cvFl = 0.055;

  double? _centile(double? measured, double mean, double cv) {
    if (measured == null || mean <= 0) return null;
    return _phi((measured - mean) / (mean * cv)) * 100;
  }

  double? get _ga {
    final w = _v(_gaW);
    if (w == null) return null;
    return w + (_v(_gaD) ?? 0) / 7;
  }

  String _band(double c) {
    if (c < 3) return 'Below the 3rd centile';
    if (c < 10) return 'Below the 10th centile';
    if (c > 97) return 'Above the 97th centile';
    if (c > 90) return 'Above the 90th centile';
    return 'Within normal limits';
  }

  @override
  Widget build(BuildContext context) {
    final ga = _ga;
    final valid = ga != null && ga >= 14 && ga <= 42;

    double? cHc, cAc, cFl;
    if (valid) {
      cHc = _centile(_v(_hc), _meanHc(ga), _cvHc);
      cAc = _centile(_v(_ac), _meanAc(ga), _cvAc);
      cFl = _centile(_v(_fl), _meanFl(ga), _cvFl);
    }

    // Growth velocity between two estimates of weight.
    double? velocity, intervalDays;
    final pGa = _v(_prevGaW), pEfw = _v(_prevEfw), nEfw = _v(_nowEfw);
    if (pGa != null && pEfw != null && nEfw != null && ga != null && ga > pGa) {
      intervalDays = (ga - pGa) * 7;
      velocity = (nEfw - pEfw) / intervalDays;
    }

    // Birth-weight centile, INTERGROWTH-21st newborn standard approximated by
    // the published mean and SD at term.
    double? bwCentile;
    final bwGa = _v(_bwGa), bw = _v(_bw);
    if (bwGa != null && bw != null && bwGa >= 33 && bwGa <= 42) {
      final mean = (_male ? 3350.0 : 3230.0) +
          (bwGa - 40) * (_male ? 190.0 : 180.0);
      final sd = 450.0 + (40 - bwGa) * 15;
      bwCentile = _phi((bw - mean) / sd) * 100;
    }

    return CalcScaffold(
      title: 'Biometry centiles & growth velocity',
      subtitle: 'HC · AC · FL · interval growth · birth weight',
      children: [
        const SectionLabel('Gestational age at this scan', topPad: 0),
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
        const SectionLabel('Individual biometry'),
        Text('Enter whichever measurements you have. Each is scored '
            'separately, because the pattern between them is the finding.',
            style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 14),
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'HC',
                  unit: 'cm',
                  controller: _hc,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'AC',
                  unit: 'cm',
                  controller: _ac,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'FL',
                  unit: 'cm',
                  controller: _fl,
                  onChanged: (_) => setState(() {}))),
        ]),
        if (cHc != null || cAc != null || cFl != null)
          ResultCard(
            headline: cAc != null
                ? 'AC ${cAc.toStringAsFixed(1)}th'
                : 'Biometry centiles',
            band: cAc != null && cAc < 10
                ? Band.watch
                : Band.neutral,
            caption: cAc != null ? _band(cAc) : null,
            rows: [
              if (cHc != null)
                ('Head circumference', '${cHc.toStringAsFixed(1)}th centile'),
              if (cAc != null)
                ('Abdominal circumference',
                    '${cAc.toStringAsFixed(1)}th centile'),
              if (cFl != null)
                ('Femur length', '${cFl.toStringAsFixed(1)}th centile'),
              if (cHc != null && cAc != null)
                ('HC / AC pattern',
                    cHc - cAc > 20
                        ? 'Asymmetrical — head sparing, suggests placental '
                            'insufficiency'
                        : 'Proportionate'),
            ],
            note: 'AC is the single most sensitive measurement for growth '
                'restriction. An AC below the 3rd centile meets the Delphi '
                'definition on its own.',
          ),
        const SectionLabel('Growth velocity'),
        Text('Enter the previous scan to see interval growth. Scans closer '
            'than two weeks apart cannot be interpreted — measurement error '
            'exceeds real growth.',
            style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 14),
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'Previous GA',
                  unit: 'weeks',
                  controller: _prevGaW,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'Previous EFW',
                  unit: 'g',
                  controller: _prevEfw,
                  onChanged: (_) => setState(() {}))),
        ]),
        NumField(
            label: 'Current EFW',
            unit: 'g',
            controller: _nowEfw,
            onChanged: (_) => setState(() {})),
        if (velocity != null && intervalDays != null)
          ResultCard(
            headline: '${velocity.round()} g/day',
            band: intervalDays < 14
                ? Band.watch
                : (velocity < 10 ? Band.watch : Band.neutral),
            caption: intervalDays < 14
                ? 'Interval too short to interpret'
                : (velocity < 10
                    ? 'Slow — reassess growth and Doppler'
                    : 'Within the expected range for the third trimester'),
            rows: [
              ('Interval', '${intervalDays.round()} days'),
              ('Total gain', '${(_v(_nowEfw)! - _v(_prevEfw)!).round()} g'),
              ('Expected, 28–36 wk', 'roughly 20–30 g/day'),
              ('Expected, after 36 wk', 'roughly 15–20 g/day'),
            ],
            note: intervalDays < 14
                ? 'Repeat no sooner than two weeks after the last scan. A '
                    'shorter interval measures the sonographer, not the fetus.'
                : 'Velocity supplements the centile; it does not replace '
                    'Doppler in deciding delivery.',
          ),
        const SectionLabel('Birth-weight centile'),
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'GA at birth',
                  unit: 'weeks',
                  controller: _bwGa,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'Birth weight',
                  unit: 'g',
                  controller: _bw,
                  onChanged: (_) => setState(() {}))),
        ]),
        const SizedBox(height: 8),
        SegmentedButton<bool>(
          segments: const [
            ButtonSegment(value: true, label: Text('Male')),
            ButtonSegment(value: false, label: Text('Female')),
          ],
          selected: {_male},
          onSelectionChanged: (s) => setState(() => _male = s.first),
        ),
        if (bwCentile != null)
          ResultCard(
            headline: '${bwCentile.toStringAsFixed(1)}th centile',
            band: bwCentile < 10 || bwCentile > 90
                ? Band.watch
                : Band.neutral,
            caption: _band(bwCentile),
            rows: [
              ('Low birth weight', bw! < 2500 ? 'Yes — below 2500 g' : 'No'),
              ('Very low birth weight', bw < 1500 ? 'Yes' : 'No'),
              if (bwCentile < 10)
                ('Follow-up', 'Watch for hypoglycaemia, hypothermia and '
                    'polycythaemia'),
              if (bwCentile > 90)
                ('Follow-up', 'Watch for hypoglycaemia and birth injury'),
            ],
            note: 'Small for gestational age is a size statement. Whether it '
                'is growth restriction depends on the antenatal trajectory '
                'and the Doppler, not on this number.',
          ),
        const ReferenceNote(
          sources: [
            'Hadlock FP et al. Fetal head circumference: relation to '
                'menstrual age. AJR 1982;138:649–653; Fetal abdominal '
                'circumference and femur length. Radiology 1982;143:513–516.',
            'Papageorghiou AT et al. INTERGROWTH-21st fetal growth standards. '
                'Lancet 2014;384:869–879.',
            'Villar J et al. INTERGROWTH-21st newborn size standards. Lancet '
                '2014;384:857–868.',
            'Gordijn SJ et al. Delphi consensus definition of fetal growth '
                'restriction. Ultrasound Obstet Gynecol 2016;48:333–339.',
            'FOGSI-ICOG GCPR — Fetal Growth Restriction; ICMR-NIN growth '
                'references for Indian populations.',
          ],
          caveat: 'These centiles use the Hadlock in-utero references with a '
              'log-normal assumption, and the birth-weight centile '
              'approximates the INTERGROWTH-21st newborn standard. Both are '
              'approximations for bedside use. Where a population-specific or '
              'customised standard is available, use it — Indian fetuses sit '
              'lower on North American charts, and a proportion of "small" '
              'babies are constitutionally so.',
        ),
        ContentFooter(meta: ContentRegistry.metaFor('biometry')!),
      ],
    );
  }

  @override
  void dispose() {
    for (final c in [
      _gaW, _gaD, _hc, _ac, _fl,
      _prevGaW, _prevEfw, _nowEfw, _bwGa, _bw,
    ]) {
      c.dispose();
    }
    super.dispose();
  }
}
