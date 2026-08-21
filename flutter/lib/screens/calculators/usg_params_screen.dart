import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';

enum UsgMode { crl, biometry, liquor }

/// Ultrasound parameters — gestational age from biometry, and amniotic fluid.
///
/// Kept separate from the dating screen on purpose: dating answers "when is
/// she due", this answers "what does this scan measure out at". They are used
/// at different moments and by different people.
class UsgParamsScreen extends StatefulWidget {
  const UsgParamsScreen({super.key});
  @override
  State<UsgParamsScreen> createState() => _UsgParamsScreenState();
}

class _UsgParamsScreenState extends State<UsgParamsScreen> {
  UsgMode _mode = UsgMode.crl;

  final _crl = TextEditingController();
  final _bpd = TextEditingController();
  final _hc = TextEditingController();
  final _ac = TextEditingController();
  final _fl = TextEditingController();
  final _q1 = TextEditingController();
  final _q2 = TextEditingController();
  final _q3 = TextEditingController();
  final _q4 = TextEditingController();
  final _dvp = TextEditingController();

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

  String _ga(double weeks) {
    final days = (weeks * 7).round();
    return '${days ~/ 7}w ${days % 7}d';
  }

  // ── Robinson & Fleming 1975, the standard first-trimester CRL equation ──
  double _gaFromCrl(double crlMm) =>
      (8.052 * math.sqrt(crlMm * 1.037) + 23.73) / 7.0;

  // ── Hadlock 1984 regressions, measurements in cm ────────────────────────
  double _gaBpd(double b) => 9.54 + 1.482 * b + 0.1676 * b * b;
  double _gaHc(double h) => 8.96 + 0.540 * h + 0.0003 * h * h * h;
  double _gaAc(double a) => 8.14 + 0.753 * a + 0.0036 * a * a;
  double _gaFl(double f) => 10.35 + 2.460 * f + 0.170 * f * f;
  double _gaComposite(double b, double h, double a, double f) =>
      10.85 + 0.060 * h * f + 0.67 * b + 0.168 * a;

  @override
  Widget build(BuildContext context) {
    return CalcScaffold(
      title: 'Ultrasound parameters',
      subtitle: 'GA from biometry · amniotic fluid',
      children: [
        SegmentedButton<UsgMode>(
          segments: const [
            ButtonSegment(value: UsgMode.crl, label: Text('CRL')),
            ButtonSegment(value: UsgMode.biometry, label: Text('Biometry')),
            ButtonSegment(value: UsgMode.liquor, label: Text('Liquor')),
          ],
          selected: {_mode},
          onSelectionChanged: (s) => setState(() => _mode = s.first),
        ),
        const SizedBox(height: 20),
        if (_mode == UsgMode.crl) ..._crlBody(),
        if (_mode == UsgMode.biometry) ..._biometryBody(),
        if (_mode == UsgMode.liquor) ..._liquorBody(),
      ],
    );
  }

  List<Widget> _crlBody() {
    final crl = _v(_crl);
    double? ga;
    if (crl != null && crl > 0) ga = _gaFromCrl(crl);

    return [
      Text(
        'Crown–rump length is the single most accurate way to date a '
        'pregnancy. It is reliable between about 7 and 13+6 weeks — below '
        '7 weeks the embryo is too small, and beyond 14 weeks fetal flexion '
        'makes the measurement unreliable.',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
      ),
      const SizedBox(height: 16),
      NumField(
        label: 'Crown–rump length',
        unit: 'mm',
        controller: _crl,
        onChanged: (_) => setState(() {}),
      ),
      if (ga != null)
        ResultCard(
          headline: _ga(ga),
          band: (crl! >= 10 && crl <= 84) ? Band.good : Band.watch,
          caption: crl < 10
              ? 'Below 10 mm this equation is extrapolating — confirm with a '
                  'repeat scan in a week.'
              : crl > 84
                  ? 'Above 84 mm (about 14 weeks) CRL is no longer reliable — '
                      'use head and abdominal biometry instead.'
                  : 'Within the range where CRL dating is most accurate.',
          rows: [
            ('CRL entered', '${crl.toStringAsFixed(1)} mm'),
            ('Gestational age', _ga(ga)),
            ('Reliable range', '10 – 84 mm (about 7 – 13+6 weeks)'),
          ],
        ),
      const ReferenceNote(
        sources: [
          'Robinson HP, Fleming JEE. A critical evaluation of sonar crown-rump '
              'length measurements. Br J Obstet Gynaecol 1975;82:702–710.',
          'ACOG Committee Opinion 700 — a first-trimester CRL is the most '
              'accurate method of establishing gestational age.',
        ],
        caveat: 'Measure in a true mid-sagittal plane, with the embryo in a '
            'neutral position and the yolk sac excluded. Take the mean of '
            'three measurements.',
      ),
    ];
  }

