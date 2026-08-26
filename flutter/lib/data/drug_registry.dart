import '../models/drug.dart';
import 'drugs/uterotonics.dart';
import 'drugs/antihypertensives.dart';
import 'drugs/prophylaxis_fertility.dart';
import 'drugs/supportive_drugs.dart';
import 'drugs/hormonal_drugs.dart';
import 'drugs/specialist_drugs.dart';
import 'drugs/oncology_drugs.dart';

enum DrugGroup {
  uterotonic,
  antihypertensive,
  prophylaxis,
  antimicrobial,
  supportive,
  hormonal,
  fertility,
  immunoglobulin,
  oncology
}

extension DrugGroupInfo on DrugGroup {
  String get label => switch (this) {
        DrugGroup.uterotonic => 'Uterotonics & haemostatics',
        DrugGroup.antihypertensive => 'Antihypertensives & anticonvulsants',
        DrugGroup.prophylaxis => 'Prophylaxis & fetal therapy',
        DrugGroup.antimicrobial => 'Antimicrobials',
        DrugGroup.supportive => 'Analgesia & antiemetics',
        DrugGroup.hormonal => 'Hormonal therapy',
        DrugGroup.immunoglobulin => 'Immunoglobulin & haematinics',
        DrugGroup.oncology => 'Oncology',
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
    DrugGroup.antimicrobial: [
      kErythromycin,
      kCefazolin,
      kBenzylpenicillin,
      kMetronidazole,
      kFluconazole,
    ],
    DrugGroup.supportive: [
      kParacetamol,
      kNsaids,
      kDoxylaminePyridoxine,
      kOndansetron,
    ],
    DrugGroup.hormonal: [
      kCoc,
      kLngIus,
      kMht,
      kGnrhAgonist,
    ],
    DrugGroup.fertility: [
      kLetrozole,
      kClomiphene,
      kGonadotrophins,
    ],
    DrugGroup.immunoglobulin: [
      kAntiD,
      kIvIron,
    ],
    DrugGroup.oncology: [
      kTamoxifen,
      kCarboplatinPaclitaxel,
      kOlaparib,
      kBevacizumab,
      kPembrolizumab,
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
