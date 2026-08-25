import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';

/// Edinburgh Postnatal Depression Scale.
///
/// Item 10 is handled separately from the total throughout, because a woman
/// can score below threshold overall and still disclose thoughts of self-harm
/// — and that disclosure is the one that needs acting on the same day.
class EpdsScreen extends StatefulWidget {
  const EpdsScreen({super.key});
  @override
  State<EpdsScreen> createState() => _EpdsScreenState();
}

class _EpdsScreenState extends State<EpdsScreen> {
  // Options are listed in display order with their scored value, because
  // seven of the ten items are reverse-scored.
  static const _items = <(String, List<(int, String)>)>[
    (
      'I have been able to laugh and see the funny side of things',
      [(0, 'As much as I always could'), (1, 'Not quite so much now'),
       (2, 'Definitely not so much now'), (3, 'Not at all')]
    ),
    (
      'I have looked forward with enjoyment to things',
      [(0, 'As much as I ever did'), (1, 'Rather less than I used to'),
       (2, 'Definitely less than I used to'), (3, 'Hardly at all')]
    ),
    (
      'I have blamed myself unnecessarily when things went wrong',
      [(3, 'Yes, most of the time'), (2, 'Yes, some of the time'),
       (1, 'Not very often'), (0, 'No, never')]
    ),
    (
      'I have been anxious or worried for no good reason',
      [(0, 'No, not at all'), (1, 'Hardly ever'), (2, 'Yes, sometimes'),
       (3, 'Yes, very often')]
    ),
    (
      'I have felt scared or panicky for no very good reason',
      [(3, 'Yes, quite a lot'), (2, 'Yes, sometimes'), (1, 'No, not much'),
       (0, 'No, not at all')]
    ),
    (
      'Things have been getting on top of me',
      [(3, 'Yes, most of the time I have not been able to cope'),
       (2, 'Yes, sometimes I have not been coping as well as usual'),
       (1, 'No, most of the time I have coped quite well'),
       (0, 'No, I have been coping as well as ever')]
    ),
    (
      'I have been so unhappy that I have had difficulty sleeping',
      [(3, 'Yes, most of the time'), (2, 'Yes, sometimes'),
       (1, 'Not very often'), (0, 'No, not at all')]
    ),
    (
      'I have felt sad or miserable',
      [(3, 'Yes, most of the time'), (2, 'Yes, quite often'),
       (1, 'Not very often'), (0, 'No, not at all')]
    ),
    (
      'I have been so unhappy that I have been crying',
      [(3, 'Yes, most of the time'), (2, 'Yes, quite often'),
       (1, 'Only occasionally'), (0, 'No, never')]
    ),
    (
      'The thought of harming myself has occurred to me',
      [(3, 'Yes, quite often'), (2, 'Sometimes'), (1, 'Hardly ever'),
       (0, 'Never')]
    ),
  ];

  final _answers = List<int?>.filled(10, null);

  int get _total =>
      _answers.fold(0, (sum, a) => sum + (a ?? 0));
  bool get _complete => _answers.every((a) => a != null);
  bool get _selfHarm => (_answers[9] ?? 0) > 0;

  @override
  Widget build(BuildContext context) {
    final answered = _answers.where((a) => a != null).length;
    return CalcScaffold(
      title: 'EPDS',
      subtitle: 'Edinburgh Postnatal Depression Scale',
      children: [
        Text(
          'Ask her to choose the answer that comes closest to how she has felt '
          'IN THE PAST SEVEN DAYS, not just today. All ten items must be '
          'completed.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5),
        ),
        const SizedBox(height: 16),
        for (var i = 0; i < _items.length; i++)
          ScoreChoice<int?>(
            label: '${i + 1}. ${_items[i].$1}',
            value: _answers[i],
            options: _items[i]
                .$2
                .map((o) => (o.$1 as int?, o.$2))
                .toList(),
            onChanged: (v) => setState(() => _answers[i] = v),
          ),
        if (_selfHarm)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 8, bottom: 4),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFB3261E).withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFB3261E)),
            ),
            child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.warning_amber_rounded,
                      size: 20, color: Color(0xFFB3261E)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'She has disclosed thoughts of self-harm on item 10. '
                      'This requires same-day mental health assessment '
                      'whatever the total score. Do not send her home on the '
                      'strength of a low total.',
                      style: TextStyle(
                          fontSize: 12.5,
                          height: 1.5,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFB3261E)),
                    ),
                  ),
                ]),
          ),
        if (_complete)
          Builder(builder: (_) {
            final (band, label, advice) = _selfHarm
                ? (Band.critical, '$_total / 30 — urgent assessment',
                    'Item 10 is positive. Arrange same-day assessment '
                        'regardless of the total.')
                : _total >= 13
                    ? (Band.alert, '$_total / 30 — probable depression',
                        'Arrange assessment. Consider referral to perinatal '
                            'mental health services.')
                    : _total >= 10
                        ? (Band.watch, '$_total / 30 — possible depression',
                            'Repeat in two weeks and assess clinically. Do not '
                                'simply reassure.')
                        : (Band.good, '$_total / 30 — below threshold',
                            'Depression unlikely on this screen. Re-screen if '
                                'concern persists — the EPDS under-detects '
                                'anxiety.');
            return ResultCard(
              headline: label,
              band: band,
              caption: advice,
              rows: [
                ('Total', '$_total of 30'),
                ('Item 10 (self-harm)',
                    _selfHarm ? 'POSITIVE — act on this' : 'Negative'),
                ('Threshold for probable depression', '13 or above'),
                ('Threshold for possible depression', '10 – 12'),
              ],
            );
          })
        else
          ResultCard(
            headline: '$answered of 10 answered',
            band: Band.neutral,
            caption: 'Complete every item — a partial EPDS cannot be scored.',
          ),
        const ReferenceNote(
          sources: [
            'Cox JL, Holden JM, Sagovsky R. Detection of postnatal '
                'depression: development of the 10-item Edinburgh Postnatal '
                'Depression Scale. Br J Psychiatry 1987;150:782–786.',
            'NICE CG192 — Antenatal and postnatal mental health.',
            'MoHFW Government of India — maternal mental health guidance; '
                'validated Indian-language versions of the EPDS.',
          ],
          caveat: 'A screening tool, not a diagnosis. A raised score needs a '
              'clinical assessment, and a normal score does not exclude '
              'depression or anxiety in a woman you are worried about. '
              'Thresholds differ between validated translations — use the '
              'cut-off validated for the language you used.',
        ),
      ],
    );
  }
}
