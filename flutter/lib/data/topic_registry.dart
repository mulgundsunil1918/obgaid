import '../models/topic.dart';
import 'topics/monitoring_topics.dart';
import 'topics/preterm_topics.dart';
import 'topics/labour_topics.dart';
import 'topics/gynae_topics.dart';
import 'topics/womens_health_topics.dart';
import 'topics/fertility_topics.dart';
import 'topics/medicine_topics.dart';
import 'topics/pathology_imaging_topics.dart';
import 'topics/procedure_topics.dart';
import 'topics/procedure_topics_obs.dart';
import 'topics/procedure_topics_3.dart';
import 'topics/procedure_topics_gyn.dart';

enum TopicGroup {
  monitoring,
  preterm,
  labour,
  immunology,
  gynaecology,
  womensHealth,
  reproductive,
  medicine,
  diagnostics,
  procedures
}

extension TopicGroupInfo on TopicGroup {
  String get label => switch (this) {
        TopicGroup.monitoring => 'Fetal monitoring & growth',
        TopicGroup.preterm => 'Preterm birth',
        TopicGroup.labour => 'Labour & delivery',
        TopicGroup.immunology => 'Immunology',
        TopicGroup.gynaecology => 'Gynaecology',
        TopicGroup.womensHealth => 'Women\'s health across the lifespan',
        TopicGroup.reproductive => 'Reproductive medicine',
        TopicGroup.medicine => 'Maternal & fetal medicine',
        TopicGroup.diagnostics => 'Pathology & imaging',
        TopicGroup.procedures => 'Procedures',
      };
}

class TopicRegistry {
  static const Map<TopicGroup, List<ClinicalTopic>> byGroup = {
    TopicGroup.monitoring: [kCtgTopic, kFgrTopic],
    TopicGroup.preterm: [kPretermLabourTopic, kPpromTopic],
    TopicGroup.labour: [kInductionTopic, kVbacTopic, kCaesareanTopic],
    TopicGroup.immunology: [kRhTopic],
    TopicGroup.gynaecology: [
      kPcosTopic,
      kFibroidsTopic,
      kEndometriosisTopic,
      kAdenomyosisTopic,
    ],
    TopicGroup.womensHealth: [
      kContraceptionTopic,
      kMenopauseTopic,
      kUrogynaeTopic,
    ],
    TopicGroup.reproductive: [kInfertilityTopic, kOhssTopic],
    TopicGroup.medicine: [kMaternalMedicineTopic, kFetalMedicineTopic],
    TopicGroup.diagnostics: [kPathologyTopic, kImagingTopic],
    TopicGroup.procedures: [
      kVaginalExamTopic,
      kOxytocinInfusionTopic,
      kUterineExplorationTopic,
      kVaginalSurgeryTopic,
      kAvdTopic,
      kPerinealRepairTopic,
      kManualRemovalTopic,
      kBalloonTamponadeTopic,
      kPapSmearTopic,
      kColposcopyTopic,
      kEndometrialBiopsyTopic,
      kHysteroscopyTopic,
      kLaparoscopyTopic,
      kSurgicalMiscarriageTopic,
      kIucdTopic,
      kImplantTopic,
    ],
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
