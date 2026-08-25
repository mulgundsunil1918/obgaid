import 'package:flutter/material.dart';
import '../../data/safety_cases.dart';
import '../../models/safety_case.dart';
import '../../widgets/hub_widgets.dart';
import '../safety/safety_case_screen.dart';

class NeverAgainHub extends StatelessWidget {
  const NeverAgainHub({super.key});

  @override
  Widget build(BuildContext context) {
    return HubScaffold(
      title: 'Never Again',
      subtitle: '${kSafetyCases.length} cases',
      intro: 'Anonymised composite cases drawn from confidential enquiry and '
          'incident literature. None describes an identifiable patient. Each '
          'sets out the timeline, the warning signs that were present, and '
          'what should have happened instead — because the error is almost '
          'never a knowledge gap.',
      children: [
        ...kSafetyCases.map((c) => HubTile(
              title: c.title,
              subtitle: c.category.label,
              icon: Icons.groups_outlined,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SafetyCaseScreen(safetyCase: c))),
            )),
      ],
    );
  }
}
