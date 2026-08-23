# ObgAid — Roadmap

Restructured on 2026-08-21 to follow **[`docs/CONTENT_SPEC.md`](docs/CONTENT_SPEC.md)**,
which is now the authoritative content plan. Section references below (§) point
into that document.

Status: ✅ done · 🔨 in progress · ⬜ pending

**Live preview:** https://mulgundsunil1918.github.io/obgaid/ ·
**App:** https://mulgundsunil1918.github.io/obgaid/app/

---

## What the spec changed

The specification supersedes the phase ordering this roadmap previously used.
Three things it forces:

1. **Build order is bedside frequency, not subject area.** The spec's Tier 1
   (§64) is what a clinician reaches for most often. Measured against it, the
   first build got the ordering partly wrong — five FIGO staging systems
   shipped (Tier 3, §66) while none of the eleven Tier 1 emergency algorithms
   exist. Staging is good content in the wrong slot.
2. **Content is a versioned record, not a screen.** §62 requires every clinical
   item to carry an ID, author, medical reviewer, source organisation and
   title, publication year, version, evidence level, created/reviewed/next-review
   dates, and a status. Nothing built so far carries any of this.
3. **Interconnection is the product** (§68). "The application should function as
   a single searchable clinical knowledge system" — every item linking to its
   related tools, drugs, algorithms, guidelines and trials. Screens currently
   have no notion of a related item.

Points 2 and 3 are architecture, not content. Both get exponentially more
expensive to retrofit as the library grows toward 100+ tools, so they come
before any further content. That is Tier 0 below.

---

## Tier 0 — Architecture prerequisites *(new; blocks further content)*

| # | Sub-phase | Why it must come first | Status |
|---|---|---|---|
| 0.1 | Identity lock — `com.obgaid.obgaid` both platforms | Irreversible after first upload | ✅ |
| 0.2 | Flutter scaffold, theme, app shell mirroring PediAid | — | ✅ |
| 0.3 | Tool registry, shared calculator widgets, global search | — | ✅ |
| 0.4 | GitHub Pages preview pipeline (analyze + test gate the deploy) | — | ✅ |
| 0.5 | **Content metadata model** — §62 record on every clinical item | Retrofitting 100+ items later is the expensive path | ✅ |
| 0.6 | **Interconnection graph** — `related` edges + a Related block on every screen | §68 calls this "the core of OBG-Aid" | ✅ |
| 0.7 | **Review-status gate** — §63 high-risk items marked and surfaced | Enforced in CI; 14 items now queued for sign-off | ✅ |
| 0.8 | Evidence-level tagging per §61 hierarchy | Makes "traceable to a source" machine-checkable | ⬜ |

## Tier 1 — Bedside essentials *(spec §64)*

### 1A · Calculators — **all 18 of §64 built**

| Tool | Spec § | Status |
|---|---|---|
| Gestational age · EDD | §3 | ✅ |
| BMI · pre-pregnancy BMI | §4 | ✅ *(WHO **and** Asia-Pacific thresholds)* |
| BSA · ideal, adjusted, lean body weight | §4 | ✅ |
| Pregnancy weight gain (IOM 2009) | §4 | ✅ |
| MAP · pulse pressure | §5 | ✅ |
| Shock index · modified · obstetric | §5 | ✅ |
| Blood-loss calculator | §6 | ✅ |
| Magnesium sulphate | §7 | ✅ |
| Tranexamic acid | §6 | ✅ *(within PPH)* |
| Insulin total daily dose · basal-bolus · correction | §8 | ✅ |
| Ganzoni iron deficit · IV iron · transfusion volume | §9 | ✅ |
| EFW | §10 | ✅ |
| Bishop score | §11 | ✅ |
| APGAR | §12 | ✅ |
| VTE risk (RCOG GTG 37a) | §12, §24 | ✅ |
| Creatinine clearance · eGFR | §24 | ✅ |

*Beyond §64 but built:* USG parameters — CRL, Hadlock biometry, AFI/DVP §14 ✅ ·
ultrasound scan guide §14 ✅ · GDM screening DIPSI/IADPSG §8 ✅

### 1B · Emergency algorithms — **all 11 built, plus AFE**

Each follows §52's ten-part structure, and opens on a red "do this now" block
because in a real emergency nobody scrolls. Explicit *do-not* steps render as
their own kind of step — fundal pressure in dystocia, fluid loading in
eclampsia, oophorectomy on appearance in torsion — because in obstetrics the
harmful action kills more reliably than the omitted one.

