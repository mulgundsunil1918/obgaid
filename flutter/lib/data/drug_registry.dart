import '../models/drug.dart';
import 'drugs/uterotonics.dart';
import 'drugs/antihypertensives.dart';
import 'drugs/prophylaxis_fertility.dart';

enum DrugGroup { uterotonic, antihypertensive, prophylaxis, fertility }

extension DrugGroupInfo on DrugGroup {
  String get label => switch (this) {
        DrugGroup.uterotonic => 'Uterotonics & haemostatics',
        DrugGroup.antihypertensive => 'Antihypertensives & anticonvulsants',
        DrugGroup.prophylaxis => 'Prophylaxis & fetal therapy',
        DrugGroup.fertility => 'Fertility',
      };
}

class DrugRegistry {
  static const Map<DrugGroup, List<Drug>> byGroup = {
    DrugGroup.uterotonic: [
      kOxytocin,
      kMisoprostol,
      kCarboprost,
      kMethylergometrine,
      kTranexamicAcid,
    ],
    DrugGroup.antihypertensive: [
      kLabetalol,
      kNifedipine,
      kHydralazine,
      kMagnesiumSulphate,
    ],
    DrugGroup.prophylaxis: [
      kAspirin,
      kEnoxaparin,
      kBetamethasone,
    ],
    DrugGroup.fertility: [
      kLetrozole,
      kClomiphene,
    ],
  };

  static List<Drug> get all => [for (final list in byGroup.values) ...list];

  static Drug? byId(String id) {
    for (final d in all) {
      if (d.id == id) return d;
    }
    return null;
  }

  static List<Drug> search(String q) {
    final needle = q.trim().toLowerCase();
    if (needle.isEmpty) return all;
    return all
        .where((d) =>
            d.generic.toLowerCase().contains(needle) ||
            d.drugClass.toLowerCase().contains(needle) ||
            d.brandNames.any((b) => b.toLowerCase().contains(needle)) ||
            d.indications.any((i) => i.toLowerCase().contains(needle)))
        .toList();
  }
}
