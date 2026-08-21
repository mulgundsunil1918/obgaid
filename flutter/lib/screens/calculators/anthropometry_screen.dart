import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// Maternal anthropometry (§4) — BMI, body surface area and the body-weight
/// derivations that drug dosing depends on.
///
/// BMI carries both the WHO thresholds and the Asia-Pacific ones. Indian women
/// develop the metabolic consequences of adiposity at a lower BMI, so a woman
/// classed "normal" at 24 by WHO is already overweight by the criteria her own
/// national programmes use.
class AnthropometryScreen extends StatefulWidget {
  const AnthropometryScreen({super.key});
  @override
  State<AnthropometryScreen> createState() => _AnthropometryScreenState();
}

class _AnthropometryScreenState extends State<AnthropometryScreen> {
  final _weight = TextEditingController();
  final _height = TextEditingController();
  bool _asian = true;

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

  @override
  Widget build(BuildContext context) {
    final w = _v(_weight);
    final h = _v(_height);

    double? bmi;
    if (w != null && h != null && h > 0) bmi = w / math.pow(h / 100, 2);

    // Devine, for a woman: 45.5 kg + 2.3 kg per inch over 5 feet.
    double? ibw;
    if (h != null && h > 152.4) {
      ibw = 45.5 + 2.3 * ((h - 152.4) / 2.54);
    } else if (h != null) {
      ibw = 45.5;
    }

    double? abw;
    if (ibw != null && w != null && w > ibw) abw = ibw + 0.4 * (w - ibw);

    // Janmahasatian, female.
    double? lbw;
    if (w != null && bmi != null) lbw = (9270 * w) / (8780 + 244 * bmi);

    double? bsaMosteller, bsaDubois;
    if (w != null && h != null) {
      bsaMosteller = math.sqrt(h * w / 3600);
      bsaDubois =
          0.007184 * math.pow(h, 0.725) * math.pow(w, 0.425).toDouble();
    }

    final (band, label) = bmi == null
        ? (Band.neutral, '')
        : _asian
            ? _asiaPacific(bmi)
            : _who(bmi);

    return CalcScaffold(
      title: 'Maternal anthropometry',
      subtitle: 'BMI · BSA · body weights',
      children: [
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
                  label: 'Height',
                  unit: 'cm',
                  controller: _height,
                  onChanged: (_) => setState(() {}))),
        ]),
        SwitchListTile(
          value: _asian,
          onChanged: (v) => setState(() => _asian = v),
          title: const Text('Asia-Pacific BMI thresholds'),
          subtitle: Text(_asian
              ? 'Overweight ≥ 23, obese ≥ 25 — the criteria used by Indian '
                  'national programmes'
              : 'WHO international: overweight ≥ 25, obese ≥ 30'),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        if (bmi != null)
          ResultCard(
            headline: 'BMI ${bmi.toStringAsFixed(1)} kg/m²',
            band: band,
            caption: label,
            rows: [
              ('By WHO thresholds', _who(bmi).$2),
              ('By Asia-Pacific thresholds', _asiaPacific(bmi).$2),
              if (bsaMosteller != null)
                ('BSA — Mosteller', '${bsaMosteller.toStringAsFixed(2)} m²'),
              if (bsaDubois != null)
                ('BSA — DuBois', '${bsaDubois.toStringAsFixed(2)} m²'),
              if (ibw != null)
                ('Ideal body weight (Devine)',
                    '${ibw.toStringAsFixed(1)} kg'),
              if (abw != null)
                ('Adjusted body weight',
                    '${abw.toStringAsFixed(1)} kg'),
              if (lbw != null)
                ('Lean body weight (Janmahasatian)',
                    '${lbw.toStringAsFixed(1)} kg'),
            ],
            note: 'In pregnancy, BMI should be calculated from the '
                'pre-pregnancy or first-trimester weight. A BMI computed at '
                '32 weeks measures the pregnancy, not the woman.',
          ),
        const SectionLabel('Which weight to dose from'),
        const _WeightUse('Total body weight',
            'Low-molecular-weight heparin thromboprophylaxis; magnesium '
            'sulphate; most obstetric drugs.'),
        const _WeightUse('Ideal body weight',
            'Tidal volume in ventilation. Lungs do not enlarge with adiposity.'),
        const _WeightUse('Adjusted body weight',
            'Aminoglycosides in obesity, and some chemotherapy protocols.'),
        const _WeightUse('Lean body weight',
            'Induction agents such as propofol, and neuromuscular blockers.'),
        const ReferenceNote(
          sources: [
            'WHO. Obesity: preventing and managing the global epidemic. WHO '
                'Technical Report Series 894.',
            'WHO Expert Consultation. Appropriate body-mass index for Asian '
                'populations. Lancet 2004;363:157–163.',
            'Ministry of Health & Family Welfare, Government of India / ICMR — '
                'Asia-Pacific BMI cut-offs for Indian adults.',
            'Mosteller RD. Simplified calculation of body-surface area. '
                'N Engl J Med 1987;317:1098.',
            'Du Bois D, Du Bois EF. Arch Intern Med 1916;17:863–871.',
            'Devine BJ. Gentamicin therapy. Drug Intell Clin Pharm 1974.',
            'Janmahasatian S et al. Quantification of lean bodyweight. Clin '
                'Pharmacokinet 2005;44:1051–1065.',
          ],
        ),
        ContentFooter(meta: ContentRegistry.metaFor('anthropometry')!),
      ],
    );
  }

  (Band, String) _who(double bmi) {
    if (bmi < 18.5) return (Band.watch, 'Underweight');
    if (bmi < 25) return (Band.good, 'Normal weight');
    if (bmi < 30) return (Band.watch, 'Overweight');
    if (bmi < 35) return (Band.alert, 'Obese class I');
    if (bmi < 40) return (Band.alert, 'Obese class II');
    return (Band.critical, 'Obese class III');
  }

  (Band, String) _asiaPacific(double bmi) {
    if (bmi < 18.5) return (Band.watch, 'Underweight');
    if (bmi < 23) return (Band.good, 'Normal weight');
    if (bmi < 25) return (Band.watch, 'Overweight');
    if (bmi < 30) return (Band.alert, 'Obese class I');
    return (Band.critical, 'Obese class II');
  }

  @override
  void dispose() {
    _weight.dispose();
    _height.dispose();
    super.dispose();
  }
}

class _WeightUse extends StatelessWidget {
  const _WeightUse(this.which, this.use);
  final String which;
  final String use;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(which,
              style: const TextStyle(
                  fontSize: 12.5, fontWeight: FontWeight.w700)),
          Text(use,
              style: TextStyle(
                  fontSize: 11.5,
                  height: 1.4,
                  color: Theme.of(context).colorScheme.onSurfaceVariant)),
        ]),
      );
}
