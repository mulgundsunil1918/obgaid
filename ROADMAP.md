# ObgAid — Roadmap

Tracking document. Status markers: ✅ done · 🔨 in progress · ⬜ pending

**Live preview:** https://mulgundsunil1918.github.io/obgaid/ · **App:** https://mulgundsunil1918.github.io/obgaid/app/

Legend for **Ship**: what a user can actually *do* once the sub-phase lands.

---

## Phase 0 — Foundation

| # | Sub-phase | Ship | Status |
|---|---|---|---|
| 0.1 | Identity lock — `com.obgaid.obgaid` on **both** Android + iOS | Irreversible IDs correct before first upload | ✅ |
| 0.2 | Flutter scaffold, pubspec, package rename | App compiles | ✅ |
| 0.3 | Theme system — M3 light/dark, ObgAid palette, typography | Own visual identity, not PediAid navy |✅ |
| 0.4 | App shell — home, module grid, search, drawer | Navigable app |✅ |
| 0.5 | Tool registry + shared calc widgets (input, result, reference note) | Adding a calculator is ~1 file |✅ |
| 0.6 | GitHub Pages preview pipeline (web → `/app/`, landing → `/`) | **You can click through every build** |✅ |
| 0.7 | Repo hygiene — README, CLAUDE.md, .gitignore, licence | Future sessions have context |✅ |

## Phase 1 — Obstetric core *(the day-one useful slice)*

| # | Sub-phase | Ship | Status |
|---|---|---|---|
| 1.1 | **Dating & GA** — EDD by LMP/Naegele + cycle adjust, USG redating, IVF dating, current GA, trimester | The single most-used OBG tool |✅ |
| 1.2 | **Fetal biometry** — EFW (Hadlock 1–4), EFW percentile (Hadlock 1991), SGA/LGA flags | Scan-room workhorse |✅ |
| 1.3 | **Labour** — Bishop score, WHO Labour Care Guide 2020, VBAC success (MFMU) | Labour-room decisions |✅ |
| 1.4 | **Hypertensive disorders** — PE severity, MgSO4 Pritchard/Zuspan/Sibai, toxicity monitoring + antidote, antihypertensive ladder | Eclampsia-grade emergency reference |✅ |
| 1.5 | **GDM** — DIPSI *(India)*, IADPSG, glycaemic targets, insulin initiation | India differentiator #1 |✅ |
| 1.6 | **PPH** — shock index, EBL % blood volume, E-MOTIVE 2023 bundle, uterotonic ladder, TXA | Leading cause of maternal death |✅ |
| 1.8 | **Ultrasound** — GA from CRL (Robinson–Fleming) and Hadlock biometry, AFI/DVP, plus a guide to all eight scans in pregnancy | Scan-room reference | ✅ |
| 1.7 | **Anaemia** — WHO/AMB grading, Ganzoni iron deficit, IV iron regimens | India differentiator #4 | ⬜ |

## Phase 2 — Obstetric advanced

| # | Sub-phase | Ship | Status |
|---|---|---|---|
| 2.1 | Doppler — UA PI/RI, MCA PSV (Mari), CPR, DV: percentiles + interpretation | ⬜ |
| 2.2 | Liquor — AFI & DVP percentiles, oligo/polyhydramnios | ⬜ |
| 2.3 | Isoimmunisation — Kleihauer-Betke, anti-D dosing, MCA-PSV MoM | ⬜ |
| 2.4 | Preterm — cervical length, fFN, progesterone, ACS timing, MgSO4 neuroprotection, tocolysis | ⬜ |
| 2.5 | Aneuploidy screening — combined/quad, NIPT with likelihood ratios, NT/nasal bone | ⬜ |
| 2.6 | Multiple pregnancy — chorionicity, TTTS Quintero, sFGR classification | ⬜ |
| 2.7 | Medical disorders — thyroid trimester ranges, cholestasis, VTE (GTG 37a), mWHO cardiac | ⬜ |
| 2.8 | MEOWS obstetric early warning + maternal sepsis | ⬜ |

