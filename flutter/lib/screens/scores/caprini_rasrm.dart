import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';

class _Factor {
  const _Factor(this.id, this.label, this.points, {this.detail});
  final String id;
  final String label;
  final int points;
  final String? detail;
}

/// Caprini VTE risk for gynaecological surgery.
class CapriniScreen extends StatefulWidget {
  const CapriniScreen({super.key});
  @override
  State<CapriniScreen> createState() => _CapriniScreenState();
}

class _CapriniScreenState extends State<CapriniScreen> {
  final _selected = <String>{};

  static const _one = [
    _Factor('age41', 'Age 41 – 60', 1),
    _Factor('bmi25', 'BMI above 25', 1),
    _Factor('minor', 'Minor surgery', 1),
    _Factor('varicose', 'Varicose veins', 1),
    _Factor('swollen', 'Swollen legs', 1),
    _Factor('oestrogen', 'Oral contraceptive or hormone therapy', 1),
    _Factor('pregnancy', 'Pregnancy or postpartum within 1 month', 1,
        detail: 'In pregnancy itself, use the RCOG obstetric score instead'),
    _Factor('loss', 'Recurrent unexplained pregnancy loss', 1),
    _Factor('sepsis', 'Sepsis within 1 month', 1),
    _Factor('lung', 'Serious lung disease or pneumonia within 1 month', 1),
    _Factor('bedrest', 'Medical patient on bed rest', 1),
  ];
  static const _two = [
    _Factor('age61', 'Age 61 – 74', 2),
    _Factor('majorOpen', 'Major open surgery over 45 minutes', 2),
    _Factor('lap', 'Laparoscopic surgery over 45 minutes', 2),
    _Factor('malignancy', 'Malignancy, present or previous', 2),
    _Factor('confined', 'Confined to bed over 72 hours', 2),
    _Factor('cvc', 'Central venous access', 2),
  ];
  static const _three = [
    _Factor('age75', 'Age 75 or above', 3),
    _Factor('prevVte', 'Previous venous thromboembolism', 3),
    _Factor('famVte', 'Family history of VTE', 3),
    _Factor('thrombophilia', 'Known thrombophilia', 3,
        detail: 'Factor V Leiden, prothrombin 20210A, lupus anticoagulant, '
            'anticardiolipin antibodies, raised homocysteine'),
    _Factor('hit', 'Heparin-induced thrombocytopenia', 3),
  ];
  static const _five = [
    _Factor('stroke', 'Stroke within 1 month', 5),
    _Factor('fracture', 'Hip, pelvis or leg fracture', 5),
    _Factor('cord', 'Acute spinal cord injury within 1 month', 5),
  ];

  int get _total {
    var t = 0;
    for (final f in [..._one, ..._two, ..._three, ..._five]) {
      if (_selected.contains(f.id)) t += f.points;
    }
    return t;
  }

  Widget _section(String title, List<_Factor> factors) {
    final cs = Theme.of(context).colorScheme;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SectionLabel(title),
      ...factors.map((f) => CheckboxListTile(
            value: _selected.contains(f.id),
            onChanged: (v) => setState(() =>
                v ?? false ? _selected.add(f.id) : _selected.remove(f.id)),
            title: Text(f.label,
                style: const TextStyle(fontSize: 12.5, height: 1.35)),
            subtitle: f.detail == null
                ? null
                : Text(f.detail!,
                    style: TextStyle(
                        fontSize: 11,
                        height: 1.35,
                        color: cs.onSurfaceVariant)),
            secondary: Text('+${f.points}',
                style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: cs.primary)),
            dense: true,
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          )),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final t = _total;
    final (band, level, advice) = t >= 5
        ? (Band.alert, 'High risk',
            'Pharmacological prophylaxis. Consider extended duration — 28 '
                'days — after surgery for malignancy.')
        : t >= 3
            ? (Band.watch, 'Moderate risk',
                'Pharmacological or mechanical prophylaxis, weighed against '
                    'bleeding risk.')
            : t == 2
                ? (Band.good, 'Low risk', 'Mechanical prophylaxis.')
                : (Band.good, 'Very low risk', 'Early ambulation.');

