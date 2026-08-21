import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// Obstetric haemodynamics (§5) — MAP, pulse pressure and the three shock
/// indices.
///
/// All of it exists because blood pressure is the last thing to fall in a
/// young pregnant woman. She compensates, and compensates, and then does not.
class HaemodynamicsScreen extends StatefulWidget {
  const HaemodynamicsScreen({super.key});
  @override
  State<HaemodynamicsScreen> createState() => _HaemodynamicsScreenState();
}

class _HaemodynamicsScreenState extends State<HaemodynamicsScreen> {
  final _sbp = TextEditingController();
  final _dbp = TextEditingController();
  final _hr = TextEditingController();

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

  @override
  Widget build(BuildContext context) {
    final s = _v(_sbp), d = _v(_dbp), hr = _v(_hr);

    double? map, pp, si, msi;
    if (s != null && d != null) {
      map = (s + 2 * d) / 3;
      pp = s - d;
    }
    if (hr != null && s != null && s > 0) si = hr / s;
    if (hr != null && map != null && map > 0) msi = hr / map;

    Band band = Band.neutral;
    String headline = 'Enter a blood pressure';
    String caption = '';

    if (si != null) {
      headline = 'Shock index ${si.toStringAsFixed(2)}';
      if (si >= 1.7) {
        band = Band.critical;
        caption = 'Severe shock. Activate the massive transfusion protocol.';
      } else if (si >= 1.1) {
        band = Band.alert;
        caption = 'Predicts adverse outcome and the need for transfusion.';
      } else if (si >= 0.9) {
        band = Band.watch;
        caption = 'Abnormal in pregnancy — treat as significant blood loss '
            'even where the blood pressure still looks acceptable.';
      } else {
        band = Band.good;
        caption = 'Within the normal obstetric range of 0.7 – 0.9.';
      }
    } else if (map != null) {
      headline = 'MAP ${map.toStringAsFixed(0)} mmHg';
      if (map < 65) {
        band = Band.critical;
        caption = 'Below 65 mmHg — organ perfusion is threatened.';
      } else if (s! >= 160 || d! >= 110) {
        band = Band.critical;
        caption = 'Severe-range hypertension. Treat within 30–60 minutes.';
      } else if (s >= 140 || d >= 90) {
        band = Band.alert;
        caption = 'Hypertensive range in pregnancy.';
      } else {
        band = Band.good;
        caption = 'Within the normal range.';
      }
    }

    return CalcScaffold(
      title: 'Obstetric haemodynamics',
      subtitle: 'MAP · pulse pressure · shock indices',
      children: [
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'Systolic BP',
                  unit: 'mmHg',
                  controller: _sbp,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'Diastolic BP',
                  unit: 'mmHg',
                  controller: _dbp,
                  onChanged: (_) => setState(() {}))),
        ]),
        NumField(
            label: 'Heart rate',
            unit: 'bpm',
            controller: _hr,
            onChanged: (_) => setState(() {})),
        if (map != null || si != null)
          ResultCard(
            headline: headline,
            band: band,
            caption: caption,
            rows: [
              if (map != null)
                ('Mean arterial pressure', '${map.toStringAsFixed(0)} mmHg'),
              if (pp != null)
                ('Pulse pressure', '${pp.toStringAsFixed(0)} mmHg'),
              if (si != null)
                ('Shock index (HR ÷ SBP)', si.toStringAsFixed(2)),
              if (msi != null)
                ('Modified shock index (HR ÷ MAP)', msi.toStringAsFixed(2)),
            ],
          ),
        const SectionLabel('How to read these'),
        const _Ref('Mean arterial pressure',
            'DBP + (SBP − DBP) ÷ 3. Keep above 65 mmHg for organ perfusion. A '
            'first-trimester MAP above 90 is a pre-eclampsia risk marker.'),
        const _Ref('Pulse pressure',
            'SBP − DBP. A narrow pulse pressure is an early sign of '
            'hypovolaemia; a wide one occurs in anaemia, sepsis and '
            'thyrotoxicosis.'),
        const _Ref('Shock index',
            'HR ÷ SBP. Normal 0.5–0.7 outside pregnancy, 0.7–0.9 in '
            'pregnancy. ≥ 0.9 abnormal · ≥ 1.1 predicts adverse outcome · '
            '≥ 1.7 severe.'),
        const _Ref('Modified shock index',
            'HR ÷ MAP. Normal 0.7–1.3. Above 1.3 suggests hypodynamic '
            'circulation; below 0.7, hyperdynamic.'),
        const _Ref('Why it matters in obstetrics',
            'Plasma volume rises by 40–50% in pregnancy. A woman can lose a '
            'litre and a half before her blood pressure moves. The shock index '
            'changes first.'),
        const ReferenceNote(
          sources: [
            'Nathan HL et al. Shock index: an effective predictor of outcome '
                'in postpartum haemorrhage? BJOG 2015;122:268–275.',
            'Le Bas A et al. Use of the "obstetric shock index" as an adjunct '
                'in identifying significant blood loss. Int J Gynecol Obstet '
                '2014;124:253–255.',
            'RCOG Green-top Guideline 52 — Prevention and Management of '
                'Postpartum Haemorrhage.',
            'NICE NG133 — Hypertension in pregnancy.',
          ],
        ),
        ContentFooter(meta: ContentRegistry.metaFor('haemodynamics')!),
      ],
    );
  }

  @override
  void dispose() {
    for (final c in [_sbp, _dbp, _hr]) {
      c.dispose();
    }
    super.dispose();
  }
}

class _Ref extends StatelessWidget {
  const _Ref(this.title, this.body);
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          Text(body,
              style: TextStyle(
                  fontSize: 11.5,
                  height: 1.45,
                  color: Theme.of(context).colorScheme.onSurfaceVariant)),
        ]),
      );
}
