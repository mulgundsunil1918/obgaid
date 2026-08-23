/// A searchable quick-reference table (spec §60).
///
/// Most of this content exists elsewhere in the app in prose. §60 exists
/// because prose is the wrong shape when you need one number in ten seconds.
class QuickTable {
  const QuickTable({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.columns,
    required this.rows,
    required this.group,
    required this.sources,
    this.note,
  });

  final String id;
  final String title;
  final String subtitle;
  final List<String> columns;
  final List<List<String>> rows;
  final QuickTableGroup group;

  /// The thing that catches people out, where there is one.
  final String? note;
  final List<String> sources;

  bool matches(String needle) {
    if (needle.isEmpty) return true;
    final q = needle.toLowerCase();
    if (title.toLowerCase().contains(q)) return true;
    if (subtitle.toLowerCase().contains(q)) return true;
    for (final r in rows) {
      for (final cell in r) {
        if (cell.toLowerCase().contains(q)) return true;
      }
    }
    return false;
  }
}

enum QuickTableGroup { antenatal, intrapartum, transfusion, gynaecology }

extension QuickTableGroupInfo on QuickTableGroup {
  String get label => switch (this) {
        QuickTableGroup.antenatal => 'Antenatal',
        QuickTableGroup.intrapartum => 'Intrapartum & postpartum',
        QuickTableGroup.transfusion => 'Transfusion & antibiotics',
        QuickTableGroup.gynaecology => 'Gynaecology',
      };
}
