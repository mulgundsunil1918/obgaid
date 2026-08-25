/// A scoring system, carrying every field spec §51 requires.
///
/// The library indexes every score in the app — those with an interactive
/// calculator and those that are reference-only — so that "which scores exist"
/// has one answer instead of being scattered across whichever module the tool
/// happened to be built into.
class ClinicalScore {
  const ClinicalScore({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.category,
    required this.purpose,
    required this.population,
    required this.inputs,
    required this.calculation,
    required this.interpretation,
    required this.limitations,
    required this.sources,
    this.toolId,
    this.stagingId,
  });

  final String id;
  final String name;
  final String subtitle;
  final ScoreCategory category;

  /// What the score is for.
  final String purpose;

  /// The population it was derived and validated in — the field that decides
  /// whether it transfers to the woman in front of you.
  final String population;

  final List<String> inputs;
  final String calculation;

  /// Band and what it means, as (range, meaning).
  final List<(String, String)> interpretation;

  final List<String> limitations;
  final List<String> sources;

  /// Registry id of the interactive calculator, where one exists.
  final String? toolId;

  /// Staging system id, for the FIGO systems.
  final String? stagingId;

  bool get isInteractive => toolId != null || stagingId != null;
}

enum ScoreCategory { obstetric, intrapartum, gynaecological, oncological }

extension ScoreCategoryInfo on ScoreCategory {
  String get label => switch (this) {
        ScoreCategory.obstetric => 'Obstetric',
        ScoreCategory.intrapartum => 'Intrapartum & postpartum',
        ScoreCategory.gynaecological => 'Gynaecological',
        ScoreCategory.oncological => 'Oncological',
      };
}
