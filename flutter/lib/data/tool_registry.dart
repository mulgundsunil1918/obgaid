import 'package:flutter/widgets.dart';
import '../models/tool.dart';
import '../screens/calculators/dating_screen.dart';
import '../screens/calculators/efw_screen.dart';
import '../screens/calculators/bishop_screen.dart';
import '../screens/calculators/dipsi_screen.dart';
import '../screens/calculators/mgso4_screen.dart';
import '../screens/calculators/pph_screen.dart';
import '../screens/calculators/usg_params_screen.dart';

/// Single source of truth for every working tool. Home quick-access, the
/// calculators hub and global search all read from here, so a tool added once
/// appears everywhere.
class ToolRegistry {
  static const List<Tool> all = [
    Tool(
      id: 'dating',
      name: 'Dating & GA',
      blurb: 'EDD by LMP, scan or IVF · current GA · ACOG redating rules',
      module: ToolModule.dating,
      builder: _dating,
    ),
    Tool(
      id: 'efw',
      name: 'Fetal weight',
      blurb: 'Hadlock EFW with growth centile · SGA / LGA flags',
      module: ToolModule.biometry,
      builder: _efw,
    ),
    Tool(
      id: 'usg',
      name: 'USG parameters',
      blurb: 'GA from CRL and biometry · amniotic fluid index and DVP',
      module: ToolModule.ultrasound,
      builder: _usg,
    ),
    Tool(
      id: 'bishop',
      name: 'Bishop score',
      blurb: 'Induction favourability · ripening threshold',
      module: ToolModule.labour,
      builder: _bishop,
    ),
    Tool(
      id: 'gdm',
      name: 'GDM screening',
      blurb: 'DIPSI and IADPSG side by side · glycaemic targets',
      module: ToolModule.diabetes,
      builder: _dipsi,
      indiaSpecific: true,
    ),
    Tool(
      id: 'mgso4',
      name: 'Magnesium sulphate',
      blurb: 'Pritchard · Zuspan · Sibai · toxicity ladder and antidote',
      module: ToolModule.hypertensive,
      builder: _mgso4,
      indiaSpecific: true,
    ),
    Tool(
      id: 'pph',
      name: 'PPH',
      blurb: 'Shock index · blood volume lost · E-MOTIVE bundle',
      module: ToolModule.haemorrhage,
      builder: _pph,
    ),
  ];

  static List<Tool> get quickAccess => all;

  static Tool? byId(String id) {
    for (final t in all) {
      if (t.id == id) return t;
    }
    return null;
  }

  static List<Tool> search(String q) {
    final needle = q.trim().toLowerCase();
    if (needle.isEmpty) return all;
    return all
        .where((t) =>
            t.name.toLowerCase().contains(needle) ||
            t.blurb.toLowerCase().contains(needle) ||
            t.module.label.toLowerCase().contains(needle))
        .toList();
  }
}

Widget _dating(BuildContext _) => const DatingScreen();
Widget _efw(BuildContext _) => const EfwScreen();
Widget _bishop(BuildContext _) => const BishopScreen();
Widget _dipsi(BuildContext _) => const DipsiScreen();
Widget _mgso4(BuildContext _) => const MgSo4Screen();
Widget _pph(BuildContext _) => const PphScreen();
Widget _usg(BuildContext _) => const UsgParamsScreen();
