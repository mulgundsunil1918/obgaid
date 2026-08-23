import 'package:flutter/material.dart';
import '../../data/quick_tables.dart';
import '../../models/quick_table.dart';
import '../../widgets/reference_note.dart';

class QuickTablesScreen extends StatefulWidget {
  const QuickTablesScreen({super.key});
  @override
  State<QuickTablesScreen> createState() => _QuickTablesScreenState();
}

class _QuickTablesScreenState extends State<QuickTablesScreen> {
  final _query = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final q = _query.text.trim();
    final matching = kQuickTables.where((t) => t.matches(q)).toList();

    final byGroup = <QuickTableGroup, List<QuickTable>>{};
    for (final t in matching) {
      byGroup.putIfAbsent(t.group, () => []).add(t);
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Quick reference'),
            Text('${kQuickTables.length} tables',
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
          TextField(
            controller: _query,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Search every cell — "fibrinogen", "aspirin", "1.5 MoM"',
              prefixIcon: const Icon(Icons.search, size: 20),
              suffixIcon: q.isEmpty
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.clear, size: 18),
                      onPressed: () => setState(() => _query.clear()),
                    ),
            ),
          ),
          const SizedBox(height: 18),
          if (matching.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text('Nothing matches "$q".',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
            )
          else
            for (final entry in byGroup.entries) ...[
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 10),
                child: Text(entry.key.label.toUpperCase(),
                    style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                        color: cs.primary)),
              ),
              ...entry.value
                  .map((t) => _TableCard(table: t, expanded: q.isNotEmpty)),
            ],
          const ReferenceNote(
            sources: ['Each table names its own sources.'],
            caveat: 'These are lookup tables, not a substitute for the full '
                'reference. Where a number here matters to a decision, open '
                'the topic behind it.',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }
}

class _TableCard extends StatelessWidget {
  const _TableCard({required this.table, this.expanded = false});
  final QuickTable table;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: expanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(table.title,
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(table.subtitle,
                style: TextStyle(fontSize: 11.5, color: cs.onSurfaceVariant)),
          ),
          children: [
            // Wide tables scroll inside their own box rather than forcing the
            // page to scroll sideways.
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width - 60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _row(context, table.columns, header: true),
                    ...table.rows.map((r) => _row(context, r)),
                  ],
                ),
              ),
            ),
            if (table.note != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFB8860B).withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color(0xFFB8860B).withValues(alpha: 0.4)),
                ),
                child: Text(table.note!,
                    style: const TextStyle(fontSize: 11.5, height: 1.5)),
              ),
            ],
            const SizedBox(height: 10),
            ...table.sources.map((s) => Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Text('· $s',
                      style: TextStyle(
                          fontSize: 10,
                          height: 1.4,
                          fontStyle: FontStyle.italic,
                          color: cs.onSurfaceVariant)),
                )),
          ],
        ),
      ),
    );
  }

  Widget _row(BuildContext context, List<String> cells, {bool header = false}) {
    final cs = Theme.of(context).colorScheme;
    final flexes = cells.length == 2
        ? [4, 7]
        : cells.length == 3
            ? [4, 4, 5]
            : List.filled(cells.length, 1);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: header
            ? cs.surfaceContainerHighest.withValues(alpha: 0.5)
            : null,
        border: Border(
          bottom: BorderSide(
              color: cs.outlineVariant.withValues(alpha: 0.4), width: 0.6),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < cells.length; i++)
            Expanded(
              flex: flexes[i],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(cells[i],
                    style: TextStyle(
                      fontSize: header ? 10.5 : 11.5,
                      height: 1.45,
                      fontWeight: header
                          ? FontWeight.w800
                          : (i == 0 ? FontWeight.w700 : FontWeight.w400),
                      letterSpacing: header ? 0.5 : 0,
                      color: header ? cs.onSurfaceVariant : null,
                    )),
              ),
            ),
        ],
      ),
    );
  }
}
