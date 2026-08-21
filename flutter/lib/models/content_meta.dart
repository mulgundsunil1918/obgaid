/// One edge in the content graph (§68). The reason belongs to the edge, not
/// to the target — magnesium sulphate leads to PPH for a different reason than
/// PPH leads to magnesium sulphate.
class Related {
  const Related(this.id, this.why);
  final String id;
  final String why;
}

/// Evidence hierarchy from the content specification §61, strongest first.
enum EvidenceLevel {
  guideline,
  nationalGuideline,
  systematicReview,
  rct,
  observational,
  referenceText,
  statute,
}

extension EvidenceLevelInfo on EvidenceLevel {
  String get label => switch (this) {
        EvidenceLevel.guideline => 'Professional guideline',
        EvidenceLevel.nationalGuideline => 'National guideline',
        EvidenceLevel.systematicReview => 'Systematic review',
        EvidenceLevel.rct => 'Randomised controlled trial',
        EvidenceLevel.observational => 'Observational study',
        EvidenceLevel.referenceText => 'Reference text',
        EvidenceLevel.statute => 'Statute',
      };

  /// 1 is strongest. Used to sort and to flag weakly-sourced content.
  int get rank => switch (this) {
        EvidenceLevel.guideline => 1,
        EvidenceLevel.nationalGuideline => 2,
        EvidenceLevel.statute => 2,
        EvidenceLevel.systematicReview => 3,
        EvidenceLevel.rct => 4,
        EvidenceLevel.observational => 5,
        EvidenceLevel.referenceText => 6,
      };
}

/// Lifecycle from §62.
enum ContentStatus { draft, underReview, approved, published, superseded, archived }

extension ContentStatusInfo on ContentStatus {
  String get label => switch (this) {
        ContentStatus.draft => 'Draft',
        ContentStatus.underReview => 'Under review',
        ContentStatus.approved => 'Approved',
        ContentStatus.published => 'Published',
        ContentStatus.superseded => 'Superseded',
        ContentStatus.archived => 'Archived',
      };
}

/// The versioned record every clinical item must carry (§62).
///
/// This exists so that "traceable to a source" (§61) is a property of the data
/// rather than a promise in prose — and so §63's mandatory-review list can be
/// enforced by the app instead of remembered by a person.
class ContentMeta {
  const ContentMeta({
    required this.id,
    required this.title,
    required this.category,
    required this.sourceOrg,
    required this.sourceTitle,
    required this.evidence,
    required this.created,
    this.author = 'Dr Sunil Mulgund',
    this.reviewer,
    this.year,
    this.version = '1.0.0',
    this.reviewed,
    this.nextReview,
    this.status = ContentStatus.draft,
    this.highRisk = false,
    this.related = const [],
  });

  final String id;
  final String title;
  final String category;
  final String author;

  /// Null until a clinician has signed the item off. For [highRisk] content
  /// §63 makes this mandatory before publication.
  final String? reviewer;

  final String sourceOrg;
  final String sourceTitle;
  final int? year;
  final String version;
  final EvidenceLevel evidence;
  final DateTime created;
  final DateTime? reviewed;
  final DateTime? nextReview;
  final ContentStatus status;

  /// On the §63 mandatory-medical-review list — drug doses, emergency
  /// algorithms, PPH, eclampsia, severe hypertension, sepsis, blood products,
  /// anticoagulation, oncology and fertility dosing, fetal therapy, vaccines.
  final bool highRisk;

  /// §68: every item connects to the tools, drugs, algorithms, guidelines and
  /// trials a clinician would reach for next.
  final List<Related> related;

  /// High-risk content that no clinician has signed off yet. Surfaced in the
  /// app rather than hidden, because a silent gap is the dangerous kind.
  bool get awaitingMandatoryReview => highRisk && reviewer == null;

  bool get isReviewOverdue =>
      nextReview != null && DateTime.now().isAfter(nextReview!);
}
