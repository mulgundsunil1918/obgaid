/// A landmark trial record carrying every field spec §53 requires.
///
/// The specification asks for absolute as well as relative effect, and for
/// limitations and applicability alongside the result. That combination is
/// deliberate: a hazard ratio without a baseline risk is unusable at the
/// bedside, and a result without its limitations invites overreach.
class Trial {
  const Trial({
    required this.id,
    required this.acronym,
    required this.name,
    required this.year,
    required this.journal,
    required this.setting,
    required this.population,
    required this.sampleSize,
    required this.intervention,
    required this.comparator,
    required this.primaryOutcome,
    required this.results,
    required this.takeaway,
    required this.guidelineImpact,
    required this.category,
    this.link,
    this.inclusion = const [],
    this.exclusion = const [],
    this.secondaryOutcomes = const [],
    this.adverseEvents = const [],
    this.limitations = const [],
    this.applicability,
    this.currentRelevance,
  });

  final String id;
  final String acronym;
  final String name;
  final int year;
  final String journal;
  final String? link;
  final String setting;
  final String population;
  final String sampleSize;
  final List<String> inclusion;
  final List<String> exclusion;
  final String intervention;
  final String comparator;
  final String primaryOutcome;
  final List<String> secondaryOutcomes;

  /// Numerical results, each ideally stating an absolute effect as well as a
  /// relative one, with its confidence interval.
  final List<String> results;

  final List<String> adverseEvents;
  final List<String> limitations;
  final String? applicability;
  final String guidelineImpact;
  final String? currentRelevance;

  /// The single sentence worth remembering.
  final String takeaway;

  final TrialCategory category;
}

enum TrialCategory {
  hypertension,
  pretermBirth,
  diabetes,
  labour,
  pph,
  fetalMedicine,
  gynaecology,
  reproductive,
  oncology,
}

extension TrialCategoryInfo on TrialCategory {
  String get label => switch (this) {
        TrialCategory.hypertension => 'Hypertension & pre-eclampsia',
        TrialCategory.pretermBirth => 'Preterm birth',
        TrialCategory.diabetes => 'Diabetes',
        TrialCategory.labour => 'Labour & delivery',
        TrialCategory.pph => 'Postpartum haemorrhage',
        TrialCategory.fetalMedicine => 'Fetal medicine',
        TrialCategory.gynaecology => 'Gynaecology',
        TrialCategory.reproductive => 'Reproductive medicine',
        TrialCategory.oncology => 'Oncology',
      };
}
