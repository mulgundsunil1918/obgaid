import '../../models/topic.dart';

/// Procedure references follow the §57 field list as section headings:
/// indications, contraindications, preparation, equipment, steps,
/// complications, post-procedure care, documentation and consent.

const kBalloonTamponadeTopic = ClinicalTopic(
  id: 'proc-balloon',
  name: 'Intrauterine balloon tamponade',
  subtitle: 'Including the condom catheter',
  headline: 'A condom tied to a Foley catheter and inflated with saline costs '
      'almost nothing, is available in any labour room, and stops most atonic '
      'haemorrhage that has not responded to drugs. Judge success in fifteen '
      'minutes, not an hour.',
  keyFacts: [
    ('Inflation volume', '250 – 500 mL warm saline'),
    ('Assess success at', '15 minutes'),
    ('Leave in situ', '4 – 24 hours'),
    ('Success rate', '~85% for atonic haemorrhage'),
    ('Deflate', 'Gradually, with theatre available'),
  ],
  sections: [
    TopicSection('Indications', [
      TopicPoint('Atonic postpartum haemorrhage not controlled by uterotonics'),
      TopicPoint('Bleeding from a lower segment placental bed after caesarean'),
      TopicPoint('As a temporising measure while arranging surgery or transfer',
          critical: true),
      TopicPoint('A negative tamponade test — bleeding continues despite '
          'inflation — predicts the need for laparotomy and should prompt it '
          'rather than delay it', critical: true),
    ]),
    TopicSection('Contraindications', [
      TopicPoint('Uterine rupture'),
      TopicPoint('Bleeding from genital tract trauma rather than the uterus'),
      TopicPoint('Retained placental tissue — remove it first'),
      TopicPoint('Purulent infection of the uterus or cervix'),
      TopicPoint('Suspected morbidly adherent placenta requiring laparotomy'),
    ]),
    TopicSection('Preparation and equipment', [
      TopicPoint('Purpose-made device (Bakri, BT-Cath) where available'),
      TopicPoint('CONDOM CATHETER alternative: a condom tied securely over the '
          'shaft of a size 16–20 Foley catheter with silk or a cotton tie',
          critical: true),
      TopicPoint('Warm saline, a giving set or 50 mL syringe, and a clamp'),
      TopicPoint('Adequate analgesia or anaesthesia'),
      TopicPoint('Antibiotic cover'),
      TopicPoint('Ensure the bladder is catheterised separately'),
    ]),
    TopicSection('Steps', [
      TopicPoint('Confirm the uterus is empty and the genital tract intact'),
      TopicPoint('Insert the deflated balloon into the uterine cavity, above '
          'the cervical os, under direct vision or by hand'),
      TopicPoint('Inflate with 250–500 mL of warm saline until bleeding stops '
          'or resistance is felt'),
      TopicPoint('Pack the vagina if the balloon threatens to extrude'),
      TopicPoint('Apply gentle traction and secure the catheter to the thigh'),
      TopicPoint('Continue oxytocin infusion throughout'),
      TopicPoint('Record the volume instilled and the time', critical: true),
    ]),
    TopicSection('Complications', [
      TopicPoint('Failure to control bleeding — escalate rather than reinflate'),
      TopicPoint('Expulsion of the balloon'),
      TopicPoint('Endometritis'),
      TopicPoint('Uterine perforation, particularly if the uterus is already '
          'traumatised'),
      TopicPoint('Concealed ongoing bleeding above the balloon',
          critical: true),
    ]),
    TopicSection('Post-procedure care and removal', [
      TopicPoint('Continuous observation on a high-dependency area'),
      TopicPoint('Hourly pulse, blood pressure and urine output; monitor for '
          'concealed loss'),
      TopicPoint('Antibiotics while the balloon is in place'),
      TopicPoint('Thromboprophylaxis once bleeding has settled'),
      TopicPoint('Deflate gradually after 4–24 hours, in daylight hours, with '
          'theatre and blood available', critical: true),
      TopicPoint('Observe for a further period after removal before discharge '
          'from high-dependency care'),
    ]),
    TopicSection('Documentation and consent', [
      TopicPoint('Estimated blood loss at the time of insertion'),
      TopicPoint('Volume instilled, time of insertion, and who performed it'),
      TopicPoint('Response at 15 minutes'),
      TopicPoint('Time and circumstances of removal'),
      TopicPoint('Consent is usually taken in an emergency — record what was '
          'explained and to whom, and debrief afterwards', critical: true),
    ]),
  ],
  sources: [
    'RCOG Green-top Guideline 52 — Prevention and Management of Postpartum '
        'Haemorrhage.',
    'Condom catheter tamponade: Akhter S et al. Medscape J Med 2003 '
        '(Bangladesh); widely adopted in South Asian practice.',
    'FOGSI GCPR — Postpartum Haemorrhage.',
  ],
);

