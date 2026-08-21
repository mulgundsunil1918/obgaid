import 'package:flutter/material.dart';

/// Standard hub page: title, optional intro, a list of tiles.
class HubScaffold extends StatelessWidget {
  const HubScaffold({
    super.key,
    required this.title,
    required this.children,
    this.subtitle,
    this.intro,
  });

  final String title;
  final String? subtitle;
  final String? intro;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            if (subtitle != null)
              Text(subtitle!,
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
          if (intro != null) ...[
            Text(intro!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(height: 1.5)),
            const SizedBox(height: 18),
          ],
          ...children,
        ],
      ),
    );
  }
}

class HubTile extends StatelessWidget {
  const HubTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
    this.badge,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final enabled = onTap != null;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: cs.primary.withValues(alpha: enabled ? 0.12 : 0.06),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(icon,
              size: 20,
              color: enabled
                  ? cs.primary
                  : cs.onSurfaceVariant.withValues(alpha: 0.5)),
        ),
        title: Row(children: [
          Flexible(
            child: Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: enabled ? null : cs.onSurfaceVariant,
                )),
          ),
          if (badge != null) ...[
            const SizedBox(width: 8),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: badge == 'India'
                    ? const Color(0xFFFF9933).withValues(alpha: 0.18)
                    : cs.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(badge!,
                  style: TextStyle(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.3,
                      color: badge == 'India'
                          ? const Color(0xFF9A5000)
                          : cs.onSurfaceVariant)),
            ),
          ],
        ]),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(subtitle,
              style: TextStyle(fontSize: 12, height: 1.35, color: cs.onSurfaceVariant)),
        ),
        trailing: enabled
            ? const Icon(Icons.chevron_right, size: 20)
            : Text('Phase ${_phaseOf(subtitle)}',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: cs.onSurfaceVariant.withValues(alpha: 0.7))),
      ),
    );
  }

  static String _phaseOf(String s) {
    final m = RegExp(r'Phase (\d)').firstMatch(s);
    return m?.group(1) ?? '·';
  }
}

/// Honest placeholder. Says what is coming and when, rather than pretending
/// the screen is broken.
class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key, required this.phase, required this.items});
  final String phase;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.construction_outlined, size: 16, color: cs.primary),
          const SizedBox(width: 8),
          Text('PLANNED — $phase',
              style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.7,
                  color: cs.primary)),
        ]),
        const SizedBox(height: 12),
        ...items.map((i) => Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('•  ',
                    style: TextStyle(color: cs.onSurfaceVariant, height: 1.45)),
                Expanded(
                  child: Text(i,
                      style: TextStyle(
                          fontSize: 12.5,
                          height: 1.45,
                          color: cs.onSurfaceVariant)),
                ),
              ]),
            )),
      ]),
    );
  }
}
