/// A change between guideline versions (spec §55).
///
/// The tracker exists to answer one question — "what changed in OBG practice
/// this year?" — so each record states the old position, the new one, and why
/// the difference matters at a bedside.
class GuidelineChange {
  const GuidelineChange({
    required this.topic,
    required this.previous,
    required this.now,
    required this.whatChanged,
    required this.whyItMatters,
    required this.source,
    required this.year,
  });

  final String topic;
  final String previous;
  final String now;
  final String whatChanged;
  final String whyItMatters;
  final String source;
  final int year;
}

/// A guideline record carrying the fields spec §54 requires.
class Guideline {
  const Guideline({
    required this.id,
    required this.organisation,
    required this.title,
    required this.published,
    required this.topic,
    required this.keyRecommendations,
    required this.source,
    this.version,
    this.changes = const [],
    this.reviewStatus = 'Current',
    this.region = GuidelineRegion.international,
  });

  final String id;
  final String organisation;
  final String title;
  final String published;
  final String? version;
  final String topic;
  final List<String> keyRecommendations;
  final String source;
  final List<GuidelineChange> changes;
  final String reviewStatus;
  final GuidelineRegion region;
}

enum GuidelineRegion { international, india }

extension GuidelineRegionInfo on GuidelineRegion {
  String get label => switch (this) {
        GuidelineRegion.international => 'International',
        GuidelineRegion.india => 'India',
      };
}
