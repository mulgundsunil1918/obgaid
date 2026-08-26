/// Learn OBG — the curriculum view over the whole app.
///
/// The section names follow the standard undergraduate and postgraduate OBG
/// curriculum structure, so a learner finds subjects where they expect them.
///
/// An entry does not own content. It points at a node that already exists —
/// an algorithm, a clinical topic, a procedure, a teaching page — so the same
/// subject is never written twice. Learn OBG is a way through the app, not a
/// second copy of it.
class CurriculumSection {
  const CurriculumSection({
    required this.id,
    required this.name,
    required this.blurb,
    required this.groups,
  });

  final String id;
  final String name;
  final String blurb;
  final List<CurriculumGroup> groups;

  int get topicCount =>
      groups.fold(0, (sum, g) => sum + g.entries.length);
}

class CurriculumGroup {
  const CurriculumGroup(this.name, this.entries);
  final String name;
  final List<CurriculumEntry> entries;
}

class CurriculumEntry {
  const CurriculumEntry(this.title, this.nodeId, {this.note});

  /// How the subject is named in the curriculum, which is not always how the
  /// node is titled — "Pre-eclampsia" in a syllabus, "Severe hypertension"
  /// as an emergency algorithm.
  final String title;

  /// The node this opens. Must resolve; a test enforces it.
  final String nodeId;

  /// Shown under the title where the destination is not obvious from it.
  final String? note;
}