| Algorithm | Spec § | Status |
|---|---|---|
| Postpartum haemorrhage | §20 | ✅ |
| Placental abruption | §20 | ✅ |
| Uterine rupture | §20 | ✅ |
| Eclampsia | §20 | ✅ |
| Severe hypertension | §20 | ✅ |
| Maternal collapse | §20 | ✅ |
| Amniotic fluid embolism | §20 | ✅ *(in §20, beyond §64's eleven)* |
| Obstetric sepsis | §20 | ✅ |
| Shoulder dystocia | §20 | ✅ |
| Cord prolapse | §20 | ✅ |
| Ectopic pregnancy | §19 | ✅ |
| Ovarian torsion | §43 | ✅ |

### 1C · High-value reference — **all 9 built**

Structured reference topics, each opening on a key-numbers block rather than an
action block: these are read over hours, not seconds.

| Topic | Spec § | Status |
|---|---|---|
| CTG interpretation | §13 | ✅ *(NICE and FIGO presented separately, per §13)* |
| Fetal growth restriction | §10 | ✅ |
| PPROM | §17 | ✅ |
| Preterm labour | §17 | ✅ |
| Induction of labour | §26 | ✅ |
| VBAC / TOLAC | §28 | ✅ |
| Caesarean section | §27 | ✅ |
| GDM | §8 | ✅ |
| Rh-negative pregnancy | §23 | ✅ |

**Tier 1 is complete. Tier 2 is complete. Every Tier 3 module now exists.**

Several modules are deliberately partial and marked so in the table — the
formulary at 33 drugs, trials at 25, procedures at 13, counselling at 12 of
§58's 24 topics. They are breadth-limited,
not shape-limited: the model, screen and governance record are done, so
extending them is data entry rather than design.

## Tier 2 — Depth *(spec §65)*

| Module | Spec § | Status |
|---|---|---|
| Drug formulary — §45 record on every entry | §44, §45 | 🔨 *(14 core drugs; antibiotics, hormones, oncology pending)* |
| Pregnancy & lactation safety — narrative, no SAFE/UNSAFE labels | §46 | 🔨 *(on all 14; enforced in CI)* |
| Maternal medicine — cardiac (mWHO), thyroid, epilepsy, autoimmune, infection, renal | §24 | ✅ |
| Fetal medicine — screening, diagnosis, TTTS/IUT/fetal therapy | §25 | ✅ |
| Infertility, IVF & OHSS — WHO 2021 semen criteria, OHSS staging | §36, §37 | ✅ |
| PCOS · endometriosis · adenomyosis · fibroids | §32–35 | ✅ |
| Contraception (WHO MEC · Antara · Chhaya) | §38 | ✅ |
| Menopause · POI | §39 | ✅ |
| Urogynaecology · obstetric fistula | §40 | ✅ |
| Gynaecological pathology | §48 | ✅ |
| Ultrasound reference — full trimester-by-trimester | §14–16 | 🔨 *(guide + parameters done)* |
| Imaging reference — CT/MRI in pregnancy, contrast, modality choice | §49 | ✅ |
| Gynaecology calculators — Ferriman-Gallwey, HOMA-IR, RMI/IOTA/O-RADS, POP-Q, PALM-COEIN, PBAC | §31, §35, §40, §42 | ✅ |
| Laboratory reference — trimester-specific ranges | §47 | ✅ |
| Maternal immunisation — country/org/year/source on every entry | §50 | ✅ |

## Tier 3 — Scholarship *(spec §66)*

| Module | Spec § | Status |
|---|---|---|
| Gynaecological oncology — FIGO staging × 5 | §41 | ✅ *(shipped ahead of tier)* |
| Ovarian masses — RMI, IOTA, O-RADS, ROMA | §42 | ⬜ |
| Landmark trials — full §53 record on each | §53 | ✅ *(25 trials across all nine §53 categories)* |
| Guideline library — §54 record on each | §54 | 🔨 *(8 guidelines)* |
| Guideline change tracker — previous, now, what changed, why | §55 | ✅ |
| Advanced fetal medicine | §25 | ⬜ |
| Procedures reference — §57 field structure | §57 | ✅ *(13 procedures)* |
| Never Again — anonymised safety cases | §56 | 🔨 *(4 cases; submission needs the backend)* |
| Academic / examination content — high-yield, viva, traps, links | §59 | ✅ |
| Patient counselling — clinician checklists with actual wording | §58 | 🔨 *(12 of 24 topics)* |
| Quick reference tables — 11 searchable tables | §60 | ✅ |

## India-specific content *(not a spec tier — ObgAid's differentiator)*

| Item | Status |
|---|---|
| DIPSI — single-step non-fasting GDM screening | ✅ |
| Pritchard magnesium sulphate regimen | ✅ |
| MTP Act 2021 — limits, Rule 3B categories, Medical Board | ✅ |
| PCPNDT Act — Form F, §4(3) indications, penalties | ✅ |
| Anemia Mukt Bharat — grading, Ganzoni, IV iron pathways | ✅ |
| Asia-Pacific BMI thresholds (ICMR) — obesity at 25, not 30 | ✅ |
| FOGSI GCPRs, ICOG guidelines | ⬜ |
| LaQshya · SUMAN · JSY / JSSK | ⬜ |
| NACO syndromic STI management | ⬜ |

## Platform *(after content; PediAid's backend, not a second one)*

| # | Sub-phase | Status |
|---|---|---|
| P.1 | Backend `app` discriminator — one Fastify+Postgres serves both apps | ⬜ |
| P.2 | SSO handoff with PediAid — one login, both apps | ⬜ |
| P.3 | Bookmarks, recents, saved | ⬜ |
| P.4 | Academics / CME scoped to OBG | ⬜ |
| P.5 | Push notifications | ⬜ |
| P.6 | `aid_core` shared package extraction | ⬜ |

## Launch

| # | Sub-phase | Status |
|---|---|---|
| L.1 | Icon, splash, feature graphic, screenshots | ⬜ |
| L.2 | Landing site + privacy policy | 🔨 *(preview site live)* |
| L.3 | Play Console — data safety, content rating, listing | ⬜ |
| L.4 | App Store Connect — listing, review notes | ⬜ |
| L.5 | Keystore + signing, Codemagic CI | ⬜ |
| L.6 | Store submission | ⬜ |

---

## Beyond the specification

| Module | Why it exists |
|---|---|
| **Surgical anatomy** — before you scrub | Not in the spec. A two-minute lookup at the sink, organised by where a structure actually gets injured rather than by descriptive anatomy: ureter, uterine artery, internal iliac, abdominal wall and ports, pelvic avascular spaces, pelvic nerves, perineum and anal sphincter. A test fails the build if any danger point lacks the manoeuvre that prevents it. |

## References

Every clinical item cites its source, and two tests enforce it. The first
fails the build if any topic, algorithm, drug, trial, staging system, safety
case, counselling guide, examination topic, quick table, anatomy entry or
guideline record has no reference at all. The second fails if a topic,
algorithm, examination topic or safety case reaches no **Indian** source —
because an India-first app whose references are entirely RCOG and ACOG is
making a claim it does not honour.

Indian sources used: FOGSI and ICOG Good Clinical Practice Recommendations ·
MoHFW national guidelines, Dakshata, LaQshya, PMSMA and Maternal Death
Surveillance and Response · ICMR · National Cancer Grid of India · NACO ·
Anemia Mukt Bharat · DIPSI · National Immunization Schedule · ISAR ·
Indian Menopause Society · National Formulary of India · the MTP, PCPNDT and
ART Acts.

## Content governance *(spec §61–63)*

Non-negotiable, and enforced in code once Tier 0.5–0.8 land:

- **Never invent** (§61) — drug doses, trial results, guideline recommendations,
  statistics, staging criteria, reference ranges, publication details. Every
  clinical claim traceable to a named source.
- **Evidence hierarchy** (§61) — current professional guidelines, then national
  guidelines, then systematic reviews, then RCTs, then observational studies,
  then reference texts.
- **Mandatory medical review** (§63) — drug doses and interactions, pregnancy
  and lactation safety, every emergency algorithm, PPH, eclampsia, severe
  hypertension, sepsis, maternal resuscitation, blood products, anticoagulation,
  cancer and chemotherapy, fertility dosing, IVF protocols, fetal therapy,
  vaccination schedules.

Clinical author and reviewer: **Dr Sunil Mulgund**. 34 items now fall
under §63 — the twelve emergency algorithms, magnesium sulphate, the PPH
calculator, both statutes, the three carrying drug or anticoagulation dosing
(insulin, IV iron, VTE prophylaxis), and six reference topics carrying dosing
or intrapartum decision thresholds (CTG, PPROM, preterm labour, induction,
caesarean, Rh-negative), and three gynaecology topics carrying drug or
eligibility decisions (PCOS, contraception, menopause), and the formulary —
which is the single largest block of §63 content in the specification and the
one where a review pass matters most — joined now by OHSS, maternal medicine,
fetal medicine and immunisation. All are marked *unreviewed*, carry a banner on
the screen itself, and appear in the drawer's review queue. They need a
signed-off pass before store launch.

Author and reviewer are currently the same person, so the queue cannot clear on
its own terms. Either a second clinician signs off, or self-review is recorded
explicitly as the standard — that is a decision for launch, not for now.
