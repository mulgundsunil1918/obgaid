import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// Ferriman-Gallwey hirsutism scoring and HOMA-IR (spec §35).
class PcosAssessmentScreen extends StatefulWidget {
  const PcosAssessmentScreen({super.key});
  @override
  State<PcosAssessmentScreen> createState() => _PcosAssessmentScreenState();
}

class _PcosAssessmentScreenState extends State<PcosAssessmentScreen> {
  static const _areas = [
    'Upper lip',
    'Chin',
    'Chest',
    'Upper back',
    'Lower back',
    'Upper abdomen',
    'Lower abdomen',
    'Upper arm',
    'Thigh',
  ];
  final _scores = List<int>.filled(9, 0);

  final _insulin = TextEditingController();
  final _glucose = TextEditingController();

  int get _fg => _scores.fold(0, (a, b) => a + b);

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

  @override
  Widget build(BuildContext context) {
    final ins = _v(_insulin);
    final glu = _v(_glucose);
    // HOMA-IR with glucose in mg/dL uses the 405 denominator; with mmol/L it
    // would be 22.5. Mixing the two is the classic error.
    final homa = (ins != null && glu != null) ? (ins * glu) / 405 : null;

    final (fgBand, fgLabel) = _fg >= 15
        ? (Band.alert, 'Severe hirsutism')
        : _fg >= 8
            ? (Band.watch, 'Hirsutism by the conventional cut-off')
            : _fg >= 6
                ? (Band.watch, 'Borderline — significant in South and East '
                    'Asian women')
                : (Band.good, 'Below the hirsutism threshold');

    return CalcScaffold(
      title: 'PCOS assessment',
      subtitle: 'Ferriman-Gallwey · HOMA-IR',
      children: [
        const SectionLabel('Ferriman-Gallwey score', topPad: 0),
        Text(
          'Score each of nine androgen-sensitive areas from 0 (no terminal '
          'hair) to 4 (frankly virile). Assess before any cosmetic hair '
          'removal, which otherwise makes the score meaningless.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),
        const SizedBox(height: 14),
        for (var i = 0; i < _areas.length; i++)
          ScoreChoice<int>(
            label: _areas[i],
            value: _scores[i],
            options: const [(0, '0'), (1, '1'), (2, '2'), (3, '3'), (4, '4')],
            onChanged: (v) => setState(() => _scores[i] = v),
          ),
        ResultCard(
          headline: '$_fg / 36',
          band: fgBand,
          caption: fgLabel,
          rows: const [
            ('Conventional cut-off', '≥ 8'),
            ('East Asian populations', '≥ 2 – 3'),
            ('South Asian populations', '≥ 6 is often used'),
            ('Severe', '≥ 15'),
          ],
          note: 'Ethnicity changes the threshold substantially. Hair density '
              'varies by population, and applying a single cut-off '
              'over-diagnoses some women and misses others. Record which '
              'threshold was used.',
        ),
        const SectionLabel('HOMA-IR — insulin resistance'),
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'Fasting insulin',
                  unit: 'µU/mL',
                  controller: _insulin,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'Fasting glucose',
                  unit: 'mg/dL',
                  controller: _glucose,
                  onChanged: (_) => setState(() {}))),
        ]),
        if (homa != null)
          ResultCard(
            headline: 'HOMA-IR ${homa.toStringAsFixed(2)}',
            band: homa >= 3.8
                ? Band.alert
                : homa >= 2.5
                    ? Band.watch
                    : Band.good,
            caption: homa >= 3.8
                ? 'Marked insulin resistance — metabolic syndrome is likely.'
                : homa >= 2.5
                    ? 'Insulin resistance by the threshold commonly used in '
                        'Indian populations.'
                    : 'Within the normal range.',
            rows: const [
              ('Formula', 'insulin × glucose ÷ 405 (glucose in mg/dL)'),
              ('Normal', '< 2.0'),
              ('Insulin resistance', '> 2.5 in South Asian populations'),
              ('Metabolic syndrome likely', '> 3.8'),
            ],
            note: 'HOMA-IR is a research and risk-stratification tool, not a '
                'diagnostic test. It does not replace an oral glucose '
                'tolerance test, which is what the 2023 PCOS guideline asks '
                'for.',
          ),
        const ReferenceNote(
          sources: [
            'Ferriman D, Gallwey JD. Clinical assessment of body hair growth '
                'in women. J Clin Endocrinol Metab 1961;21:1440–1447.',
            'Teede HJ et al. International Evidence-Based Guideline for the '
                'Assessment and Management of PCOS, 2023.',
            'Matthews DR et al. Homeostasis model assessment. Diabetologia '
                '1985;28:412–419.',
            'Escobar-Morreale HF et al. Epidemiology, diagnosis and management '
                'of hirsutism. Hum Reprod Update 2012;18:146–170.',
          ],
        ),
        ContentFooter(meta: ContentRegistry.metaFor('pcos-assessment')!),
      ],
    );
  }

  @override
  void dispose() {
    _insulin.dispose();
    _glucose.dispose();
    super.dispose();
  }
}
