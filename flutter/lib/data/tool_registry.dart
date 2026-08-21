import 'package:flutter/widgets.dart';
import '../models/tool.dart';
import '../screens/calculators/dating_screen.dart';
import '../screens/calculators/efw_screen.dart';
import '../screens/calculators/bishop_screen.dart';
import '../screens/calculators/dipsi_screen.dart';
import '../screens/calculators/mgso4_screen.dart';
import '../screens/calculators/pph_screen.dart';
import '../screens/calculators/usg_params_screen.dart';
import '../screens/calculators/anthropometry_screen.dart';
import '../screens/calculators/weight_gain_screen.dart';
import '../screens/calculators/haemodynamics_screen.dart';
import '../screens/calculators/anaemia_screen.dart';
import '../screens/calculators/insulin_screen.dart';
import '../screens/calculators/creatinine_screen.dart';
import '../screens/calculators/vte_risk_screen.dart';
import '../screens/calculators/apgar_screen.dart';
import '../screens/calculators/pcos_assessment_screen.dart';
import '../screens/calculators/adnexal_mass_screen.dart';
import '../screens/calculators/popq_screen.dart';
import '../screens/calculators/aub_screen.dart';

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
      id: 'anthropometry',
      name: 'Anthropometry',
      blurb: 'BMI with Asia-Pacific thresholds · BSA · ideal, adjusted and '
          'lean body weight',
      module: ToolModule.anthropometry,
      builder: _anthro,
      indiaSpecific: true,
    ),
    Tool(
      id: 'weight-gain',
      name: 'Gestational weight gain',
      blurb: 'IOM 2009 total and weekly ranges by pre-pregnancy BMI',
      module: ToolModule.anthropometry,
      builder: _weightGain,
    ),
    Tool(
      id: 'haemodynamics',
      name: 'Haemodynamics',
      blurb: 'MAP · pulse pressure · shock index and modified shock index',
      module: ToolModule.haemodynamics,
      builder: _haemo,
    ),
    Tool(
      id: 'anaemia',
      name: 'Anaemia & iron',
      blurb: 'WHO/AMB grading · Ganzoni deficit · IV iron and transfusion',
      module: ToolModule.haematology,
      builder: _anaemia,
      indiaSpecific: true,
    ),
    Tool(
      id: 'insulin',
      name: 'Insulin in pregnancy',
      blurb: 'Total daily dose by trimester · basal-bolus · correction dose',
      module: ToolModule.diabetes,
      builder: _insulin,
    ),
    Tool(
      id: 'creatinine',
      name: 'Renal function',
      blurb: 'Cockcroft-Gault · CKD-EPI · why pregnancy shifts the range',
      module: ToolModule.maternalMedicine,
      builder: _creatinine,
    ),
    Tool(
      id: 'vte-risk',
      name: 'VTE risk',
      blurb: 'RCOG Green-top 37a antenatal and postnatal scoring · LMWH dosing',
      module: ToolModule.maternalMedicine,
      builder: _vte,
    ),
    Tool(
      id: 'apgar',
      name: 'Apgar score',
      blurb: 'At 1 and 5 minutes — and what it must not be used for',
      module: ToolModule.neonatal,
      builder: _apgar,
    ),
    Tool(
      id: 'pcos-assessment',
      name: 'PCOS assessment',
      blurb: 'Ferriman-Gallwey hirsutism score · HOMA-IR insulin resistance',
      module: ToolModule.gynaecology,
      builder: _pcosAssess,
      indiaSpecific: true,
    ),
    Tool(
      id: 'adnexal-mass',
      name: 'Adnexal mass',
      blurb: 'RMI · IOTA simple rules · O-RADS categories',
      module: ToolModule.gynaecology,
      builder: _adnexal,
    ),
    Tool(
      id: 'popq',
      name: 'POP-Q',
      blurb: 'Pelvic organ prolapse quantification and staging',
      module: ToolModule.gynaecology,
      builder: _popq,
    ),
    Tool(
      id: 'aub',
      name: 'Abnormal uterine bleeding',
      blurb: 'PALM-COEIN classification · PBAC blood loss score',
      module: ToolModule.gynaecology,
      builder: _aub,
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
Widget _anthro(BuildContext _) => const AnthropometryScreen();
Widget _weightGain(BuildContext _) => const WeightGainScreen();
Widget _haemo(BuildContext _) => const HaemodynamicsScreen();
Widget _anaemia(BuildContext _) => const AnaemiaScreen();
Widget _insulin(BuildContext _) => const InsulinScreen();
Widget _creatinine(BuildContext _) => const CreatinineScreen();
Widget _vte(BuildContext _) => const VteRiskScreen();
Widget _apgar(BuildContext _) => const ApgarScreen();
Widget _pcosAssess(BuildContext _) => const PcosAssessmentScreen();
Widget _adnexal(BuildContext _) => const AdnexalMassScreen();
Widget _popq(BuildContext _) => const PopQScreen();
Widget _aub(BuildContext _) => const AubScreen();
