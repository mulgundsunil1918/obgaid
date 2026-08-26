import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/content_registry.dart';
import '../../models/content_meta.dart';

/// The §63 mandatory-review worklist.
///
/// The specification names eighteen categories of content that cannot be
/// published without a clinician signing them off. This screen is what turns
/// that from a rule in a document into a queue somebody can work through.
class ReviewQueueScreen extends StatelessWidget {
  const ReviewQueueScreen({super.key});

  static final _fmt = DateFormat('d MMM yyyy');

  @override
  Widget build(BuildContext context) {
    final pending = ContentRegistry.awaitingReview;
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Clinical review queue'),
            Text('Content specification §63',
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
          Text(
            'Drug doses, emergency algorithms, PPH, eclampsia, severe '
            'hypertension, sepsis, blood products, anticoagulation, oncology '
            'and fertility dosing, fetal therapy and vaccination schedules all '
            'require a clinician\'s sign-off before publication.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.55),
          ),
          const SizedBox(height: 20),
          if (pending.isEmpty)
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF1B7F5C).withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(children: [
                Icon(Icons.check_circle_outline,
                    color: Color(0xFF1B7F5C), size: 20),
                SizedBox(width: 12),
                Expanded(
                    child: Text('Nothing is awaiting mandatory review.',
                        style: TextStyle(fontSize: 13))),
              ]),
            )
          else ...[
            Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                color: const Color(0xFFB8860B).withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: const Color(0xFFB8860B).withValues(alpha: 0.45)),
              ),
              child: Row(children: [
                const Icon(Icons.fact_check_outlined,
                    size: 19, color: Color(0xFF8D6E00)),
                const SizedBox(width: 11),
                Expanded(
                  child: Text(
                    '${pending.length} item${pending.length == 1 ? '' : 's'} '
                    'awaiting sign-off. Each is held as a draft and carries an '
                    'unreviewed banner until a clinician approves it. They '
                    'must clear review before store launch.',
                    style: TextStyle(
                        fontSize: 12.5,
                        height: 1.45,
                        fontWeight: FontWeight.w600,
                        color: cs.onSurface.withValues(alpha: 0.85)),
                  ),
                ),
              ]),
            ),
            ...pending.map((m) => _ReviewCard(meta: m, fmt: _fmt)),
          ],
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.meta, required this.fmt});
  final ContentMeta meta;
  final DateFormat fmt;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final target = ContentRegistry.resolve(meta.id);
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        onTap: target?.builder == null
            ? null
            : () => Navigator.push(
                context, MaterialPageRoute(builder: target!.builder!)),
        leading: Icon(target?.icon ?? Icons.description_outlined,
            color: const Color(0xFF8D6E00)),
        title: Text(meta.title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(meta.category,
                style: TextStyle(fontSize: 11.5, color: cs.onSurfaceVariant)),
            const SizedBox(height: 3),
            Text(
                '${meta.sourceOrg} · ${meta.evidence.label}'
                '${meta.year != null ? ' · ${meta.year}' : ''}',
                style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
            if (meta.nextReview != null)
              Text('Review due ${fmt.format(meta.nextReview!)}',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: meta.isReviewOverdue
                          ? const Color(0xFFB3261E)
                          : cs.onSurfaceVariant)),
          ]),
        ),
        trailing: target?.builder == null
            ? null
            : const Icon(Icons.chevron_right, size: 20),
      ),
    );
  }
}
