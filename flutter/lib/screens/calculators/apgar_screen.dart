import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

/// Apgar score (§12).
///
/// Shared ground with PediAid, and the one calculator here whose most
/// important content is what it must not be used for: Apgar does not diagnose
/// asphyxia, does not predict outcome, and never guides resuscitation.
class ApgarScreen extends StatefulWidget {
  const ApgarScreen({super.key});
  @override
  State<ApgarScreen> createState() => _ApgarScreenState();
}

class _ApgarScreenState extends State<ApgarScreen> {
  int _appearance = 2;
  int _pulse = 2;
  int _grimace = 2;
  int _activity = 2;
  int _respiration = 2;

  int get _total =>
      _appearance + _pulse + _grimace + _activity + _respiration;

  @override
  Widget build(BuildContext context) {
    final t = _total;
    final (band, label, advice) = switch (t) {
      >= 7 => (Band.good, 'Reassuring',
          'Routine care. Repeat at 5 minutes.'),
      >= 4 => (Band.alert, 'Moderately depressed',
          'Continue resuscitation. Repeat every 5 minutes until the score '
              'reaches 7, up to 20 minutes.'),
      _ => (Band.critical, 'Severely depressed',
          'Full resuscitation per the newborn life support algorithm. Repeat '
              'every 5 minutes up to 20 minutes.'),
    };

    return CalcScaffold(
      title: 'Apgar score',
      subtitle: 'At 1 and 5 minutes',
      children: [
        ScoreChoice<int>(
          label: 'Appearance — colour',
          value: _appearance,
          options: const [
            (0, 'Blue or pale'),
            (1, 'Body pink, extremities blue'),
            (2, 'Completely pink'),
          ],
          onChanged: (v) => setState(() => _appearance = v),
        ),
        ScoreChoice<int>(
          label: 'Pulse — heart rate',
          value: _pulse,
          options: const [
            (0, 'Absent'),
            (1, 'Below 100'),
            (2, '100 or above'),
          ],
          onChanged: (v) => setState(() => _pulse = v),
        ),
        ScoreChoice<int>(
          label: 'Grimace — reflex irritability',
          value: _grimace,
          options: const [
            (0, 'No response'),
            (1, 'Grimace'),
            (2, 'Cry, cough or sneeze'),
          ],
          onChanged: (v) => setState(() => _grimace = v),
        ),
        ScoreChoice<int>(
          label: 'Activity — muscle tone',
          value: _activity,
          options: const [
            (0, 'Limp'),
            (1, 'Some flexion'),
            (2, 'Active motion'),
          ],
          onChanged: (v) => setState(() => _activity = v),
        ),
        ScoreChoice<int>(
          label: 'Respiration',
          value: _respiration,
          options: const [
            (0, 'Absent'),
            (1, 'Slow, irregular, weak cry'),
            (2, 'Good, strong cry'),
          ],
          onChanged: (v) => setState(() => _respiration = v),
        ),
        ResultCard(
          headline: '$t / 10 — $label',
          band: band,
          caption: advice,
          rows: [
            ('Appearance', '$_appearance'),
            ('Pulse', '$_pulse'),
            ('Grimace', '$_grimace'),
            ('Activity', '$_activity'),
            ('Respiration', '$_respiration'),
          ],
        ),
        const SectionLabel('What the Apgar score is not'),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFB3261E).withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: const Color(0xFFB3261E).withValues(alpha: 0.4)),
          ),
          child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Never use Apgar to guide resuscitation.',
                    style: TextStyle(
                        fontSize: 12.5,
                        height: 1.5,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: 8),
                Text(
                    'Resuscitation begins on assessment of breathing, heart '
                    'rate and tone — long before the one-minute score exists.\n\n'
                    'A low Apgar score alone does not diagnose birth asphyxia '
                    'or hypoxic-ischaemic encephalopathy. That needs cord '
                    'gases, the clinical course, and neurological examination.\n\n'
                    'It does not predict individual neurological outcome, and '
                    'should not be quoted to parents as though it did.\n\n'
                    'Prematurity, maternal sedation, anaesthesia, congenital '
                    'anomaly and neuromuscular disease all lower the score '
                    'without hypoxia.',
                    style: TextStyle(fontSize: 12, height: 1.55)),
              ]),
        ),
        const SectionLabel('Recording it properly'),
        const _Point('Score at 1 and 5 minutes for every birth.'),
        const _Point('If the 5-minute score is below 7, continue scoring every '
            '5 minutes up to 20 minutes.'),
        const _Point('Record an expanded Apgar alongside it, noting what '
            'resuscitation was being given at the time — oxygen, positive '
            'pressure ventilation, intubation, compressions, adrenaline.'),
        const _Point('Send paired arterial and venous cord gases wherever the '
            'birth was complicated.'),
        const ReferenceNote(
          sources: [
            'Apgar V. A proposal for a new method of evaluation of the newborn '
                'infant. Curr Res Anesth Analg 1953;32:260–267.',
            'ACOG Committee Opinion 644 / AAP — The Apgar Score (reaffirmed).',
            'Neonatal Resuscitation Program (NRP), American Academy of '
                'Pediatrics.',
            'Resuscitation Council UK — Newborn Life Support.',
          ],
        ),
        ContentFooter(meta: ContentRegistry.metaFor('apgar')!),
      ],
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
