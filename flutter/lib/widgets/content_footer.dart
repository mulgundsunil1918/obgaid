import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/content_meta.dart';
import '../data/content_registry.dart';

/// Governance block shown at the foot of every clinical screen.
///
/// Renders the §62 versioning record and, where §63 applies, states plainly
/// whether a clinician has signed the content off. The specification's rule is
/// that every claim is traceable; this is where that becomes visible to the
/// person acting on it.
class ContentFooter extends StatelessWidget {
  const ContentFooter({super.key, required this.meta});
  final ContentMeta meta;

  static final _fmt = DateFormat('d MMM yyyy');

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (meta.awaitingMandatoryReview)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: const Color(0xFFB8860B).withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(11),
              border: Border.all(
                  color: const Color(0xFFB8860B).withValues(alpha: 0.45)),
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.fact_check_outlined,
                  size: 17, color: Color(0xFF8D6E00)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'This screen is on the mandatory clinical review list and has '
                  'not yet been signed off. Verify every dose and threshold '
                  'against the source before acting on it.',
                  style: TextStyle(
                      fontSize: 11.5,
                      height: 1.5,
                      color: cs.onSurface.withValues(alpha: 0.85)),
                ),
              ),
            ]),
          ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 14),
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: cs.surfaceContainerHighest.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Icon(Icons.verified_outlined,
                  size: 14, color: cs.onSurfaceVariant),
              const SizedBox(width: 6),
              Text('CONTENT RECORD',
                  style: TextStyle(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.7,
                      color: cs.onSurfaceVariant)),
              const Spacer(),
              _StatusChip(meta: meta),
            ]),
            const SizedBox(height: 10),
            _row(context, 'ID', meta.id),
            _row(context, 'Version', meta.version),
            _row(context, 'Evidence', meta.evidence.label),
            _row(context, 'Author', meta.author),
            _row(context, 'Medical reviewer', meta.reviewer ?? 'Not yet reviewed'),
            _row(context, 'Created', _fmt.format(meta.created)),
            if (meta.reviewed != null)
              _row(context, 'Reviewed', _fmt.format(meta.reviewed!)),
            if (meta.nextReview != null)
              _row(
                  context,
                  'Next review',
                  '${_fmt.format(meta.nextReview!)}'
                      '${meta.isReviewOverdue ? '  — overdue' : ''}'),
          ]),
        ),
        RelatedBlock(links: meta.related),
      ],
    );
  }

  Widget _row(BuildContext context, String k, String v) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: 118,
          child: Text(k,
              style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
        ),
        Expanded(
          child: Text(v,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
        ),
      ]),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.meta});
  final ContentMeta meta;

  @override
  Widget build(BuildContext context) {
    final color = switch (meta.status) {
      ContentStatus.published || ContentStatus.approved => const Color(0xFF1B7F5C),
      ContentStatus.underReview => const Color(0xFFB8860B),
      ContentStatus.draft => const Color(0xFF5B6B68),
      _ => const Color(0xFFC2603C),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(meta.status.label.toUpperCase(),
          style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.4,
              color: color)),
    );
  }
}

/// §68 — "every content item should connect to other relevant content".
class RelatedBlock extends StatelessWidget {
  const RelatedBlock({super.key, required this.links});
  final List<Related> links;

  @override
  Widget build(BuildContext context) {
    if (links.isEmpty) return const SizedBox.shrink();
    final cs = Theme.of(context).colorScheme;
    final items = <({ContentLink target, String why})>[
      for (final l in links)
        if (ContentRegistry.resolve(l.id) case final t?) (target: t, why: l.why),
    ];
    if (items.isEmpty) return const SizedBox.shrink();

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 22),
      Text('WHERE THIS LEADS',
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
              color: cs.primary)),
      const SizedBox(height: 10),
      ...items.map((c) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              dense: true,
              onTap: c.target.builder == null
                  ? null
                  : () => Navigator.push(
                      context, MaterialPageRoute(builder: c.target.builder!)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 13, vertical: 2),
              leading: Icon(c.target.icon, size: 19, color: cs.primary),
              title: Text(c.target.title,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600)),
              subtitle: Text(c.why,
                  style: TextStyle(
                      fontSize: 11.5,
                      height: 1.35,
                      color: cs.onSurfaceVariant)),
              trailing: c.target.builder == null
                  ? Text('soon',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: cs.onSurfaceVariant.withValues(alpha: 0.7)))
                  : const Icon(Icons.chevron_right, size: 18),
            ),
          )),
    ]);
  }
}
