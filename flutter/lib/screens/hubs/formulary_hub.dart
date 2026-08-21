import 'package:flutter/material.dart';
import '../../data/drug_registry.dart';
import '../../models/drug.dart';
import '../../widgets/hub_widgets.dart';
import '../formulary/drug_screen.dart';

class FormularyHub extends StatefulWidget {
  const FormularyHub({super.key});
  @override
  State<FormularyHub> createState() => _FormularyHubState();
}

class _FormularyHubState extends State<FormularyHub> {
  final _query = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final q = _query.text.trim();
    final filtered = q.isEmpty ? null : DrugRegistry.search(q);

    return HubScaffold(
      title: 'Drug Formulary',
      subtitle: '${DrugRegistry.all.length} drugs · pregnancy & lactation',
      children: [
        TextField(
          controller: _query,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            hintText: 'Search by name, brand, class or indication',
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
        Container(
          padding: const EdgeInsets.all(13),
          margin: const EdgeInsets.only(bottom: 18),
          decoration: BoxDecoration(
            color: cs.primaryContainer.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Text(
            'FDA pregnancy letter categories were withdrawn in 2015. Safety '
            'here is narrative, per the PLLR format — because "category C" '
            'never told anyone what to actually do.',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(height: 1.5),
          ),
        ),
        if (filtered != null) ...[
          if (filtered.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text('Nothing matches "$q" yet.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
            )
          else
            ...filtered.map((d) => _tile(context, d)),
        ] else
          for (final entry in DrugRegistry.byGroup.entries) ...[
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 10),
              child: Text(entry.key.label.toUpperCase(),
                  style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: cs.primary)),
            ),
            ...entry.value.map((d) => _tile(context, d)),
          ],
        const SizedBox(height: 18),
        const ComingSoon(phase: 'Tier 2 continued', items: [
          'Antibiotics — obstetric and gynaecological infection',
          'Analgesics and antiemetics in pregnancy',
          'Tocolytics — atosiban',
          'Hormonal therapy — oestrogens, progestogens, GnRH analogues, SERMs',
          'Gonadotrophins, hCG and luteal support',
          'Gynaecological oncology agents — platinums, taxanes, PARP '
              'inhibitors',
          'Antiepileptics, antidepressants and antidiabetics in pregnancy',
          'A full lactation-safety index',
        ]),
      ],
    );
  }

  Widget _tile(BuildContext context, Drug d) => HubTile(
        title: d.generic,
        subtitle: d.drugClass,
        icon: Icons.medication_outlined,
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => DrugScreen(drug: d))),
      );

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }
}
