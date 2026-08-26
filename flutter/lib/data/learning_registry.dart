import '../models/learning_topic.dart';
import 'learning/history_examination.dart';
import 'learning/labour_puerperium.dart';
import 'learning/antenatal.dart';
import 'learning/early_pregnancy.dart';
import 'learning/gynaecology.dart';
import 'learning/sexual_health.dart';

/// Every teaching topic in the Learning section, grouped by curriculum area.
///
/// The taxonomy follows the NMC competency-based postgraduate curriculum and
/// the RCOG core curriculum. Content is written from primary guidelines and
/// cited to them — the categories organise, they do not source.
class LearningRegistry {
  static final Map<LearningCategory, List<LearningTopic>> byCategory = {
    LearningCategory.historyExamination: kHistoryExamTopics,
    LearningCategory.earlyPregnancy: kEarlyPregnancyLearningTopics,
    LearningCategory.antenatal: kAntenatalLearningTopics,
    LearningCategory.labourPuerperium: kLabourPuerperiumTopics,
    LearningCategory.gynaecology: kGynaecologyLearningTopics,
    LearningCategory.sexualHealth: kSexualHealthLearningTopics,
  };

  static List<LearningTopic> get all =>
      [for (final l in byCategory.values) ...l];

  static LearningTopic? byId(String id) {
    for (final t in all) {
      if (t.id == id) return t;
    }
    return null;
  }

  /// Categories that actually hold topics, in curriculum order.
  static List<LearningCategory> get populated => LearningCategory.values
      .where((c) => (byCategory[c] ?? const []).isNotEmpty)
      .toList();

  static List<LearningTopic> search(String q) {
    final n = q.trim().toLowerCase();
    if (n.isEmpty) return all;
    return all
        .where((t) =>
            t.title.toLowerCase().contains(n) ||
            t.summary.toLowerCase().contains(n) ||
            (t.subtitle ?? '').toLowerCase().contains(n))
        .toList();
  }
}
