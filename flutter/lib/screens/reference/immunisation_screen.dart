import 'package:flutter/material.dart';
import '../../data/vaccines.dart';
import '../../models/reference_data.dart';
import '../../widgets/reference_note.dart';
import '../../widgets/content_footer.dart';
import '../../data/content_registry.dart';

class ImmunisationScreen extends StatelessWidget {
  const ImmunisationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Maternal immunisation'),
            Text('Preconception · pregnancy · postpartum',
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
              'Schedules differ by country and change often. Every '
              'recommendation below names its country, organisation and year, '
              'so you can see whose advice you are following — India uses Td, '
              'not Tdap, and that difference matters.',
              style: TextStyle(fontSize: 12.5, height: 1.55),
            ),
          ),
          for (final stage in VaccineStage.values) ...[
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 10),
              child: Text(stage.label.toUpperCase(),
                  style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: stage == VaccineStage.contraindicated
                          ? const Color(0xFFB3261E)
                          : cs.primary)),
            ),
            ...(kVaccines[stage] ?? []).map((v) => _VaccineCard(v: v)),
          ],
          const ReferenceNote(
            sources: [
              'National Immunization Schedule, Ministry of Health & Family '
                  'Welfare, Government of India.',
              'WHO position papers on influenza, HPV and hepatitis B vaccines.',
              'ACOG Committee Opinions 718 and 741; CDC ACIP recommendations.',
              'FOGSI recommendations on preconception care and immunisation.',
            ],
            caveat: 'Vaccine recommendations change between seasons and '
                'between countries. Verify against the current national '
                'schedule before advising — the entries here name their year '
                'precisely so that staleness is visible rather than hidden.',
          ),
          ContentFooter(meta: ContentRegistry.metaFor('immunisation')!),
        ],
      ),
    );
  }
}

class _VaccineCard extends StatelessWidget {
  const _VaccineCard({required this.v});
  final VaccineRecommendation v;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(15, 0, 15, 14),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Row(children: [
            Expanded(
              child: Text(v.vaccine,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 13.5)),
            ),
            if (v.live)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFB3261E).withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text('LIVE',
                    style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.4,
                        color: Color(0xFFB3261E))),
              ),
          ]),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text('${v.timing} · ${v.country}',
                style: TextStyle(fontSize: 11.5, color: cs.onSurfaceVariant)),
          ),
          children: [
            _kv(context, 'Schedule', v.schedule, bold: true),
            _kv(context, 'Timing', v.timing),
            _kv(context, 'Country', v.country),
            _kv(context, 'Organisation', v.organisation),
            _kv(context, 'Year', '${v.year}'),
            _kv(context, 'Source', v.source),
            if (v.notes.isNotEmpty) ...[
              const SizedBox(height: 8),
              ...v.notes.map((n) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('•  ', style: TextStyle(color: cs.primary)),
                          Expanded(
                              child: Text(n,
                                  style: const TextStyle(
                                      fontSize: 12, height: 1.5))),
                        ]),
                  )),
            ],
          ],
        ),
      ),
    );
  }

  Widget _kv(BuildContext context, String k, String val, {bool bold = false}) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            width: 96,
            child: Text(k,
                style: TextStyle(fontSize: 11, color: cs.onSurfaceVariant))),
        Expanded(
            child: Text(val,
                style: TextStyle(
                    fontSize: 11.5,
                    height: 1.45,
                    fontWeight: bold ? FontWeight.w700 : FontWeight.w500))),
      ]),
    );
  }
}
