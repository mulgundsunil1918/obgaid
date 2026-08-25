import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/cme_entry.dart';
import '../../services/cme_store.dart';
import '../../widgets/reference_note.dart';

class CmeHub extends StatefulWidget {
  const CmeHub({super.key});
  @override
  State<CmeHub> createState() => _CmeHubState();
}

class _CmeHubState extends State<CmeHub> {
  List<CmeEntry> _entries = [];
  bool _loading = true;
  static final _fmt = DateFormat('d MMM yyyy');

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final e = await CmeStore.load();
    if (mounted) setState(() { _entries = e; _loading = false; });
  }

  Future<void> _addEntry() async {
    final entry = await showModalBottomSheet<CmeEntry>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _AddCmeSheet(),
    );
    if (entry != null) {
      final updated = await CmeStore.add(entry);
      if (mounted) setState(() => _entries = updated);
    }
  }

  Future<void> _delete(CmeEntry e) async {
    final updated = await CmeStore.remove(e.id);
    if (mounted) setState(() => _entries = updated);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final fiveYear = CmeStore.creditsInWindow(_entries, 5);
    final oneYear = CmeStore.creditsInWindow(_entries, 1);

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('CME'),
            Text('Credit log & accreditation',
                style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addEntry,
        icon: const Icon(Icons.add),
        label: const Text('Log activity'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
              children: [
                Row(children: [
                  Expanded(
                      child: _CreditCard(
                          label: 'Last 5 years',
                          value: fiveYear,
                          highlight: true)),
                  const SizedBox(width: 12),
                  Expanded(
                      child:
                          _CreditCard(label: 'Last 12 months', value: oneYear)),
                ]),
                const SizedBox(height: 20),
                Text('YOUR LOG',
                    style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                        color: cs.primary)),
                const SizedBox(height: 10),
                if (_entries.isEmpty)
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest.withValues(alpha: 0.45),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Nothing logged yet. Add a conference, workshop, webinar '
                      'or journal club as you attend it — the record is far '
                      'easier to keep than to reconstruct five years later.',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(height: 1.5),
                    ),
                  )
                else
                  ..._entries.map((e) => _EntryCard(
                      entry: e, fmt: _fmt, onDelete: () => _delete(e))),
                const SizedBox(height: 24),
                Text('ACCREDITATION',
                    style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                        color: cs.primary)),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: cs.primaryContainer.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'In India, continuing medical education requirements for '
                    'renewal of registration are set by each STATE Medical '
                    'Council, not centrally, and they differ — in the number '
                    'of credit hours, the period over which they are counted, '
                    'and which activities are recognised. Check the '
                    'requirement with your own council rather than assuming a '
                    'national figure.',
                    style: TextStyle(fontSize: 12.5, height: 1.55),
                  ),
                ),
                const SizedBox(height: 12),
                const _Point('Keep the certificate for every activity. Most '
                    'councils require documentary proof, not a self-declared '
                    'list.'),
                const _Point('Credits are usually awarded by the accrediting '
                    'body named on the certificate — record which body, not '
                    'just the organiser.'),
                const _Point('Activities delivered as well as attended often '
                    'count. Teaching, examining and publishing may be '
                    'creditable.'),
                const _Point('FOGSI and its member societies, and the '
                    'specialty associations, are the usual accrediting routes '
                    'for OBG activities in India.'),
                const ReferenceNote(
                  sources: [
                    'National Medical Commission — Registered Medical '
                        'Practitioner (Professional Conduct) Regulations and '
                        'guidance on continuing professional development.',
                    'State Medical Council re-registration requirements — '
                        'these vary by state and are the operative '
                        'requirement.',
                    'FOGSI — accreditation of continuing medical education '
                        'activities.',
                  ],
                  caveat: 'Requirements change and differ between states. '
                      'This log is a personal record; it is not a submission '
                      'to any council and does not itself satisfy any '
                      'requirement.',
                ),
              ],
            ),
    );
  }
}

