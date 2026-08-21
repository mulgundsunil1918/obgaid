import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// Renal function in pregnancy (§24).
///
/// The important content here is the caveat, not the arithmetic. Glomerular
/// filtration rises 40–50% in normal pregnancy and creatinine falls with it,
/// so a value that reads as reassuringly normal outside pregnancy can
/// represent substantial renal impairment inside it.
class CreatinineScreen extends StatefulWidget {
  const CreatinineScreen({super.key});
  @override
  State<CreatinineScreen> createState() => _CreatinineScreenState();
}

class _CreatinineScreenState extends State<CreatinineScreen> {
  final _creatinine = TextEditingController();
  final _age = TextEditingController();
  final _weight = TextEditingController();
  bool _pregnant = true;

  double? _v(TextEditingController c) => double.tryParse(c.text.trim());

  @override
  Widget build(BuildContext context) {
    final cr = _v(_creatinine);
    final age = _v(_age);
    final wt = _v(_weight);

    // Cockcroft-Gault, with the 0.85 female factor.
    double? crcl;
    if (cr != null && age != null && wt != null && cr > 0) {
      crcl = ((140 - age) * wt * 0.85) / (72 * cr);
    }

    // CKD-EPI 2021, race-free, female coefficients.
    double? egfr;
    if (cr != null && age != null && cr > 0) {
      const k = 0.7; // female
      egfr = 142 *
          math.pow(math.min(cr / k, 1), -0.241) *
          math.pow(math.max(cr / k, 1), -1.200) *
          math.pow(0.9938, age) *
          1.012; // female coefficient
    }

    Band band = Band.neutral;
    String caption = '';
    if (cr != null) {
      if (_pregnant) {
        if (cr > 0.9) {
          band = Band.critical;
          caption = 'Above 0.9 mg/dL in pregnancy is clearly abnormal and '
              'warrants nephrology referral.';
        } else if (cr > 0.8) {
          band = Band.alert;
          caption = 'Above the normal pregnancy range of 0.4–0.8 mg/dL. This '
              'would look normal outside pregnancy — it is not.';
        } else {
          band = Band.good;
          caption = 'Within the normal pregnancy range of 0.4–0.8 mg/dL.';
        }
      } else {
        band = cr > 1.1 ? Band.alert : Band.good;
        caption = cr > 1.1
            ? 'Above the usual non-pregnant female range.'
            : 'Within the usual non-pregnant female range.';
      }
    }

    return CalcScaffold(
      title: 'Renal function',
      subtitle: 'Creatinine clearance · eGFR',
      children: [
        SwitchListTile(
          value: _pregnant,
          onChanged: (v) => setState(() => _pregnant = v),
          title: const Text('Currently pregnant'),
          subtitle: const Text('Changes how the creatinine is interpreted'),
          dense: true,
          contentPadding: EdgeInsets.zero,
        ),
        const SizedBox(height: 8),
        NumField(
            label: 'Serum creatinine',
            unit: 'mg/dL',
            controller: _creatinine,
            onChanged: (_) => setState(() {})),
        Row(children: [
          Expanded(
              child: NumField(
                  label: 'Age',
                  unit: 'years',
                  controller: _age,
                  onChanged: (_) => setState(() {}))),
          const SizedBox(width: 12),
          Expanded(
              child: NumField(
                  label: 'Weight',
                  unit: 'kg',
                  controller: _weight,
                  onChanged: (_) => setState(() {}))),
        ]),
        if (cr != null)
          ResultCard(
            headline: '${cr.toStringAsFixed(2)} mg/dL',
            band: band,
            caption: caption,
            rows: [
              if (crcl != null)
                ('Cockcroft-Gault clearance',
                    '${crcl.round()} mL/min'),
              if (egfr != null)
                ('CKD-EPI 2021 eGFR',
                    '${egfr.round()} mL/min/1.73 m²'),
              (
                'Normal range',
                _pregnant
                    ? '0.4 – 0.8 mg/dL in pregnancy'
                    : '0.6 – 1.1 mg/dL non-pregnant'
              ),
            ],
            note: _pregnant
                ? 'Neither Cockcroft-Gault nor CKD-EPI is validated in '
                    'pregnancy. Both systematically UNDERESTIMATE the true '
                    'glomerular filtration rate here. Where an accurate figure '
                    'matters — drug dosing, staging chronic kidney disease — a '
                    '24-hour creatinine clearance is the reference standard.'
                : null,
          ),
        const SectionLabel('Why pregnancy changes the reading'),
        const _Note('Glomerular filtration rises by 40–50% by the end of the '
            'first trimester and stays high until term.'),
        const _Note('Serum creatinine falls correspondingly. The normal '
            'pregnancy range is 0.4–0.8 mg/dL — roughly a third lower than '
            'outside pregnancy.'),
        const _Note('A creatinine of 1.0 mg/dL in a pregnant woman is not '
            '"just above normal". It represents a substantial loss of renal '
            'reserve and needs investigation.'),
        const _Note('Creatinine that fails to fall in early pregnancy is '
            'itself a signal of underlying renal disease.'),
        const _Note('In pre-eclampsia, a rising creatinine is a severe '
            'feature and an indication to plan delivery.'),
        const SectionLabel('Thresholds worth remembering'),
        const _Threshold('Normal pregnancy creatinine', '0.4 – 0.8 mg/dL'),
        const _Threshold('Severe feature of pre-eclampsia',
            '> 1.1 mg/dL, or a doubling from her own baseline'),
        const _Threshold('Nephrology referral in pregnancy', '> 0.9 mg/dL'),
        const _Threshold('Proteinuria — significant',
            'Protein:creatinine ratio ≥ 30 mg/mmol'),
        const ReferenceNote(
          sources: [
            'Cockcroft DW, Gault MH. Prediction of creatinine clearance from '
                'serum creatinine. Nephron 1976;16:31–41.',
            'Inker LA et al. New Creatinine- and Cystatin C-Based Equations to '
                'Estimate GFR without Race. N Engl J Med 2021;385:1737–1749.',
            'Wiles K et al. Clinical practice guideline on pregnancy and renal '
                'disease. BMC Nephrol 2019;20:401.',
            'ACOG Practice Bulletin 222 — Gestational Hypertension and '
                'Preeclampsia.',
          ],
          caveat: 'Estimating equations were derived and validated outside '
              'pregnancy. Use them for trend and for triage, not as a '
              'substitute for a measured clearance where the number will drive '
              'a decision.',
        ),
        ContentFooter(meta: ContentRegistry.metaFor('creatinine')!),
      ],
    );
  }

  @override
  void dispose() {
    for (final c in [_creatinine, _age, _weight]) {
      c.dispose();
    }
    super.dispose();
  }
}

class _Note extends StatelessWidget {
  const _Note(this.text);
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

class _Threshold extends StatelessWidget {
  const _Threshold(this.what, this.value);
  final String what;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              flex: 5,
              child:
                  Text(what, style: const TextStyle(fontSize: 12, height: 1.4))),
          Expanded(
              flex: 4,
              child: Text(value,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w700, height: 1.4))),
        ]),
      );
}
