/// A clinician-facing counselling checklist (spec §58).
///
/// The spec asks for patient-friendly language. These are written as the words
/// to say rather than as topics to remember, because a checklist that lists
/// "discuss risks" is one nobody uses.
class CounsellingGuide {
  const CounsellingGuide({
    required this.id,
    required this.title,
    required this.setting,
    required this.cover,
    required this.saferWording,
    required this.redFlags,
    required this.sources,
    this.pitfalls = const [],
  });

  final String id;
  final String title;

  /// When this conversation happens.
  final String setting;

  /// The points that must be covered.
  final List<String> cover;

  /// Phrasing that lands, as (instead of, say).
  final List<(String, String)> saferWording;

  /// What she must be told to come back for.
  final List<String> redFlags;

  /// Common ways the conversation goes wrong.
  final List<String> pitfalls;

  final List<String> sources;
}
