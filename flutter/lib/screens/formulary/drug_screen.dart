import 'package:flutter/material.dart';
import '../../models/drug.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

class DrugScreen extends StatelessWidget {
  const DrugScreen({super.key, required this.drug});
  final Drug drug;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final meta = ContentRegistry.metaFor('formulary');

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(drug.generic),
            Text(drug.drugClass,
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
          if (drug.brandNames.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: drug.brandNames
                    .map((b) => Chip(
                          label: Text(b, style: const TextStyle(fontSize: 11)),
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ))
                    .toList(),
              ),
            ),
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 18),
            decoration: BoxDecoration(
              color: cs.primaryContainer.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(drug.mechanism,
                style: const TextStyle(fontSize: 12.5, height: 1.55)),
          ),

          // Doses lead — it is what the screen is opened for.
          Text('DOSING',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: cs.primary)),
          const SizedBox(height: 10),
          ...drug.doses.map((d) => _DoseCard(dose: d)),

          const SizedBox(height: 8),
          _SafetyCard(
              title: 'In pregnancy',
              icon: Icons.pregnant_woman_outlined,
              safety: drug.pregnancy),
          _SafetyCard(
              title: 'In lactation',
              icon: Icons.water_drop_outlined,
              safety: drug.lactation),

          if (drug.antidote != null)
            _Callout(
              title: 'ANTIDOTE',
              body: drug.antidote!,
              colour: const Color(0xFF1B7F5C),
              icon: Icons.medical_services_outlined,
            ),
          if (drug.contraindications.isNotEmpty)
            _ListSection('Contraindications', drug.contraindications,
                danger: true),
          if (drug.warnings.isNotEmpty)
            _ListSection('Warnings', drug.warnings, danger: true),
          if (drug.indications.isNotEmpty)
            _ListSection('Indications', drug.indications),
          if (drug.preparation != null)
            _TextSection('Preparation', drug.preparation!),
          if (drug.dilution != null) _TextSection('Dilution', drug.dilution!),
          if (drug.administrationRate != null)
            _TextSection('Administration rate', drug.administrationRate!),
          if (drug.doseAdjustments.isNotEmpty)
            _ListSection('Dose adjustments', drug.doseAdjustments),
          if (drug.adverseEffects.isNotEmpty)
            _ListSection('Adverse effects', drug.adverseEffects),
          if (drug.interactions.isNotEmpty)
            _ListSection('Interactions', drug.interactions),
          if (drug.monitoring.isNotEmpty)
            _ListSection('Monitoring', drug.monitoring),
          if (drug.overdose != null) _TextSection('Overdose', drug.overdose!),
          if (drug.fertility != null)
            _TextSection('Fertility considerations', drug.fertility!),
          if (drug.perioperative != null)
            _TextSection('Perioperative', drug.perioperative!),

          ReferenceNote(
            sources: drug.references,
            caveat: 'Doses are for adults in obstetric and gynaecological use '
                'and assume normal renal and hepatic function unless stated. '
                'Check against your unit formulary and the product literature '
                'before prescribing.',
          ),
          if (meta != null) ContentFooter(meta: meta),
        ],
      ),
    );
  }
}

class _DoseCard extends StatelessWidget {
  const _DoseCard({required this.dose});
  final DrugDose dose;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: cs.primary, width: 3)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(dose.indication,
            style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.3,
                color: cs.primary)),
        const SizedBox(height: 7),
        Text(dose.dose,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w700, height: 1.4)),
        const SizedBox(height: 6),
        if (dose.route != null) _kv(context, 'Route', dose.route!),
        if (dose.frequency != null) _kv(context, 'Frequency', dose.frequency!),
        if (dose.max != null) _kv(context, 'Maximum', dose.max!),
        if (dose.notes != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(dose.notes!,
                style: TextStyle(
                    fontSize: 11.5,
                    height: 1.45,
                    color: cs.onSurfaceVariant)),
          ),
      ]),
    );
  }

  Widget _kv(BuildContext context, String k, String v) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            width: 76,
            child: Text(k,
                style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant))),
        Expanded(
            child: Text(v,
                style: const TextStyle(
                    fontSize: 11.5, height: 1.4, fontWeight: FontWeight.w600))),
      ]),
    );
  }
}

class _SafetyCard extends StatelessWidget {
  const _SafetyCard(
      {required this.title, required this.icon, required this.safety});
  final String title;
  final IconData icon;
  final DrugSafety safety;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(icon, size: 15, color: cs.onSurfaceVariant),
          const SizedBox(width: 7),
          Text(title.toUpperCase(),
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                  color: cs.onSurfaceVariant)),
        ]),
        const SizedBox(height: 8),
        Text(safety.summary,
            style: const TextStyle(
                fontSize: 12.5, height: 1.5, fontWeight: FontWeight.w600)),
        if (safety.points.isNotEmpty) ...[
          const SizedBox(height: 8),
          ...safety.points.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('•  ', style: TextStyle(color: cs.primary)),
                  Expanded(
                      child: Text(p,
                          style: const TextStyle(fontSize: 11.5, height: 1.45))),
                ]),
              )),
        ],
        if (safety.source != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(safety.source!,
                style: TextStyle(
                    fontSize: 10.5,
                    fontStyle: FontStyle.italic,
                    color: cs.onSurfaceVariant)),
          ),
      ]),
    );
  }
}

class _Callout extends StatelessWidget {
  const _Callout(
      {required this.title,
      required this.body,
      required this.colour,
      required this.icon});
  final String title;
  final String body;
  final Color colour;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colour.withValues(alpha: 0.09),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colour.withValues(alpha: 0.4)),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(icon, size: 17, color: colour),
          const SizedBox(width: 10),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: colour)),
              const SizedBox(height: 5),
              Text(body,
                  style: const TextStyle(fontSize: 12.5, height: 1.5)),
            ]),
          ),
        ]),
      );
}

class _ListSection extends StatelessWidget {
  const _ListSection(this.title, this.items, {this.danger = false});
  final String title;
  final List<String> items;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final accent = danger ? const Color(0xFFB3261E) : cs.primary;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: danger,
          tilePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          childrenPadding: const EdgeInsets.fromLTRB(15, 0, 15, 14),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13.5,
                  color: danger ? accent : null)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text('${items.length} item${items.length == 1 ? '' : 's'}',
                style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant)),
          ),
          children: items
              .map((i) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
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

class _TextSection extends StatelessWidget {
  const _TextSection(this.title, this.body);
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          childrenPadding: const EdgeInsets.fromLTRB(15, 0, 15, 14),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 13.5)),
          children: [
            Text(body,
                style: TextStyle(
                    fontSize: 12, height: 1.55, color: cs.onSurface)),
          ],
        ),
      ),
    );
  }
}
