import 'package:flutter/material.dart';

/// Per-item icons, keyed by node id.
///
/// Icons used to be assigned per group — `icon: t.module.icon` — so every
/// tool in a module shared one glyph and 235 nodes drew on 31 icons. Three
/// fetal-biometry cards were visually identical triplets. This map assigns
/// meaning to the item rather than to the bucket it sits in.
///
/// Where an id is absent the caller falls back to its group icon, so adding a
/// node never breaks; it just starts generic until it is given a glyph.
class IconMap {
  static IconData? of(String id) => _map[id];

  /// Every id this map claims to know. Used by the test that catches stale
  /// entries after a rename.
  static Iterable<String> get mappedIds => _map.keys;

  static IconData resolve(String id, IconData fallback) =>
      _map[id] ?? _byPrefix(id) ?? fallback;

  /// Families that are genuinely homogeneous — trials, safety cases, exam
  /// topics — still need variety inside their own hub, so they are keyed by
  /// sub-group rather than given one glyph each or one glyph for all.
  /// Trials vary by the clinical question they answered.
  static IconData forTrialCategory(String category) {
    final c = category.toLowerCase();
    if (c.contains('hypert')) return Icons.bolt_outlined;
    if (c.contains('preterm')) return Icons.hourglass_bottom;
    if (c.contains('diabet')) return Icons.bloodtype_outlined;
    if (c.contains('labour')) return Icons.directions_walk;
    if (c.contains('pph') || c.contains('haemorrh')) return Icons.water_drop;
    if (c.contains('fetal')) return Icons.child_friendly_outlined;
    if (c.contains('gynae')) return Icons.healing_outlined;
    if (c.contains('reproduct')) return Icons.spa_outlined;
    if (c.contains('onco') || c.contains('cancer')) return Icons.coronavirus;
    return Icons.science_outlined;
  }

  /// Drugs vary by what they do, which is the thing a prescriber is scanning
  /// for.
  static IconData forDrugClass(String drugClass) {
    final c = drugClass.toLowerCase();
    if (c.contains('oxytoc') || c.contains('prostagl')) {
      return Icons.compress;
    }
    if (c.contains('antihypertens') || c.contains('blocker') ||
        c.contains('calcium channel') || c.contains('vasodilat')) {
      return Icons.speed;
    }
    if (c.contains('anticoag') || c.contains('heparin')) {
      return Icons.timeline;
    }
    if (c.contains('antifibrinolytic')) return Icons.water_drop_outlined;
    if (c.contains('antibiot') || c.contains('penicillin') ||
        c.contains('macrolide') || c.contains('cephalosporin') ||
        c.contains('nitroimidazole')) {
      return Icons.coronavirus_outlined;
    }
    if (c.contains('antifungal')) return Icons.grass;
    if (c.contains('corticosteroid')) return Icons.cloud_outlined;
    if (c.contains('anticonvuls') || c.contains('magnesium')) {
      return Icons.science_outlined;
    }
    if (c.contains('insulin') || c.contains('hypoglyc')) {
      return Icons.vaccines_outlined;
    }
    if (c.contains('iron')) return Icons.invert_colors;
    if (c.contains('immunoglobulin')) return Icons.shield_outlined;
    if (c.contains('antiemetic')) return Icons.sick_outlined;
    if (c.contains('analgesi') || c.contains('nsaid') ||
        c.contains('paracetamol')) {
      return Icons.healing_outlined;
    }
    if (c.contains('oestrogen') || c.contains('progest') ||
        c.contains('contracept') || c.contains('gnrh')) {
      return Icons.shield_moon_outlined;
    }
    if (c.contains('serm') || c.contains('aromatase') ||
        c.contains('parp') || c.contains('taxane') ||
        c.contains('platinum') || c.contains('checkpoint') ||
        c.contains('vegf')) {
      return Icons.biotech_outlined;
    }
    return Icons.medication_outlined;
  }

