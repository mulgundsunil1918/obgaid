/// Categories named in spec §56.
enum SafetyCategory {
  medicationError,
  delayedEscalation,
  delayedRecognitionPph,
  delayedRecognitionEclampsia,
  delayedRecognitionSepsis,
  ctgFailure,
  delayedCaesarean,
  communicationFailure,
  documentationFailure,
  surgicalComplication,
  vteFailure,
}

extension SafetyCategoryInfo on SafetyCategory {
  String get label => switch (this) {
        SafetyCategory.medicationError => 'Medication error',
        SafetyCategory.delayedEscalation => 'Delayed escalation',
        SafetyCategory.delayedRecognitionPph => 'Delayed recognition of PPH',
        SafetyCategory.delayedRecognitionEclampsia =>
          'Delayed recognition of eclampsia',
        SafetyCategory.delayedRecognitionSepsis =>
          'Delayed recognition of sepsis',
        SafetyCategory.ctgFailure => 'CTG interpretation failure',
        SafetyCategory.delayedCaesarean => 'Delayed caesarean',
        SafetyCategory.communicationFailure => 'Communication failure',
        SafetyCategory.documentationFailure => 'Documentation failure',
        SafetyCategory.surgicalComplication => 'Surgical complication',
        SafetyCategory.vteFailure => 'VTE prevention failure',
      };
}

/// An anonymised, educational safety case (spec §56).
///
/// Composites drawn from published confidential enquiries and incident
/// literature. They carry no identifiable information and describe no single
/// real patient — the specification's rule is absolute on that point.
class SafetyCase {
  const SafetyCase({
    required this.id,
    required this.title,
    required this.category,
    required this.presentation,
    required this.timeline,
    required this.criticalEvent,
    required this.whatWentWrong,
    required this.contributingFactors,
    required this.warningSigns,
    required this.correctResponse,
    required this.prevention,
    required this.learningPoints,
    required this.sources,
  });

  final String id;
  final String title;
  final SafetyCategory category;
  final String presentation;

  /// Time-stamped sequence, as (time, event).
  final List<(String, String)> timeline;

  final String criticalEvent;
  final List<String> whatWentWrong;
  final List<String> contributingFactors;
  final List<String> warningSigns;
  final List<String> correctResponse;
  final List<String> prevention;
  final List<String> learningPoints;
  final List<String> sources;
}
