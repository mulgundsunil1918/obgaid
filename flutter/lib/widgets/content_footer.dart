import 'package:flutter/material.dart';
import '../models/content_meta.dart';
import '../data/content_registry.dart';

/// Foot of every clinical screen.
///
/// The §62 versioning record is held on [ContentMeta] and enforced by the
/// governance tests, but it is deliberately NOT rendered — IDs, versions and
/// review dates are governance metadata, and putting them under every
/// clinical screen is clutter at the point of care. What remains visible is
/// the part a clinician needs: an unreviewed warning where §63 applies, and
/// the links to where this leads.
class ContentFooter extends StatelessWidget {
  const ContentFooter({super.key, required this.meta});
  final ContentMeta meta;

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
        RelatedBlock(links: meta.related),
      ],
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
