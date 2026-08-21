# CLAUDE.md

Guidance for Claude Code working in this repository.

## Project

**ObgAid** — an India-first obstetrics & gynaecology clinical reference.
Standalone sibling to **PediAid** (`/Users/sunil/pediaid`), which is live on
both stores and is the reference architecture for everything here.

**`docs/CONTENT_SPEC.md` is the authoritative content plan** — 68 sections, 30
modules, 100+ tools, with its own Tier 1/2/3 build order. Read it before adding
any clinical content. `PLAN.md` holds the product thesis; `ROADMAP.md` tracks
status against the spec's tiers.

## Hard constraints

- **Package identity is locked and identical across platforms:**
  `com.obgaid.obgaid` for Android `applicationId` **and** iOS
  `PRODUCT_BUNDLE_IDENTIFIER`. Never change either, and never let them diverge.
  PediAid's are permanently mismatched; that is the mistake this repo exists to
  not repeat. Note `flutter create` will happily regenerate the divergence
  (`com.obgaid.obgaid_app` vs `com.obgaid.obgaidApp`) — check after any
  platform re-scaffold.
- **Frontend first.** No backend calls until Phase 6, when ObgAid joins
  PediAid's existing Fastify + Postgres service via an `app` discriminator
  rather than a second stack.
- Store name is capped at 30 characters: `ObgAid-Obstetrics&Gynaecology` (29).

## Commands

```bash
cd flutter
flutter pub get
flutter run -d chrome
flutter analyze          # must be clean before pushing
flutter test
flutter build web --release --base-href /obgaid/app/
```

Pushing to `main` triggers `.github/workflows/deploy.yml`, which analyzes,
tests, builds web, and publishes both the landing page and the app to GitHub
Pages. A failing analyze or test blocks the deploy.

## Architecture

```
lib/
  main.dart                    ObgAidApp, theme provider wiring
  theme/                       ObgColors + M3 light/dark. Teal, NOT PediAid navy.
  models/       tool.dart       Tool + ToolModule (label/icon extension)
                staging.dart    StagingSystem / StageEntry
  data/         tool_registry.dart   single source of truth for working tools
                staging_data.dart    FIGO systems, transcribed from source
  widgets/      calc_widgets.dart    CalcScaffold, ResultCard, NumField,
                                     SectionLabel, ScoreChoice, Band
                reference_note.dart  the source citation on every clinical screen
                hub_widgets.dart     HubScaffold, HubTile, ComingSoon
  screens/
    home/                      mirrors PediAid's home: SliverAppBar, welcome
                               banner, 2-col feature grid, quick-access chips,
                               drawer, disclaimer
    hubs/                      one per module card
    calculators/               one file per calculator
    staging/                   renders any StagingSystem
    legal/                     MTP Act, PCPNDT Act
    guides/                    ultrasound scan guide
    search/                    global search over tools + staging
```

**Adding a calculator:** write the screen in `screens/calculators/`, then
register it in `data/tool_registry.dart`. Home quick-access, the calculators
hub and global search all read from the registry, so one registration surfaces
it everywhere.

## Content governance — enforced in CI

`test/content_governance_test.dart` enforces the specification's own rules. A
failure blocks the Pages deploy. Do not weaken these to make a change land.

- **§62 versioning.** Every clinical item needs a `ContentMeta` in
  `data/content_registry.dart`: id, author, medical reviewer, source
  organisation and title, year, semver version, evidence level, created and
  next-review dates, status.
- **§68 interconnection.** Every item declares `related` edges, and every edge
  states *why* — the reason belongs to the edge, not the target. No item may be
  an island; no edge may dangle. Links to unbuilt content are fine and render
  as "soon", which keeps the intended clinical pathway visible before every
  node on it exists.
- **§63 mandatory review.** Drug doses, emergency algorithms, PPH, eclampsia,
  severe hypertension, sepsis, blood products, anticoagulation, oncology and
  fertility dosing, fetal therapy and vaccination schedules must be
  `highRisk: true`, carry a `nextReview` date, and cannot reach
  `ContentStatus.published` without a `reviewer`. Unreviewed high-risk screens
  show a banner and appear in the drawer's review queue.
- **§61 never invent.** Doses, trial results, guideline recommendations,
  statistics, staging criteria, reference ranges and publication details are
  transcribed from a named source or not written at all.

## Clinical content rules

- Every clinical screen ends in a `ReferenceNote` naming its source and year.
  This is PediAid's trust mechanic and it is not optional.
- Where Indian practice differs, the Indian standard leads and the
  international one is shown beside it — DIPSI before IADPSG, Pritchard before
  Zuspan. Mark these tools `indiaSpecific: true` so they carry the India badge.
- Prefer the current edition and say what changed: the WHO Labour Care Guide
  has replaced the partograph, FIGO endometrial staging changed in 2023, FDA
  pregnancy letter categories were withdrawn in 2015.
- Statutory content (MTP, PCPNDT) is quoted, never paraphrased into advice, and
  always carries the verify-the-current-text banner. It is the strongest reason
  to install the app and its largest liability.
