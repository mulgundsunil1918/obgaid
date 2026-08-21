import 'package:flutter/material.dart';
import '../../widgets/calc_widgets.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

class BishopScreen extends StatefulWidget {
  const BishopScreen({super.key});
  @override
  State<BishopScreen> createState() => _BishopScreenState();
}

class _BishopScreenState extends State<BishopScreen> {
  int _dilatation = 0;
  int _effacement = 0;
  int _station = 0;
  int _consistency = 0;
  int _position = 0;

  int get _total =>
      _dilatation + _effacement + _station + _consistency + _position;

  @override
  Widget build(BuildContext context) {
    final t = _total;
    final (headline, band, caption) = switch (t) {
      >= 8 => ('Favourable', Band.good,
          'Likelihood of vaginal delivery after induction is similar to '
              'spontaneous labour. Induce with oxytocin or amniotomy.'),
      >= 6 => ('Intermediate', Band.watch,
          'Induction is reasonable; consider ripening if other factors are '
              'unfavourable.'),
      _ => ('Unfavourable', Band.alert,
          'Cervical ripening indicated before induction — prostaglandin '
              '(dinoprostone / misoprostol) or a mechanical method (Foley).'),
    };

    return CalcScaffold(
      title: 'Bishop score',
      subtitle: 'Induction favourability',
      children: [
        ScoreChoice<int>(
          label: 'Cervical dilatation',
          value: _dilatation,
          options: const [
            (0, 'Closed'),
            (1, '1–2 cm'),
            (2, '3–4 cm'),
            (3, '≥ 5 cm'),
          ],
          onChanged: (v) => setState(() => _dilatation = v),
        ),
        ScoreChoice<int>(
          label: 'Effacement',
          value: _effacement,
          options: const [
            (0, '0–30%'),
            (1, '40–50%'),
            (2, '60–70%'),
            (3, '≥ 80%'),
          ],
          onChanged: (v) => setState(() => _effacement = v),
        ),
        ScoreChoice<int>(
          label: 'Fetal station',
          value: _station,
          options: const [
            (0, '−3'),
            (1, '−2'),
            (2, '−1 or 0'),
            (3, '+1 or +2'),
          ],
          onChanged: (v) => setState(() => _station = v),
        ),
        ScoreChoice<int>(
          label: 'Cervical consistency',
          value: _consistency,
          options: const [
            (0, 'Firm'),
            (1, 'Medium'),
            (2, 'Soft'),
          ],
          onChanged: (v) => setState(() => _consistency = v),
        ),
        ScoreChoice<int>(
          label: 'Cervical position',
          value: _position,
          options: const [
            (0, 'Posterior'),
            (1, 'Mid'),
            (2, 'Anterior'),
          ],
          onChanged: (v) => setState(() => _position = v),
        ),
        ResultCard(
          headline: '$t / 13 — $headline',
          band: band,
          caption: caption,
          rows: [
            ('Dilatation', '$_dilatation'),
            ('Effacement', '$_effacement'),
            ('Station', '$_station'),
            ('Consistency', '$_consistency'),
            ('Position', '$_position'),
          ],
        ),
        const ReferenceNote(
          sources: [
            'Bishop EH. Pelvic scoring for elective induction. Obstet Gynecol '
                '1964;24:266–268.',
            'ACOG Practice Bulletin 107 — Induction of Labor.',
            'A score ≥ 8 is conventionally taken as favourable; ≤ 5 warrants '
                'cervical ripening.',
          ],
          caveat: 'Bishop score was derived in multiparous women for elective '
              'induction at term. It predicts less well in nulliparas, where a '
              'ripening agent is often reasonable even at intermediate scores.',
        ),
        ContentFooter(meta: ContentRegistry.metaFor('bishop')!),
      ],
    );
  }
}
