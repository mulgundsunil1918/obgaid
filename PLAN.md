# ObgAid — Plan

**ObgAid — Obstetrics & Gynaecology.** A full OBG clinical reference for Indian
clinicians. Standalone sibling to PediAid, sharing its platform.

Status: naming ceremony complete (2026-08-21). Nothing built yet.

---

## 1. Identity — LOCKED, decide once, never again

PediAid shipped with `com.pediaid.pediaid` on Android and `app.pediaid.pediaid`
on iOS. That mismatch is permanent and its CLAUDE.md carries a paragraph
explaining why it can never be corrected. **ObgAid does not repeat this.**

| Field | Value |
|---|---|
| Product name | **ObgAid** (CamelCase, matching PediAid — not OBGAid, not OBGaid) |
| Android `applicationId` | `com.obgaid.obgaid` |
| iOS `PRODUCT_BUNDLE_IDENTIFIER` | `com.obgaid.obgaid` — **identical to Android** |
| Flutter package (`pubspec` name) | `obgaid_app` |
| Store name (≤30 chars) | `ObgAid-Obstetrics&Gynaecology` (29) |
| Short description (≤80) | `Obstetric & gynae calculators, FOGSI/RCOG protocols, FIGO staging.` (66) |
| Landing | `info.obgaid.bridgr.co.in` |
| Local path | `/Users/sunil/obgaid` (lowercase, matching `/Users/sunil/pediaid`) |
| Category | Medical · Target audience 18+ · Free |

Verified free on the App Store (IN storefront) as of 2026-08-21: ObgAid, ObsAid,
MatriAid, GynAid, ObGyAid, NatalAid, GravidAid, PartoAid.
`ObAid` was **rejected** — collides with *Obaid*, an existing app and a common
given name.

### Pre-first-upload checklist (the irreversible ones)
- [ ] Both platform IDs set to `com.obgaid.obgaid` **before** the first store upload
- [ ] Upload keystore generated and backed up (mirror `~/.pediaid-signing`)
- [ ] App Store Connect record created with the final name

---

## 2. Why this app wins

The App Store OBG space is **fragmented**: a dozen single-purpose "OB wheel /
EDD calculator" apps by individual developers, one protocol app out of Ethiopia,
and no India-first OBG clinical reference at all. Same gap PediAid walked into.

The moat is the same one PediAid built — **India-native content that no foreign
app carries**:

1. **DIPSI GDM criteria** — India's single-step 75g non-fasting test. Every
   foreign app has only IADPSG / Carpenter-Coustan.
2. **PCPNDT Act** — Form F, what may and may not be recorded or spoken during a
   scan. Every Indian sonologist works in fear of this. A clean reference is
   worth the download on its own.
3. **MTP Act 2021 amendment** — the 20/24-week limits, medical board
   composition, opinion requirements. Legally critical, constantly confused.
4. **Anemia Mukt Bharat** — IV iron protocols, Ganzoni dosing. Anaemia is *the*
   dominant Indian obstetric problem.
5. **FOGSI GCPRs** as the primary guideline set, the way IAP/NNF are PediAid's.
6. **LaQshya / SUMAN** labour-room quality standards.

Everything else (RCOG, ACOG, NICE, WHO, FIGO) is table stakes that makes it
credible outside India too.

---

## 3. Platform reuse — inherit, don't rebuild

PediAid is already a platform. ObgAid consumes it.

### Shared, one instance serving both apps
- **Backend** — the Fastify + Postgres service (`pediaid/backend`). Add an
  `app` discriminator column to content tables rather than standing up a second
  stack. Auth already carries a `specialty` field on the user profile — that is
  the natural hook. One Render service, one DB, one admin panel, one set of
  signing keys.
- **Auth / SSO** — a doctor signs in once. Migration `0034_pediaid-sso-handoff`
  already exists; extend it so a PediAid session lights up ObgAid and back.
- **Academics / CME, Never Again, Landmark Trials, Guideline Notes,
  Submissions, Moderation, Push, Bookmarks** — all specialty-agnostic features.
  Scope by `app`, reuse wholesale.

### Forked per-app
- Flutter shell, theme (new palette — PediAid's `#1e3a5f` navy should *not* be
  reused; ObgAid needs its own colour identity), icon, store listing, landing.
- All clinical content and calculators.

### Open architecture decision — resolve before Phase 1
Extract a shared Dart package (`aid_core`) for theme scaffolding, auth client,
calculator widget shell, bookmark/recents plumbing, and the genuinely shared
calculators (**Apgar, BSA, blood gas, cord gases, NRP** sit in both specialties).
Cost: a refactor of PediAid. Benefit: every later app is nearly free, and
bugfixes land once. **Recommendation: yes, but do it at Phase 4, not Phase 0** —
build ObgAid's content first, let the real duplication reveal itself, then
extract what's actually shared instead of what's theoretically shared.

---

## 4. Clinical content architecture

### Obstetrics
**Dating & growth** — EDD (LMP/Naegele, USG, IVF transfer), pregnancy wheel,
EFW (Hadlock 1–4, Shepard, Warsof), fetal growth percentiles (Hadlock,
INTERGROWTH-21st, WHO), customised charts, AFI/DVP percentiles, Doppler indices
(UA PI/RI, MCA, CPR, DV) with percentiles.

**Labour** — Bishop score, **WHO Labour Care Guide 2020** (has replaced the old
partograph — most apps still ship the obsolete one), VBAC success (MFMU),
induction and augmentation regimens, cord blood gas interpretation.

