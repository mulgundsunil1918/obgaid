import '../models/algorithm.dart';
import 'algorithms/haemorrhage_algorithms.dart';
import 'algorithms/hypertensive_algorithms.dart';
import 'algorithms/collapse_sepsis_algorithms.dart';
import 'algorithms/intrapartum_algorithms.dart';
import 'algorithms/gynae_algorithms.dart';

/// Emergency grouping for the hub. Ordered by how a clinician thinks about
/// them, not alphabetically.
enum EmergencyGroup { haemorrhage, hypertensive, collapse, intrapartum, gynae }

extension EmergencyGroupInfo on EmergencyGroup {
  String get label => switch (this) {
        EmergencyGroup.haemorrhage => 'Haemorrhage',
        EmergencyGroup.hypertensive => 'Hypertensive disorders',
        EmergencyGroup.collapse => 'Collapse & sepsis',
        EmergencyGroup.intrapartum => 'Intrapartum',
        EmergencyGroup.gynae => 'Gynaecological',
      };
}

class AlgorithmRegistry {
  static const Map<EmergencyGroup, List<Algorithm>> byGroup = {
    EmergencyGroup.haemorrhage: [
      kPphAlgorithm,
      kAbruptionAlgorithm,
      kUterineRuptureAlgorithm,
    ],
    EmergencyGroup.hypertensive: [
      kEclampsiaAlgorithm,
      kSevereHypertensionAlgorithm,
    ],
    EmergencyGroup.collapse: [
      kMaternalCollapseAlgorithm,
      kAfeAlgorithm,
      kSepsisAlgorithm,
    ],
    EmergencyGroup.intrapartum: [
      kShoulderDystociaAlgorithm,
      kCordProlapseAlgorithm,
    ],
    EmergencyGroup.gynae: [
      kEctopicAlgorithm,
      kOvarianTorsionAlgorithm,
    ],
  };

  static List<Algorithm> get all =>
      [for (final list in byGroup.values) ...list];

  static Algorithm? byId(String id) {
    for (final a in all) {
      if (a.id == id) return a;
    }
    return null;
  }

  static List<Algorithm> search(String q) {
    final needle = q.trim().toLowerCase();
    if (needle.isEmpty) return all;
    return all
        .where((a) =>
            a.name.toLowerCase().contains(needle) ||
            a.subtitle.toLowerCase().contains(needle))
        .toList();
  }
}
