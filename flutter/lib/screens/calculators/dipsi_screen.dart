import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';

enum GdmCriteria { dipsi, iadpsg }

/// GDM screening — DIPSI alongside IADPSG.
///
/// DIPSI is the reason this screen exists. India screens with a single-step
/// 75 g load given *irrespective of the last meal*, which no foreign app
/// carries; a clinician using an imported app has to mentally translate every
/// result. Both criteria sit side by side here so the translation is visible.
class DipsiScreen extends StatefulWidget {
  const DipsiScreen({super.key});
  @override
  State<DipsiScreen> createState() => _DipsiScreenState();
}

class _DipsiScreenState extends State<DipsiScreen> {
  GdmCriteria _criteria = GdmCriteria.dipsi;
  final _twoHour = TextEditingController();
  final _fasting = TextEditingController();
  final _oneHour = TextEditingController();

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

  @override
  Widget build(BuildContext context) {
    Widget? result;

    if (_criteria == GdmCriteria.dipsi) {
      final v = _v(_twoHour);
      if (v != null) {
        final (h, b, c) = switch (v) {
          >= 200 => (
              'Diabetes in pregnancy',
              Band.critical,
              'A 2-hour value ≥ 200 mg/dL indicates overt diabetes rather than '
                  'GDM. Treat as pre-gestational diabetes and screen for '
                  'complications.'
            ),
          >= 140 => (
              'Gestational diabetes',
              Band.alert,
              'Start medical nutrition therapy immediately and review glycaemic '
                  'control in 2 weeks. Add metformin or insulin if targets are '
                  'not met.'
            ),
          _ => (
              'Normal',
              Band.good,
              'Repeat screening at 24–28 weeks if this was a first-trimester '
                  'test, and again at 32–34 weeks if risk factors are present.'
            ),
        };
        result = ResultCard(
          headline: h,
          band: b,
          caption: c,
          rows: [
            ('2-hour plasma glucose', '${v.toStringAsFixed(0)} mg/dL'),
            ('DIPSI threshold for GDM', '≥ 140 mg/dL'),
            ('Overt diabetes threshold', '≥ 200 mg/dL'),
            ('By IADPSG 2-h criterion', v >= 153 ? 'Would also be GDM' : 'Below the 153 mg/dL 2-h cut-off'),
          ],
        );
      }
    } else {
      final f = _v(_fasting), o = _v(_oneHour), t = _v(_twoHour);
      if (f != null || o != null || t != null) {
        final breaches = <String>[
          if (f != null && f >= 92) 'Fasting ${f.toStringAsFixed(0)} ≥ 92',
          if (o != null && o >= 180) '1-hour ${o.toStringAsFixed(0)} ≥ 180',
          if (t != null && t >= 153) '2-hour ${t.toStringAsFixed(0)} ≥ 153',
        ];
        final overt = (f != null && f >= 126) || (t != null && t >= 200);
        result = ResultCard(
          headline: overt
              ? 'Overt diabetes'
              : breaches.isEmpty
                  ? 'Normal'
                  : 'Gestational diabetes',
          band: overt
              ? Band.critical
              : breaches.isEmpty
                  ? Band.good
                  : Band.alert,
          caption: overt
              ? 'Fasting ≥ 126 mg/dL or 2-hour ≥ 200 mg/dL meets criteria for '
                  'diabetes outside pregnancy.'
              : breaches.isEmpty
                  ? 'All three values are below the IADPSG thresholds.'
                  : 'Any single value at or above threshold establishes the '
                      'diagnosis — all three are not required.',
          rows: [
            ('Fasting', f == null ? '—' : '${f.toStringAsFixed(0)} mg/dL (≥ 92)'),
            ('1 hour', o == null ? '—' : '${o.toStringAsFixed(0)} mg/dL (≥ 180)'),
            ('2 hour', t == null ? '—' : '${t.toStringAsFixed(0)} mg/dL (≥ 153)'),
            if (breaches.isNotEmpty) ('Values at/above threshold', breaches.join(' · ')),
          ],
        );
      }
    }

    return CalcScaffold(
      title: 'GDM screening',
      subtitle: 'DIPSI · IADPSG',
      children: [
        SegmentedButton<GdmCriteria>(
          segments: const [
            ButtonSegment(value: GdmCriteria.dipsi, label: Text('DIPSI (India)')),
            ButtonSegment(value: GdmCriteria.iadpsg, label: Text('IADPSG')),
          ],
          selected: {_criteria},
          onSelectionChanged: (s) => setState(() => _criteria = s.first),
        ),
        const SizedBox(height: 18),
        if (_criteria == GdmCriteria.dipsi) ...[
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '75 g oral glucose, given irrespective of the last meal. '
              'Plasma glucose measured at 2 hours. No fasting required — this '
              'is what makes DIPSI workable in a single antenatal visit.',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(height: 1.45),
            ),
          ),
          const SizedBox(height: 18),
          NumField(
            label: '2-hour plasma glucose',
            unit: 'mg/dL',
            controller: _twoHour,
            onChanged: (_) => setState(() {}),
          ),
        ] else ...[
          Text(
            '75 g OGTT after an overnight fast of 8–14 hours. Any one value at '
            'or above threshold is diagnostic.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 14),
          NumField(
              label: 'Fasting plasma glucose',
              unit: 'mg/dL',
              controller: _fasting,
              onChanged: (_) => setState(() {})),
          NumField(
              label: '1-hour plasma glucose',
              unit: 'mg/dL',
              controller: _oneHour,
              onChanged: (_) => setState(() {})),
          NumField(
              label: '2-hour plasma glucose',
              unit: 'mg/dL',
              controller: _twoHour,
              onChanged: (_) => setState(() {})),
        ],
        if (result != null) result,
        const SectionLabel('Glycaemic targets once diagnosed'),
        const _TargetRow('Fasting', '< 95 mg/dL'),
        const _TargetRow('1 hour post-meal', '< 140 mg/dL'),
        const _TargetRow('2 hours post-meal', '< 120 mg/dL'),
        const ReferenceNote(
          sources: [
            'DIPSI — Diabetes in Pregnancy Study Group India. Seshiah V et al. '
                'Single-step 75 g glucose, non-fasting, 2-hour ≥ 140 mg/dL.',
            'Government of India, MoHFW — National Guidelines for Diagnosis & '
                'Management of Gestational Diabetes Mellitus (endorses DIPSI).',
            'IADPSG Consensus Panel. Diabetes Care 2010;33:676–682.',
            'FOGSI–ICOG Good Clinical Practice Recommendations on GDM.',
          ],
          caveat: 'DIPSI and IADPSG do not identify the same women. DIPSI is '
              'the criterion endorsed for the national programme in India; '
              'IADPSG is used by many tertiary and academic units. Record which '
              'criterion was applied in the notes.',
        ),
      ],
    );
  }

  @override
  void dispose() {
    _twoHour.dispose();
    _fasting.dispose();
    _oneHour.dispose();
    super.dispose();
  }
}

class _TargetRow extends StatelessWidget {
  const _TargetRow(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
            Text(value,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w700)),
          ],
        ),
      );
}