class _CreditCard extends StatelessWidget {
  const _CreditCard(
      {required this.label, required this.value, this.highlight = false});
  final String label;
  final double value;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: highlight
            ? cs.primary.withValues(alpha: 0.10)
            : cs.surfaceContainerHighest.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(12),
        border: highlight
            ? Border.all(color: cs.primary.withValues(alpha: 0.35))
            : null,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label.toUpperCase(),
            style: TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.7,
                color: cs.onSurfaceVariant)),
        const SizedBox(height: 6),
        Text(
            value == value.roundToDouble()
                ? '${value.toInt()}'
                : value.toStringAsFixed(1),
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: highlight ? cs.primary : cs.onSurface)),
        Text('credit hours',
            style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
      ]),
    );
  }
}

class _EntryCard extends StatelessWidget {
  const _EntryCard(
      {required this.entry, required this.fmt, required this.onDelete});
  final CmeEntry entry;
  final DateFormat fmt;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 9),
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(14, 6, 6, 6),
        title: Text(entry.title,
            style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('${entry.organiser} · ${fmt.format(entry.date)}',
                style: TextStyle(fontSize: 11.5, color: cs.onSurfaceVariant)),
            Text(
                '${entry.type.label} · ${entry.credits} credits'
                '${entry.accreditingBody != null ? ' · ${entry.accreditingBody}' : ''}',
                style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
            if (!entry.certificateHeld)
              const Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text('No certificate recorded',
                    style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFB8860B))),
              ),
          ]),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, size: 20),
          onPressed: onDelete,
          tooltip: 'Remove',
        ),
      ),
    );
  }
}

class _AddCmeSheet extends StatefulWidget {
  const _AddCmeSheet();
  @override
  State<_AddCmeSheet> createState() => _AddCmeSheetState();
}

class _AddCmeSheetState extends State<_AddCmeSheet> {
  final _title = TextEditingController();
  final _organiser = TextEditingController();
  final _credits = TextEditingController();
  final _body = TextEditingController();
  CmeType _type = CmeType.conference;
  DateTime _date = DateTime.now();
  bool _certificate = false;

  @override
  Widget build(BuildContext context) {
    final valid = _title.text.trim().isNotEmpty &&
        double.tryParse(_credits.text.trim()) != null;
    return Padding(
      padding: EdgeInsets.only(
          left: 18,
          right: 18,
          top: 18,
          bottom: MediaQuery.of(context).viewInsets.bottom + 18),
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text('Log a CME activity',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
          const SizedBox(height: 16),
          TextField(
            controller: _title,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(labelText: 'Title of activity'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _organiser,
            decoration: const InputDecoration(
                labelText: 'Organiser', hintText: 'e.g. local FOGSI society'),
          ),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(
              child: TextField(
                controller: _credits,
                onChanged: (_) => setState(() {}),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Credit hours'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _date,
                    firstDate: DateTime(DateTime.now().year - 10),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) setState(() => _date = picked);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Date'),
                  child: Text(DateFormat('d MMM yyyy').format(_date),
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 12),
          TextField(
            controller: _body,
            decoration: const InputDecoration(
                labelText: 'Accrediting body (optional)'),
          ),
          const SizedBox(height: 14),
          DropdownButtonFormField<CmeType>(
            initialValue: _type,
            decoration: const InputDecoration(labelText: 'Type'),
            items: CmeType.values
                .map((t) => DropdownMenuItem(value: t, child: Text(t.label)))
                .toList(),
            onChanged: (v) => setState(() => _type = v ?? CmeType.conference),
          ),
          CheckboxListTile(
            value: _certificate,
            onChanged: (v) => setState(() => _certificate = v ?? false),
            title: const Text('Certificate held'),
            subtitle: const Text('Most councils require documentary proof'),
            dense: true,
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: valid
                  ? () => Navigator.pop(
                        context,
                        CmeEntry(
                          id: '${_date.millisecondsSinceEpoch}-'
                              '${_title.text.hashCode}',
                          title: _title.text.trim(),
                          organiser: _organiser.text.trim(),
                          date: _date,
                          credits: double.parse(_credits.text.trim()),
                          type: _type,
                          accreditingBody: _body.text.trim().isEmpty
                              ? null
                              : _body.text.trim(),
                          certificateHeld: _certificate,
                        ),
                      )
                  : null,
              child: const Text('Save'),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    for (final c in [_title, _organiser, _credits, _body]) {
      c.dispose();
    }
    super.dispose();
  }
}

class _Point extends StatelessWidget {
  const _Point(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('•  ',
              style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          Expanded(
              child: Text(text,
                  style: const TextStyle(fontSize: 12, height: 1.5))),
        ]),
      );
}
