import 'package:flutter/material.dart';
import '../../data/exam_topics.dart';
import '../../data/content_registry.dart';
import '../../models/exam_topic.dart';
import '../../widgets/hub_widgets.dart';

class ExamHub extends StatelessWidget {
  const ExamHub({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final byArea = <ExamArea, List<ExamTopic>>{};
    for (final t in kExamTopics) {
      byArea.putIfAbsent(t.area, () => []).add(t);
    }

    return HubScaffold(
      title: 'Examination',
      subtitle: '${kExamTopics.length} topics',
      intro: 'Not a second copy of the clinical content — the app already '
          'holds that. This is the shape of the questions: the facts that '
          'recur, the way examiners phrase them, and where candidates lose '
          'marks.',
      children: [
        for (final entry in byArea.entries) ...[
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 10),
            child: Text(entry.key.label.toUpperCase(),
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                    color: cs.primary)),
          ),
          ...entry.value.map((t) => HubTile(
                title: t.title,
                subtitle: '${t.highYield.length} high-yield points · '
                    '${t.vivaQuestions.length} viva questions',
                icon: Icons.school_outlined,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ExamScreen(topic: t))),
              )),
        ],
      ],
    );
  }
}

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key, required this.topic});
  final ExamTopic topic;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final links = topic.readsInApp
        .map(ContentRegistry.resolve)
        .whereType<ContentLink>()
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(topic.title),
            Text(topic.area.label,
                style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
        children: [
          _Header('HIGH YIELD', cs.primary),
          ...topic.highYield.map((h) => _Bullet(h, cs.primary, bold: true)),
          const SizedBox(height: 18),
          _Header('VIVA QUESTIONS', const Color(0xFF6A1B9A)),
          ...topic.vivaQuestions.map((q) => Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 9),
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: const Color(0xFF6A1B9A).withValues(alpha: 0.07),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Text('"$q"',
                    style: const TextStyle(
                        fontSize: 12.5,
                        height: 1.5,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500)),
              )),
          if (topic.classicTraps.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFB3261E).withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: const Color(0xFFB3261E).withValues(alpha: 0.4)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('WHERE MARKS ARE LOST',
                        style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.8,
                            color: Color(0xFFB3261E))),
                    const SizedBox(height: 9),
                    ...topic.classicTraps.map((t) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('•  ',
                                    style:
                                        TextStyle(color: Color(0xFFB3261E))),
                                Expanded(
                                    child: Text(t,
                                        style: const TextStyle(
                                            fontSize: 12, height: 1.5))),
                              ]),
                        )),
                  ]),
            ),
          ],
          if (links.isNotEmpty) ...[
            const SizedBox(height: 20),
            _Header('READ IN THE APP', cs.primary),
            ...links.map((c) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    dense: true,
                    leading: Icon(c.icon, size: 19, color: cs.primary),
                    title: Text(c.title,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600)),
                    trailing: c.builder == null
                        ? null
                        : const Icon(Icons.chevron_right, size: 18),
                    onTap: c.builder == null
                        ? null
                        : () => Navigator.push(context,
                            MaterialPageRoute(builder: c.builder!)),
                  ),
                )),
          ],
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(this.text, this.colour);
  final String text;
  final Color colour;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(text,
            style: TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
                color: colour)),
      );
}

class _Bullet extends StatelessWidget {
  const _Bullet(this.text, this.colour, {this.bold = false});
  final String text;
  final Color colour;
  final bool bold;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 9),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('•  ', style: TextStyle(color: colour)),
          Expanded(
              child: Text(text,
                  style: TextStyle(
                      fontSize: 12.5,
                      height: 1.5,
                      fontWeight: bold ? FontWeight.w500 : FontWeight.w400))),
        ]),
      );
}
