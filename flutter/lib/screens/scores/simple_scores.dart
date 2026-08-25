import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';

/// Menopause Rating Scale — 11 self-rated items.
class MrsScreen extends StatefulWidget {
  const MrsScreen({super.key});
  @override
  State<MrsScreen> createState() => _MrsScreenState();
}

class _MrsScreenState extends State<MrsScreen> {
  static const _items = [
    'Hot flushes and sweating',
    'Heart discomfort — palpitations, racing, tightness',
    'Sleep problems',
    'Depressive mood',
    'Irritability',
    'Anxiety — inner restlessness, feeling panicky',
    'Physical and mental exhaustion',
    'Sexual problems',
    'Bladder problems',
    'Vaginal dryness',
    'Joint and muscular discomfort',
  ];
  final _scores = List<int>.filled(11, 0);
  int get _total => _scores.fold(0, (a, b) => a + b);

  @override
  Widget build(BuildContext context) {
    final t = _total;
    final (band, label) = t >= 17
        ? (Band.alert, 'Severe')
        : t >= 9
            ? (Band.watch, 'Moderate')
            : t >= 5
                ? (Band.watch, 'Mild')
                : (Band.good, 'None or minimal');

    // Subscale totals, per the published structure.
    final somato = _scores[0] + _scores[1] + _scores[2] + _scores[10];
    final psych = _scores[3] + _scores[4] + _scores[5] + _scores[6];
    final uro = _scores[7] + _scores[8] + _scores[9];

    return CalcScaffold(
      title: 'Menopause Rating Scale',
      subtitle: 'MRS · 11 items',
      children: [
        Text(
          'Ask her to rate each symptom as she has experienced it recently. '
          'The change in her own score over time is more useful than comparing '
          'her with anyone else.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),
        const SizedBox(height: 16),
        for (var i = 0; i < _items.length; i++)
          ScoreChoice<int>(
            label: '${i + 1}. ${_items[i]}',
            value: _scores[i],
            options: const [
              (0, 'None'),
              (1, 'Mild'),
              (2, 'Moderate'),
              (3, 'Severe'),
              (4, 'Very severe'),
            ],
            onChanged: (v) => setState(() => _scores[i] = v),
          ),
        ResultCard(
          headline: '$t / 44 — $label',
          band: band,
          caption: t >= 9
              ? 'Symptoms at this level usually warrant discussing treatment, '
                  'hormonal or otherwise.'
              : 'Reassess if symptoms change. Treatment is driven by how much '
                  'they trouble her, not by the number.',
          rows: [
            ('Somato-vegetative', '$somato of 16'),
            ('Psychological', '$psych of 16'),
            ('Urogenital', '$uro of 12'),
            ('None or minimal', '0 – 4'),
            ('Mild', '5 – 8'),
            ('Moderate', '9 – 16'),
            ('Severe', '17 or above'),
          ],
          note: 'The urogenital subscale matters separately: unlike vasomotor '
              'symptoms, genitourinary symptoms do not improve with time and '
              'need long-term treatment.',
        ),
        const ReferenceNote(
          sources: [
            'Heinemann LAJ et al. The Menopause Rating Scale (MRS): a '
                'methodological review. Health Qual Life Outcomes 2004;2:45.',
            'Indian Menopause Society — clinical practice recommendations.',
            'NICE NG23 — Menopause: diagnosis and management.',
          ],
          caveat: 'Self-rated, so it measures distress as much as physiology. '
              'Exclude thyroid disease, anaemia and depression before '
              'attributing everything to the menopause.',
        ),
      ],
    );
  }
}

/// ECOG performance status.
class EcogScreen extends StatefulWidget {
  const EcogScreen({super.key});
  @override
  State<EcogScreen> createState() => _EcogScreenState();
}

class _EcogScreenState extends State<EcogScreen> {
  int? _grade;

  static const _grades = <(int, String, String)>[
    (0, 'Fully active',
        'Able to carry on all pre-disease activity without restriction.'),
    (1, 'Restricted in strenuous activity',
        'Ambulatory and able to do light or sedentary work — housework, '
            'office work.'),
    (2, 'Ambulatory and self-caring',
        'Unable to work. Up and about more than half of waking hours.'),
    (3, 'Limited self-care',
        'Confined to bed or chair more than half of waking hours.'),
    (4, 'Completely disabled',
        'No self-care. Totally confined to bed or chair.'),
    (5, 'Dead', ''),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return CalcScaffold(
      title: 'ECOG performance status',
      subtitle: 'Fitness for cancer treatment',
      children: [
        Text(
          'Assign by observation and history. Note that most chemotherapy '
          'trials enrolled only grades 0 to 2, so the evidence for treating '
          'grade 3 and 4 is thin.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),
        const SizedBox(height: 16),
        ..._grades.map((g) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              color: _grade == g.$1
                  ? cs.primary.withValues(alpha: 0.10)
                  : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(
                    color: _grade == g.$1
                        ? cs.primary
                        : cs.outlineVariant.withValues(alpha: 0.5)),
              ),
              child: ListTile(
                onTap: () => setState(() => _grade = g.$1),
                leading: CircleAvatar(
                  radius: 15,
                  backgroundColor: _grade == g.$1
                      ? cs.primary
                      : cs.surfaceContainerHighest,
                  child: Text('${g.$1}',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: _grade == g.$1
                              ? Colors.white
                              : cs.onSurfaceVariant)),
                ),
                title: Text(g.$2,
                    style: const TextStyle(
                        fontSize: 13.5, fontWeight: FontWeight.w700)),
                subtitle: g.$3.isEmpty
                    ? null
                    : Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(g.$3,
                            style: TextStyle(
                                fontSize: 12,
                                height: 1.4,
                                color: cs.onSurfaceVariant)),
                      ),
              ),
            )),
        if (_grade != null)
          ResultCard(
            headline: 'ECOG $_grade',
            band: _grade! <= 1
                ? Band.good
                : _grade! == 2
                    ? Band.watch
                    : Band.alert,
            caption: _grade! <= 1
                ? 'Generally fit for standard chemotherapy and for radical '
                    'surgery.'
                : _grade! == 2
                    ? 'Fitness borderline. Consider dose modification and '
                        'discuss at the multidisciplinary meeting.'
                    : 'Standard chemotherapy is usually not appropriate. '
                        'Consider best supportive care, and reassess after '
                        'symptom control.',
            note: 'Performance status can improve substantially once cancer '
                'symptoms are palliated. A grade taken at the worst moment may '
                'understate her fitness — reassess rather than deciding once.',
          ),
        const ReferenceNote(
          sources: [
            'Oken MM et al. Toxicity and response criteria of the Eastern '
                'Cooperative Oncology Group. Am J Clin Oncol 1982;5:649–655.',
            'National Cancer Grid of India — treatment guidelines.',
            'ESGO and NCCN guidance on fitness for treatment.',
          ],
          caveat: 'Crude and subjective, with considerable variation between '
              'observers. It is a communication shorthand, not a measurement.',
        ),
      ],
    );
  }
}