const kIucdTopic = ClinicalTopic(
  id: 'proc-iucd',
  name: 'IUCD insertion & removal',
  subtitle: 'Interval · postpartum · post-abortion',
  headline: 'Postpartum insertion within 48 hours of birth is a mainstay of '
      'the Indian family planning programme. Expulsion is commoner than at '
      'interval insertion, and warning her about that at the time is what '
      'keeps her from concluding the method failed her.',
  keyFacts: [
    ('Postpartum window', 'Within 48 hours, or after 4 weeks'),
    ('Post-abortion', 'Immediately, if no infection'),
    ('Copper IUD duration', '5 – 10 years'),
    ('LNG-IUS duration', '5 – 8 years by device'),
    ('Perforation risk', '~1 – 2 per 1000'),
    ('Expulsion — highest risk', 'First 3 months'),
  ],
  sections: [
    TopicSection('Indications', [
      TopicPoint('Contraception — long-acting and reversible'),
      TopicPoint('Emergency contraception, within 120 hours (copper only)'),
      TopicPoint('Heavy menstrual bleeding, adenomyosis, endometrial '
          'protection (levonorgestrel system)'),
      TopicPoint('Endometrial hyperplasia without atypia'),
    ]),
    TopicSection('Contraindications', [
      TopicPoint('Pregnancy', critical: true),
      TopicPoint('Current pelvic infection or purulent cervicitis'),
      TopicPoint('Unexplained abnormal uterine bleeding, until investigated',
          critical: true),
      TopicPoint('Known uterine cavity distortion'),
      TopicPoint('Gestational trophoblastic disease with raised hCG'),
      TopicPoint('Cervical or endometrial malignancy'),
      TopicPoint('Copper allergy or Wilson disease (copper devices)'),
    ]),
    TopicSection('Preparation and equipment', [
      TopicPoint('Exclude pregnancy; screen for sexually transmitted infection '
          'where indicated'),
      TopicPoint('Explain the procedure, the expected bleeding pattern and the '
          'expulsion risk', critical: true),
      TopicPoint('Speculum, tenaculum, uterine sound, sponge holder, '
          'antiseptic, the device'),
      TopicPoint('For postpartum insertion, a long placental forceps or a '
          'dedicated postpartum inserter'),
      TopicPoint('Have resuscitation available for the rare vasovagal '
          'collapse'),
    ]),
    TopicSection('Steps — interval insertion', [
      TopicPoint('Bimanual examination to determine uterine size and version',
          critical: true,
          detail: 'Sounding an anteverted uterus as though it were retroverted '
              'is how perforations happen.'),
      TopicPoint('Insert speculum, clean the cervix'),
      TopicPoint('Apply tenaculum to the anterior lip to straighten the canal'),
      TopicPoint('Sound the uterus — expect 6–9 cm'),
      TopicPoint('Load and insert the device using the withdrawal technique to '
          'the fundus'),
      TopicPoint('Trim the threads to 3 cm from the external os'),
      TopicPoint('Teach her to check the threads'),
    ]),
    TopicSection('Steps — postpartum insertion', [
      TopicPoint('Within 10 minutes of placental delivery, or within 48 hours',
          critical: true),
      TopicPoint('Hold the device with a long placental forceps and place it '
          'at the fundus'),
      TopicPoint('Confirm fundal placement by the length of instrument '
          'inserted, not by sounding'),
      TopicPoint('Leave the threads long — they can be trimmed at the '
          '6-week visit once the uterus has involuted'),
      TopicPoint('At caesarean, place through the uterine incision before '
          'closure'),
      TopicPoint('insert between 48 hours and 4 weeks postpartum', avoid: true,
          detail: 'Expulsion and perforation risk are both highest in that '
              'window.'),
    ]),
    TopicSection('Complications', [
      TopicPoint('Expulsion — commonest in the first 3 months and after '
          'postpartum insertion'),
      TopicPoint('Perforation — about 1–2 per 1000, higher in breastfeeding '
          'women and with postpartum insertion', critical: true),
      TopicPoint('Pelvic infection — risk confined largely to the first 20 '
          'days after insertion'),
      TopicPoint('Vasovagal reaction during insertion'),
      TopicPoint('Malposition and embedding'),
      TopicPoint('Pregnancy with the device in situ — exclude ectopic',
          critical: true),
    ]),
    TopicSection('Lost threads', [
      TopicPoint('Exclude pregnancy first', critical: true),
      TopicPoint('Ultrasound to locate the device within the cavity'),
      TopicPoint('If not seen on ultrasound, a plain abdominal radiograph to '
          'exclude an intra-abdominal device', critical: true),
      TopicPoint('Retrieve with a thread retriever or artery forceps; '
          'hysteroscopy where that fails'),
      TopicPoint('A perforated device in the abdomen requires laparoscopic '
          'removal'),
    ]),
    TopicSection('Documentation and consent', [
      TopicPoint('Device type, batch and expiry'),
      TopicPoint('Sound length and ease of insertion'),
      TopicPoint('Thread length'),
      TopicPoint('Expected removal or replacement date', critical: true),
      TopicPoint('What was explained about bleeding pattern, expulsion and '
          'when to seek help'),
      TopicPoint('For postpartum insertion, that the woman consented before '
          'labour where possible — consent in advanced labour is not valid '
          'consent', critical: true),
    ]),
  ],
  sources: [
    'FSRH Clinical Guideline — Intrauterine Contraception.',
    'WHO Medical Eligibility Criteria for Contraceptive Use, 5th edition.',
    'Ministry of Health & Family Welfare, Government of India — Postpartum '
        'IUCD reference manual.',
  ],
);

