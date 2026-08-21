# ObgAid

**ObgAid — Obstetrics & Gynaecology.** An India-first clinical reference for
obstetricians and gynaecologists. Standalone sibling to
[PediAid](https://apps.apple.com/app/id6777623709), sharing its platform.

**Live preview:** https://mulgundsunil1918.github.io/obgaid/
**The app itself:** https://mulgundsunil1918.github.io/obgaid/app/

Both rebuild automatically on every push to `main`.

---

## Repository layout

```
flutter/      the ObgAid app — web, Android, iOS
landing/      static preview site (served at the Pages root)
PLAN.md       product plan: thesis, moat, platform reuse, risks
ROADMAP.md    phase and sub-phase tracking, with status
```

## Identity — do not change

| | |
|---|---|
| Android `applicationId` | `com.obgaid.obgaid` |
| iOS `PRODUCT_BUNDLE_IDENTIFIER` | `com.obgaid.obgaid` |
| Flutter package | `obgaid_app` |
| Store name | `ObgAid-Obstetrics&Gynaecology` (29/30 chars) |

These are **deliberately identical across platforms.** PediAid shipped
`com.pediaid.pediaid` on Android and `app.pediaid.pediaid` on iOS; that
mismatch is permanent and cannot be corrected after the first store upload.
`flutter create` reproduced the same divergence here by default
(`com.obgaid.obgaid_app` vs `com.obgaid.obgaidApp`) and it was corrected before
any upload existed. Do not let it drift back.

## Working on it

```bash
cd flutter
flutter pub get
flutter run -d chrome
```

```bash
flutter analyze && flutter test
```

## Clinical content

Every threshold is transcribed from its source publication, and every screen
names that source on the screen — the trust mechanic PediAid runs on. Where
Indian practice differs (DIPSI, Pritchard, MTP, PCPNDT, Anemia Mukt Bharat) the
Indian standard leads and the international one is shown alongside.

Statutory content is a summary for clinical reference, not legal advice, and
carries a verify-the-current-text banner on every such screen.

Content authored by Dr Sunil Mulgund.
