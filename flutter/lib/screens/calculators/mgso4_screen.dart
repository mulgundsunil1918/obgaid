import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';

enum MgRegimen { pritchard, zuspan, sibai }

/// Magnesium sulphate for severe pre-eclampsia and eclampsia.
///
/// Pritchard leads because it is the regimen that works in a district hospital
/// without an infusion pump — which is where most Indian eclampsia is actually
/// treated. Zuspan and Sibai follow for units that have pumps.
class MgSo4Screen extends StatefulWidget {
  const MgSo4Screen({super.key});
  @override
  State<MgSo4Screen> createState() => _MgSo4ScreenState();
}

class _MgSo4ScreenState extends State<MgSo4Screen> {
  MgRegimen _regimen = MgRegimen.pritchard;

  bool _reflex = true;
  bool _resp = true;
  bool _urine = true;

  bool get _safeToDose => _reflex && _resp && _urine;

  ({String loading, String maintenance, String route}) get _details =>
      switch (_regimen) {
        MgRegimen.pritchard => (
            loading:
                '4 g IV (20 mL of 20%) over 3–5 min\n+ 10 g IM (10 mL of 50%, '
                    '5 g into each buttock)',
            maintenance:
                '5 g IM (10 mL of 50%) every 4 hours,\nalternating buttocks',
            route: 'IV + IM — no infusion pump required',
          ),
        MgRegimen.zuspan => (
            loading: '4 g IV (20 mL of 20%) over 15–20 min',
            maintenance: '1 g/hour by continuous IV infusion',
            route: 'IV — requires an infusion pump',
          ),
        MgRegimen.sibai => (
            loading: '6 g IV over 15–20 min',
            maintenance: '2–3 g/hour by continuous IV infusion',
            route: 'IV — requires an infusion pump',
          ),
      };

  @override
  Widget build(BuildContext context) {
    final d = _details;

    return CalcScaffold(
      title: 'Magnesium sulphate',
      subtitle: 'Eclampsia & severe pre-eclampsia',
      children: [
        SegmentedButton<MgRegimen>(
          segments: const [
            ButtonSegment(value: MgRegimen.pritchard, label: Text('Pritchard')),
            ButtonSegment(value: MgRegimen.zuspan, label: Text('Zuspan')),
            ButtonSegment(value: MgRegimen.sibai, label: Text('Sibai')),
          ],
          selected: {_regimen},
          onSelectionChanged: (s) => setState(() => _regimen = s.first),
        ),
        const SizedBox(height: 20),
        _DoseCard(title: 'Loading dose', body: d.loading, emphasis: true),
        const SizedBox(height: 12),
        _DoseCard(title: 'Maintenance', body: d.maintenance),
        const SizedBox(height: 12),
        _DoseCard(title: 'Route', body: d.route),
        const SizedBox(height: 12),
        const _DoseCard(
          title: 'Duration',
          body: 'Continue for 24 hours after delivery, or 24 hours after the '
              'last convulsion — whichever is later.',
        ),

        const SectionLabel('Check before every maintenance dose'),
        CheckboxListTile(
          value: _reflex,
          onChanged: (v) => setState(() => _reflex = v ?? false),
          title: const Text('Patellar reflex present'),
          subtitle: const Text('Absent reflex is the earliest sign of toxicity'),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        CheckboxListTile(
          value: _resp,
          onChanged: (v) => setState(() => _resp = v ?? false),
          title: const Text('Respiratory rate ≥ 12–16 / min'),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        CheckboxListTile(
          value: _urine,
          onChanged: (v) => setState(() => _urine = v ?? false),
          title: const Text('Urine output ≥ 100 mL in the last 4 hours'),
          subtitle: const Text('Magnesium is cleared entirely by the kidney'),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        ResultCard(
          headline: _safeToDose ? 'Safe to give the next dose' : 'WITHHOLD the next dose',
          band: _safeToDose ? Band.good : Band.critical,
          caption: _safeToDose
              ? 'All three checks pass. Reassess before the dose after this one.'
              : 'One or more checks have failed. Withhold magnesium, check a '
                  'serum level if available, and prepare calcium gluconate.',
          rows: const [
            ('Antidote',
                'Calcium gluconate 1 g (10 mL of 10%) IV slowly over 10 min'),
          ],
        ),

        const SectionLabel('Serum magnesium — what the numbers mean'),
        const _LevelRow('Therapeutic', '4.8 – 8.4 mg/dL (2–4 mmol/L)', Band.good),
        const _LevelRow('Patellar reflex lost', '9 – 12 mg/dL', Band.watch),
        const _LevelRow('Respiratory depression', '12 – 18 mg/dL', Band.alert),
        const _LevelRow('Respiratory paralysis', '15 – 17 mg/dL', Band.alert),
        const _LevelRow('Cardiac arrest', '> 25 – 30 mg/dL', Band.critical),

        const SectionLabel('Renal impairment'),
        Text(
          'Magnesium is excreted unchanged by the kidney. With oliguria or a '
          'creatinine above 1.2 mg/dL, give the loading dose in full but halve '
          'or omit maintenance and monitor levels — accumulation, not the '
          'loading dose, is what causes toxicity.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),

        const ReferenceNote(
          sources: [
            'Pritchard JA. The use of magnesium sulfate in preeclampsia-'
                'eclampsia. J Reprod Med 1979.',
            'Zuspan FP. Problems encountered in the treatment of pregnancy-'
                'induced hypertension. Am J Obstet Gynecol 1978.',
            'The Magpie Trial Collaborative Group. Lancet 2002;359:1877–1890.',
            'FOGSI–ICOG Good Clinical Practice Recommendations — Hypertensive '
                'Disorders of Pregnancy.',
            'WHO Recommendations for Prevention and Treatment of Pre-eclampsia '
                'and Eclampsia.',
          ],
          caveat: 'Magnesium sulphate is for seizure prophylaxis and treatment. '
              'It is not an antihypertensive — severe hypertension needs '
              'labetalol, nifedipine or hydralazine alongside it.',
        ),
      ],
    );
  }
}

class _DoseCard extends StatelessWidget {
  const _DoseCard(
      {required this.title, required this.body, this.emphasis = false});
  final String title;
  final String body;
  final bool emphasis;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: emphasis
            ? cs.primaryContainer.withValues(alpha: 0.45)
            : cs.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
        border: emphasis
            ? Border.all(color: cs.primary.withValues(alpha: 0.4))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.7,
                  color: cs.onSurfaceVariant)),
          const SizedBox(height: 6),
          Text(body,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                  fontWeight: emphasis ? FontWeight.w700 : FontWeight.w500)),
        ],
      ),
    );
  }
}

class _LevelRow extends StatelessWidget {
  const _LevelRow(this.label, this.range, this.band);
  final String label;
  final String range;
  final Band band;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(children: [
          Container(
              width: 8,
              height: 8,
              decoration:
                  BoxDecoration(color: band.color, shape: BoxShape.circle)),
          const SizedBox(width: 10),
          Expanded(
              child: Text(label,
                  style: Theme.of(context).textTheme.bodyMedium)),
          Text(range,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w700)),
        ]),
      );
}