    return CalcScaffold(
      title: 'Caprini score',
      subtitle: 'VTE risk in gynaecological surgery',
      children: [
        Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: const Color(0xFFB3261E).withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(11),
            border: Border.all(
                color: const Color(0xFFB3261E).withValues(alpha: 0.4)),
          ),
          child: const Text(
            'This is the SURGICAL score. In pregnancy and the puerperium use '
            'the RCOG Green-top 37a obstetric score instead — the risk factors '
            'and thresholds are different.',
            style: TextStyle(
                fontSize: 12, height: 1.5, fontWeight: FontWeight.w600),
          ),
        ),
        _section('1 point each', _one),
        _section('2 points each', _two),
        _section('3 points each', _three),
        _section('5 points each', _five),
        ResultCard(
          headline: 'Caprini $t — $level',
          band: band,
          caption: advice,
          rows: const [
            ('0 – 1', 'Very low — early ambulation'),
            ('2', 'Low — mechanical prophylaxis'),
            ('3 – 4', 'Moderate — pharmacological or mechanical'),
            ('5 or above', 'High — pharmacological, consider extended'),
          ],
          note: 'The score does not account for bleeding risk, which must be '
              'weighed separately before prescribing.',
        ),
        const ReferenceNote(
          sources: [
            'Caprini JA. Thrombosis risk assessment as a guide to quality '
                'patient care. Dis Mon 2005;51:70–78.',
            'ACOG Practice Bulletin 232 — Prevention of Venous '
                'Thromboembolism in Gynecologic Surgery.',
            'FOGSI GCPR — Thromboprophylaxis in Obstetrics and Gynaecology.',
          ],
          caveat: 'Derived largely in general surgical populations. '
              'Validation in gynaecological oncology is more limited, where '
              'risk is generally higher than the score suggests.',
        ),
      ],
    );
  }
}

/// rASRM endometriosis staging.
class RasrmScreen extends StatefulWidget {
  const RasrmScreen({super.key});
  @override
  State<RasrmScreen> createState() => _RasrmScreenState();
}

class _RasrmScreenState extends State<RasrmScreen> {
  int _peritonealSuperficial = 0;
  int _peritonealDeep = 0;
  int _ovaryRight = 0;
  int _ovaryLeft = 0;
  int _culDeSac = 0;
  int _adhesionOvaryR = 0;
  int _adhesionOvaryL = 0;
  int _adhesionTubeR = 0;
  int _adhesionTubeL = 0;

  int get _total =>
      _peritonealSuperficial +
      _peritonealDeep +
      _ovaryRight +
      _ovaryLeft +
      _culDeSac +
      _adhesionOvaryR +
      _adhesionOvaryL +
      _adhesionTubeR +
      _adhesionTubeL;

