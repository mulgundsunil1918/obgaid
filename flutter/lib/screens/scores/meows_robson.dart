import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';

/// Modified Early Obstetric Warning Score.
///
/// The trigger rule, not a total, is what escalates. Charts differ between
/// units — this uses widely-adopted thresholds and says so.
class MeowsScreen extends StatefulWidget {
  const MeowsScreen({super.key});
  @override
  State<MeowsScreen> createState() => _MeowsScreenState();
}

enum _Zone { white, yellow, red }

class _MeowsScreenState extends State<MeowsScreen> {
  final _rr = TextEditingController();
  final _spo2 = TextEditingController();
  final _temp = TextEditingController();
  final _sbp = TextEditingController();
  final _dbp = TextEditingController();
  final _hr = TextEditingController();
  bool _alert = true;

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

  _Zone _zoneRr(double v) =>
      (v < 10 || v > 30) ? _Zone.red : (v > 20 ? _Zone.yellow : _Zone.white);
  _Zone _zoneSpo2(double v) => v < 95 ? _Zone.red : _Zone.white;
  _Zone _zoneTemp(double v) => (v < 35 || v > 38)
      ? _Zone.red
      : ((v < 36 || v > 37.4) ? _Zone.yellow : _Zone.white);
  _Zone _zoneSbp(double v) => (v < 90 || v > 160)
      ? _Zone.red
      : ((v < 100 || v > 150) ? _Zone.yellow : _Zone.white);
  _Zone _zoneDbp(double v) =>
      v > 100 ? _Zone.red : (v > 90 ? _Zone.yellow : _Zone.white);
  _Zone _zoneHr(double v) => (v < 40 || v > 120)
      ? _Zone.red
      : ((v < 50 || v > 100) ? _Zone.yellow : _Zone.white);

  @override
  Widget build(BuildContext context) {
    final entries = <(String, _Zone?)>[
      ('Respiratory rate', _v(_rr) == null ? null : _zoneRr(_v(_rr)!)),
      ('Oxygen saturation', _v(_spo2) == null ? null : _zoneSpo2(_v(_spo2)!)),
      ('Temperature', _v(_temp) == null ? null : _zoneTemp(_v(_temp)!)),
      ('Systolic BP', _v(_sbp) == null ? null : _zoneSbp(_v(_sbp)!)),
      ('Diastolic BP', _v(_dbp) == null ? null : _zoneDbp(_v(_dbp)!)),
      ('Heart rate', _v(_hr) == null ? null : _zoneHr(_v(_hr)!)),
      ('Conscious level', _alert ? _Zone.white : _Zone.red),
    ];

    final reds = entries.where((e) => e.$2 == _Zone.red).length;
    final yellows = entries.where((e) => e.$2 == _Zone.yellow).length;
    final recorded = entries.where((e) => e.$2 != null).length;
    final rrMissing = _v(_rr) == null;
    final triggered = reds >= 1 || yellows >= 2;

    Widget field(String label, String unit, TextEditingController c) =>
        NumField(
            label: label,
            unit: unit,
            controller: c,
            onChanged: (_) => setState(() {}));

    return CalcScaffold(
      title: 'MEOWS',
      subtitle: 'Modified Early Obstetric Warning Score',
      children: [
        Text(
          'One red or two yellow observations trigger urgent medical review. '
          'Thresholds below are the widely-adopted ones — your unit chart may '
          'differ, and its trigger rule is the one that applies.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),
        const SizedBox(height: 16),
        Row(children: [
          Expanded(child: field('Respiratory rate', '/min', _rr)),
          const SizedBox(width: 12),
          Expanded(child: field('SpO₂', '%', _spo2)),
        ]),
        Row(children: [
          Expanded(child: field('Temperature', '°C', _temp)),
          const SizedBox(width: 12),
          Expanded(child: field('Heart rate', 'bpm', _hr)),
        ]),
        Row(children: [
          Expanded(child: field('Systolic BP', 'mmHg', _sbp)),
          const SizedBox(width: 12),
          Expanded(child: field('Diastolic BP', 'mmHg', _dbp)),
        ]),
        SwitchListTile(
          value: _alert,
          onChanged: (v) => setState(() => _alert = v),
          title: const Text('Alert on AVPU'),
          subtitle: Text(_alert
              ? 'Fully alert'
              : 'Anything other than alert is a RED trigger'),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        if (rrMissing)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: const Color(0xFFB8860B).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(11),
              border: Border.all(color: const Color(0xFFB8860B)),
            ),
            child: const Text(
              'Respiratory rate is not recorded. It is the earliest and most '
              'sensitive sign of deterioration, and the observation most often '
              'left blank — an incomplete chart cannot trigger.',
              style: TextStyle(
                  fontSize: 12, height: 1.5, fontWeight: FontWeight.w600),
            ),
          ),
        if (recorded > 1)
          ResultCard(
            headline: triggered ? 'TRIGGERED' : 'No trigger',
            band: reds >= 2
                ? Band.critical
                : triggered
                    ? Band.alert
                    : Band.good,
            caption: reds >= 2
                ? 'Multiple red observations. Immediate senior review, and '
                    'consider critical care.'
                : triggered
                    ? 'Urgent medical review now. Do not wait for the next '
                        'set of observations.'
                    : 'Continue routine observations. Clinical concern '
                        'overrides a non-triggering chart.',
            rows: [
              ('Red observations', '$reds'),
              ('Yellow observations', '$yellows'),
              ('Trigger rule', 'One red, or two yellow'),
              ...entries
                  .where((e) => e.$2 != null && e.$2 != _Zone.white)
                  .map((e) => (e.$1, e.$2 == _Zone.red ? 'RED' : 'Yellow')),
            ],
            note: 'A young woman compensates until she does not. In '
                'haemorrhage the chart may trigger late — if she looks wrong, '
                'escalate whatever the chart says.',
          ),
        const ReferenceNote(
          sources: [
            'RCOG Green-top Guideline 56 — Maternal Collapse in Pregnancy and '
                'the Puerperium.',
            'MBRRACE-UK — Saving Lives, Improving Mothers\' Care; recurring '
                'themes on failure to recognise and escalate.',
            'FOGSI GCPR — Maternal Early Warning Systems; MoHFW Dakshata.',
            'NICE NG51 — Sepsis, for the escalation principles.',
          ],
          caveat: 'MEOWS charts are not standardised. Thresholds here are '
              'representative; use your own unit\'s chart and its trigger '
              'rule. It is a prompt to escalate, not a diagnosis.',
        ),
      ],
    );
  }