  static IconData? _byPrefix(String id) {
    if (id.startsWith('case-')) {
      if (id.contains('pph') || id.contains('blood')) return Icons.water_drop;
      if (id.contains('sepsis')) return Icons.coronavirus_outlined;
      if (id.contains('eclampsia')) return Icons.bolt_outlined;
      if (id.contains('ctg')) return Icons.monitor_heart_outlined;
      if (id.contains('vte')) return Icons.timeline;
      if (id.contains('mgso4') || id.contains('oxytocin')) {
        return Icons.science_outlined;
      }
      if (id.contains('handover') || id.contains('language')) {
        return Icons.forum_outlined;
      }
      if (id.contains('swab') || id.contains('bladder')) {
        return Icons.content_cut_outlined;
      }
      return Icons.report_problem_outlined;
    }
    if (id.startsWith('exam-')) {
      if (id.contains('oncology')) return Icons.coronavirus;
      if (id.contains('statute')) return Icons.gavel;
      if (id.contains('basic')) return Icons.biotech_outlined;
      if (id.contains('operative')) return Icons.content_cut;
      if (id.contains('urogyn')) return Icons.water_outlined;
      if (id.contains('reproductive')) return Icons.spa_outlined;
      if (id.contains('maternal')) return Icons.medical_information_outlined;
      return Icons.school_outlined;
    }
    if (id.startsWith('qt-')) return Icons.table_rows_outlined;
    if (id.startsWith('score-')) {
      // Scores mirror their tool where one exists; the rest vary by subject.
      final bare = id.substring(6);
      final mapped = _map[bare];
      if (mapped != null) return mapped;
      if (bare.contains('rmi') || bare.contains('roma') ||
          bare.contains('iota')) {
        return Icons.album_outlined;
      }
      if (bare.contains('fsfi') || bare.contains('ehp')) {
        return Icons.favorite_outline;
      }
      if (bare.contains('iciq')) return Icons.water_outlined;
      if (bare.contains('qsofa')) return Icons.coronavirus_outlined;
      if (bare.contains('rotterdam')) return Icons.donut_large;
      if (bare.contains('gtn')) return Icons.grain_outlined;
      return Icons.rule_outlined;
    }
    if (id.startsWith('couns-')) {
      if (id.contains('cancer')) return Icons.sentiment_neutral_outlined;
      if (id.contains('pph') || id.contains('miscarriage') ||
          id.contains('ectopic')) {
        return Icons.support_agent_outlined;
      }
      if (id.contains('breastfeeding') || id.contains('nutrition')) {
        return Icons.local_drink_outlined;
      }
      if (id.contains('contracept')) return Icons.shield_moon_outlined;
      if (id.contains('caesarean') || id.contains('vbac')) {
        return Icons.content_cut_outlined;
      }
      if (id.contains('ivf') || id.contains('infertility') ||
          id.contains('pcos')) {
        return Icons.spa_outlined;
      }
      if (id.contains('gdm') || id.contains('hypertension') ||
          id.contains('preeclampsia')) {
        return Icons.monitor_heart_outlined;
      }
      if (id.contains('labour') || id.contains('induction')) {
        return Icons.directions_walk;
      }
      if (id.contains('menopause') || id.contains('fibroids') ||
          id.contains('endometriosis')) {
        return Icons.healing_outlined;
      }
      return Icons.record_voice_over_outlined;
    }
    return null;
  }

