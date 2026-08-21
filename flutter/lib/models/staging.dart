class StageEntry {
  const StageEntry(this.code, this.text, {this.children = const []});
  final String code;
  final String text;
  final List<StageEntry> children;
}

class StagingSystem {
  const StagingSystem({
    required this.id,
    required this.name,
    required this.edition,
    required this.stages,
    required this.sources,
    this.note,
    this.keyChange,
  });

  final String id;
  final String name;
  final String edition;
  final List<StageEntry> stages;
  final List<String> sources;
  final String? note;

  /// What changed in this edition. Half the competing apps still ship the
  /// previous one, so saying plainly what moved is part of the value.
  final String? keyChange;
}
