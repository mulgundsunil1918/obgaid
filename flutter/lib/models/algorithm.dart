/// One instruction inside an algorithm step.
class AlgoStep {
  const AlgoStep(this.text, {this.detail, this.critical = false, this.avoid = false});

  final String text;
  final String? detail;

  /// Time-critical or life-saving. Drawn in the alert colour.
  final bool critical;

  /// An explicit "do not do this". These kill people in obstetric emergencies
  /// more reliably than omissions do — fundal pressure in shoulder dystocia,
  /// fluid loading in eclampsia — so they render as their own kind of step
  /// rather than as a footnote nobody reads at 3am.
  final bool avoid;
}

/// One of the ten sections the content specification (§52) requires of every
/// clinical algorithm.
class AlgoSection {
  const AlgoSection(this.title, this.steps);
  final String title;
  final List<AlgoStep> steps;
}

class Algorithm {
  const Algorithm({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.immediate,
    required this.sections,
    required this.sources,
    this.callFor,
    this.timeTarget,
  });

  final String id;
  final String name;
  final String subtitle;

  /// Who to summon, spelled out. In an emergency the useful instruction is
  /// "call the anaesthetist and the neonatal team", not "call for help".
  final String? callFor;

  /// The clock that governs this emergency, where one exists.
  final String? timeTarget;

  /// Surfaced above everything else, because in a real emergency nobody
  /// scrolls. §52's Recognition and Immediate assessment still appear in full
  /// below; this is the subset you act on before reading anything.
  final List<AlgoStep> immediate;

  final List<AlgoSection> sections;
  final List<String> sources;
}