  @override
  void dispose() {
    for (final c in [_rr, _spo2, _temp, _sbp, _dbp, _hr]) {
      c.dispose();
    }
    super.dispose();
  }
}

/// Robson ten-group classification.
class RobsonScreen extends StatefulWidget {
  const RobsonScreen({super.key});
  @override
  State<RobsonScreen> createState() => _RobsonScreenState();
}

class _RobsonScreenState extends State<RobsonScreen> {
  int _parity = 0; // 0 nulliparous, 1 multiparous
  bool _previousCs = false;
  int _onset = 0; // 0 spontaneous, 1 induced, 2 caesarean before labour
  bool _term = true;
  int _presentation = 0; // 0 cephalic, 1 breech, 2 transverse/oblique
  bool _multiple = false;

  /// Assignment order matters — the groups are mutually exclusive and the
  /// hierarchy is what makes them so.
  (int, String) get _group {
    if (_multiple) {
      return (8, 'All multiple pregnancies, including those with a previous '
          'caesarean');
    }
    if (_presentation == 2) {
      return (9, 'All abnormal lies — transverse or oblique — including those '
          'with a previous caesarean');
    }
    if (_presentation == 1) {
      return _parity == 0
          ? (6, 'All nulliparous women with a single breech')
          : (7, 'All multiparous women with a single breech, including those '
              'with a previous caesarean');
    }
    if (!_term) {
      return (10, 'All single cephalic pregnancies at 36 weeks or less, '
          'including those with a previous caesarean');
    }
    if (_previousCs) {
      return (5, 'Previous caesarean, single cephalic, 37 weeks or more');
    }
    if (_parity == 0) {
      return _onset == 0
          ? (1, 'Nulliparous, single cephalic, 37 weeks or more, spontaneous '
              'labour')
          : (2, 'Nulliparous, single cephalic, 37 weeks or more, induced or '
              'caesarean before labour');
    }
    return _onset == 0
        ? (3, 'Multiparous without a previous caesarean, single cephalic, 37 '
            'weeks or more, spontaneous labour')
        : (4, 'Multiparous without a previous caesarean, single cephalic, 37 '
            'weeks or more, induced or caesarean before labour');
  }

  @override
  Widget build(BuildContext context) {
    final (n, description) = _group;
    return CalcScaffold(
      title: 'Robson classification',
      subtitle: 'Ten-group caesarean audit',
      children: [
        Text(
          'Every woman fits exactly one group, and no woman fits two. This is '
          'an audit tool — it describes what happened, and says nothing about '
          'whether it was appropriate.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),
        const SizedBox(height: 16),
        SwitchListTile(
          value: _multiple,
          onChanged: (v) => setState(() => _multiple = v),
          title: const Text('Multiple pregnancy'),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        ScoreChoice<int>(
          label: 'Presentation',
          value: _presentation,
          options: const [
            (0, 'Cephalic'),
            (1, 'Breech'),
            (2, 'Transverse or oblique'),
          ],
          onChanged: (v) => setState(() => _presentation = v),
        ),
        ScoreChoice<int>(
          label: 'Parity',
          value: _parity,
          options: const [(0, 'Nulliparous'), (1, 'Multiparous')],
          onChanged: (v) => setState(() => _parity = v),
        ),
        SwitchListTile(
          value: _previousCs,
          onChanged: (v) => setState(() => _previousCs = v),
          title: const Text('Previous caesarean'),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        ScoreChoice<int>(
          label: 'Onset of labour',
          value: _onset,
          options: const [
            (0, 'Spontaneous'),
            (1, 'Induced'),
            (2, 'Caesarean before labour'),
          ],
          onChanged: (v) => setState(() => _onset = v),
        ),
        SwitchListTile(
          value: _term,
          onChanged: (v) => setState(() => _term = v),
          title: const Text('37 weeks or more'),
          subtitle: Text(_term ? 'Term' : '36 weeks or less — preterm'),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        ResultCard(
          headline: 'Group $n',
          band: Band.neutral,
          caption: description,
          rows: const [
            ('Groups 1 and 2', 'Nulliparous term cephalic — these drive the '
                'future caesarean rate'),
            ('Group 5', 'Previous caesarean — usually the largest contributor '
                'where the overall rate is high'),
            ('Groups 6 – 9', 'Small groups with high rates'),
          ],
          note: 'A high rate in group 5 is expected. The question the audit '
              'exists to answer is whether groups 1 and 2 are feeding it.',
        ),
        const ReferenceNote(
          sources: [
            'Robson MS. Classification of caesarean sections. Fetal Matern '
                'Med Rev 2001;12:23–39.',
            'WHO statement on caesarean section rates; WHO Robson '
                'classification implementation manual, 2017.',
            'FOGSI — caesarean audit recommendations.',
          ],
          caveat: 'It describes; it does not judge. It says nothing about '
              'indication or appropriateness, and needs complete data on '
              'every birth to mean anything.',
        ),
      ],
    );
  }
}
