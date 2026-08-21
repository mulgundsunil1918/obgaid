import 'package:flutter/material.dart';

/// Every clinical screen names its source and year. This is PediAid's core
/// trust mechanic and ObgAid inherits it: if you can see where a threshold
/// came from, you can verify it before you act on it.
class ReferenceNote extends StatelessWidget {
  const ReferenceNote({super.key, required this.sources, this.caveat});

  final List<String> sources;
  final String? caveat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(Icons.menu_book_outlined,
                size: 15, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(width: 6),
            Text('Source',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                )),
          ]),
          const SizedBox(height: 8),
          ...sources.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text('• $s',
                    style: theme.textTheme.bodySmall?.copyWith(height: 1.45)),
              )),
          if (caveat != null) ...[
            const SizedBox(height: 8),
            Text(caveat!,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.45,
                )),
          ],
        ],
      ),
    );
  }
}
