import 'package:flutter/material.dart';

enum ToolModule {
  dating,
  biometry,
  ultrasound,
  labour,
  hypertensive,
  diabetes,
  haemorrhage
}

extension ToolModuleInfo on ToolModule {
  String get label => switch (this) {
        ToolModule.dating => 'Dating & growth',
        ToolModule.biometry => 'Fetal biometry',
        ToolModule.ultrasound => 'Ultrasound',
        ToolModule.labour => 'Labour',
        ToolModule.hypertensive => 'Hypertensive disorders',
        ToolModule.diabetes => 'Diabetes in pregnancy',
        ToolModule.haemorrhage => 'Haemorrhage',
      };

  IconData get icon => switch (this) {
        ToolModule.dating => Icons.calendar_month_outlined,
        ToolModule.biometry => Icons.monitor_heart_outlined,
        ToolModule.ultrasound => Icons.graphic_eq_rounded,
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
