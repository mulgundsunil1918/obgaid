import '../models/topic.dart';
import 'topics/monitoring_topics.dart';
import 'topics/preterm_topics.dart';
import 'topics/labour_topics.dart';

enum TopicGroup { monitoring, preterm, labour, immunology }

extension TopicGroupInfo on TopicGroup {
  String get label => switch (this) {
        TopicGroup.monitoring => 'Fetal monitoring & growth',
        TopicGroup.preterm => 'Preterm birth',
        TopicGroup.labour => 'Labour & delivery',
        TopicGroup.immunology => 'Immunology',
      };
}

class TopicRegistry {
  static const Map<TopicGroup, List<ClinicalTopic>> byGroup = {
    TopicGroup.monitoring: [kCtgTopic, kFgrTopic],
    TopicGroup.preterm: [kPretermLabourTopic, kPpromTopic],
    TopicGroup.labour: [kInductionTopic, kVbacTopic, kCaesareanTopic],
    TopicGroup.immunology: [kRhTopic],
  };

  static List<ClinicalTopic> get all =>
      [for (final list in byGroup.values) ...list];

  static ClinicalTopic? byId(String id) {
    for (final t in all) {
      if (t.id == id) return t;
    }
    return null;
  }

  static List<ClinicalTopic> search(String q) {
    final needle = q.trim().toLowerCase();
    if (needle.isEmpty) return all;
    return all
        .where((t) =>
            t.name.toLowerCase().contains(needle) ||
            t.subtitle.toLowerCase().contains(needle))
        .toList();
  }
}
