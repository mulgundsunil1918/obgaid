import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// POP-Q staging (spec §40).
///
/// Points are measured in centimetres relative to the hymen: negative above,
/// positive below. The stage comes from the single most distal point, which is
/// the part most often got wrong at the bedside.
class PopQScreen extends StatefulWidget {
  const PopQScreen({super.key});
  @override
  State<PopQScreen> createState() => _PopQScreenState();
}

class _PopQScreenState extends State<PopQScreen> {
  final _aa = TextEditingController();
  final _ba = TextEditingController();
  final _c = TextEditingController();
  final _d = TextEditingController();
  final _bp = TextEditingController();
  final _ap = TextEditingController();
  final _gh = TextEditingController();
  final _pb = TextEditingController();
  final _tvl = TextEditingController();
  bool _postHysterectomy = false;

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

  @override
  Widget build(BuildContext context) {
    final points = <String, double?>{
      'Aa': _v(_aa),
      'Ba': _v(_ba),
      'C': _v(_c),
      if (!_postHysterectomy) 'D': _v(_d),
      'Bp': _v(_bp),
      'Ap': _v(_ap),
    };
    final tvl = _v(_tvl);

    final entered = points.entries.where((e) => e.value != null).toList();
    double? mostDistal;
    String? mostDistalName;
    for (final e in entered) {
      if (mostDistal == null || e.value! > mostDistal) {
        mostDistal = e.value;
        mostDistalName = e.key;
      }
    }

    int? stage;
    if (mostDistal != null && tvl != null) {
      final allAtMinus3 = ['Aa', 'Ba', 'Bp', 'Ap']
          .every((k) => points[k] != null && points[k] == -3);
      final apicalHigh = points['C'] != null && points['C']! <= -(tvl - 2);
      if (allAtMinus3 && apicalHigh) {
        stage = 0;
      } else if (mostDistal < -1) {
        stage = 1;
      } else if (mostDistal <= 1) {
        stage = 2;
      } else if (mostDistal < tvl - 2) {
        stage = 3;
      } else {
        stage = 4;
      }
    }

    final (band, label, advice) = switch (stage) {
      0 => (Band.good, 'Stage 0 — no prolapse', 'No treatment indicated.'),
      1 => (Band.good, 'Stage I',
          'Leading edge more than 1 cm above the hymen. Usually asymptomatic; '
              'pelvic floor muscle training if she has symptoms.'),
      2 => (Band.watch, 'Stage II',
          'Leading edge within 1 cm of the hymen. Pelvic floor training or a '
              'pessary; surgery only if symptomatic and conservative measures '
              'fail.'),
      3 => (Band.alert, 'Stage III',
          'Leading edge more than 1 cm below the hymen but not fully everted. '
              'Pessary or surgery.'),
      4 => (Band.alert, 'Stage IV — complete eversion',
          'Complete procidentia. Examine for ulceration and hydronephrosis.'),
      _ => (Band.neutral, 'Enter the points', ''),
    };

    Widget field(String label, String hint, TextEditingController c) =>
        Expanded(
          child: NumField(
            label: label,
            unit: 'cm',
            hint: hint,
            controller: c,
            onChanged: (_) => setState(() {}),
          ),
        );

    return CalcScaffold(
      title: 'POP-Q',
      subtitle: 'Pelvic organ prolapse quantification',
      children: [
        Text(
          'Measure at maximum Valsalva with the prolapse at full descent. '
          'Negative numbers are above the hymen, positive below. The hymen '
          'itself is zero.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),
        const SizedBox(height: 16),
        SwitchListTile(
          value: _postHysterectomy,
          onChanged: (v) => setState(() => _postHysterectomy = v),
          title: const Text('Post-hysterectomy'),
          subtitle: const Text('Point D is omitted; C becomes the vault'),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        const SectionLabel('Anterior wall'),
        Row(children: [
          field('Aa', '−3 to +3', _aa),
          const SizedBox(width: 12),
          field('Ba', '≥ Aa', _ba),
        ]),
        const SectionLabel('Apex'),
        Row(children: [
          field('C', 'Cervix or vault', _c),
          const SizedBox(width: 12),
          if (!_postHysterectomy)
            field('D', 'Posterior fornix', _d)
          else
            const Expanded(child: SizedBox()),
        ]),
        const SectionLabel('Posterior wall'),
        Row(children: [
          field('Bp', '≥ Ap', _bp),
          const SizedBox(width: 12),
          field('Ap', '−3 to +3', _ap),
        ]),
        const SectionLabel('Measurements'),
        Row(children: [
          field('Genital hiatus', 'gh', _gh),
          const SizedBox(width: 12),
          field('Perineal body', 'pb', _pb),
        ]),
        NumField(
            label: 'Total vaginal length',
            unit: 'cm',
            controller: _tvl,
            onChanged: (_) => setState(() {})),
        if (stage != null)
          ResultCard(
            headline: label,
            band: band,
            caption: advice,
            rows: [
              if (mostDistalName != null)
                ('Most distal point',
                    '$mostDistalName at ${mostDistal!.toStringAsFixed(1)} cm'),
              ('Total vaginal length', '${tvl!.toStringAsFixed(1)} cm'),
              if (_v(_gh) != null && _v(_pb) != null)
                ('gh + pb',
                    '${(_v(_gh)! + _v(_pb)!).toStringAsFixed(1)} cm'),
            ],
            note: 'Stage correlates poorly with symptoms. A stage II prolapse '
                'may be highly bothersome and a stage III barely noticed — '
                'treat the woman, not the number.',
          ),
        const SectionLabel('Staging definitions'),
        const _StageRow('0', 'No prolapse: Aa, Ba, Ap, Bp all at −3, and C at '
            'or above −(TVL − 2)'),
        const _StageRow('I', 'Most distal point more than 1 cm above the hymen'),
        const _StageRow('II', 'Most distal point within 1 cm above or below the '
            'hymen'),
        const _StageRow('III', 'More than 1 cm below the hymen, but less than '
            '(TVL − 2)'),
        const _StageRow('IV', 'Complete eversion — at or beyond (TVL − 2)'),
        const ReferenceNote(
          sources: [
            'Bump RC et al. The standardization of terminology of female '
                'pelvic organ prolapse and pelvic floor dysfunction. Am J '
                'Obstet Gynecol 1996;175:10–17.',
            'IUGA/ICS joint report on the terminology for female pelvic floor '
                'dysfunction.',
            'NICE NG123 — Urinary incontinence and pelvic organ prolapse in '
                'women.',
          ],
        ),
        ContentFooter(meta: ContentRegistry.metaFor('popq')!),
      ],
    );
  }

  @override
  void dispose() {
    for (final c in [_aa, _ba, _c, _d, _bp, _ap, _gh, _pb, _tvl]) {
      c.dispose();
    }
    super.dispose();
  }
}

class _StageRow extends StatelessWidget {
  const _StageRow(this.stage, this.def);
  final String stage;
  final String def;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 30,
          padding: const EdgeInsets.symmetric(vertical: 2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(6)),
          child: Text(stage,
              style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w800,
                  color: cs.primary)),
        ),
        const SizedBox(width: 12),
        Expanded(
            child: Text(def,
                style: const TextStyle(fontSize: 12, height: 1.45))),
      ]),
    );
  }
}
