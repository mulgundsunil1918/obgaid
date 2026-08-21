import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';

enum DatingMode { lmp, scan, ivf }

class DatingScreen extends StatefulWidget {
  const DatingScreen({super.key});
  @override
  State<DatingScreen> createState() => _DatingScreenState();
}

class _DatingScreenState extends State<DatingScreen> {
  DatingMode _mode = DatingMode.lmp;

  DateTime? _lmp;
  int _cycle = 28;

  DateTime? _scanDate;
  final _scanW = TextEditingController();
  final _scanD = TextEditingController();

  DateTime? _transferDate;
  int _embryoDay = 5;

  static final _fmt = DateFormat('d MMM yyyy');

  /// Today, normalised to midnight so day arithmetic can't drift by a few hours.
  DateTime get _today {
    final n = DateTime.now();
    return DateTime(n.year, n.month, n.day);
  }

  /// Naegele's rule, corrected for cycle length. A 35-day cycle ovulates ~7
  /// days later than a 28-day one, so the EDD moves out by the difference.
  DateTime? get _edd {
    switch (_mode) {
      case DatingMode.lmp:
        if (_lmp == null) return null;
        return _lmp!.add(Duration(days: 280 + (_cycle - 28)));
      case DatingMode.scan:
        if (_scanDate == null) return null;
        final gaDays = _scanGaDays;
        if (gaDays == null) return null;
        return _scanDate!.add(Duration(days: 280 - gaDays));
      case DatingMode.ivf:
        if (_transferDate == null) return null;
        // Day-5 blastocyst transfer: EDD = transfer + 261.
        // Day-3 cleavage transfer: EDD = transfer + 263.
        // Both resolve to retrieval + 266.
        return _transferDate!.add(Duration(days: _embryoDay == 5 ? 261 : 263));
    }
  }

  int? get _scanGaDays {
    final w = int.tryParse(_scanW.text);
    final d = int.tryParse(_scanD.text) ?? 0;
    if (w == null) return null;
    return w * 7 + d;
  }

  /// GA today = 280 days minus however long is left until the EDD.
  int? get _gaDaysToday {
    final edd = _edd;
    if (edd == null) return null;
    return 280 - edd.difference(_today).inDays;
  }

  String _fmtGa(int days) {
    if (days < 0) return 'Not yet conceived by these dates';
    return '${days ~/ 7}w ${days % 7}d';
  }

  String _trimester(int days) {
    if (days < 98) return 'First trimester';
    if (days < 196) return 'Second trimester';
    return 'Third trimester';
  }

  /// ACOG "Methods for Estimating the Due Date" term categories.
  (String, Band) _termBand(int days) {
    if (days < 196) return ('Previable / preterm range', Band.neutral);
    if (days < 231) return ('Extremely to very preterm', Band.critical);
    if (days < 259) return ('Moderate to late preterm', Band.alert);
    if (days < 273) return ('Early term', Band.watch);
    if (days < 287) return ('Full term', Band.good);
    if (days < 294) return ('Late term', Band.watch);
    return ('Post-term', Band.alert);
  }

  /// ACOG/AIUM/SMFM Committee Opinion 700 redating thresholds. If the scan
  /// disagrees with the LMP by more than the allowance for that gestation,
  /// the scan wins.
  (int allowance, String window)? _redateRule(int gaDaysByScan) {
    if (gaDaysByScan < 63) return (5, 'Up to 8w6d');
    if (gaDaysByScan < 112) return (7, '9w0d – 15w6d');
    if (gaDaysByScan < 154) return (10, '16w0d – 21w6d');
    if (gaDaysByScan < 196) return (14, '22w0d – 27w6d');
    return (21, '28w0d and beyond');
  }

