import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// Adnexal mass risk assessment (spec §42) — RMI, IOTA simple rules, O-RADS.
class AdnexalMassScreen extends StatefulWidget {
  const AdnexalMassScreen({super.key});
  @override
  State<AdnexalMassScreen> createState() => _AdnexalMassScreenState();
}

class _AdnexalMassScreenState extends State<AdnexalMassScreen> {
  // RMI
  final _ca125 = TextEditingController();
  bool _postmenopausal = false;
  final _usFeatures = <String>{};
  static const _rmiFeatures = [
    ('multilocular', 'Multilocular cyst'),
    ('solid', 'Solid areas'),
    ('bilateral', 'Bilateral lesions'),
    ('ascites', 'Ascites'),
    ('mets', 'Intra-abdominal metastases'),
  ];

  // IOTA simple rules
  final _bRules = <String>{};
  final _mRules = <String>{};
  static const _b = [
    ('b1', 'B1 — unilocular cyst'),
    ('b2', 'B2 — solid components under 7 mm'),
    ('b3', 'B3 — acoustic shadows'),
    ('b4', 'B4 — smooth multilocular tumour under 100 mm'),
    ('b5', 'B5 — no blood flow (colour score 1)'),
  ];
  static const _m = [
    ('m1', 'M1 — irregular solid tumour'),
    ('m2', 'M2 — ascites'),
    ('m3', 'M3 — at least four papillary structures'),
    ('m4', 'M4 — irregular multilocular solid tumour ≥ 100 mm'),
    ('m5', 'M5 — very strong blood flow (colour score 4)'),
  ];

  @override
  Widget build(BuildContext context) {
    final ca = double.tryParse(_ca125.text.trim());
    final points = _usFeatures.length;
    final u = points == 0 ? 0 : (points == 1 ? 1 : 3);
    final m = _postmenopausal ? 3 : 1;
    final rmi = ca == null ? null : u * m * ca;

    final hasB = _bRules.isNotEmpty;
    final hasM = _mRules.isNotEmpty;
    final (iotaBand, iotaVerdict, iotaNote) = hasM && !hasB
        ? (Band.critical, 'Malignant',
            'One or more M-features and no B-features. Refer to '
                'gynaecological oncology.')
        : hasB && !hasM
            ? (Band.good, 'Benign',
                'One or more B-features and no M-features. Conservative '
                    'management is usually appropriate.')
            : (hasB && hasM) || (!hasB && !hasM)
                ? (Band.watch, 'Inconclusive',
                    'Both or neither category applies — this happens in about '
                        '20% of masses. Needs an expert examiner or a '
                        'second-stage test.')
                : (Band.neutral, 'Select features', '');

    return CalcScaffold(
      title: 'Adnexal mass',
      subtitle: 'RMI · IOTA simple rules · O-RADS',
      children: [
        const SectionLabel('Risk of Malignancy Index', topPad: 0),
        Text('RMI = ultrasound score × menopausal score × CA-125',
            style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 12),
        ..._rmiFeatures.map((f) => CheckboxListTile(
              value: _usFeatures.contains(f.$1),
              onChanged: (v) => setState(() =>
                  v ?? false ? _usFeatures.add(f.$1) : _usFeatures.remove(f.$1)),
              title: Text(f.$2, style: const TextStyle(fontSize: 12.5)),
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            )),
        SwitchListTile(
          value: _postmenopausal,
          onChanged: (v) => setState(() => _postmenopausal = v),
          title: const Text('Postmenopausal'),
          subtitle: Text(_postmenopausal ? 'M = 3' : 'M = 1'),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        NumField(
            label: 'CA-125',
            unit: 'U/mL',
            controller: _ca125,
            onChanged: (_) => setState(() {})),
        if (rmi != null)
          ResultCard(
            headline: 'RMI ${rmi.round()}',
            band: rmi >= 200 ? Band.alert : Band.good,
            caption: rmi >= 200
                ? 'At or above 200 — refer to a gynaecological oncology centre.'
                : 'Below 200 — may be managed locally, with the clinical '
                    'picture taken into account.',
            rows: [
              ('Ultrasound features', '$points of 5 → U = $u'),
              ('Menopausal score', 'M = $m'),
              ('CA-125', '${ca!.toStringAsFixed(0)} U/mL'),
              ('Referral threshold', '200 (some centres use 250)'),
            ],
            note: 'CA-125 is raised by endometriosis, fibroids, pelvic '
                'inflammatory disease, pregnancy, menstruation, and any '
                'peritoneal irritation. RMI performs poorly in premenopausal '
                'women for exactly that reason.',
          ),
        const SectionLabel('IOTA simple rules'),
        Text('Benign features',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w700)),
        ..._b.map((f) => CheckboxListTile(
              value: _bRules.contains(f.$1),
              onChanged: (v) => setState(
                  () => v ?? false ? _bRules.add(f.$1) : _bRules.remove(f.$1)),
              title: Text(f.$2, style: const TextStyle(fontSize: 12.5)),
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            )),
        const SizedBox(height: 8),
        Text('Malignant features',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w700)),
        ..._m.map((f) => CheckboxListTile(
              value: _mRules.contains(f.$1),
              onChanged: (v) => setState(
                  () => v ?? false ? _mRules.add(f.$1) : _mRules.remove(f.$1)),
              title: Text(f.$2, style: const TextStyle(fontSize: 12.5)),
              dense: true,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            )),
        if (hasB || hasM)
          ResultCard(
            headline: iotaVerdict,
            band: iotaBand,
            caption: iotaNote,
            rows: [
              ('B-features present', hasB ? _bRules.length.toString() : 'none'),
              ('M-features present', hasM ? _mRules.length.toString() : 'none'),
            ],
          ),
        const SectionLabel('O-RADS ultrasound categories'),
        const _Ords('0', 'Incomplete evaluation', '—'),
        const _Ords('1', 'Normal premenopausal ovary', '—'),
        const _Ords('2', 'Almost certainly benign', '< 1%'),
        const _Ords('3', 'Low risk', '1 – < 10%'),
        const _Ords('4', 'Intermediate risk', '10 – < 50%'),
        const _Ords('5', 'High risk', '≥ 50%'),
        const ReferenceNote(
          sources: [
            'Jacobs I et al. A risk of malignancy index incorporating CA125, '
                'ultrasound and menopausal status. Br J Obstet Gynaecol '
                '1990;97:922–929.',
            'Timmerman D et al. Simple ultrasound-based rules for the diagnosis '
                'of ovarian cancer (IOTA). Ultrasound Obstet Gynecol '
                '2008;31:681–690.',
            'Andreotti RF et al. O-RADS US Risk Stratification and Management '
                'System. Radiology 2020;294:168–185.',
            'RCOG Green-top Guideline 62 — Management of Suspected Ovarian '
                'Masses in Premenopausal Women.',
          ],
          caveat: 'These systems stratify risk; none of them diagnoses. A mass '
              'that worries an experienced examiner should be referred '
              'whatever the score says.',
        ),
        ContentFooter(meta: ContentRegistry.metaFor('adnexal-mass')!),
      ],
    );
  }

  @override
  void dispose() {
    _ca125.dispose();
    super.dispose();
  }
}

class _Ords extends StatelessWidget {
  const _Ords(this.n, this.label, this.risk);
  final String n;
  final String label;
  final String risk;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(children: [
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(7)),
          child: Text(n,
              style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w800,
                  color: cs.primary)),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(label, style: const TextStyle(fontSize: 12.5))),
        Text(risk,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
      ]),
    );
  }
}
