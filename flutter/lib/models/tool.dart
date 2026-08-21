import 'package:flutter/material.dart';

enum ToolModule {
  dating,
  biometry,
  ultrasound,
  anthropometry,
  haemodynamics,
  labour,
  hypertensive,
  diabetes,
  haematology,
  maternalMedicine,
  neonatal,
  gynaecology,
  haemorrhage
}

extension ToolModuleInfo on ToolModule {
  String get label => switch (this) {
        ToolModule.dating => 'Dating & growth',
        ToolModule.biometry => 'Fetal biometry',
        ToolModule.ultrasound => 'Ultrasound',
        ToolModule.anthropometry => 'Maternal anthropometry',
        ToolModule.haemodynamics => 'Haemodynamics',
        ToolModule.haematology => 'Anaemia & haematology',
        ToolModule.maternalMedicine => 'Maternal medicine',
        ToolModule.neonatal => 'Neonatal',
        ToolModule.gynaecology => 'Gynaecology',
        ToolModule.labour => 'Labour',
        ToolModule.hypertensive => 'Hypertensive disorders',
        ToolModule.diabetes => 'Diabetes in pregnancy',
        ToolModule.haemorrhage => 'Haemorrhage',
      };

  IconData get icon => switch (this) {
        ToolModule.dating => Icons.calendar_month_outlined,
        ToolModule.biometry => Icons.monitor_heart_outlined,
        ToolModule.ultrasound => Icons.graphic_eq_rounded,
        ToolModule.anthropometry => Icons.straighten_outlined,
        ToolModule.haemodynamics => Icons.favorite_outline,
        ToolModule.haematology => Icons.water_drop_outlined,
        ToolModule.maternalMedicine => Icons.medical_information_outlined,
        ToolModule.neonatal => Icons.child_care_outlined,
        ToolModule.gynaecology => Icons.female_outlined,
        ToolModule.labour => Icons.timeline_outlined,
        ToolModule.hypertensive => Icons.warning_amber_outlined,
        ToolModule.diabetes => Icons.water_drop_outlined,
        ToolModule.haemorrhage => Icons.bloodtype_outlined,
      };
}

class Tool {
  const Tool({
    required this.id,
    required this.name,
    required this.blurb,
    required this.module,
    required this.builder,
    this.indiaSpecific = false,
  });

  final String id;
  final String name;
  final String blurb;
  final ToolModule module;
  final WidgetBuilder builder;

  /// Marks content that exists because Indian practice differs — the reason
  /// somebody picks ObgAid over a foreign app.
  final bool indiaSpecific;
}