  Future<void> _pick(BuildContext context, ValueChanged<DateTime> set,
      {DateTime? initial}) async {
    final now = _today;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial ?? now,
      firstDate: now.subtract(const Duration(days: 400)),
      lastDate: now.add(const Duration(days: 400)),
    );
    if (picked != null) set(picked);
  }

  Widget _dateTile(String label, DateTime? value, ValueChanged<DateTime> set) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => _pick(context, set, initial: value),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: const Icon(Icons.calendar_today_outlined, size: 18),
          ),
          child: Text(value == null ? 'Tap to select' : _fmt.format(value),
              style: TextStyle(
                  fontWeight: value == null ? FontWeight.w400 : FontWeight.w600,
                  color: value == null ? Theme.of(context).hintColor : null)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final edd = _edd;
    final gaDays = _gaDaysToday;

    return CalcScaffold(
      title: 'Dating & gestational age',
      subtitle: 'EDD · current GA · redating',
      children: [
        SegmentedButton<DatingMode>(
          segments: const [
            ButtonSegment(value: DatingMode.lmp, label: Text('LMP')),
            ButtonSegment(value: DatingMode.scan, label: Text('Scan')),
            ButtonSegment(value: DatingMode.ivf, label: Text('IVF')),
          ],
          selected: {_mode},
          onSelectionChanged: (s) => setState(() => _mode = s.first),
        ),
        const SizedBox(height: 20),

        if (_mode == DatingMode.lmp) ...[
          _dateTile('First day of last menstrual period', _lmp,
              (d) => setState(() => _lmp = d)),
          Text('Cycle length: $_cycle days',
              style: Theme.of(context).textTheme.bodyMedium),
          Slider(
            value: _cycle.toDouble(),
            min: 21,
            max: 45,
            divisions: 24,
            label: '$_cycle days',
            onChanged: (v) => setState(() => _cycle = v.round()),
          ),
          if (_cycle != 28)
            Text(
              'EDD shifted by ${_cycle - 28 > 0 ? '+' : ''}${_cycle - 28} days for a '
              '$_cycle-day cycle.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
        ],

        if (_mode == DatingMode.scan) ...[
          _dateTile('Date of ultrasound', _scanDate,
              (d) => setState(() => _scanDate = d)),
          Row(children: [
            Expanded(
              child: NumField(
                label: 'GA at scan',
                unit: 'weeks',
                controller: _scanW,
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: NumField(
                label: '',
                unit: 'days',
                controller: _scanD,
                onChanged: (_) => setState(() {}),
              ),
            ),
          ]),
        ],

        if (_mode == DatingMode.ivf) ...[
          _dateTile('Date of embryo transfer', _transferDate,
              (d) => setState(() => _transferDate = d)),
          ScoreChoice<int>(
            label: 'Embryo age at transfer',
            value: _embryoDay,
            options: const [
              (3, 'Day 3 — cleavage'),
              (5, 'Day 5 — blastocyst'),
            ],
            onChanged: (v) => setState(() => _embryoDay = v),
          ),
          Text(
            'IVF dating is exact — it overrides both LMP and ultrasound, and is '
            'never redated by a scan.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],

        if (edd != null && gaDays != null) ...[
          Builder(builder: (_) {
            final (term, band) = _termBand(gaDays);
            return ResultCard(
              headline: _fmtGa(gaDays),
              band: gaDays < 0 ? Band.neutral : band,
              caption: gaDays < 0 ? null : term,
              rows: [
                ('Estimated due date', _fmt.format(edd)),
                ('Trimester', gaDays < 0 ? '—' : _trimester(gaDays)),
                (
                  'Days to EDD',
                  '${edd.difference(_today).inDays} '
                      '(${edd.difference(_today).inDays < 0 ? 'past due' : 'remaining'})'
                ),
                ('40-week date', _fmt.format(edd)),
                ('Post-term (42w0d)',
                    _fmt.format(edd.add(const Duration(days: 14)))),
              ],
            );
          }),
        ],

        if (_mode == DatingMode.lmp && _lmp != null) ...[
          const SectionLabel('Redating cross-check (optional)'),
          Text(
            'Enter the scan below to test the LMP against ACOG Committee Opinion 700.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 14),
          _dateTile('Date of ultrasound', _scanDate,
              (d) => setState(() => _scanDate = d)),
          Row(children: [
            Expanded(
              child: NumField(
                label: 'GA at scan',
                unit: 'weeks',
                controller: _scanW,
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: NumField(
                label: '',
                unit: 'days',
                controller: _scanD,
                onChanged: (_) => setState(() {}),
              ),
            ),
          ]),
          Builder(builder: (_) {
            final scanGa = _scanGaDays;
            if (_scanDate == null || scanGa == null) {
              return const SizedBox.shrink();
            }
            // GA the LMP predicts for the day of the scan.
            final lmpGaAtScan = _scanDate!.difference(_lmp!).inDays +
                (28 - _cycle); // cycle correction
            final diff = (lmpGaAtScan - scanGa).abs();
            final rule = _redateRule(scanGa)!;
            final redate = diff > rule.$1;
            final scanEdd = _scanDate!.add(Duration(days: 280 - scanGa));
            return ResultCard(
              headline: redate ? 'Redate to the scan' : 'Keep the LMP date',
              band: redate ? Band.alert : Band.good,
              caption: redate
                  ? 'Discrepancy of $diff days exceeds the ${rule.$1}-day allowance '
                      'for ${rule.$2}.'
                  : 'Discrepancy of $diff days is within the ${rule.$1}-day '
                      'allowance for ${rule.$2}.',
              rows: [
                ('GA by LMP on scan day', _fmtGa(lmpGaAtScan)),
                ('GA by scan', _fmtGa(scanGa)),
                ('Discrepancy', '$diff days'),
                ('EDD by LMP', _fmt.format(_edd!)),
                ('EDD by scan', _fmt.format(scanEdd)),
                ('Use', redate ? _fmt.format(scanEdd) : _fmt.format(_edd!)),
              ],
            );
          }),
        ],

        const ReferenceNote(
          sources: [
            'ACOG / AIUM / SMFM Committee Opinion 700 — Methods for Estimating '
                'the Due Date (reaffirmed 2022): redating thresholds and term '
                'definitions.',
            'Naegele\'s rule: LMP + 280 days, adjusted for cycle length.',
            'IVF dating: oocyte retrieval + 266 days; day-3 transfer + 263; '
                'day-5 blastocyst transfer + 261.',
          ],
          caveat: 'A first-trimester CRL measurement is the most accurate way to '
              'date a pregnancy. Once an EDD is established by the earliest '
              'adequate scan, it should not be changed by later scans.',
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scanW.dispose();
    _scanD.dispose();
    super.dispose();
  }
}