  List<Widget> _biometryBody() {
    final b = _v(_bpd), h = _v(_hc), a = _v(_ac), f = _v(_fl);
    final rows = <(String, String)>[];
    if (b != null) rows.add(('GA by BPD', _ga(_gaBpd(b))));
    if (h != null) rows.add(('GA by HC', _ga(_gaHc(h))));
    if (a != null) rows.add(('GA by AC', _ga(_gaAc(a))));
    if (f != null) rows.add(('GA by FL', _ga(_gaFl(f))));

    double? composite;
    if (b != null && h != null && a != null && f != null) {
      composite = _gaComposite(b, h, a, f);
    }

    return [
      Text(
        'Enter measurements in centimetres. Each parameter gives its own '
        'estimate; with all four present, the composite is the one to quote — '
        'it is more robust than any single measurement.',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
      ),
      const SizedBox(height: 16),
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
      if (rows.isNotEmpty)
        ResultCard(
          headline: composite != null
              ? _ga(composite)
              : 'GA by ${rows.length} parameter${rows.length == 1 ? '' : 's'}',
          band: composite != null ? Band.good : Band.neutral,
          caption: composite != null
              ? 'Hadlock composite of BPD, HC, AC and FL.'
              : 'Enter all four measurements for the composite estimate.',
          rows: [
            ...rows,
            if (composite != null) ('Composite (all four)', _ga(composite)),
          ],
          note: 'Second- and third-trimester biometry carries a widening '
              'margin of error: about ±1 week at 20 weeks, ±2 weeks at 28, and '
              '±3 weeks near term. It should not override an EDD already '
              'established by an earlier scan.',
        ),
      const ReferenceNote(
        sources: [
          'Hadlock FP et al. Estimating fetal age: computer-assisted analysis '
              'of multiple fetal growth parameters. Radiology 1984;152:497–501.',
        ],
        caveat: 'HC and AC are measured as ellipses at the standard planes — '
            'transventricular for HC, and at the level of the stomach and '
            'umbilical vein for AC. A poorly obtained AC is the commonest '
            'source of error in estimated weight.',
      ),
    ];
  }

  List<Widget> _liquorBody() {
    final q = [
      _v(_q1) ?? 0,
      _v(_q2) ?? 0,
      _v(_q3) ?? 0,
      _v(_q4) ?? 0,
    ];
    final anyEntered = [_q1, _q2, _q3, _q4].any((c) => c.text.trim().isNotEmpty);
    final afi = q.reduce((x, y) => x + y);
    final dvp = _v(_dvp);

    Band afiBand = Band.neutral;
    String afiText = '';
    if (anyEntered) {
      if (afi < 5) {
        afiBand = Band.alert;
        afiText = 'Oligohydramnios — AFI below 5 cm.';
      } else if (afi > 25) {
        afiBand = Band.alert;
        afiText = 'Polyhydramnios — AFI above 25 cm.';
      } else if (afi < 8) {
        afiBand = Band.watch;
        afiText = 'Low-normal (5 – 8 cm). Repeat and correlate with growth '
            'and Doppler.';
      } else {
        afiBand = Band.good;
        afiText = 'Normal — 5 to 25 cm.';
      }
    }

    Band dvpBand = Band.neutral;
    String dvpText = '';
    if (dvp != null) {
      if (dvp < 2) {
        dvpBand = Band.alert;
        dvpText = 'Oligohydramnios — deepest pocket below 2 cm.';
      } else if (dvp > 8) {
        dvpBand = Band.alert;
        dvpText = 'Polyhydramnios — deepest pocket above 8 cm.';
      } else {
        dvpBand = Band.good;
        dvpText = 'Normal — 2 to 8 cm.';
      }
    }

    return [
      const SectionLabel('Amniotic fluid index — four quadrants', topPad: 0),
      Row(children: [
        Expanded(
            child: NumField(
                label: 'Right upper',
                unit: 'cm',
                controller: _q1,
                onChanged: (_) => setState(() {}))),
        const SizedBox(width: 12),
        Expanded(
            child: NumField(
                label: 'Left upper',
                unit: 'cm',
                controller: _q2,
                onChanged: (_) => setState(() {}))),
      ]),
      Row(children: [
        Expanded(
            child: NumField(
                label: 'Right lower',
                unit: 'cm',
                controller: _q3,
                onChanged: (_) => setState(() {}))),
        const SizedBox(width: 12),
        Expanded(
            child: NumField(
                label: 'Left lower',
                unit: 'cm',
                controller: _q4,
                onChanged: (_) => setState(() {}))),
      ]),
      if (anyEntered)
        ResultCard(
          headline: 'AFI ${afi.toStringAsFixed(1)} cm',
          band: afiBand,
          caption: afiText,
          rows: const [
            ('Oligohydramnios', '< 5 cm'),
            ('Normal', '5 – 25 cm'),
            ('Polyhydramnios', '> 25 cm'),
          ],
        ),
      const SectionLabel('Single deepest vertical pocket'),
      Text(
        'The deepest pocket is now preferred over AFI for diagnosing '
        'oligohydramnios: using AFI leads to more inductions and caesareans '
        'without improving outcomes.',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
      ),
      const SizedBox(height: 14),
      NumField(
        label: 'Deepest vertical pocket',
        unit: 'cm',
        controller: _dvp,
        onChanged: (_) => setState(() {}),
      ),
      if (dvp != null)
        ResultCard(
          headline: 'DVP ${dvp.toStringAsFixed(1)} cm',
          band: dvpBand,
          caption: dvpText,
          rows: const [
            ('Oligohydramnios', '< 2 cm'),
            ('Normal', '2 – 8 cm'),
            ('Polyhydramnios', '> 8 cm'),
          ],
        ),
      const ReferenceNote(
        sources: [
          'Phelan JP et al. Amniotic fluid index measurements during pregnancy. '
              'J Reprod Med 1987;32:601–604.',
          'Nabhan AF, Abdelmoula YA. Amniotic fluid index versus single deepest '
              'vertical pocket. Cochrane Database Syst Rev 2008.',
          'SMFM and RCOG both favour the deepest vertical pocket for the '
              'diagnosis of oligohydramnios.',
        ],
        caveat: 'Measure pockets free of cord and fetal parts, with the '
            'transducer perpendicular to the floor. Polyhydramnios is graded '
            'mild (DVP 8–11 cm), moderate (12–15 cm) and severe (≥ 16 cm).',
      ),
    ];
  }

  @override
  void dispose() {
    for (final c in [
      _crl, _bpd, _hc, _ac, _fl, _q1, _q2, _q3, _q4, _dvp,
    ]) {
      c.dispose();
    }
    super.dispose();
  }
}
