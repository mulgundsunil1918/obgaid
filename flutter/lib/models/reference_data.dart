/// A laboratory analyte with trimester-specific ranges (spec §47).
///
/// Non-pregnant ranges are carried alongside deliberately: the clinical error
/// this screen exists to prevent is reading a pregnant woman's result against
/// a non-pregnant reference.
class LabAnalyte {
  const LabAnalyte({
    required this.name,
    required this.unit,
    required this.nonPregnant,
    required this.first,
    required this.second,
    required this.third,
    this.note,
    this.direction = LabDirection.unchanged,
  });

  final String name;
  final String unit;
  final String nonPregnant;
  final String first;
  final String second;
  final String third;

  /// The thing that catches people out, where there is one.
  final String? note;
  final LabDirection direction;
}

enum LabDirection { rises, falls, unchanged }

extension LabDirectionInfo on LabDirection {
  String get label => switch (this) {
        LabDirection.rises => 'Rises in pregnancy',
        LabDirection.falls => 'Falls in pregnancy',
        LabDirection.unchanged => 'Little changed',
      };
}

class LabPanel {
  const LabPanel(this.name, this.analytes);
  final String name;
  final List<LabAnalyte> analytes;
}

/// A vaccine recommendation. Spec §50 requires country, organisation, year,
/// schedule and source on every one — so they are required fields, not
/// optional prose.
class VaccineRecommendation {
  const VaccineRecommendation({
    required this.vaccine,
    required this.country,
    required this.organisation,
    required this.year,
    required this.schedule,
    required this.source,
    required this.timing,
    this.notes = const [],
    this.live = false,
  });

  final String vaccine;
  final String country;
  final String organisation;
  final int year;
  final String schedule;
  final String source;
  final String timing;
  final List<String> notes;

  /// Live vaccines are contraindicated in pregnancy.
  final bool live;
}

enum VaccineStage { preconception, pregnancy, postpartum, contraindicated }

extension VaccineStageInfo on VaccineStage {
  String get label => switch (this) {
        VaccineStage.preconception => 'Preconception',
        VaccineStage.pregnancy => 'During pregnancy',
        VaccineStage.postpartum => 'Postpartum',
        VaccineStage.contraindicated => 'Contraindicated in pregnancy',
      };
}