const kEndometrialBiopsyTopic = ClinicalTopic(
  id: 'proc-endometrial-biopsy',
  name: 'Endometrial sampling',
  subtitle: 'Pipelle · indications · pitfalls',
  headline: 'A negative Pipelle in a woman with persistent postmenopausal '
      'bleeding does not close the case. It samples a fraction of the cavity '
      'and misses focal lesions — persistent bleeding needs hysteroscopy '
      'whatever the biopsy said.',
  keyFacts: [
    ('Postmenopausal bleeding — sample if', 'Endometrium > 4 mm'),
    ('Age threshold for sampling in AUB', '45 years'),
    ('Pipelle sensitivity, endometrial cancer', '~91% postmenopausal'),
    ('Inadequate sample rate', 'Up to 20% postmenopausal'),
  ],
  sections: [
    TopicSection('Indications', [
      TopicPoint('Postmenopausal bleeding with an endometrium above 4 mm',
          critical: true),
      TopicPoint('Abnormal uterine bleeding at 45 or over'),
      TopicPoint('Abnormal bleeding under 45 with risk factors — obesity, '
          'PCOS, unopposed oestrogen, Lynch syndrome, tamoxifen',
          critical: true),
      TopicPoint('Persistent intermenstrual bleeding'),
      TopicPoint('Failed medical management of heavy menstrual bleeding'),
      TopicPoint('Atypical glandular cells on cervical cytology'),
      TopicPoint('Surveillance of treated endometrial hyperplasia'),
    ]),
    TopicSection('Contraindications', [
      TopicPoint('Pregnancy — exclude before sampling', critical: true),
      TopicPoint('Acute pelvic infection'),
      TopicPoint('Cervical stenosis preventing safe access — refer for '
          'hysteroscopy under anaesthesia'),
      TopicPoint('Clotting disorder or full anticoagulation — relative'),
    ]),
    TopicSection('Preparation and equipment', [
      TopicPoint('Explain that it is uncomfortable and briefly painful; offer '
          'simple analgesia an hour beforehand'),
      TopicPoint('Speculum, tenaculum, antiseptic, Pipelle or similar sampler'),
      TopicPoint('A chaperone, always', critical: true),
      TopicPoint('Ultrasound result available before the procedure'),
    ]),
    TopicSection('Steps', [
      TopicPoint('Bimanual examination to establish uterine position'),
      TopicPoint('Insert speculum and clean the cervix'),
      TopicPoint('Tenaculum if the canal is difficult — warn her first'),
      TopicPoint('Pass the sampler to the fundus, noting the depth'),
      TopicPoint('Withdraw the plunger fully to create suction'),
      TopicPoint('Rotate and move the sampler along the cavity 4–6 times, '
          'covering anterior, posterior and lateral walls', critical: true),
      TopicPoint('Withdraw and expel into formalin; a second pass improves '
          'adequacy'),
    ]),
    TopicSection('Complications', [
      TopicPoint('Pain and vasovagal reaction — the commonest'),
      TopicPoint('Bleeding'),
      TopicPoint('Infection — uncommon'),
      TopicPoint('Uterine perforation — around 1 to 2 per 1000'),
      TopicPoint('Inadequate or insufficient sample, in up to 20% of '
          'postmenopausal women', critical: true),
    ]),
    TopicSection('Interpreting the result', [
      TopicPoint('An INSUFFICIENT sample in a postmenopausal woman with a thin '
          'endometrium and no ongoing bleeding may be acceptable',
          critical: true),
      TopicPoint('An insufficient sample with persistent bleeding requires '
          'hysteroscopy', critical: true),
      TopicPoint('regard a benign Pipelle as excluding cancer where bleeding '
          'persists', avoid: true,
          detail: 'It samples a limited area and misses focal lesions such as '
              'polyps and localised carcinoma.'),
      TopicPoint('Atypical hyperplasia on a Pipelle warrants hysterectomy '
          'planning, given the high rate of concurrent carcinoma',
          critical: true),
    ]),
    TopicSection('Documentation and consent', [
      TopicPoint('Indication and the ultrasound findings that prompted it'),
      TopicPoint('Whether a tenaculum was used, and the sound length'),
      TopicPoint('Number of passes and apparent adequacy'),
      TopicPoint('Chaperone present and named'),
      TopicPoint('Verbal consent, and what was explained about pain and about '
          'the possibility of an inconclusive result', critical: true),
      TopicPoint('The follow-up plan, made before she leaves the room'),
    ]),
  ],
  sources: [
    'RCOG / BSGE Green-top Guideline 67 — Management of Endometrial '
        'Hyperplasia.',
    'NICE NG88 — Heavy menstrual bleeding.',
    'Clark TJ et al. Accuracy of outpatient endometrial biopsy in the '
        'diagnosis of endometrial cancer. BJOG 2002;109:313–321.',
  ],
);