/// Quintero staging for twin-to-twin transfusion syndrome.
class QuinteroScreen extends StatefulWidget {
  const QuinteroScreen({super.key});
  @override
  State<QuinteroScreen> createState() => _QuinteroScreenState();
}

class _QuinteroScreenState extends State<QuinteroScreen> {
  bool _poly = false;
  bool _bladderAbsent = false;
  bool _dopplerAbnormal = false;
  bool _hydrops = false;
  bool _demise = false;

  int? get _stage {
    if (_demise) return 5;
    if (_hydrops) return 4;
    if (_dopplerAbnormal) return 3;
    if (_bladderAbsent) return 2;
    if (_poly) return 1;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final st = _stage;
    return CalcScaffold(
      title: 'Quintero staging',
      subtitle: 'Twin-to-twin transfusion syndrome',
      children: [
        Text(
          'Applies only to monochorionic diamniotic twins. Tick the findings '
          'present — the stage is set by the most advanced feature.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),
        const SizedBox(height: 14),
        CheckboxListTile(
          value: _poly,
          onChanged: (v) => setState(() => _poly = v ?? false),
          title: const Text('Polyhydramnios–oligohydramnios sequence'),
          subtitle: const Text(
              'Recipient DVP above 8 cm, donor DVP below 2 cm'),
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        ),
        CheckboxListTile(
          value: _bladderAbsent,
          onChanged: (v) => setState(() => _bladderAbsent = v ?? false),
          title: const Text('Donor bladder not visible'),
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        ),
        CheckboxListTile(
          value: _dopplerAbnormal,
          onChanged: (v) => setState(() => _dopplerAbnormal = v ?? false),
          title: const Text('Critically abnormal Doppler'),
          subtitle: const Text(
              'Absent or reversed umbilical artery end-diastolic flow, '
              'reversed ductus venosus a-wave, or pulsatile umbilical venous '
              'flow'),
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        ),
        CheckboxListTile(
          value: _hydrops,
          onChanged: (v) => setState(() => _hydrops = v ?? false),
          title: const Text('Hydrops in either twin'),
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        ),
        CheckboxListTile(
          value: _demise,
          onChanged: (v) => setState(() => _demise = v ?? false),
          title: const Text('Demise of either twin'),
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        ),
        if (st != null)
          ResultCard(
            headline: 'Stage $st',
            band: st >= 4
                ? Band.critical
                : st >= 2
                    ? Band.alert
                    : Band.watch,
            caption: switch (st) {
              1 => 'Management debated. Close surveillance is reasonable; some '
                  'centres offer laser.',
              2 => 'Fetoscopic laser ablation is the treatment of choice from '
                  'this stage.',
              3 => 'Laser ablation, urgently. Refer to a fetal medicine centre '
                  'today.',
              4 => 'Advanced disease. Urgent fetal medicine referral.',
              _ => 'Discuss management of the surviving twin with fetal '
                  'medicine — the risk of co-twin injury is substantial.',
            },
            rows: const [
              ('Laser window', 'Generally before 26 weeks'),
              ('Evidence', 'Senat MV et al. NEJM 2004 — laser superior to '
                  'amnioreduction'),
            ],
            note: 'Progression is not always sequential — a pregnancy can move '
                'from stage I to IV without passing through the intermediate '
                'stages, which is why surveillance intervals are short.',
          ),
        const ReferenceNote(
          sources: [
            'Quintero RA et al. Staging of twin-twin transfusion syndrome. '
                'J Perinatol 1999;19:550–555.',
            'Senat MV et al. N Engl J Med 2004;351:136–144.',
            'ISUOG Practice Guidelines — role of ultrasound in twin '
                'pregnancy.',
            'FOGSI GCPR — Multiple Pregnancy.',
          ],
          caveat: 'Stage predicts outcome only loosely. The referral, not the '
              'stage, is the intervention a general obstetrician controls.',
        ),
      ],
    );
  }
}