**Hypertensive disorders** — preeclampsia risk (FMF first-trimester),
sFlt-1/PlGF interpretation, severity features, **magnesium sulphate regimens
(Pritchard = Indian standard, Zuspan, Sibai)**, eclampsia protocol, MEOWS.

**Diabetes** — **DIPSI**, IADPSG, insulin initiation and titration, GDM
targets.

**Haemorrhage** — PPH estimation, shock index, **E-MOTIVE 2023 bundle**,
uterotonic doses, B-Lynch, **condom tamponade** (India-relevant), MTP protocol.

**Preterm** — cervical length, fetal fibronectin, progesterone indications,
antenatal corticosteroid timing, MgSO4 neuroprotection, tocolysis.

**Isoimmunisation** — Kleihauer-Betke, anti-D dosing, MCA-PSV (Mari curves).

**Medical disorders** — anaemia (**Ganzoni / IV iron**), thyroid
(trimester-specific TSH), obstetric cholestasis, VTE risk (RCOG GTG 37a),
epilepsy, cardiac disease (mWHO classification).

**Screening** — combined/quad test, cfDNA-NIPT interpretation with likelihood
ratios, NT/nasal bone/soft markers, twin chorionicity, TTTS Quintero staging.

### Gynaecology
**Reproductive endocrine** — PCOS (Rotterdam, AES), Ferriman-Gallwey, HOMA-IR,
PALM-COEIN, PBAC score.

**Infertility** — ovarian reserve (AMH, AFC), Bologna / **POSEIDON**, IUI/IVF
predictors, **WHO 2021 semen analysis reference**.

**Onco-gyn staging** — **FIGO 2018 cervical, FIGO 2023 endometrial, FIGO 2014
ovarian, FIGO vulvar, GTD prognostic score**. Staging tools are the single
highest-value gynae content.

**Adnexal mass** — RMI, **IOTA simple rules, O-RADS**, ROMA, endometrial
thickness thresholds.

**Structural** — **FIGO leiomyoma classification 0–8**, rASRM endometriosis
staging, ENZIAN, **POP-Q prolapse**, ICIQ.

**Contraception** — **WHO MEC wheel**, Pearl index, missed-pill rules,
emergency contraception.

**Menopause** — STRAW+10, MRS/Greene, MHT eligibility and regimens, FRAX.

**Infection** — Amsel criteria, Nugent score, PID, **NACO syndromic STI
management**.

**Perioperative** — ERAS gynae, Caprini VTE.

### Reference library
FOGSI GCPRs · ICOG · RCOG Green-top · ACOG Practice Bulletins · NICE NG201 /
NG235 · WHO ANC 2016, LCG 2020, PPH · **MTP Act 2021 · PCPNDT Act · LaQshya ·
SUMAN · Anemia Mukt Bharat · NACO**

### Formulary
Drug safety in pregnancy and lactation. Note: FDA letter categories are
**deprecated** — use the PLLR narrative format plus LactMed. This is a different
data shape from PediAid's Neofax/Harriet Lane dosing tables and needs its own
model.

---

## 5. Phasing

| Phase | Scope | Ships |
|---|---|---|
| **0 — Scaffold** | Identity locked, Flutter shell forked, new theme/palette/icon, repo + CI (codemagic, mirroring PediAid) | Runnable empty app |
| **1 — Calculators** | The obstetric engine: dating, growth, Bishop, LCG, preeclampsia/MgSO4, DIPSI, PPH, anti-D. Fully offline, no backend. | **Useful day one** |
| **2 — Gynae + staging** | FIGO staging set, IOTA/O-RADS, PCOS, POP-Q, FIGO fibroids, MEC wheel | Full OBG breadth |
| **3 — Reference library** | Guidelines, protocols, MTP/PCPNDT modules, lab normals in pregnancy | The moat |
| **4 — Backend** | SSO with PediAid, bookmarks, academics/CME, push. `aid_core` extraction decided here. | Platform parity |
| **5 — Launch** | Store listings, landing site, privacy policy, data-safety form, content rating | Live |

Phase 1 is the one that matters. PediAid earned trust by being *correct and
offline* before it was a platform; ObgAid should follow the same order.

---

## 6. Risks specific to OBG

- **Legal content is legally risky.** MTP and PCPNDT modules are the strongest
  differentiator *and* the highest liability. They must be quoted verbatim from
  the gazette with dates and a "verify current amendment" banner — never
  paraphrased into advice.
- **Patient-facing confusion.** The store is thick with pregnancy trackers for
  mothers. The listing, icon, and screenshots must read *clinician tool* on
  first glance or the wrong audience installs and one-star reviews it.
- **Content rating.** Unlike PediAid, OBG content touches sex, reproduction, and
  contraception. Answer the IARC questionnaire honestly — expect a rating above
  Everyone, and confirm it does not trip Play's medical/sexual-content policies.
- **Obsolete-by-default sources.** The WHO Labour Care Guide replaced the
  partograph; FDA pregnancy categories are gone; FIGO endometrial staging
  changed in 2023. Half the competing apps are wrong on these. Every screen
  carries its source and year, as PediAid already does.

---

## 7. Open questions

1. Who is the clinical co-author? PediAid's authority comes from Dr Sunil
   Mulgund being a paediatrician. ObgAid needs a named OBG consultant behind it
   for the same credibility — and for the store listing.
2. Shared account or separate? (Recommendation: shared — one login, both apps.)
3. Does ObgAid cross-link into PediAid at the handover point (newborn
   resuscitation, Apgar, first-hour care)? That link is a genuine product
   advantage neither app has alone.