## Phase 3 — Gynaecology

| # | Sub-phase | Ship | Status |
|---|---|---|---|
| 3.1 | **Onco-gyn staging** — FIGO cervical 2018, endometrial 2023, ovarian 2014, vulvar 2021, GTN + WHO score | Highest-value gynae content | ✅ *(shipped early)* |
| 3.2 | Adnexal mass — RMI, IOTA simple rules, O-RADS, ROMA, endometrial thickness | ⬜ |
| 3.3 | Structural — FIGO leiomyoma 0–8, rASRM endometriosis, ENZIAN, POP-Q | ⬜ |
| 3.4 | Reproductive endocrine — Rotterdam PCOS, Ferriman-Gallwey, HOMA-IR, PALM-COEIN, PBAC | ⬜ |
| 3.5 | Infertility — AMH/AFC reserve, POSEIDON, Bologna, WHO 2021 semen reference | ⬜ |
| 3.6 | Contraception — WHO MEC wheel, missed-pill rules, EC, Pearl index | ⬜ |
| 3.7 | Menopause — STRAW+10, MRS/Greene, MHT eligibility, FRAX | ⬜ |
| 3.8 | Infection — Amsel, Nugent, PID, NACO syndromic STI | ⬜ |

## Phase 4 — Reference library *(the moat)*

| # | Sub-phase | Ship | Status |
|---|---|---|---|
| 4.1 | **India legal** — MTP Act 2021 amendment, PCPNDT Act + Form F | Nothing foreign carries this | ✅ *(shipped early)* |
| 4.2 | **India programmes** — Anemia Mukt Bharat, LaQshya, SUMAN, JSY/JSSK | ⬜ |
| 4.3 | Guidelines — FOGSI GCPR, ICOG, RCOG Green-top, ACOG, NICE, WHO | ⬜ |
| 4.4 | Lab normals in pregnancy (trimester-specific) | ⬜ |
| 4.5 | Emergency algorithms — eclampsia, PPH, shoulder dystocia, cord prolapse, AFE, maternal collapse | ⬜ |
| 4.6 | Scores hub + global search | ⬜ |

## Phase 5 — Formulary

| # | Sub-phase | Ship | Status |
|---|---|---|---|
| 5.1 | Pregnancy drug safety — PLLR narrative format (**not** deprecated FDA letter categories) | ⬜ |
| 5.2 | Lactation safety — LactMed-style | ⬜ |
| 5.3 | Common obstetric & gynae drug dosing | ⬜ |
| 5.4 | Formulary search + bookmarks | ⬜ |

## Phase 6 — Platform integration *(inherit PediAid's backend)*

| # | Sub-phase | Ship | Status |
|---|---|---|---|
| 6.1 | Backend `app` discriminator migration — one Fastify+Postgres serves both apps | No second stack to pay for | ⬜ |
| 6.2 | SSO handoff with PediAid — one login, both apps | ⬜ |
| 6.3 | Bookmarks, recents, saved | ⬜ |
| 6.4 | Academics / CME scoped to OBG | ⬜ |
| 6.5 | Push notifications | ⬜ |
| 6.6 | `aid_core` shared package extraction *(decided here, not earlier)* | ⬜ |

## Phase 7 — Launch

| # | Sub-phase | Ship | Status |
|---|---|---|---|
| 7.1 | Icon, splash, feature graphic, screenshots | ⬜ |
| 7.2 | Landing site + privacy policy | ⬜ |
| 7.3 | Play Console — data safety, content rating, listing | ⬜ |
| 7.4 | App Store Connect — listing, review notes | ⬜ |
| 7.5 | Keystore + signing, Codemagic CI | ⬜ |
| 7.6 | Store submission | ⬜ |

---

## Clinical authorship

Content authored and reviewed by **Dr Sunil Mulgund** (as of 2026-08-21).
A named OBG consultant co-author remains desirable before store launch (Phase 7)
for the same credibility PediAid carries — revisit at 7.3.
