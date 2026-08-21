import 'package:flutter/material.dart';
import '../../data/lab_reference.dart';
import '../../models/reference_data.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

class LabReferenceScreen extends StatelessWidget {
  const LabReferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Laboratory reference'),
            Text('Trimester-specific ranges',
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
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 18),
            decoration: BoxDecoration(
              color: cs.primaryContainer.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Reading a pregnant woman\'s result against a non-pregnant range '
              'is the error this screen exists to prevent. Alkaline phosphatase '
              'trebles and means nothing; ALT falls and a "normal" 40 is '
              'abnormal; fibrinogen rises, so 2.5 g/L in a bleeding woman is '
              'dangerously low.',
              style: TextStyle(fontSize: 12.5, height: 1.55),
            ),
          ),
          ...kLabPanels.map((p) => _PanelTile(panel: p)),
          const ReferenceNote(
            sources: [
              'Abbassi-Ghanavati M, Greer LG, Cunningham FG. Pregnancy and '
                  'laboratory studies: a reference table for clinicians. '
                  'Obstet Gynecol 2009;114:1326–1331.',
              'American Thyroid Association Guidelines for Thyroid Disease '
                  'During Pregnancy and the Postpartum.',
              'RCOG Green-top Guideline 43 — Obstetric Cholestasis.',
              'WHO haemoglobin thresholds for anaemia.',
            ],
            caveat: 'Reference intervals vary between laboratories and '
                'assays. Where your laboratory publishes pregnancy-specific '
                'ranges, use those. These are a guide for interpretation, not '
                'a substitute for the local range.',
          ),
          ContentFooter(meta: ContentRegistry.metaFor('lab-reference')!),
        ],
      ),
    );
  }
}

class _PanelTile extends StatelessWidget {
  const _PanelTile({required this.panel});
  final LabPanel panel;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: panel.name == 'Coagulation',
          tilePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(panel.name,
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text('${panel.analytes.length} analytes',
                style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
          ),
          children: panel.analytes.map((a) => _AnalyteBlock(a: a)).toList(),
        ),
      ),
    );
  }
}

class _AnalyteBlock extends StatelessWidget {
  const _AnalyteBlock({required this.a});
  final LabAnalyte a;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final arrow = switch (a.direction) {
      LabDirection.rises => '↑',
      LabDirection.falls => '↓',
      LabDirection.unchanged => '–',
    };
    final arrowColour = switch (a.direction) {
      LabDirection.rises => const Color(0xFFC2603C),
      LabDirection.falls => const Color(0xFF1565C0),
      LabDirection.unchanged => cs.onSurfaceVariant,
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(
            child: Text('${a.name}  (${a.unit})',
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w700)),
          ),
          Text(arrow,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: arrowColour)),
        ]),
        const SizedBox(height: 8),
        _row(context, 'Non-pregnant', a.nonPregnant, muted: true),
        _row(context, 'First trimester', a.first),
        _row(context, 'Second trimester', a.second),
        _row(context, 'Third trimester', a.third),
        if (a.note != null) ...[
          const SizedBox(height: 8),
          Text(a.note!,
              style: TextStyle(
                  fontSize: 11.5,
                  height: 1.5,
                  color: cs.onSurfaceVariant,
                  fontStyle: FontStyle.italic)),
        ],
      ]),
    );
  }

  Widget _row(BuildContext context, String label, String value,
      {bool muted = false}) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(children: [
        SizedBox(
          width: 118,
          child: Text(label,
              style: TextStyle(
                  fontSize: 11,
                  color: muted
                      ? cs.onSurfaceVariant.withValues(alpha: 0.7)
                      : cs.onSurfaceVariant)),
        ),
        Expanded(
          child: Text(value,
              style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: muted ? FontWeight.w400 : FontWeight.w700,
                  color: muted
                      ? cs.onSurfaceVariant.withValues(alpha: 0.8)
                      : null)),
        ),
      ]),
    );
  }
}
