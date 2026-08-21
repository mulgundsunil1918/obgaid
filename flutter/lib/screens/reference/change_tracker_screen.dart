import 'package:flutter/material.dart';
import '../../data/guidelines.dart';
import '../../models/guideline.dart';
import 'guidelines_screen.dart';

/// The §55 change tracker, answering "what changed in OBG practice?"
///
/// Ordered newest first, across every guideline, because that is how the
/// question is actually asked.
class ChangeTrackerScreen extends StatelessWidget {
  const ChangeTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final changes = <GuidelineChange>[
      for (final g in kGuidelines) ...g.changes,
    ]..sort((a, b) => b.year.compareTo(a.year));

    final byYear = <int, List<GuidelineChange>>{};
    for (final c in changes) {
      byYear.putIfAbsent(c.year, () => []).add(c);
    }

    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('What changed'),
            Text('Guideline change tracker',
                style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 18),
            decoration: BoxDecoration(
              color: cs.primaryContainer.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Practice changes faster than textbooks are reprinted. Each '
              'entry states what the recommendation used to be, what it is '
              'now, and why the difference matters at a bedside.',
              style: TextStyle(fontSize: 12.5, height: 1.55),
            ),
          ),
          for (final year in byYear.keys) ...[
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 10),
              child: Text('$year',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: cs.primary)),
            ),
            ...byYear[year]!.map((c) => ChangeCard(c: c, showTopic: true)),
          ],
        ],
      ),
    );
  }
}