  static const _map = <String, IconData>{
    // ── Emergency algorithms ────────────────────────────────────────────
    'algo-pph': Icons.water_drop,
    'algo-abruption': Icons.crisis_alert,
    'algo-uterine-rupture': Icons.broken_image_outlined,
    'algo-eclampsia': Icons.bolt,
    'algo-severe-htn': Icons.speed,
    'algo-maternal-collapse': Icons.airline_seat_flat,
    'algo-afe': Icons.bubble_chart,
    'algo-sepsis': Icons.coronavirus,
    'algo-shoulder-dystocia': Icons.pan_tool_outlined,
    'algo-cord-prolapse': Icons.cable,
    'algo-ctg': Icons.monitor_heart,
    'algo-rfm': Icons.motion_photos_off,
    'algo-fgr': Icons.trending_down,
    'algo-pprom': Icons.water_damage_outlined,
    'algo-preterm-labour': Icons.schedule,
    'algo-ectopic': Icons.wrong_location_outlined,
    'algo-miscarriage': Icons.heart_broken_outlined,
    'algo-septic-abortion': Icons.dangerous_outlined,
    'algo-ovarian-torsion': Icons.rotate_right,
    'algo-ruptured-cyst': Icons.blur_circular,
    'algo-pelvic-pain': Icons.flash_on,
    'algo-pelvic-sepsis': Icons.biotech,
    'algo-aub': Icons.opacity,
    'algo-pmb': Icons.warning_amber_rounded,
    'algo-ohss': Icons.scatter_plot,
    'algo-bartholin': Icons.lens_blur,
    'algo-vaginal-foreign-body': Icons.search_off,
    'algo-urinary-retention': Icons.block,
    'algo-postop-haemorrhage': Icons.healing,

    // ── Calculators and tools ───────────────────────────────────────────
    'dating': Icons.event_available,
    'efw': Icons.monitor_weight_outlined,
    'biometry': Icons.straighten,
    'usg': Icons.graphic_eq,
    'usg-guide': Icons.menu_book_outlined,
    'anthropometry': Icons.accessibility_new,
    'weight-gain': Icons.trending_up,
    'haemodynamics': Icons.favorite_border,
    'pph': Icons.water_drop_outlined,
    'mgso4': Icons.science_outlined,
    'insulin': Icons.vaccines_outlined,
    'gdm': Icons.bloodtype_outlined,
    'anaemia': Icons.invert_colors,
    'creatinine': Icons.filter_alt_outlined,
    'vte-risk': Icons.timeline,
    'bishop': Icons.checklist_rtl,
    'apgar': Icons.child_care,
    'robson': Icons.category_outlined,
    'meows': Icons.notifications_active_outlined,
    'epds': Icons.psychology_outlined,
    'popq': Icons.south,
    'score-pbac': Icons.calendar_view_week,
    'caprini': Icons.merge_type,
    'rasrm': Icons.grain,
    'quintero': Icons.compare_arrows,
    'adnexal-mass': Icons.album_outlined,
    'pcos-assessment': Icons.donut_large,
    'aub': Icons.opacity,
    'contraception': Icons.shield_moon_outlined,
    'lab-reference': Icons.science,
    'immunisation': Icons.vaccines,
    'formulary': Icons.medication_liquid,

    // ── Clinical topics ─────────────────────────────────────────────────
    'ctg': Icons.monitor_heart_outlined,
    'fgr': Icons.trending_down,
    'pprom': Icons.water_damage_outlined,
    'preterm-labour': Icons.hourglass_bottom,
    'induction': Icons.play_circle_outline,
    'vbac': Icons.replay_circle_filled_outlined,
    'caesarean': Icons.content_cut,
    'rh-negative': Icons.remove_circle_outline,
    'maternal-medicine': Icons.medical_information_outlined,
    'fetal-medicine': Icons.child_friendly_outlined,
    'pcos': Icons.donut_large,
    'endometriosis': Icons.grain,
    'adenomyosis': Icons.texture,
    'fibroids': Icons.bubble_chart_outlined,
    'menopause': Icons.wb_twilight,
    'urogynaecology': Icons.water_outlined,
    'infertility': Icons.spa_outlined,
    'ohss': Icons.scatter_plot_outlined,
    'vulval-disorders': Icons.healing_outlined,
    'pathology': Icons.biotech_outlined,
    'imaging': Icons.image_search,
    'mtp-act': Icons.gavel,
    'pcpndt-act': Icons.policy_outlined,

    // ── Procedures ──────────────────────────────────────────────────────
    'proc-vaginal-exam': Icons.touch_app_outlined,
    'proc-oxytocin': Icons.opacity_outlined,
    'proc-uterine-exploration': Icons.pan_tool_alt_outlined,
    'proc-avd': Icons.download_outlined,
    'proc-perineal-repair': Icons.link,
    'proc-manual-removal': Icons.back_hand_outlined,
    'proc-balloon': Icons.circle_outlined,
    'proc-surgical-miscarriage': Icons.cleaning_services_outlined,
    'proc-vaginal-surgery': Icons.content_cut_outlined,
    'proc-hysteroscopy': Icons.videocam_outlined,
    'proc-laparoscopy': Icons.camera_outdoor_outlined,
    'proc-colposcopy': Icons.zoom_in,
    'proc-pap': Icons.colorize_outlined,
    'proc-endometrial-biopsy': Icons.compress,
    'proc-iucd': Icons.add_circle_outline,
    'proc-implant': Icons.horizontal_rule,

    // ── Surgical anatomy ────────────────────────────────────────────────
    'anat-ureter': Icons.alt_route,
    'anat-uterine-artery': Icons.call_split,
    'anat-internal-iliac': Icons.account_tree_outlined,
    'anat-abdominal-wall': Icons.layers_outlined,
    'anat-spaces': Icons.crop_free,
    'anat-nerves': Icons.polyline_outlined,
    'anat-perineum': Icons.change_history_outlined,

    // ── Learning: by curriculum area, then by subject ───────────────────
    'lrn-genital-embryology': Icons.hub_outlined,
    'lrn-menstrual-cycle': Icons.autorenew,
    'lrn-pregnancy-physiology': Icons.speed_outlined,
    'lrn-placenta': Icons.filter_drama_outlined,
    'lrn-fetal-circulation': Icons.sync_alt,
    'lrn-obs-history': Icons.history_edu_outlined,
    'lrn-gyn-history': Icons.assignment_ind_outlined,
    'lrn-abdominal-exam': Icons.pan_tool_outlined,
    'lrn-pelvic-exam': Icons.visibility_outlined,
    'lrn-hyperemesis': Icons.sick_outlined,
    'lrn-gtd': Icons.grain_outlined,
    'lrn-recurrent-loss': Icons.repeat,
    'lrn-abortion-care': Icons.gavel_outlined,
    'lrn-aph-praevia': Icons.warning_outlined,
    'lrn-multiple-pregnancy': Icons.people_outline,
    'lrn-liquor-disorders': Icons.water,
    'lrn-post-term': Icons.more_time,
    'lrn-obstetric-cholestasis': Icons.back_hand,
    'lrn-infections-pregnancy': Icons.coronavirus_outlined,
    'lrn-obesity-pregnancy': Icons.monitor_weight,
    'lrn-vte-pregnancy': Icons.timeline_outlined,
    'lrn-normal-labour': Icons.directions_walk,
    'lrn-labour-analgesia': Icons.medication_outlined,
    'lrn-malpresentation': Icons.rotate_90_degrees_ccw,
    'lrn-prolonged-labour': Icons.hourglass_empty,
    'lrn-puerperium': Icons.night_shelter_outlined,
    'lrn-postnatal-mental-health': Icons.psychology,
    'lrn-lactation': Icons.local_drink_outlined,
    'lrn-amenorrhoea': Icons.event_busy,
    'lrn-dysmenorrhoea': Icons.sentiment_dissatisfied_outlined,
    'lrn-pms': Icons.mood_bad_outlined,
    'lrn-chronic-pelvic-pain': Icons.blur_on,
    'lrn-endometrial-hyperplasia': Icons.layers,
    'lrn-mullerian-anomalies': Icons.account_tree,
    'lrn-asherman': Icons.link_off,
    'lrn-sti': Icons.shield_outlined,
    'lrn-vaginitis': Icons.bubble_chart,
    'lrn-hiv-pptct': Icons.health_and_safety_outlined,
    'lrn-hpv-vaccination': Icons.vaccines_outlined,
    'lrn-adolescent-gynae': Icons.escalator_warning_outlined,
    'lrn-sexual-violence-care': Icons.support_outlined,
    'lrn-fgm': Icons.report_outlined,
    'lrn-male-factor': Icons.male_outlined,
    'lrn-ovulation-induction': Icons.egg_outlined,
    'lrn-art-techniques': Icons.biotech,
    'lrn-cervical-cancer': Icons.dangerous,
    'lrn-ovarian-cancer': Icons.album,
    'lrn-endometrial-cancer': Icons.layers_clear_outlined,

    // ── FIGO staging ────────────────────────────────────────────────────
    'figo-cervix-2018': Icons.filter_1,
    'figo-endometrium-2023': Icons.filter_2,
    'figo-ovary-2014': Icons.filter_3,
    'figo-vulva-2021': Icons.filter_4,
    'figo-who-gtn': Icons.filter_5,
  };
}
