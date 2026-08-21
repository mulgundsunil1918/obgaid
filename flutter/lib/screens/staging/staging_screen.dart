import 'package:flutter/material.dart';
import '../../models/staging.dart';
import '../../widgets/reference_note.dart';

class StagingScreen extends StatelessWidget {
  const StagingScreen({super.key, required this.system});
  final StagingSystem system;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(system.name),
            Text(system.edition,
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
          if (system.keyChange != null)
            Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFFC107)),
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Icon(Icons.new_releases_outlined,
                    size: 18, color: Color(0xFF8D6E00)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('WHAT CHANGED',
                            style: TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.7,
                                color: Color(0xFF8D6E00))),
                        const SizedBox(height: 5),
                        Text(system.keyChange!,
                            style: const TextStyle(
                                fontSize: 12.5,
                                height: 1.5,
                                color: Color(0xFF4A3B00))),
                      ]),
                ),
              ]),
            ),
          ...system.stages.map((s) => _StageTile(entry: s, depth: 0)),
          if (system.note != null) ...[
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: cs.primaryContainer.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(system.note!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(height: 1.5)),
            ),
          ],
          ReferenceNote(
            sources: system.sources,
            caveat: 'Staging is assigned once, at diagnosis, and is not '
                'changed by later findings or by response to treatment.',
          ),
        ],
      ),
    );
  }
}

class _StageTile extends StatelessWidget {
  const _StageTile({required this.entry, required this.depth});
  final StageEntry entry;
  final int depth;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isTop = depth == 0;

    final header = Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.only(top: 1),
        padding: EdgeInsets.symmetric(
            horizontal: isTop ? 10 : 8, vertical: isTop ? 5 : 3),
        decoration: BoxDecoration(
          color: isTop
              ? cs.primary
              : cs.primary.withValues(alpha: depth == 1 ? 0.16 : 0.09),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(entry.code,
            style: TextStyle(
              color: isTop ? Colors.white : cs.primary,
              fontWeight: FontWeight.w800,
              fontSize: isTop ? 13 : 11.5,
            )),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Text(entry.text,
            style: TextStyle(
              fontSize: isTop ? 13.5 : 12.5,
              height: 1.5,
              fontWeight: isTop ? FontWeight.w600 : FontWeight.w400,
            )),
      ),
    ]);

    if (entry.children.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(left: depth * 12.0, bottom: 12),
        child: header,
      );
    }

    return Padding(
      padding: EdgeInsets.only(left: depth * 12.0, bottom: isTop ? 8 : 4),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isTop,
          tilePadding: EdgeInsets.zero,
          childrenPadding: const EdgeInsets.only(left: 4, bottom: 8),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: header,
          children:
              entry.children.map((c) => _StageTile(entry: c, depth: depth + 1)).toList(),
        ),
      ),
    );
  }
}