  @override
  Widget build(BuildContext context) {
    final t = _total;
    final (band, stage, label) = t > 40
        ? (Band.alert, 'IV', 'Severe')
        : t >= 16
            ? (Band.watch, 'III', 'Moderate')
            : t >= 6
                ? (Band.watch, 'II', 'Mild')
                : t >= 1
                    ? (Band.good, 'I', 'Minimal')
                    : (Band.neutral, '—', 'No disease scored');

    return CalcScaffold(
      title: 'rASRM staging',
      subtitle: 'Endometriosis — scored at surgery',
      children: [
        Text(
          'Scored from findings at laparoscopy. Note before you start that the '
          'stage correlates poorly with pain — a stage I can be agonising and '
          'a stage IV asymptomatic.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),
        const SectionLabel('Peritoneum'),
        ScoreChoice<int>(
          label: 'Superficial implants',
          value: _peritonealSuperficial,
          options: const [
            (0, 'None'), (1, 'Under 1 cm'), (2, '1 – 3 cm'), (4, 'Over 3 cm'),
          ],
          onChanged: (v) => setState(() => _peritonealSuperficial = v),
        ),
        ScoreChoice<int>(
          label: 'Deep implants',
          value: _peritonealDeep,
          options: const [
            (0, 'None'), (2, 'Under 1 cm'), (4, '1 – 3 cm'), (6, 'Over 3 cm'),
          ],
          onChanged: (v) => setState(() => _peritonealDeep = v),
        ),
        const SectionLabel('Ovarian endometriosis'),
        ScoreChoice<int>(
          label: 'Right ovary',
          value: _ovaryRight,
          options: const [
            (0, 'None'), (1, 'Superficial under 1 cm'),
            (2, 'Superficial 1 – 3 cm'), (4, 'Superficial over 3 cm'),
            (16, 'Deep 1 – 3 cm'), (20, 'Deep over 3 cm'),
          ],
          onChanged: (v) => setState(() => _ovaryRight = v),
        ),
        ScoreChoice<int>(
          label: 'Left ovary',
          value: _ovaryLeft,
          options: const [
            (0, 'None'), (1, 'Superficial under 1 cm'),
            (2, 'Superficial 1 – 3 cm'), (4, 'Superficial over 3 cm'),
            (16, 'Deep 1 – 3 cm'), (20, 'Deep over 3 cm'),
          ],
          onChanged: (v) => setState(() => _ovaryLeft = v),
        ),
        const SectionLabel('Posterior cul-de-sac'),
        ScoreChoice<int>(
          label: 'Obliteration',
          value: _culDeSac,
          options: const [(0, 'None'), (4, 'Partial'), (40, 'Complete')],
          onChanged: (v) => setState(() => _culDeSac = v),
        ),
        const SectionLabel('Adhesions — ovary'),
        ScoreChoice<int>(
          label: 'Right ovary',
          value: _adhesionOvaryR,
          options: const [
            (0, 'None'), (1, 'Filmy, under ⅓'), (2, 'Filmy, ⅓ – ⅔'),
            (4, 'Filmy, over ⅔'), (8, 'Dense, ⅓ – ⅔'), (16, 'Dense, over ⅔'),
          ],
          onChanged: (v) => setState(() => _adhesionOvaryR = v),
        ),
        ScoreChoice<int>(
          label: 'Left ovary',
          value: _adhesionOvaryL,
          options: const [
            (0, 'None'), (1, 'Filmy, under ⅓'), (2, 'Filmy, ⅓ – ⅔'),
            (4, 'Filmy, over ⅔'), (8, 'Dense, ⅓ – ⅔'), (16, 'Dense, over ⅔'),
          ],
          onChanged: (v) => setState(() => _adhesionOvaryL = v),
        ),
        const SectionLabel('Adhesions — tube'),
        ScoreChoice<int>(
          label: 'Right tube',
          value: _adhesionTubeR,
          options: const [
            (0, 'None'), (1, 'Filmy, under ⅓'), (2, 'Filmy, ⅓ – ⅔'),
            (4, 'Filmy, over ⅔'), (8, 'Dense, ⅓ – ⅔'), (16, 'Dense, over ⅔'),
          ],
          onChanged: (v) => setState(() => _adhesionTubeR = v),
        ),
        ScoreChoice<int>(
          label: 'Left tube',
          value: _adhesionTubeL,
          options: const [
            (0, 'None'), (1, 'Filmy, under ⅓'), (2, 'Filmy, ⅓ – ⅔'),
            (4, 'Filmy, over ⅔'), (8, 'Dense, ⅓ – ⅔'), (16, 'Dense, over ⅔'),
          ],
          onChanged: (v) => setState(() => _adhesionTubeL = v),
        ),
        ResultCard(
          headline: t == 0 ? 'No points scored' : '$t points — Stage $stage',
          band: band,
          caption: t == 0 ? '' : label,
          rows: const [
            ('Stage I · minimal', '1 – 5'),
            ('Stage II · mild', '6 – 15'),
            ('Stage III · moderate', '16 – 40'),
            ('Stage IV · severe', 'Above 40'),
          ],
          note: 'A complete cul-de-sac obliteration alone scores 40 and puts '
              'her in stage IV — which is why the stage tracks anatomy rather '
              'than symptoms.',
        ),
        const ReferenceNote(
          sources: [
            'American Society for Reproductive Medicine. Revised '
                'classification of endometriosis: 1996. Fertil Steril '
                '1997;67:817–821.',
            'Keckstein J et al. #Enzian classification for deep '
                'endometriosis. Acta Obstet Gynecol Scand 2021.',
            'ESHRE Endometriosis Guideline 2022; FOGSI GCPR — Endometriosis.',
          ],
          caveat: 'Correlates poorly with pain and only moderately with '
              'fertility — the Endometriosis Fertility Index predicts '
              'conception better. It describes deep infiltrating disease '
              'badly, which is what #Enzian was developed to complement. And '
              'it requires surgery, which ESHRE 2022 no longer requires to '
              'diagnose or treat.',
        ),
      ],
    );
  }
}
