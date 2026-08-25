import 'package:flutter/material.dart';
import '../../data/counselling.dart';
import '../../models/counselling.dart';
import '../../widgets/hub_widgets.dart';
import '../../widgets/reference_note.dart';

class CounsellingHub extends StatelessWidget {
  const CounsellingHub({super.key});

  @override
  Widget build(BuildContext context) {
    return HubScaffold(
      title: 'Counselling',
      subtitle: '${kCounsellingGuides.length} guides',
      intro: 'Clinician-facing checklists with the words to actually say. A '
          'checklist that reads "discuss the risks" is one nobody uses, so '
          'each of these carries phrasing that lands beside the phrasing that '
          'does not.',
      children: [
        ...kCounsellingGuides.map((g) => HubTile(
              title: g.title,
              subtitle: g.setting,
              icon: Icons.record_voice_over_outlined,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CounsellingScreen(guide: g))),
            )),
      ],
    );
  }
}

class CounsellingScreen extends StatelessWidget {
  const CounsellingScreen({super.key, required this.guide});
  final CounsellingGuide guide;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(guide.title),
            Text(guide.setting,
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
          Text('COVER ALL OF THIS',
              style: TextStyle(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: cs.primary)),
          const SizedBox(height: 10),
          ...guide.cover.map((c) => Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(Icons.check_box_outline_blank,
                      size: 15, color: cs.primary),
                  const SizedBox(width: 9),
                  Expanded(
                      child: Text(c,
                          style: const TextStyle(fontSize: 12.5, height: 1.5))),
                ]),
              )),
          const SizedBox(height: 14),
          Text('HOW TO PUT IT',
              style: TextStyle(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: cs.primary)),
          const SizedBox(height: 10),
          ...guide.saferWording.map((w) => _WordingCard(instead: w.$1, say: w.$2)),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFB3261E).withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: const Color(0xFFB3261E).withValues(alpha: 0.4)),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('TELL HER TO COME BACK FOR',
                  style: TextStyle(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: Color(0xFFB3261E))),
              const SizedBox(height: 9),
              ...guide.redFlags.map((r) => Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('•  ',
                              style: TextStyle(color: Color(0xFFB3261E))),
                          Expanded(
                              child: Text(r,
                                  style: const TextStyle(
                                      fontSize: 12.5,
                                      height: 1.45,
                                      fontWeight: FontWeight.w600))),
                        ]),
                  )),
            ]),
          ),
          if (guide.pitfalls.isNotEmpty) ...[
            Card(
              child: Theme(
                data:
                    Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  tilePadding: const EdgeInsets.symmetric(horizontal: 15),
                  childrenPadding: const EdgeInsets.fromLTRB(15, 0, 15, 13),
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  title: const Text('How this conversation goes wrong',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Color(0xFFC2603C))),
                  children: guide.pitfalls
                      .map((p) => Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('•  ',
                                      style:
                                          TextStyle(color: Color(0xFFC2603C))),
                                  Expanded(
                                      child: Text(p,
                                          style: const TextStyle(
                                              fontSize: 12, height: 1.5))),
                                ]),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
          ReferenceNote(sources: guide.sources),
        ],
      ),
    );
  }
}

class _WordingCard extends StatelessWidget {
  const _WordingCard({required this.instead, required this.say});
  final String instead;
  final String say;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.close_rounded, size: 15, color: Color(0xFFB3261E)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(instead,
                style: TextStyle(
                    fontSize: 12,
                    height: 1.45,
                    color: cs.onSurfaceVariant,
                    fontStyle: FontStyle.italic)),
          ),
        ]),
        const SizedBox(height: 8),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.check_rounded, size: 15, color: Color(0xFF1B7F5C)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(say,
                style: const TextStyle(
                    fontSize: 12.5, height: 1.5, fontWeight: FontWeight.w600)),
          ),
        ]),
      ]),
    );
  }
}
