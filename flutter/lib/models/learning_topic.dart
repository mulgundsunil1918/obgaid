/// A teaching topic for the Learning section.
///
/// Deliberately a different shape from [ClinicalTopic], which answers "what do
/// I do now" at the bedside. A learning topic answers "explain this to me" —
/// so it moves definition → aetiology → features → investigation → management
/// → complications, which is the order a curriculum teaches in and the order
/// an examiner asks in.
///
/// The taxonomy follows the National Medical Commission competency-based
/// postgraduate curriculum for MD Obstetrics and Gynaecology and the RCOG
/// core curriculum. Both are published curricula, and both are cited.
class LearningTopic {
  const LearningTopic({
    required this.id,
    required this.title,
    required this.category,
    required this.summary,
    required this.sections,
    required this.keyPoints,
    required this.sources,
    this.subtitle,
    this.related = const [],
    this.competency,
  });

  final String id;
  final String title;
  final String? subtitle;
  final LearningCategory category;

  /// One or two sentences that would satisfy someone who reads no further.
  final String summary;

  final List<LearningSection> sections;

  /// The handful of facts worth carrying out of the page.
  final List<String> keyPoints;

  /// Ids of clinical content elsewhere in the app that go deeper.
  final List<String> related;

  /// NMC competency code where one maps cleanly, e.g. 'OG 1.1'.
  final String? competency;

  final List<String> sources;
}

class LearningSection {
  const LearningSection(this.heading, this.points);
  final String heading;
  final List<String> points;
}

enum LearningCategory {
  basicSciences,
  historyExamination,
  earlyPregnancy,
  antenatal,
  labourPuerperium,
  gynaecology,
  sexualHealth,
  reproductive,
  oncology,
  procedures,
}

extension LearningCategoryInfo on LearningCategory {
  String get label => switch (this) {
        LearningCategory.basicSciences => 'Basic Sciences',
        LearningCategory.historyExamination => 'History Taking & Examination',
        LearningCategory.earlyPregnancy => 'Early Pregnancy',
        LearningCategory.antenatal => 'Antenatal Care',
        LearningCategory.labourPuerperium => 'Labour & Puerperium',
        LearningCategory.gynaecology => 'Gynaecological Disorders',
        LearningCategory.sexualHealth => 'Sexual & Reproductive Health',
        LearningCategory.reproductive => 'Reproductive Medicine',
        LearningCategory.oncology => 'Gynaecological Oncology',
        LearningCategory.procedures => 'Operations & Procedures',
      };

  String get blurb => switch (this) {
        LearningCategory.basicSciences =>
          'Anatomy, physiology and embryology of the female genital tract',
        LearningCategory.historyExamination =>
          'How to take the history and perform the examination, in each setting',
        LearningCategory.earlyPregnancy =>
          'Bleeding, pain and loss in the first trimester',
        LearningCategory.antenatal =>
          'Booking through to term, and the conditions that complicate it',
        LearningCategory.labourPuerperium =>
          'Normal labour, its complications, and the six weeks after',
        LearningCategory.gynaecology =>
          'Menstrual, pelvic, endocrine and benign structural disease',
        LearningCategory.sexualHealth =>
          'Contraception, infection, and sexual and reproductive rights',
        LearningCategory.reproductive =>
          'Subfertility, assisted reproduction and the endocrinology behind it',
        LearningCategory.oncology =>
          'Screening, diagnosis, staging and treatment of gynaecological cancer',
        LearningCategory.procedures =>
          'What is done, why, how, and what goes wrong',
      };
}
