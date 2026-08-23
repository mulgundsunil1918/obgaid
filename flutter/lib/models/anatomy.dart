/// Where a structure is at risk, and what prevents the injury.
class AnatomyDanger {
  const AnatomyDanger({
    required this.site,
    required this.risk,
    required this.avoid,
  });

  /// The anatomical point at which injury happens.
  final String site;

  /// What goes wrong there.
  final String risk;

  /// The manoeuvre or habit that prevents it.
  final String avoid;
}

/// A surgical anatomy entry, written for the two minutes before scrubbing.
///
/// Not a textbook chapter. The organising question is "what will I injure and
/// how do I not", so relations are given only where they bear on that, and the
/// danger points lead.
class AnatomyEntry {
  const AnatomyEntry({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.headline,
    required this.region,
    required this.course,
    required this.dangers,
    required this.identification,
    required this.sources,
    this.ifInjured = const [],
    this.numbers = const [],
  });

  final String id;
  final String name;
  final String subtitle;

  /// The single thing to carry into theatre.
  final String headline;

  final AnatomyRegion region;

  /// Course and the relations that matter surgically.
  final List<String> course;

  final List<AnatomyDanger> dangers;

  /// How to find it, and how to confirm it is what you think it is.
  final List<String> identification;

  /// What to do when it has already gone wrong.
  final List<String> ifInjured;

  /// Distances and measurements worth knowing exactly.
  final List<(String, String)> numbers;

  final List<String> sources;
}

enum AnatomyRegion { vascular, urinary, neural, wall, spaces, perineum }

extension AnatomyRegionInfo on AnatomyRegion {
  String get label => switch (this) {
        AnatomyRegion.vascular => 'Vascular',
        AnatomyRegion.urinary => 'Urinary tract',
        AnatomyRegion.neural => 'Nerves',
        AnatomyRegion.wall => 'Abdominal wall & entry',
        AnatomyRegion.spaces => 'Pelvic spaces',
        AnatomyRegion.perineum => 'Perineum',
      };
}
