import '../models/trial.dart';
import 'trials/obstetric_trials.dart';
import 'trials/other_trials.dart';
import 'trials/obstetric_trials_2.dart';
import 'trials/gynae_trials.dart';

class TrialRegistry {
  static const List<Trial> all = [
    kMagpie,
    kAspre,
    kWoman,
    kEmotive,
    kTruffle,
    kArrive,
    kTermBreech,
    kOracle,
    kMoms,
    kAchois,
    kLegro,
    kSenatTtts,
    kLandonVbac,
    kChips,
    kHypitat,
    kHapo,
    kTermProm,
    kLigginsHowie,
    kActoMgso4,
    kGrit,
    kChampion,
    kWhi,
    kLacc,
    kSolo1,
    kPortec3,
  ];

  static Map<TrialCategory, List<Trial>> get byCategory {
    final map = <TrialCategory, List<Trial>>{};
    for (final t in all) {
      map.putIfAbsent(t.category, () => []).add(t);
    }
    return map;
  }

  static Trial? byId(String id) {
    for (final t in all) {
      if (t.id == id) return t;
    }
    return null;
  }

  static List<Trial> search(String q) {
    final needle = q.trim().toLowerCase();
    if (needle.isEmpty) return all;
    return all
        .where((t) =>
            t.acronym.toLowerCase().contains(needle) ||
            t.name.toLowerCase().contains(needle) ||
            t.takeaway.toLowerCase().contains(needle) ||
            t.category.label.toLowerCase().contains(needle))
        .toList();
  }
}
