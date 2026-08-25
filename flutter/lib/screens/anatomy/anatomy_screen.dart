import 'package:flutter/material.dart';
import '../../data/anatomy.dart';
import '../../models/anatomy.dart';
import '../../widgets/hub_widgets.dart';
import '../../widgets/reference_note.dart';

class AnatomyHub extends StatelessWidget {
  const AnatomyHub({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final byRegion = <AnatomyRegion, List<AnatomyEntry>>{};
    for (final a in kAnatomy) {
      byRegion.putIfAbsent(a.region, () => []).add(a);
    }

    return HubScaffold(
      title: 'Surgical anatomy',
      subtitle: 'Before you scrub',
      intro: 'Two minutes at the sink, not a textbook chapter. Each entry '
          'leads with the danger points — where the structure actually gets '
          'injured, and the habit that prevents it.',
      children: [
        for (final entry in byRegion.entries) ...[
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 10),
            child: Text(entry.key.label.toUpperCase(),
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                    color: cs.primary)),
          ),
          ...entry.value.map((a) => HubTile(
                title: a.name,
                subtitle: a.subtitle,
                icon: Icons.account_tree_outlined,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AnatomyScreen(entry: a))),
              )),
        ],
      ],
    );
  }
}

class AnatomyScreen extends StatelessWidget {
  const AnatomyScreen({super.key, required this.entry});
  final AnatomyEntry entry;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    const danger = Color(0xFFB3261E);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(entry.name),
            Text(entry.subtitle,
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
          // The one thing to carry in.
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: cs.primaryContainer.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(entry.headline,
                style: const TextStyle(
                    fontSize: 13, height: 1.55, fontWeight: FontWeight.w600)),
          ),

          if (entry.numbers.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
              margin: const EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NUMBERS',
                        style: TextStyle(
                            fontSize: 9.5,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.8,
                            color: cs.onSurfaceVariant)),
                    const SizedBox(height: 9),
                    ...entry.numbers.map((n) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Text(n.$1,
                                      style: TextStyle(
                                          fontSize: 11.5,
                                          height: 1.4,
                                          color: cs.onSurfaceVariant)),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(n.$2,
                                      style: const TextStyle(
                                          fontSize: 11.5,
                                          height: 1.4,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ]),
                        )),
                  ]),
            ),
          ],

          // Dangers lead — this is the reason the screen exists.
          const Text('WHERE IT GETS INJURED',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.9,
                  color: danger)),
          const SizedBox(height: 11),
          ...entry.dangers.map((d) => _DangerCard(d: d)),

          const SizedBox(height: 8),
          _Block('Course and relations', entry.course, cs.primary),
          _Block('How to identify it', entry.identification,
              const Color(0xFF1B7F5C), expanded: true),
          if (entry.ifInjured.isNotEmpty)
            _Block('If it is already injured', entry.ifInjured, danger),

          ReferenceNote(
            sources: entry.sources,
            caveat: 'Anatomy is variable, and it is more variable in the '
                'pelvis you are about to open than in the textbook. Identify '
                'structures in the field rather than assuming them from a '
                'diagram.',
          ),
        ],
      ),
    );
  }
}

class _DangerCard extends StatelessWidget {
  const _DangerCard({required this.d});
  final AnatomyDanger d;

  @override
  Widget build(BuildContext context) {
    const danger = Color(0xFFB3261E);
    const good = Color(0xFF1B7F5C);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: danger.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: danger.withValues(alpha: 0.35)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.warning_amber_rounded, size: 16, color: danger),
          const SizedBox(width: 8),
          Expanded(
            child: Text(d.site,
                style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    color: danger)),
          ),
        ]),
        const SizedBox(height: 8),
        Text(d.risk, style: const TextStyle(fontSize: 12, height: 1.5)),
        const SizedBox(height: 9),
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.check_circle_outline, size: 15, color: good),
          const SizedBox(width: 8),
          Expanded(
            child: Text(d.avoid,
                style: const TextStyle(
                    fontSize: 12, height: 1.5, fontWeight: FontWeight.w600)),
          ),
        ]),
      ]),
    );
  }
}

class _Block extends StatelessWidget {
  const _Block(this.title, this.items, this.accent, {this.expanded = false});
  final String title;
  final List<String> items;
  final Color accent;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 9),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: expanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 15),
          childrenPadding: const EdgeInsets.fromLTRB(15, 0, 15, 13),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 13, color: accent)),
          children: items
              .map((i) => Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('•  ', style: TextStyle(color: accent)),
                          Expanded(
                              child: Text(i,
                                  style: const TextStyle(
                                      fontSize: 12, height: 1.5))),
                        ]),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
