import '../../models/topic.dart';

const kVulvalTopic = ClinicalTopic(
  id: 'vulval-disorders',
  name: 'Vulval disorders',
  subtitle: 'Lichen sclerosus · lichen planus · VIN · vulvodynia',
  headline: 'Vulval symptoms are under-examined and over-treated with '
      'antifungals. Most women with lichen sclerosus have seen several '
      'clinicians before anyone looked, and the delay costs architecture that '
      'does not come back.',
  keyFacts: [
    ('Lichen sclerosus — cancer risk', 'Around 2–5% lifetime risk of vulval '
        'squamous carcinoma'),
    ('First-line treatment', 'Ultrapotent topical steroid — clobetasol '
        'propionate 0.05%'),
    ('Biopsy', 'Any lesion that fails to respond to adequate treatment'),
    ('HPV-independent VIN', 'Arises in lichen sclerosus; higher malignant '
        'potential'),
    ('Follow-up', 'Lifelong self-examination; review any change promptly'),
  ],
  sections: [
    TopicSection('Assessment', [
      TopicPoint('LOOK. The commonest failure in vulval medicine is treating '
          'by telephone or by history alone', critical: true),
      TopicPoint('Good light, and a chaperone offered and recorded'),
      TopicPoint('Ask about itch, soreness, splitting, dyspareunia, bleeding, '
          'and difficulty passing urine'),
      TopicPoint('Ask specifically about the effect on sex and on sleep — '
          'both are commonly severe and rarely volunteered'),
      TopicPoint('Examine the whole vulva, perineum and perianal skin, and '
          'record the findings on a diagram or with consented photography'),
      TopicPoint('Look in the mouth and at the rest of the skin — lichen '
          'planus and psoriasis declare themselves elsewhere',
          critical: true),
      TopicPoint('treat recurrent "thrush" repeatedly without examining and '
          'without a swab', avoid: true,
          detail: 'This is the single commonest route by which lichen '
              'sclerosus goes undiagnosed for years.'),
    ]),
    TopicSection('Lichen sclerosus', [
      TopicPoint('White, atrophic, crinkled "cigarette paper" skin in a '
          'figure-of-eight around vulva and anus, sparing the vagina',
          critical: true),
      TopicPoint('Intense itch, worse at night; soreness, splitting and '
          'bleeding from fissures'),
      TopicPoint('Architectural change: loss of labia minora, burying of the '
          'clitoris under fused hood, narrowing of the introitus',
          critical: true),
      TopicPoint('Bimodal age distribution — prepubertal girls and '
          'postmenopausal women — but it occurs at any age'),
      TopicPoint('Autoimmune associations, particularly thyroid disease; '
          'check thyroid function'),
      TopicPoint('Diagnosis is usually clinical. Biopsy where the appearance '
          'is atypical, where treatment fails, or where malignancy is '
          'suspected', critical: true),
      TopicPoint('Treatment: clobetasol propionate 0.05% ointment, daily for '
          '4 weeks, alternate days for 4 weeks, twice weekly for 4 weeks, '
          'then as needed to keep the skin normal', critical: true),
      TopicPoint('Emollient as a soap substitute, and stop all soaps, wipes '
          'and shower gels'),
      TopicPoint('Warn her that treatment controls the disease and prevents '
          'progression; it does not reverse architecture already lost',
          critical: true),
      TopicPoint('withhold steroid for fear of thinning the skin', avoid: true,
          detail: 'Undertreatment is the far commoner error. The atrophy is '
              'the disease, not the treatment.'),
      TopicPoint('Surgery only for function — division of adhesions, '
          'perineoplasty for introital narrowing — never for the skin '
          'disease itself', critical: true),
      TopicPoint('In girls, it usually improves at puberty but does not '
          'reliably resolve; do not discharge without review'),
    ]),
    TopicSection('Lichen planus', [
      TopicPoint('Unlike lichen sclerosus, it INVOLVES THE VAGINA and can '
          'cause vaginal stenosis and complete obliteration', critical: true),
      TopicPoint('Erosive form: glazed erythema at the introitus with a white '
          'reticulate border — Wickham striae'),
      TopicPoint('Look in the mouth; oral involvement is common and confirms '
          'the picture', critical: true),
      TopicPoint('Biopsy is more often needed than in lichen sclerosus'),
      TopicPoint('Ultrapotent topical steroid; vaginal steroid or '
          'hydrocortisone pessaries where the vagina is involved'),
      TopicPoint('Dilators to maintain vaginal patency', critical: true),
      TopicPoint('Second line: topical calcineurin inhibitors, or systemic '
          'immunosuppression under specialist care'),
      TopicPoint('Small but real malignant potential — keep under review'),
    ]),
    TopicSection('Vulval intraepithelial neoplasia', [
      TopicPoint('HPV-ASSOCIATED (usual type, HSIL): younger women, smokers, '
          'multifocal, often warty or pigmented. Associated with cervical and '
          'anal disease — examine both.', critical: true),
      TopicPoint('HPV-INDEPENDENT (differentiated VIN): older women, arises '
          'in lichen sclerosus or lichen planus, unifocal, subtle. Higher and '
          'faster progression to cancer.', critical: true),
      TopicPoint('Differentiated VIN is the dangerous one and the easy one to '
          'miss, because it looks like the background dermatosis',
          critical: true),
      TopicPoint('Biopsy anything that is raised, ulcerated, pigmented, or '
          'simply not settling', critical: true),
      TopicPoint('Treatment: wide local excision, or imiquimod for HPV-related '
          'disease where cancer has been excluded'),
      TopicPoint('Laser ablation only where invasion has been confidently '
          'excluded by biopsy'),
      TopicPoint('Smoking cessation; HPV vaccination as prevention'),
      TopicPoint('Long-term follow-up — recurrence is common'),
    ]),
    TopicSection('Vulvodynia', [
      TopicPoint('Vulval pain of at least three months without an '
          'identifiable cause — a diagnosis of exclusion, not a label for '
          'unexplained symptoms', critical: true),
      TopicPoint('Localised provoked vestibulodynia is the commonest '
          'pattern: pain on touch or attempted penetration'),
      TopicPoint('Examine to exclude dermatosis, infection and atrophy '
          'before applying the label'),
      TopicPoint('Cotton-bud mapping identifies the painful area'),
      TopicPoint('Management is multimodal: skin care, topical local '
          'anaesthetic, pelvic floor physiotherapy, psychosexual support, '
          'and neuromodulators such as amitriptyline or gabapentin'),
      TopicPoint('tell her the pain is psychological', avoid: true,
          detail: 'It is a genuine neuropathic pain syndrome. This sentence '
              'ends the therapeutic relationship and is frequently reported '
              'by women as the worst part of their care.'),
      TopicPoint('Address the effect on the relationship explicitly'),
    ]),
    TopicSection('Other conditions to recognise', [
      TopicPoint('Vulval eczema and contact dermatitis — often from the '
          'treatments already applied', critical: true),
      TopicPoint('Psoriasis — well-demarcated, often without scale in flexures'),
      TopicPoint('Recurrent candidiasis — confirm on culture before treating '
          'repeatedly'),
      TopicPoint('Bartholin cyst and abscess — a cyst needs no treatment '
          'unless symptomatic; an abscess needs marsupialisation or a '
          'balloon catheter rather than simple incision, which recurs',
          critical: true),
      TopicPoint('In a woman over 40 with a new Bartholin mass, consider '
          'carcinoma and biopsy', critical: true),
      TopicPoint('Vulval Crohn disease — knife-cut fissures and oedema'),
      TopicPoint('Hidradenitis suppurativa — recurrent painful nodules and '
          'sinuses in apocrine skin'),
      TopicPoint('Behçet disease — recurrent oral and genital ulceration'),
      TopicPoint('Female genital mutilation: recognise, document, offer '
          'deinfibulation, and know the legal reporting duty in your '
          'jurisdiction', critical: true),
    ]),
    TopicSection('When to suspect cancer', [
      TopicPoint('A persistent lump, ulcer or raised area', critical: true),
      TopicPoint('Bleeding not explained by fissuring'),
      TopicPoint('Pain or itch that does not respond to adequate treatment',
          critical: true),
      TopicPoint('Any change in a known dermatosis'),
      TopicPoint('New pigmentation'),
      TopicPoint('Groin lymphadenopathy'),
      TopicPoint('Biopsy rather than another prescription. The commonest '
          'reason for late diagnosis of vulval cancer is repeated topical '
          'treatment without a biopsy.', critical: true),
    ]),
  ],
  sources: [
    'British Association of Dermatologists — Guidelines for the management of '
        'lichen sclerosus, 2018.',
    'British Society for the Study of Vulval Disease — guidelines on vulval '
        'skin disorders and on vulvodynia.',
    'RCOG Green-top Guideline 58 on vulval skin disorders is archived; the '
        'BAD and BSSVD guidelines above are the current authority.',
    'Lee A, Bradford J, Fischer G. Long-term management of adult vulvar '
        'lichen sclerosus. JAMA Dermatol 2015;151:1061–1067.',
    'FOGSI GCPR — Vulval Disorders; National Cancer Grid of India guidelines '
        'on vulval cancer; MoHFW guidance on management of RTI/STI.',
  ],
);
