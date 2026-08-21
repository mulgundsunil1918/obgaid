import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';

/// Postpartum haemorrhage — shock index, blood-volume loss, and the E-MOTIVE
/// bundle.
///
/// Shock index leads because blood pressure is the last thing to fall in a
/// young pregnant woman: she compensates until she does not. HR ÷ SBP catches
/// the deterioration that a "BP still 110/70" reading conceals.
class PphScreen extends StatefulWidget {
  const PphScreen({super.key});
  @override
  State<PphScreen> createState() => _PphScreenState();
}

class _PphScreenState extends State<PphScreen> {
  final _hr = TextEditingController();
  final _sbp = TextEditingController();
  final _weight = TextEditingController();
  final _ebl = TextEditingController();
  bool _caesarean = false;

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

  @override
  Widget build(BuildContext context) {
    final hr = _v(_hr), sbp = _v(_sbp), wt = _v(_weight), ebl = _v(_ebl);

    double? si;
    if (hr != null && sbp != null && sbp > 0) si = hr / sbp;

    // Blood volume rises to roughly 100 mL/kg by term.
    double? bv, pct;
    if (wt != null) bv = wt * 100;
    if (bv != null && ebl != null && bv > 0) pct = ebl / bv * 100;

    Band band = Band.neutral;
    String headline = 'Enter observations';
    String caption = 'Shock index needs a heart rate and systolic pressure.';

    if (si != null) {
      headline = 'Shock index ${si.toStringAsFixed(2)}';
      if (si >= 1.7) {
        band = Band.critical;
        caption = 'Severe shock. Activate massive transfusion protocol now.';
      } else if (si >= 1.1) {
        band = Band.alert;
        caption = 'Predicts adverse outcome and need for transfusion. '
            'Escalate, cross-match, and move towards theatre.';
      } else if (si >= 0.9) {
        band = Band.watch;
        caption = 'Abnormal in pregnancy. Treat as significant blood loss even '
            'if the blood pressure still looks acceptable.';
      } else {
        band = Band.good;
        caption = 'Within the normal obstetric range of 0.7 – 0.9.';
      }
    }

    final threshold = _caesarean ? 1000 : 500;

    return CalcScaffold(
      title: 'Postpartum haemorrhage',
      subtitle: 'Shock index · blood loss · E-MOTIVE',
      children: [
        const SectionLabel('Observations', topPad: 0),
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'Heart rate',
                  unit: 'bpm',
                  controller: _hr,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'Systolic BP',
                  unit: 'mmHg',
                  controller: _sbp,
                  onChanged: (_) => setState(() {}))),
        ]),
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'Weight',
                  unit: 'kg',
                  controller: _weight,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'Estimated blood loss',
                  unit: 'mL',
                  controller: _ebl,
                  onChanged: (_) => setState(() {}))),
        ]),
        SwitchListTile(
          value: _caesarean,
          onChanged: (v) => setState(() => _caesarean = v),
          title: const Text('Caesarean delivery'),
          subtitle: Text('PPH threshold $threshold mL'),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        ResultCard(
          headline: headline,
          band: band,
          caption: caption,
          rows: [
            if (bv != null)
              ('Estimated blood volume', '${bv.round()} mL (100 mL/kg at term)'),
            if (pct != null)
              ('Proportion lost', '${pct.toStringAsFixed(1)}% of blood volume'),
            if (ebl != null)
              (
                'Meets PPH definition',
                ebl >= threshold
                    ? 'Yes — ≥ $threshold mL'
                    : 'Not by volume alone (< $threshold mL)'
              ),
            if (ebl != null && ebl >= 1000) ('Severity', 'Major PPH — ≥ 1000 mL'),
            if (ebl != null && ebl >= 2000)
              ('Severity', 'Massive PPH — ≥ 2000 mL'),
          ],
          note: 'ACOG reVITALize defines PPH as ≥ 1000 mL by any route, OR '
              'blood loss with signs of hypovolaemia within 24 hours. Visual '
              'estimation underestimates loss by 30–50% — use a calibrated '
              'drape.',
        ),

        const SectionLabel('E-MOTIVE bundle — start all of it, at once'),
        const _BundleStep('E', 'Early detection',
            'Calibrated drape; trigger at 500 mL or clinical concern.'),
        const _BundleStep('M', 'Massage',
            'Uterine massage until the uterus is contracted.'),
        const _BundleStep('O', 'Oxytocic drugs',
            'Oxytocin 10 IU IM or 5 IU slow IV; infusion 40 IU in 500 mL over 4 h.'),
        const _BundleStep('T', 'Tranexamic acid',
            '1 g IV over 10 min within 3 hours of birth; repeat once after 30 min if bleeding continues.'),
        const _BundleStep('I', 'IV fluids',
            'Crystalloid resuscitation; cross-match and activate transfusion early.'),
        const _BundleStep('V', 'Examination',
            'Examine the genital tract — tone, tissue, trauma, thrombin.'),
        const _BundleStep('E', 'Escalation',
            'Call for senior help, bimanual compression, balloon tamponade, theatre.'),

        const SectionLabel('Uterotonic ladder'),
        const _DrugRow('Oxytocin', '10 IU IM, or 5 IU slow IV',
            'First line. Avoid rapid IV bolus — causes hypotension.'),
        const _DrugRow('Methylergometrine', '0.2 mg IM, repeat q15 min (max 5)',
            'CONTRAINDICATED in hypertension and pre-eclampsia.'),
        const _DrugRow('Carboprost (15-methyl PGF2α)',
            '250 µg IM q15 min, max 2 mg (8 doses)',
            'CONTRAINDICATED in asthma.'),
        const _DrugRow('Misoprostol', '800 µg sublingual',
            'Where injectables or cold chain are unavailable.'),
        const _DrugRow('Tranexamic acid', '1 g IV over 10 min',
            'Within 3 hours of birth. Benefit is lost after that.'),

        const SectionLabel('If drugs fail'),
        Text(
          'Bimanual compression → intrauterine balloon tamponade (a condom '
          'catheter is an effective and widely available substitute) → '
          'compression sutures (B-Lynch) → stepwise devascularisation '
          '(uterine, then internal iliac) → hysterectomy. Do not let the '
          'escalation stall; delay, not the operation, is what kills.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),

        const ReferenceNote(
          sources: [
            'WHO / E-MOTIVE trial. Gallos I et al. N Engl J Med 2023;389:11–21.',
            'WOMAN Trial Collaborators. Lancet 2017;389:2105–2116 — tranexamic acid.',
            'RCOG Green-top Guideline 52 — Prevention and Management of PPH.',
            'ACOG Practice Bulletin 183 — Postpartum Hemorrhage; reVITALize '
                'definition.',
            'FOGSI GCPR — Prevention and Management of Postpartum Haemorrhage.',
            'Shock index in obstetrics: normal 0.7–0.9; ≥ 0.9 abnormal; ≥ 1.1 '
                'predicts adverse outcome; ≥ 1.7 severe.',
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    for (final c in [_hr, _sbp, _weight, _ebl]) {
      c.dispose();
    }
    super.dispose();
  }
}

class _BundleStep extends StatelessWidget {
  const _BundleStep(this.letter, this.title, this.body);
  final String letter;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8)),
          child: Text(letter,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                  color: cs.primary)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w700)),
            Text(body,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(height: 1.4)),
          ]),
        ),
      ]),
    );
  }
}

class _DrugRow extends StatelessWidget {
  const _DrugRow(this.name, this.dose, this.note);
  final String name;
  final String dose;
  final String note;

  @override
  Widget build(BuildContext context) {
    final warn = note.contains('CONTRAINDICATED');
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w700)),
        Text(dose, style: Theme.of(context).textTheme.bodySmall),
        Text(note,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: warn
                    ? Band.critical.color
                    : Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: warn ? FontWeight.w700 : FontWeight.w400)),
      ]),
    );
  }
}
