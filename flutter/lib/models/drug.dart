/// One indication-specific dose. A drug used for three different things in
/// obstetrics needs three dose blocks, not one paragraph.
class DrugDose {
  const DrugDose({
    required this.indication,
    required this.dose,
    this.route,
    this.frequency,
    this.max,
    this.notes,
  });

  final String indication;
  final String dose;
  final String? route;
  final String? frequency;
  final String? max;
  final String? notes;
}

/// Narrative safety information, per spec §46.
///
/// The specification is explicit that simplistic SAFE / UNSAFE labels are to
/// be avoided where the evidence is more nuanced — which, in pregnancy and
/// lactation, it almost always is. So this carries a summary sentence and
/// supporting points rather than a category letter. FDA pregnancy letter
/// categories were withdrawn in 2015 and are deliberately not modelled here.
class DrugSafety {
  const DrugSafety({
    required this.summary,
    this.points = const [],
    this.source,
  });

  final String summary;
  final List<String> points;
  final String? source;
}

/// A formulary entry carrying every field spec §45 requires.
class Drug {
  const Drug({
    required this.id,
    required this.generic,
    required this.drugClass,
    required this.mechanism,
    required this.indications,
    required this.doses,
    required this.contraindications,
    required this.pregnancy,
    required this.lactation,
    required this.references,
    this.brandNames = const [],
    this.preparation,
    this.dilution,
    this.administrationRate,
    this.doseAdjustments = const [],
    this.warnings = const [],
    this.adverseEffects = const [],
    this.interactions = const [],
    this.monitoring = const [],
    this.fertility,
    this.perioperative,
    this.antidote,
    this.overdose,
  });

  final String id;
  final String generic;
  final List<String> brandNames;
  final String drugClass;
  final String mechanism;
  final List<String> indications;
  final List<DrugDose> doses;
  final String? preparation;
  final String? dilution;
  final String? administrationRate;
  final List<String> doseAdjustments;
  final List<String> contraindications;
  final List<String> warnings;
  final List<String> adverseEffects;
  final List<String> interactions;
  final List<String> monitoring;
  final DrugSafety pregnancy;
  final DrugSafety lactation;
  final String? fertility;
  final String? perioperative;
  final String? antidote;
  final String? overdose;
  final List<String> references;
}
