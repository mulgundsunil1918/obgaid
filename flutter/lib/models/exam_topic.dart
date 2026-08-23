/// Postgraduate examination content (spec §59).
///
/// Deliberately not a second copy of the clinical topics. The app already
/// holds the substance; what an exam candidate needs on top is the shape of
/// the questions, the facts that get asked, and a pointer to where the detail
/// lives. So each entry carries high-yield points, viva questions, and links
/// into the existing content graph.
class ExamTopic {
  const ExamTopic({
    required this.id,
    required this.title,
    required this.area,
    required this.highYield,
    required this.vivaQuestions,
    required this.sources,
    this.classicTraps = const [],
    this.readsInApp = const [],
  });

  final String id;
  final String title;
  final ExamArea area;

  /// The facts that recur across papers and vivas.
  final List<String> highYield;

  /// Questions as an examiner actually phrases them.
  final List<String> vivaQuestions;

  /// Where candidates reliably lose marks.
  final List<String> classicTraps;

  /// Content ids in the app that cover this topic.
  final List<String> readsInApp;

  /// Curriculum, guideline and textbook references. Indian sources lead,
  /// because Indian examinations are set against Indian guidelines.
  final List<String> sources;
}

enum ExamArea { obstetrics, gynaecology, reproductive, oncology }

extension ExamAreaInfo on ExamArea {
  String get label => switch (this) {
        ExamArea.obstetrics => 'Obstetrics',
        ExamArea.gynaecology => 'Gynaecology',
        ExamArea.reproductive => 'Reproductive medicine',
        ExamArea.oncology => 'Oncology',
      };
}
