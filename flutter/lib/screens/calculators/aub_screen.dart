import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// Abnormal uterine bleeding (spec §31) — PALM-COEIN and the PBAC score.
class AubScreen extends StatefulWidget {
  const AubScreen({super.key});
  @override
  State<AubScreen> createState() => _AubScreenState();
}

class _AubScreenState extends State<AubScreen> {
  int _towelsLight = 0;
  int _towelsModerate = 0;
  int _towelsSoaked = 0;
  int _tamponsLight = 0;
  int _tamponsModerate = 0;
  int _tamponsSoaked = 0;
  int _clotsSmall = 0;
  int _clotsLarge = 0;
  int _flooding = 0;

  int get _pbac =>
      _towelsLight * 1 +
      _towelsModerate * 5 +
      _towelsSoaked * 20 +
      _tamponsLight * 1 +
      _tamponsModerate * 5 +
      _tamponsSoaked * 10 +
      _clotsSmall * 1 +
      _clotsLarge * 5 +
      _flooding * 5;

  Widget _counter(String label, int value, ValueChanged<int> onChanged,
      {String? points}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: const TextStyle(fontSize: 12.5)),
            if (points != null)
              Text(points,
                  style: TextStyle(
                      fontSize: 11,
                      color: Theme.of(context).colorScheme.onSurfaceVariant)),
          ]),
        ),
        IconButton(
          icon: const Icon(Icons.remove_circle_outline, size: 20),
          onPressed: value > 0 ? () => onChanged(value - 1) : null,
        ),
        SizedBox(
          width: 26,
          child: Text('$value',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w700)),
        ),
        IconButton(
          icon: const Icon(Icons.add_circle_outline, size: 20),
          onPressed: () => onChanged(value + 1),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = _pbac;
    return CalcScaffold(
      title: 'Abnormal uterine bleeding',
      subtitle: 'PALM-COEIN · PBAC score',
      children: [
        const SectionLabel('PALM-COEIN classification', topPad: 0),
        Text(
          'Structural causes on the left, non-structural on the right. A woman '
          'may have more than one, and finding a fibroid does not mean the '
          'fibroid is the cause.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),
        const SizedBox(height: 14),
        const _Cause('P', 'Polyp', 'Endometrial or endocervical. Diagnosed on '
            'saline infusion sonography or hysteroscopy.', true),
        const _Cause('A', 'Adenomyosis', 'MUSA ultrasound features; junctional '
            'zone ≥ 12 mm on MRI.', true),
        const _Cause('L', 'Leiomyoma', 'Sub-classified by the FIGO 0–8 system. '
            'Submucosal types drive bleeding.', true),
        const _Cause('M', 'Malignancy and hyperplasia',
            'Sample the endometrium in any woman over 45, or younger with risk '
            'factors or failed treatment.', true),
        const _Cause('C', 'Coagulopathy',
            'About 13% of women with heavy menstrual bleeding — von '
            'Willebrand disease most often. Screen if bleeding since menarche, '
            'or a personal or family bleeding history.', false),
        const _Cause('O', 'Ovulatory dysfunction',
            'PCOS, thyroid disease, hyperprolactinaemia, perimenopause, '
            'adolescence.', false),
        const _Cause('E', 'Endometrial',
            'A primary disorder of endometrial haemostasis. A diagnosis of '
            'exclusion in a woman with regular, ovulatory, heavy cycles.',
            false),
        const _Cause('I', 'Iatrogenic',
            'Hormonal contraception, anticoagulants, intrauterine devices, '
            'tamoxifen.', false),
        const _Cause('N', 'Not otherwise classified',
            'Arteriovenous malformation, caesarean scar niche, chronic '
            'endometritis.', false),

        const SectionLabel('Pictorial blood loss assessment chart'),
        Text(
          'Count over one complete period. A score above 100 corresponds to a '
          'loss over 80 mL.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),
        const SizedBox(height: 10),
        Text('Towels',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w700)),
        _counter('Lightly stained', _towelsLight,
            (v) => setState(() => _towelsLight = v), points: '1 point each'),
        _counter('Moderately soiled', _towelsModerate,
            (v) => setState(() => _towelsModerate = v), points: '5 points each'),
        _counter('Completely saturated', _towelsSoaked,
            (v) => setState(() => _towelsSoaked = v), points: '20 points each'),
        const SizedBox(height: 8),
        Text('Tampons',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w700)),
        _counter('Lightly stained', _tamponsLight,
            (v) => setState(() => _tamponsLight = v), points: '1 point each'),
        _counter('Moderately soiled', _tamponsModerate,
            (v) => setState(() => _tamponsModerate = v), points: '5 points each'),
        _counter('Completely saturated', _tamponsSoaked,
            (v) => setState(() => _tamponsSoaked = v), points: '10 points each'),
        const SizedBox(height: 8),
        Text('Clots and flooding',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w700)),
        _counter('Small clots (coin-sized)', _clotsSmall,
            (v) => setState(() => _clotsSmall = v), points: '1 point each'),
        _counter('Large clots', _clotsLarge,
            (v) => setState(() => _clotsLarge = v), points: '5 points each'),
        _counter('Episodes of flooding', _flooding,
            (v) => setState(() => _flooding = v), points: '5 points each'),
        ResultCard(
          headline: 'PBAC $p',
          band: p >= 185
              ? Band.alert
              : p >= 100
                  ? Band.watch
                  : Band.good,
          caption: p >= 185
              ? 'Very heavy loss. Check haemoglobin and ferritin, and treat '
                  'the anaemia alongside the bleeding.'
              : p >= 100
                  ? 'Above 100 — consistent with a loss over 80 mL.'
                  : 'Below the conventional threshold for heavy menstrual '
                      'bleeding.',
          rows: const [
            ('Threshold for heavy loss', '> 100'),
            ('Corresponds to', '> 80 mL per cycle'),
          ],
          note: 'NICE defines heavy menstrual bleeding by its impact on '
              'quality of life, not by a measured volume. A woman whose life '
              'is disrupted deserves treatment whatever her PBAC score.',
        ),
        const SectionLabel('Investigation'),
        const _Point('Full blood count in every woman with heavy bleeding'),
        const _Point('Ferritin — iron deficiency without anaemia is common and '
            'symptomatic'),
        const _Point('Thyroid function and coagulation screen only where the '
            'history suggests them'),
        const _Point('Transvaginal ultrasound as first-line imaging'),
        const _Point('Endometrial sampling in women over 45, or younger with '
            'risk factors, persistent intermenstrual bleeding, or failed '
            'medical treatment'),
        const ReferenceNote(
          sources: [
            'Munro MG et al. FIGO classification system (PALM-COEIN) for '
                'causes of abnormal uterine bleeding. Int J Gynecol Obstet '
                '2011;113:3–13, revised 2018.',
            'Higham JM et al. Assessment of menstrual blood loss using a '
                'pictorial chart. Br J Obstet Gynaecol 1990;97:734–739.',
            'NICE NG88 — Heavy menstrual bleeding: assessment and management.',
            'FOGSI GCPR — Abnormal Uterine Bleeding.',
          ],
        ),
        ContentFooter(meta: ContentRegistry.metaFor('aub')!),
      ],
    );
  }
}

class _Cause extends StatelessWidget {
  const _Cause(this.letter, this.name, this.detail, this.structural);
  final String letter;
  final String name;
  final String detail;
  final bool structural;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final colour = structural ? cs.primary : const Color(0xFFC2603C);
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: colour.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(7)),
          child: Text(letter,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w800, color: colour)),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name,
                style: const TextStyle(
                    fontSize: 12.5, fontWeight: FontWeight.w700)),
            Text(detail,
                style: TextStyle(
                    fontSize: 11.5,
                    height: 1.45,
                    color: cs.onSurfaceVariant)),
          ]),
        ),
      ]),
    );
  }
}

class _Point extends StatelessWidget {
  const _Point(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('•  ',
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          Expanded(
              child: Text(text,
                  style: const TextStyle(fontSize: 12, height: 1.5))),
        ]),
      );
}
