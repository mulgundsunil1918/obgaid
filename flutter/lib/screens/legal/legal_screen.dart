import 'package:flutter/material.dart';
import '../../widgets/reference_note.dart';

class LegalSection {
  const LegalSection(this.heading, this.points, {this.warn = false});
  final String heading;
  final List<String> points;
  final bool warn;
}

/// Statutory reference screens.
///
/// Legal text is quoted rather than paraphrased into advice, and every screen
/// carries a verify-the-current-amendment banner. This content is the strongest
/// reason an Indian clinician installs ObgAid and also its largest liability —
/// it is a pointer to the statute, never a substitute for reading it.
class LegalScreen extends StatelessWidget {
  const LegalScreen({
    super.key,
    required this.title,
    required this.act,
    required this.sections,
    required this.sources,
  });

  final String title;
  final String act;
  final List<LegalSection> sections;
  final List<String> sources;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            Text(act,
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
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFB3261E).withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: const Color(0xFFB3261E).withValues(alpha: 0.4)),
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.gavel_outlined,
                  size: 18, color: Color(0xFFB3261E)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'This is a summary for clinical reference, not legal advice. '
                  'Acts are amended and rules are notified without warning — '
                  'verify the currently in-force text and your State rules '
                  'before relying on any point below.',
                  style: TextStyle(
                      fontSize: 12,
                      height: 1.5,
                      color: cs.onSurface.withValues(alpha: 0.85)),
                ),
              ),
            ]),
          ),
          ...sections.map((s) => _SectionBlock(section: s)),
          ReferenceNote(sources: sources),
        ],
      ),
    );
  }
}

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({required this.section});
  final LegalSection section;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final accent = section.warn ? const Color(0xFFB3261E) : cs.primary;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: accent, width: 3)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(section.heading,
            style: TextStyle(
                fontSize: 13.5, fontWeight: FontWeight.w800, color: accent)),
        const SizedBox(height: 10),
        ...section.points.map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('•  ', style: TextStyle(color: accent, height: 1.5)),
                Expanded(
                    child: Text(p,
                        style: const TextStyle(fontSize: 12.5, height: 1.55))),
              ]),
            )),
      ]),
    );
  }
}
