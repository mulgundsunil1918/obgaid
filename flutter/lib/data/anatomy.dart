import '../models/anatomy.dart';

const kAnatomy = <AnatomyEntry>[
  AnatomyEntry(
    id: 'anat-ureter',
    name: 'Ureter',
    subtitle: 'The three danger points',
    region: AnatomyRegion.urinary,
    headline: 'Water under the bridge. The ureter passes BENEATH the uterine '
        'artery about 1.5–2 cm lateral to the cervix, at roughly the level of '
        'the internal os. Almost every gynaecological ureteric injury happens '
        'at one of three places, and all three are predictable.',
    numbers: [
      ('Length', '25 – 30 cm'),
      ('Ureter to cervix, at the crossing', '1.5 – 2 cm lateral'),
      ('Ureter to internal iliac bifurcation', 'Crosses at the pelvic brim'),
      ('Injury rate, hysterectomy', '0.5 – 1.5%'),
      ('Injury rate, caesarean', '~0.03%'),
      ('Recognised intraoperatively', 'Fewer than a third'),
    ],
    course: [
      'Runs on the medial leaf of the broad ligament — not free in the '
          'retroperitoneum. Open the leaf and it comes with it.',
      'Crosses the pelvic brim over the bifurcation of the common iliac '
          'artery, immediately beneath the infundibulopelvic ligament.',
      'Descends on the lateral pelvic sidewall, then turns medially in the '
          'cardinal ligament.',
      'Passes beneath the uterine artery 1.5–2 cm lateral to the cervix.',
      'Runs anterior to the vaginal fornix and enters the bladder '
          'obliquely at the trigone.',
    ],
    dangers: [
      AnatomyDanger(
        site: 'Pelvic brim — infundibulopelvic ligament',
        risk: 'Clamped or ligated with the ovarian vessels during '
            'oophorectomy, or during adnexal surgery for a large mass.',
        avoid: 'Open the retroperitoneum, identify the ureter crossing the '
            'bifurcation, and skeletonise the IP ligament before clamping. '
            'In a large adnexal mass the ureter is displaced, not where you '
            'expect it.',
      ),
      AnatomyDanger(
        site: 'Uterine artery crossing',
        risk: 'Included in the uterine artery pedicle at hysterectomy, or '
            'caught in a haemostatic suture for postpartum bleeding.',
        avoid: 'Skeletonise the uterine vessels and clamp close to the '
            'uterus. Push the bladder down first so the ureter falls away '
            'laterally with it.',
      ),
      AnatomyDanger(
        site: 'Cardinal ligament and vaginal angle',
        risk: 'Caught when securing the vaginal angles, particularly with a '
            'blind deep suture for bleeding.',
        avoid: 'Never place a blind deep suture into a bleeding vaginal '
            'angle. Get exposure, see the bleeder, and place the suture under '
            'vision.',
      ),
      AnatomyDanger(
        site: 'Broad ligament haematoma or fibroid',
        risk: 'Anatomy is distorted and the ureter may be stretched over the '
            'mass or displaced medially.',
        avoid: 'Identify it at the brim, where anatomy is still normal, and '
            'trace it down. Do not start dissecting at the distorted end.',
      ),
    ],
    identification: [
      'It PERISTALSES when touched with a forceps — the single most reliable '
          'sign.',
      'It adheres to the medial leaf of the peritoneum and lifts with it.',
      'It has a characteristic longitudinal vascular pattern on its surface.',
      'Find it at the pelvic brim over the common iliac bifurcation, then '
          'trace distally.',
      'The vessel it is most often confused with does NOT peristalse.',
    ],
    ifInjured: [
      'Recognise it in theatre. Fewer than a third are, and delayed '
          'recognition is what converts an injury into a fistula.',
      'Give intravenous indigo carmine or methylene blue, or fill the bladder, '
          'if you suspect a breach.',
      'Call urology. Do not repair a ureter you are not trained to repair.',
      'Crush injury from a clamp released immediately may still necrose — '
          'consider stenting.',
      'Partial transection: repair over a stent. Complete lower-third '
          'transection: usually reimplantation with a psoas hitch.',
      'Postoperative flank pain, ileus, fever or a rising creatinine after '
          'pelvic surgery is ureteric injury until imaging says otherwise.',
    ],
    sources: [
      'Standring S. Gray\'s Anatomy, 42nd edition.',
      'RCOG Consent Advice and guidance on urinary tract injury at '
          'gynaecological surgery.',
      'Hurd WW et al. Pelvic anatomy for the gynaecological surgeon.',
      'FOGSI GCPR — Prevention and Management of Urinary Tract Injury at '
          'Gynaecological Surgery.',
    ],
  ),
  AnatomyEntry(
    id: 'anat-uterine-artery',
    name: 'Uterine artery',
    subtitle: 'Origin, course, and the crossing',
    region: AnatomyRegion.vascular,
    headline: 'A branch of the anterior division of the internal iliac. It '
        'runs medially in the base of the broad ligament and crosses ABOVE the '
        'ureter about 1.5–2 cm from the cervix. Clamp close to the uterus and '
        'the ureter stays out of the pedicle.',
    numbers: [
      ('Origin', 'Anterior division of internal iliac'),
      ('Crossing point', '1.5 – 2 cm lateral to the cervix'),
      ('Uterine blood flow at term', '~500 – 700 mL/min'),
      ('Proportion of cardiac output at term', '~15 – 20%'),
    ],
    course: [
      'Arises from the anterior division of the internal iliac artery.',
      'Runs medially and forwards in the base of the broad ligament.',
      'Crosses ANTERIOR and SUPERIOR to the ureter, 1.5–2 cm lateral to the '
          'cervix at about the level of the internal os.',
      'Reaches the uterus at the level of the internal os and divides into an '
          'ascending branch along the lateral uterine wall and a descending '
          'cervicovaginal branch.',
      'The ascending branch anastomoses freely with the ovarian artery — '
          'which is why unilateral ligation alone rarely controls bleeding.',
    ],
    dangers: [
      AnatomyDanger(
        site: 'The pedicle at hysterectomy',
        risk: 'Taking the ureter with the artery.',
        avoid: 'Skeletonise the vessels, push the bladder down, and clamp '
            'perpendicular to the uterus at the level of the internal os, '
            'hugging the cervix.',
      ),
      AnatomyDanger(
        site: 'Slipped pedicle',
        risk: 'Retraction into the broad ligament with concealed haematoma '
            'formation.',
        avoid: 'Doubly ligate. If it retracts, do not grab blindly — open the '
            'retroperitoneum, find the internal iliac and work distally.',
      ),
      AnatomyDanger(
        site: 'Extension of a caesarean incision laterally',
        risk: 'Tearing into the uterine vessels and the broad ligament.',
        avoid: 'Blunt extension of the uterine incision, in a cephalocaudad '
            'direction, which follows the muscle fibres rather than tearing '
            'across them.',
      ),
    ],
    identification: [
      'Follow the round ligament back and open the broad ligament to expose '
          'the paravesical and pararectal spaces — the artery lies between '
          'them at the base.',
      'Palpate it as a cord in the parametrium before dividing anything.',
      'At caesarean, it is the vessel that bleeds when the incision extends '
          'laterally.',
    ],
    ifInjured: [
      'Direct pressure first, then exposure. Blind clamping in a pool of blood '
          'is how the ureter is injured.',
      'Ligate close to the uterus if possible.',
      'Bilateral uterine artery ligation (O\'Leary) is a step in stepwise '
          'devascularisation and preserves fertility.',
      'If bleeding continues, proceed up the ladder — ovarian vessels, then '
          'internal iliac.',
    ],
    sources: [
      'Standring S. Gray\'s Anatomy, 42nd edition.',
      'RCOG Green-top Guideline 52 — surgical management of PPH.',
      'AbdRabbo SA. Stepwise uterine devascularisation. Am J Obstet Gynecol '
          '1994.',
      'FOGSI GCPR — Postpartum Haemorrhage: surgical management.',
    ],
  ),
  AnatomyEntry(
    id: 'anat-internal-iliac',
    name: 'Internal iliac artery',
    subtitle: 'Ligation — and the branch you must not take',
    region: AnatomyRegion.vascular,
    headline: 'Ligate the ANTERIOR division only, about 2.5 cm distal to the '
        'bifurcation. Taking the posterior division causes gluteal '
        'claudication and, rarely, buttock necrosis — and it is easy to do in '
        'a hurry.',
    numbers: [
      ('Ligate distal to bifurcation', '2.5 cm — beyond the posterior '
          'division'),
      ('Reduction in pulse pressure', '~85%'),
      ('Reduction in blood flow', '~50%'),
      ('Success in controlling PPH', '~40 – 70%'),
    ],
    course: [
      'The common iliac bifurcates at the pelvic brim into external and '
          'internal iliac arteries.',
      'The ureter crosses the bifurcation — it is your landmark and your '
          'hazard in the same place.',
      'The internal iliac divides after 3–4 cm into posterior and anterior '
          'divisions.',
      'POSTERIOR division: iliolumbar, lateral sacral, superior gluteal. This '
          'is the one to spare.',
      'ANTERIOR division: uterine, vaginal, obturator, internal pudendal, '
          'inferior gluteal, umbilical, middle rectal.',
    ],
    dangers: [
      AnatomyDanger(
        site: 'The posterior division',
        risk: 'Gluteal claudication, and buttock or sciatic nerve ischaemia.',
        avoid: 'Pass the ligature 2.5 cm distal to the bifurcation, beyond '
            'the posterior division take-off.',
      ),
      AnatomyDanger(
        site: 'The internal iliac VEIN',
        risk: 'It lies immediately posterior and lateral to the artery. '
            'Tearing it produces bleeding far worse than the problem you came '
            'to fix.',
        avoid: 'Pass the right-angle forceps from LATERAL to MEDIAL, so the '
            'tip moves away from the vein, and keep the tip visible '
            'throughout.',
      ),
      AnatomyDanger(
        site: 'The ureter',
        risk: 'It crosses exactly where you are opening the peritoneum.',
        avoid: 'Identify and reflect it medially before dissecting the '
            'vessels.',
      ),
      AnatomyDanger(
        site: 'The external iliac artery',
        risk: 'Ligated in error under pressure. Catastrophic limb ischaemia.',
        avoid: 'Confirm the bifurcation and palpate a femoral pulse after '
            'ligation, before closing.',
      ),
    ],
    identification: [
      'Open the peritoneum lateral to the infundibulopelvic ligament, parallel '
          'to it.',
      'Identify the ureter on the medial leaf and reflect it medially.',
      'Find the common iliac bifurcation; the external iliac runs laterally '
          'towards the inguinal ligament, the internal dives into the pelvis.',
      'Trace the internal iliac 2.5 cm distally, past the posterior division.',
      'Ligation does not divide the vessel — it reduces pulse pressure and '
          'converts the arterial supply to a venous-type system that clots.',
    ],
    ifInjured: [
      'Venous injury: direct pressure, do not clamp blindly. Call vascular '
          'surgery.',
      'Arterial injury to the external iliac requires immediate vascular '
          'repair — clamp proximally and distally and get help.',
    ],
    sources: [
      'Standring S. Gray\'s Anatomy, 42nd edition.',
      'RCOG Green-top Guideline 52.',
      'FOGSI GCPR — surgical management of postpartum haemorrhage; MoHFW '
          'guidance on internal iliac artery ligation at first referral '
          'units.',
    ],
  ),
  AnatomyEntry(
    id: 'anat-abdominal-wall',
    name: 'Abdominal wall and port placement',
    subtitle: 'Layers, and the inferior epigastric vessels',
    region: AnatomyRegion.wall,
    headline: 'The inferior epigastric vessels run just lateral to the medial '
        'umbilical ligament and medial to the deep inguinal ring. Place '
        'lateral ports lateral to them under direct vision, and transilluminate '
        'before you cut.',
    numbers: [
      ('Inferior epigastric origin', 'External iliac, above the inguinal '
          'ligament'),
      ('Arcuate line', 'Midway between umbilicus and pubis'),
      ('Safe lateral port', 'At least 5 cm from midline, above the level of '
          'the ASIS'),
      ('Aortic bifurcation at umbilicus', 'In a thin woman it lies directly '
          'beneath'),
    ],
    course: [
      'Layers at the midline: skin, Camper fascia, Scarpa fascia, linea alba, '
          'transversalis fascia, preperitoneal fat, peritoneum.',
      'Layers laterally: skin, fat, external oblique, internal oblique, '
          'transversus abdominis, transversalis fascia, peritoneum.',
      'Above the arcuate line the rectus sheath has anterior and posterior '
          'layers; below it, all aponeuroses pass anteriorly and there is no '
          'posterior sheath.',
      'The inferior epigastric vessels arise from the external iliac and run '
          'upwards behind the rectus, entering the sheath below the arcuate '
          'line.',
      'The superficial epigastric vessels run in the subcutaneous fat and are '
          'the ones seen on transillumination.',
    ],
    dangers: [
      AnatomyDanger(
        site: 'Lateral port placement',
        risk: 'Inferior epigastric vessel injury, causing rectus sheath '
            'haematoma or delayed haemorrhage that may be concealed.',
        avoid: 'Identify the vessels laparoscopically before placing lateral '
            'ports. Place them lateral to the vessels, or truly in the '
            'midline. Transillumination shows only the superficial vessels, '
            'not the inferior epigastrics.',
      ),
      AnatomyDanger(
        site: 'Umbilical entry',
        risk: 'Aortic or common iliac injury, especially in a thin woman '
            'where the bifurcation lies directly beneath the umbilicus.',
        avoid: 'Insert at 45 degrees in a normal-weight woman and closer to '
            '90 degrees in obesity. Consider an open (Hasson) entry or a '
            'left upper quadrant (Palmer point) entry after previous surgery.',
      ),
      AnatomyDanger(
        site: 'Ilioinguinal and iliohypogastric nerves',
        risk: 'Entrapment in a Pfannenstiel closure, causing chronic groin '
            'pain.',
        avoid: 'Do not extend the incision beyond the lateral border of '
            'rectus, and take care with lateral sutures.',
      ),
      AnatomyDanger(
        site: 'Bladder at low midline entry',
        risk: 'Cystotomy, particularly after previous caesarean where the '
            'bladder is drawn up and adherent.',
        avoid: 'Catheterise before starting. Enter high and dissect down.',
      ),
    ],
    identification: [
      'Inferior epigastrics: look laparoscopically just lateral to the medial '
          'umbilical ligament and medial to the deep ring, where the round '
          'ligament enters.',
      'Arcuate line: the point below which the posterior rectus sheath ends.',
      'Palmer point: 3 cm below the left costal margin in the mid-clavicular '
          'line, for entry where periumbilical adhesions are likely.',
    ],
    ifInjured: [
      'Epigastric vessel injury: tamponade with a Foley through the port site '
          'with the balloon inflated, or place a full-thickness suture on '
          'either side of the port.',
      'Major vessel injury at entry: leave the trocar in place to tamponade, '
          'convert to laparotomy immediately, and call vascular surgery.',
    ],
    sources: [
      'RCOG Green-top Guideline 49 — Preventing Entry-Related Gynaecological '
          'Laparoscopic Injuries.',
      'Standring S. Gray\'s Anatomy, 42nd edition.',
      'NICE NG192 — Caesarean birth: surgical technique.',
      'FOGSI GCPR — Caesarean Section and laparoscopic entry.',
    ],
  ),
  AnatomyEntry(
    id: 'anat-spaces',
    name: 'Pelvic avascular spaces',
    subtitle: 'Where safe dissection happens',
    region: AnatomyRegion.spaces,
    headline: 'The pelvis is organised into avascular planes separated by '
        'vascular pedicles. Develop the spaces first, and the pedicles become '
        'discrete structures you can see. Cut before developing them and '
        'everything bleeds at once.',
    numbers: [
      ('Paravesical space — boundaries', 'Bladder medially, obturator '
          'internus laterally, cardinal ligament posteriorly'),
      ('Pararectal space — boundaries', 'Rectum medially, internal iliac '
          'laterally, cardinal ligament anteriorly, sacrum posteriorly'),
    ],
    course: [
      'PARAVESICAL — opened by pushing medially on the bladder and laterally '
          'on the pelvic sidewall. Its floor is the levator.',
      'PARARECTAL — opened between the ureter medially and the internal iliac '
          'laterally. The uterine artery separates it from the paravesical '
          'space.',
      'VESICOVAGINAL — between bladder and cervix/vagina. Developed at every '
          'hysterectomy and every caesarean.',
      'RECTOVAGINAL — between the posterior vagina and rectum, opened for '
          'deep endometriosis and posterior compartment surgery.',
      'RETRORECTAL (presacral) — between rectum and sacrum, containing the '
          'presacral nerve and the sacral venous plexus.',
      'RETZIUS (retropubic) — between pubis and bladder, entered for '
          'colposuspension and sling procedures.',
    ],
    dangers: [
      AnatomyDanger(
        site: 'Vesicovaginal space after previous caesarean',
        risk: 'Dense adhesions draw the bladder up onto the lower segment. '
            'Cystotomy is common.',
        avoid: 'Enter the space laterally where it is virgin tissue, and work '
            'medially. Sharp dissection, not blunt sweeping.',
      ),
      AnatomyDanger(
        site: 'Presacral space',
        risk: 'The sacral venous plexus bleeds torrentially and cannot be '
            'clamped — the veins retract into bone.',
        avoid: 'Stay in the midline and above the periosteum. If it bleeds, '
            'use a sterile thumbtack, bone wax or a haemostatic agent with '
            'pressure. Do not chase it with sutures.',
      ),
      AnatomyDanger(
        site: 'Rectovaginal space in deep endometriosis',
        risk: 'The plane is obliterated and rectal injury is a real risk.',
        avoid: 'Operate with colorectal support available, and consider '
            'preoperative bowel preparation and a rectal probe for '
            'orientation.',
      ),
      AnatomyDanger(
        site: 'Space of Retzius',
        risk: 'Injury to the bladder, and to the retropubic venous plexus.',
        avoid: 'Keep the dissection against the back of the pubic bone.',
      ),
    ],
    identification: [
      'Every space is opened by blunt spreading along a natural plane — if it '
          'takes force, you are not in the plane.',
      'Areolar tissue that separates easily is the plane. Fatty, vascular '
          'tissue is not.',
      'Open the paravesical and pararectal spaces to isolate the cardinal '
          'ligament and the uterine artery between them.',
      'Developing the spaces first turns radical pelvic surgery from a '
          'dissection through tissue into a division of defined pedicles.',
    ],
    sources: [
      'Standring S. Gray\'s Anatomy, 42nd edition.',
      'Querleu D, Morrow CP. Classification of radical hysterectomy. Lancet '
          'Oncol 2008.',
      'ESGO textbook of gynaecological oncology — surgical anatomy.',
      'National Cancer Grid of India — radical hysterectomy standards.',
    ],
  ),
  AnatomyEntry(
    id: 'anat-nerves',
    name: 'Pelvic nerves',
    subtitle: 'Obturator, genitofemoral, hypogastric, pudendal',
    region: AnatomyRegion.neural,
    headline: 'The obturator nerve is the one you will see and the one most '
        'often divided at lymphadenectomy. It runs on the medial wall of the '
        'obturator fossa, below the external iliac vein, and looks '
        'disconcertingly like a lymphatic channel.',
    numbers: [
      ('Obturator nerve roots', 'L2 – L4'),
      ('Pudendal nerve roots', 'S2 – S4'),
      ('Genitofemoral roots', 'L1 – L2'),
      ('Lateral femoral cutaneous roots', 'L2 – L3'),
    ],
    course: [
      'OBTURATOR — emerges from the medial border of psoas, runs on the '
          'lateral pelvic wall below the external iliac vein, through the '
          'obturator fossa, to the obturator canal. Supplies the adductors '
          'and sensation to the medial thigh.',
      'GENITOFEMORAL — runs ON the anterior surface of psoas, which is why it '
          'is at risk in para-aortic and pelvic node dissection.',
      'ILIOINGUINAL and ILIOHYPOGASTRIC — pierce the abdominal wall near the '
          'anterior superior iliac spine; injured by lateral extension of a '
          'Pfannenstiel or by lateral trocars.',
      'HYPOGASTRIC NERVE and INFERIOR HYPOGASTRIC PLEXUS — sympathetic and '
          'parasympathetic supply to bladder, rectum and vagina, running in '
          'the uterosacral and cardinal ligaments.',
      'PUDENDAL — leaves the pelvis through the greater sciatic foramen, '
          'hooks around the ischial spine, and re-enters through the lesser '
          'sciatic foramen into Alcock canal.',
      'LATERAL FEMORAL CUTANEOUS — compressed by excessive hip flexion in '
          'lithotomy, and by prolonged McRoberts.',
    ],
    dangers: [
      AnatomyDanger(
        site: 'Obturator fossa at lymphadenectomy',
        risk: 'Division causes weakness of thigh adduction and medial thigh '
            'numbness.',
        avoid: 'Identify the nerve before removing nodal tissue. It is white, '
            'runs longitudinally, and does not tether like a lymphatic. If '
            'you divide it, repair it primarily — the result is usually good.',
      ),
      AnatomyDanger(
        site: 'Uterosacral and cardinal ligaments at radical hysterectomy',
        risk: 'Autonomic denervation causing bladder atony, constipation and '
            'sexual dysfunction.',
        avoid: 'Nerve-sparing technique, identifying and preserving the '
            'hypogastric nerve and the inferior hypogastric plexus.',
      ),
      AnatomyDanger(
        site: 'Ischial spine during sacrospinous fixation',
        risk: 'Pudendal vessel and nerve injury, causing buttock pain.',
        avoid: 'Place the suture two fingerbreadths MEDIAL to the ischial '
            'spine, in the sacrospinous ligament.',
      ),
      AnatomyDanger(
        site: 'Lithotomy positioning',
        risk: 'Common peroneal palsy from lateral knee compression; femoral '
            'and lateral femoral cutaneous neuropathy from excessive hip '
            'flexion and abduction.',
        avoid: 'Limit hip flexion and abduction, pad the lateral knee, and '
            'reposition if the operation is prolonged. Positioning injuries '
            'are entirely preventable and are a recurring source of '
            'litigation.',
      ),
      AnatomyDanger(
        site: 'Deep lateral sutures in the vagina',
        risk: 'Pudendal branches, with chronic perineal pain.',
        avoid: 'Suture under vision and avoid deep lateral bites.',
      ),
    ],
    identification: [
      'Obturator nerve: white, glistening, runs anteroposteriorly on the '
          'medial obturator fossa wall, beneath the external iliac vein.',
      'Genitofemoral nerve: on the surface of psoas, running with it — do not '
          'strip psoas fascia.',
      'Ischial spine: palpable transvaginally, and the landmark for both '
          'sacrospinous fixation and pudendal block.',
    ],
    ifInjured: [
      'Obturator nerve transection: repair primarily with fine '
          'non-absorbable suture if the ends are clean. Refer for '
          'physiotherapy; recovery is usually good.',
      'Positioning neuropathy: most resolve within weeks to months. Document '
          'the position and duration, examine, and refer to neurology if not '
          'improving.',
    ],
    sources: [
      'Standring S. Gray\'s Anatomy, 42nd edition.',
      'Cardosi RJ et al. Neuropathy after major pelvic surgery. Obstet '
          'Gynecol 2002.',
      'FOGSI GCPR — Gynaecological Surgery: positioning and nerve injury.',
      'ESGO surgical anatomy references; nerve-sparing radical hysterectomy '
          'literature.',
    ],
  ),
  AnatomyEntry(
    id: 'anat-perineum',
    name: 'Perineum and anal sphincter',
    subtitle: 'For OASIS repair',
    region: AnatomyRegion.perineum,
    headline: 'The internal anal sphincter is the thin, pale, involuntary '
        'layer beneath the external sphincter — it looks like fascia and is '
        'routinely missed. A repaired 3b that was actually a 3c is the '
        'commonest reason for a poor functional result.',
    numbers: [
      ('3a', 'Less than 50% of external sphincter thickness torn'),
      ('3b', 'More than 50% of external sphincter thickness torn'),
      ('3c', 'Internal sphincter also torn'),
      ('4th degree', 'Anal epithelium torn'),
      ('OASIS incidence', '~3% in nulliparous, ~0.5% multiparous'),
    ],
    course: [
      'Perineal body: the fibromuscular mass between vagina and anus, into '
          'which bulbospongiosus, superficial and deep transverse perinei, '
          'and the external anal sphincter all insert.',
      'EXTERNAL anal sphincter: striated, voluntary, red, under pudendal '
          'nerve control. Retracts laterally when torn.',
      'INTERNAL anal sphincter: smooth muscle, involuntary, PALE and thin — '
          'it is the continuation of the circular rectal muscle and looks '
          'like fascia.',
      'Anal epithelium lies deep to both.',
      'Levator ani forms the pelvic floor above.',
    ],
    dangers: [
      AnatomyDanger(
        site: 'Classifying the tear',
        risk: 'Missing internal sphincter involvement, so a 3c is repaired as '
            'a 3b and the internal sphincter is never approximated.',
        avoid: 'Examine every woman rectally after every vaginal delivery, '
            'before you suture. Identify the pale internal sphincter '
            'separately from the red external sphincter.',
      ),
      AnatomyDanger(
        site: 'Repair setting',
        risk: 'Repairing in the delivery room with inadequate light, '
            'anaesthesia and assistance gives a poor result.',
        avoid: 'Repair in theatre, with regional or general anaesthesia, by '
            'someone trained. Antibiotics and laxatives afterwards.',
      ),
      AnatomyDanger(
        site: 'Suture technique',
        risk: 'Overlapping a partially torn (3a) external sphincter can '
            'worsen function.',
        avoid: 'End-to-end for 3a and partial 3b; overlap or end-to-end for '
            'full-thickness — the evidence does not clearly favour either at '
            '12 months.',
      ),
    ],
    identification: [
      'The external sphincter is red striated muscle that retracts into the '
          'ischiorectal fat and must be retrieved with Allis forceps.',
      'The internal sphincter is pale, thin and glistening, immediately deep '
          'to it. If you cannot see it, look again.',
      'Rectal examination confirms the extent, and confirms no suture has '
          'passed through the anal mucosa at the end.',
    ],
    ifInjured: [
      'Repair the anal epithelium with fine absorbable suture, knots in the '
          'lumen.',
      'Repair the internal sphincter separately, end-to-end, with '
          'interrupted sutures.',
      'Repair the external sphincter with 3-0 PDS.',
      'Broad-spectrum antibiotics, laxatives for 10–14 days, and '
          'physiotherapy.',
      'Follow up at 6–12 weeks. Counsel about mode of delivery next time — '
          'elective caesarean if symptomatic or if endoanal ultrasound is '
          'abnormal.',
    ],
    sources: [
      'RCOG Green-top Guideline 29 — Third and Fourth Degree Perineal Tears.',
      'Sultan AH. Obstetric perineal injury and anal incontinence. Clinical '
          'Risk 1999.',
      'FOGSI GCPR — Perineal Trauma and OASIS Repair.',
      'Standring S. Gray\'s Anatomy, 42nd edition.',
    ],
  ),
];
