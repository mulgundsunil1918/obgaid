import 'algorithm.dart';

/// Reference topics reuse the algorithm's point and section types deliberately.
/// A clinical statement is a clinical statement — it can be critical, or it can
/// be a prohibition — and duplicating the types would only let the two drift.
typedef TopicPoint = AlgoStep;
typedef TopicSection = AlgoSection;

/// A structured clinical reference topic (spec §10, §13, §17, §23, §26–28).
///
/// Unlike an algorithm, a topic is read before the event rather than during
/// it. So it leads with a key-facts table — the numbers you came to look up —
/// rather than with an action block.
class ClinicalTopic {
  const ClinicalTopic({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.keyFacts,
    required this.sections,
    required this.sources,
    this.headline,
  });

  final String id;
  final String name;
  final String subtitle;

  /// The one sentence worth reading if nothing else is.
  final String? headline;

  /// Quick-reference pairs shown above the sections.
  final List<(String, String)> keyFacts;

  final List<TopicSection> sections;
  final List<String> sources;
}
