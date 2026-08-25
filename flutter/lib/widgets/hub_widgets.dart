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
    required this.onTap,
    this.badge,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: cs.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(icon, size: 20, color: cs.primary),
        ),
        title: Row(children: [
          Flexible(
            child: Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 14)),
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
        trailing: const Icon(Icons.chevron_right, size: 20),
      ),
    );
  }
}
