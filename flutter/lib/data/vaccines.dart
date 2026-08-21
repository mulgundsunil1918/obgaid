import '../models/reference_data.dart';

/// Maternal immunisation (spec §50). Every entry carries country,
/// organisation, year, schedule and source, because §50 requires it.
const kVaccines = <VaccineStage, List<VaccineRecommendation>>{
  VaccineStage.preconception: [
    VaccineRecommendation(
      vaccine: 'MMR (rubella)',
      country: 'India',
      organisation: 'Ministry of Health & Family Welfare / FOGSI',
      year: 2023,
      schedule: 'Two doses at least 4 weeks apart in seronegative women',
      timing: 'Before conception',
      source: 'National Immunization Schedule; FOGSI preconception care '
          'recommendations',
      live: true,
      notes: [
        'Avoid pregnancy for 4 weeks after vaccination.',
        'Congenital rubella syndrome remains a preventable cause of deafness, '
            'cataract and cardiac disease.',
        'Cannot be given during pregnancy — vaccinate postpartum instead if '
            'seronegativity is discovered antenatally.',
      ],
    ),
    VaccineRecommendation(
      vaccine: 'Varicella',
      country: 'India',
      organisation: 'FOGSI / IAP',
      year: 2023,
      schedule: 'Two doses 4–8 weeks apart in seronegative women',
      timing: 'Before conception',
      source: 'FOGSI preconception care recommendations',
      live: true,
      notes: [
        'Avoid pregnancy for 4 weeks after vaccination.',
        'Varicella pneumonia in pregnancy carries substantial maternal '
            'mortality.',
      ],
    ),
    VaccineRecommendation(
      vaccine: 'Hepatitis B',
      country: 'India',
      organisation: 'Ministry of Health & Family Welfare',
      year: 2023,
      schedule: 'Three doses at 0, 1 and 6 months',
      timing: 'Before conception, or during pregnancy if at risk',
      source: 'National Viral Hepatitis Control Programme',
      notes: [
        'Inactivated — may be given in pregnancy where risk warrants it.',
      ],
    ),
    VaccineRecommendation(
      vaccine: 'HPV',
      country: 'India',
      organisation: 'MoHFW / FOGSI',
      year: 2023,
      schedule: 'Two doses for ages 9–14; three doses from 15 years',
      timing: 'Before conception',
      source: 'National HPV vaccination guidance',
      notes: [
        'Not recommended during pregnancy, though inadvertent administration '
            'has not been associated with harm.',
        'Complete or resume the course postpartum.',
      ],
    ),
  ],
  VaccineStage.pregnancy: [
    VaccineRecommendation(
      vaccine: 'Td (tetanus and diphtheria)',
      country: 'India',
      organisation: 'Ministry of Health & Family Welfare',
      year: 2023,
      schedule: 'Td-1 at first antenatal contact, Td-2 four weeks later. A '
          'single booster if two doses were given within the past 3 years.',
      timing: 'Any trimester; early registration preferred',
      source: 'National Immunization Schedule, Government of India',
      notes: [
        'India replaced tetanus toxoid with Td to address waning diphtheria '
            'immunity in adults.',
        'Maternal and neonatal tetanus elimination was validated in India in '
            '2015 — sustaining it depends on this schedule.',
      ],
    ),
    VaccineRecommendation(
      vaccine: 'Tdap (tetanus, diphtheria, acellular pertussis)',
      country: 'United States / United Kingdom',
      organisation: 'ACOG / CDC; UKHSA',
      year: 2024,
      schedule: 'One dose in EVERY pregnancy, between 27 and 36 weeks',
      timing: '27–36 weeks, ideally at the earlier end',
      source: 'ACOG Committee Opinion 718; CDC ACIP recommendations',
      notes: [
        'Given in every pregnancy regardless of interval, because the aim is '
            'transplacental antibody for the newborn rather than maternal '
            'protection.',
        'Protects the infant in the window before their own primary course.',
        'Not part of the Indian national schedule, where Td is used.',
      ],
    ),
    VaccineRecommendation(
      vaccine: 'Influenza (inactivated)',
      country: 'India / global',
      organisation: 'WHO; MoHFW; ACOG',
      year: 2023,
      schedule: 'One dose annually',
      timing: 'Any trimester',
      source: 'WHO position paper on influenza vaccines; MoHFW seasonal '
          'influenza guidance',
      notes: [
        'Pregnant women are a WHO priority group — influenza in pregnancy '
            'carries a markedly raised risk of severe disease and death.',
        'Protects the infant for the first months of life.',
        'The live attenuated intranasal vaccine is contraindicated.',
      ],
    ),
    VaccineRecommendation(
      vaccine: 'COVID-19',
      country: 'India / global',
      organisation: 'MoHFW; WHO; ACOG',
      year: 2023,
      schedule: 'Per current national guidance; primary course and boosters '
          'as recommended',
      timing: 'Any trimester',
      source: 'MoHFW guidance on COVID-19 vaccination of pregnant women; WHO '
          'interim recommendations',
      notes: [
        'Recommendations have changed repeatedly — verify the current national '
            'position rather than relying on this entry.',
      ],
    ),
    VaccineRecommendation(
      vaccine: 'RSV (RSVpreF)',
      country: 'United States / Europe',
      organisation: 'CDC ACIP; EMA',
      year: 2024,
      schedule: 'Single dose between 32 and 36 weeks, seasonally',
      timing: '32–36 weeks',
      source: 'CDC ACIP recommendations for maternal RSV vaccination',
      notes: [
        'Given for infant protection against RSV lower respiratory tract '
            'infection.',
        'Not currently part of the Indian national schedule.',
      ],
    ),
  ],
  VaccineStage.postpartum: [
    VaccineRecommendation(
      vaccine: 'MMR (rubella)',
      country: 'India / global',
      organisation: 'MoHFW; ACOG',
      year: 2023,
      schedule: 'Two doses 4 weeks apart, starting before discharge',
      timing: 'Immediately postpartum in seronegative women',
      source: 'National Immunization Schedule; ACOG guidance',
      live: true,
      notes: [
        'Compatible with breastfeeding.',
        'Give before discharge — the commonest reason it never happens is '
            'that she does not come back.',
        'Advise against pregnancy for 4 weeks; offer contraception at the same '
            'visit.',
      ],
    ),
    VaccineRecommendation(
      vaccine: 'Varicella',
      country: 'India / global',
      organisation: 'FOGSI; ACOG',
      year: 2023,
      schedule: 'Two doses 4–8 weeks apart',
      timing: 'Postpartum in seronegative women',
      source: 'ACOG Committee Opinion 741',
      live: true,
      notes: ['Compatible with breastfeeding.'],
    ),
    VaccineRecommendation(
      vaccine: 'HPV',
      country: 'India / global',
      organisation: 'MoHFW; WHO',
      year: 2023,
      schedule: 'Complete or resume the age-appropriate course',
      timing: 'Postpartum',
      source: 'WHO position paper on HPV vaccines',
      notes: ['Compatible with breastfeeding.'],
    ),
  ],
  VaccineStage.contraindicated: [
    VaccineRecommendation(
      vaccine: 'MMR · Varicella · Live attenuated influenza · BCG · Oral '
          'typhoid',
      country: 'Global',
      organisation: 'WHO; CDC; MoHFW',
      year: 2023,
      schedule: 'Not to be given during pregnancy',
      timing: 'Defer to the postpartum period',
      source: 'WHO and CDC general recommendations on immunisation',
      live: true,
      notes: [
        'Live attenuated vaccines are contraindicated on theoretical grounds.',
        'Inadvertent administration is NOT an indication for termination — no '
            'case of congenital rubella syndrome has followed inadvertent MMR '
            'in pregnancy.',
        'Yellow fever is an exception: give it where exposure is unavoidable '
            'and the risk of disease outweighs the theoretical vaccine risk.',
      ],
    ),
  ],
};
