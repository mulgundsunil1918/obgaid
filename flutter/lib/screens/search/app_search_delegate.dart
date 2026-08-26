import 'package:flutter/material.dart';
import '../../data/search_index.dart';

/// Global search across every node in the content graph.
///
/// Grouped by content category, ranked so a title match beats a category
/// match. Common abbreviations resolve — LSCS finds caesarean, PPROM finds
/// the algorithm, DIPSI finds gestational diabetes.
class AppSearchDelegate extends SearchDelegate<void> {
  @override
  String get searchFieldLabel =>
      'Search algorithms, drugs, scores, topics, trials…';

  @override
  List<Widget> buildActions(BuildContext context) => [
        if (query.isNotEmpty)
          IconButton(
              icon: const Icon(Icons.clear), onPressed: () => query = ''),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => _results(context);

  @override
  Widget buildSuggestions(BuildContext context) => _results(context);

  Widget _results(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    if (query.trim().isEmpty) {
      return _Hints(cs: cs, onTap: (q) => query = q);
    }

    final grouped = SearchIndex.grouped(query);
    if (grouped.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search_off,
                  size: 36, color: cs.onSurface.withValues(alpha: 0.3)),
              const SizedBox(height: 12),
              Text('Nothing matches "$query".',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(
                'Try a shorter word, or an abbreviation such as PPH, PPROM, '
                'GDM or LSCS.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12.5,
                    height: 1.45,
                    color: cs.onSurface.withValues(alpha: 0.6)),
              ),
            ],
          ),
        ),
      );
    }

    final total = grouped.values.fold<int>(0, (a, b) => a + b.length);

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 2),
          child: Text(
            '$total result${total == 1 ? '' : 's'}',
            style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: cs.onSurface.withValues(alpha: 0.55)),
          ),
        ),
        for (final entry in grouped.entries) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
            child: Text(
              entry.key.toUpperCase(),
              style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: cs.primary),
            ),
          ),
          for (final hit in entry.value)
            ListTile(
              dense: true,
              leading: Icon(hit.link.icon, size: 21, color: cs.primary),
              title: Text(hit.link.title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600)),
              trailing: const Icon(Icons.chevron_right, size: 18),
              onTap: () {
                close(context, null);
                Navigator.push(context,
                    MaterialPageRoute(builder: hit.link.builder!));
              },
            ),
        ],
        const SizedBox(height: 32),
      ],
    );
  }
}

/// Shown before anything is typed. Suggests the searches people actually
/// make rather than leaving an empty screen.
class _Hints extends StatelessWidget {
  const _Hints({required this.cs, required this.onTap});
  final ColorScheme cs;
  final ValueChanged<String> onTap;

  static const _common = [
    'PPH',
    'MgSO4',
    'Bishop',
    'PPROM',
    'GDM',
    'Ectopic',
    'VBAC',
    'PCOS',
    'Anti-D',
    'Sepsis',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 16),
      children: [
        Text('COMMON SEARCHES',
            style: TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
                color: cs.primary)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final q in _common)
              ActionChip(
                label: Text(q, style: const TextStyle(fontSize: 12.5)),
                onPressed: () => onTap(q),
              ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Searches every algorithm, calculator, score, drug, topic, '
          'procedure, counselling guide, trial, table and statute in the app.',
          style: TextStyle(
              fontSize: 12.5,
              height: 1.5,
              color: cs.onSurface.withValues(alpha: 0.6)),
        ),
      ],
    );
  }
}
