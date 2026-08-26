import 'content_registry.dart';
import '../models/content_meta.dart';
import 'quick_tables.dart';
import 'drug_registry.dart';
import 'scores.dart';
import 'algorithm_registry.dart';
import 'learning_registry.dart';

/// One searchable entry: a node, plus everything a clinician might type to
/// reach it.
class SearchHit {
  const SearchHit(this.link, this.category, this.score);
  final ContentLink link;
  final String category;

  /// Lower is a better match.
  final int score;
}

/// Global search over the whole content graph.
///
/// The previous implementation hand-listed six registries, so it could find
/// tools, algorithms, topics, drugs, trials and staging — and nothing else.
/// Scores, counselling guides, learning topics, safety cases, exam topics,
/// quick tables, anatomy, guidelines, the lab reference, immunisation and both
/// statutes were invisible: roughly 150 of 235 nodes.
///
/// Searching the graph instead of a hand-written list makes that class of gap
/// impossible — a node that exists is a node that can be found.
class SearchIndex {
  /// Abbreviations and lay terms a clinician actually types, mapped to words
  /// that appear in titles. Without this, "LSCS" and "PROM" return nothing
  /// while the content sits right there.
  static const _synonyms = <String, List<String>>{
    'pph': ['postpartum haemorrhage'],
    'aph': ['antepartum haemorrhage', 'abruption', 'praevia'],
    'prom': ['prelabour rupture', 'rupture of membranes'],
    'pprom': ['preterm prelabour rupture'],
    'lscs': ['caesarean'],
    'cs': ['caesarean'],
    'gdm': ['gestational diabetes'],
    'dipsi': ['gestational diabetes'],
    'iugr': ['growth restriction'],
    'fgr': ['growth restriction'],
    'sga': ['growth restriction', 'biometry'],
    'edd': ['dating', 'gestational age'],
    'lmp': ['dating', 'gestational age'],
    'ctg': ['cardiotocograph', 'fetal monitoring'],
    'nst': ['cardiotocograph', 'fetal monitoring'],
    'bpp': ['biophysical profile'],
    'efw': ['estimated fetal weight'],
    'ttts': ['twin', 'quintero'],
    'taps': ['twin', 'anaemia polycythaemia'],
    'ohss': ['ovarian hyperstimulation'],
    'pid': ['pelvic inflammatory'],
    'sti': ['sexually transmitted'],
    'rti': ['sexually transmitted'],
    'pcod': ['polycystic', 'pcos'],
    'aub': ['abnormal uterine bleeding'],
    'hmb': ['heavy menstrual', 'abnormal uterine bleeding'],
    'pmb': ['postmenopausal bleeding'],
    'pop': ['prolapse', 'pop-q'],
    'sui': ['incontinence', 'urogynaecology'],
    'mtp': ['abortion', 'termination', 'mtp act'],
    'pcpndt': ['pcpndt act', 'sex determination'],
    'form f': ['pcpndt act'],
    'formf': ['pcpndt act'],
    'pndt': ['pcpndt act'],
    'rule 3b': ['mtp act'],
    'pocso': ['adolescent', 'sexual violence'],
    'bandl': ['obstructed labour'],
    'partograph': ['labour'],
    'labour care guide': ['labour'],
    'kick count': ['reduced fetal movements'],
    'sfh': ['abdominal examination', 'growth'],
    'accreta': ['antepartum haemorrhage', 'praevia'],
    'praevia': ['antepartum haemorrhage'],
    'previa': ['antepartum haemorrhage', 'praevia'],
    'shoulder': ['shoulder dystocia'],
    'cord': ['cord prolapse'],
    'afe': ['amniotic fluid embolism'],
    'hellp': ['severe hypertension', 'eclampsia'],
    'icp': ['cholestasis'],
    'obstetric cholestasis': ['cholestasis'],
    'vte': ['thromboembolism', 'thrombosis'],
    'dvt': ['thromboembolism', 'thrombosis'],
    'pe': ['thromboembolism', 'pulmonary embolism'],
    'mgso4': ['magnesium'],
    'txa': ['tranexamic'],
    'hrt': ['menopause', 'hormone'],
    'mht': ['menopause', 'hormone'],
    'ecv': ['breech', 'malpresentation'],
    'avd': ['assisted vaginal'],
    'oasis': ['perineal', 'sphincter'],
    'iud': ['iucd', 'intrauterine'],
    'iucd': ['intrauterine device'],
    'via': ['cervical screening', 'cervical cancer'],
    'hpv': ['human papillomavirus', 'cervical'],
    'rmi': ['malignancy index', 'adnexal'],
    'figo': ['staging'],
    'anc': ['antenatal'],
    'pnc': ['postnatal', 'puerperium'],
    'epds': ['depression', 'postnatal mental'],
    'meows': ['early warning'],
    'ivf': ['fertility', 'assisted reproduction'],
    'icsi': ['fertility', 'assisted reproduction'],
    'art': ['assisted reproduction'],
    'poi': ['premature ovarian', 'menopause'],
    'fgm': ['female genital mutilation'],
    'gtd': ['trophoblastic'],
    'gtn': ['trophoblastic'],
    'usg': ['ultrasound'],
    'tvs': ['ultrasound'],
    'dfm': ['reduced fetal movements'],
    'rfm': ['reduced fetal movements'],
  };

  static String _norm(String s) => s.toLowerCase().trim();

  /// Extra text a node should be findable by, beyond its title.
  ///
  /// Titles alone are too thin: "fibrinogen" is a cell inside the blood
  /// products table, "Syntocinon" is a brand name inside a monograph, and
  /// neither appears in any title. Built once and cached.
  static Map<String, String>? _keywordCache;

  static Map<String, String> get _keywords {
    final cached = _keywordCache;
    if (cached != null) return cached;
    final k = <String, String>{};

    void add(String id, Iterable<String> parts) {
      final blob = parts.where((p) => p.trim().isNotEmpty).join(' ');
      if (blob.isEmpty) return;
      final prior = k[id];
      k[id] = _norm(prior == null ? blob : '$prior $blob');
    }

    // Quick tables are searchable down to the cell — that is the whole point
    // of a lookup table.
    for (final t in kQuickTables) {
      add(t.id, [
        t.subtitle,
        ...t.columns,
        for (final row in t.rows) ...row,
        t.note ?? '',
      ]);
    }

    // Drugs by brand name and class — clinicians search the name on the box.
    for (final d in DrugRegistry.all) {
      add(d.id, [d.generic, d.drugClass, ...d.brandNames, ...d.indications]);
    }

    for (final sc in kScores) {
      add(sc.id, [sc.subtitle, sc.purpose, ...sc.inputs]);
    }

    for (final a in AlgorithmRegistry.all) {
      add(a.id, [a.subtitle]);
    }

    for (final lt in LearningRegistry.all) {
      add(lt.id, [lt.subtitle ?? '', lt.summary, ...lt.keyPoints]);
    }

    _keywordCache = k;
    return k;
  }

  /// Expand the query with any synonyms, so "LSCS" also searches "caesarean".
  static List<String> _terms(String query) {
    final q = _norm(query);
    if (q.isEmpty) return const [];
    final out = <String>[q];
    final syn = _synonyms[q];
    if (syn != null) out.addAll(syn);
    // Also expand each whitespace-separated token.
    for (final tok in q.split(RegExp(r'\s+'))) {
      final s = _synonyms[tok];
      if (s != null) out.addAll(s);
    }
    return out;
  }

  /// Rank so that a title match always beats a category match — otherwise
  /// searching "sepsis" surfaces every item categorised under sepsis before
  /// the sepsis algorithm itself.
  static int? _rank(ContentLink n, ContentMeta? meta, List<String> terms) {
    final title = _norm(n.title);
    final category = _norm(meta?.category ?? '');
    final source = _norm(meta?.sourceTitle ?? '');
    int? best;

    void consider(int s) {
      if (best == null || s < best!) best = s;
    }

    for (final t in terms) {
      if (title == t) {
        consider(0);
      } else if (title.startsWith(t)) {
        consider(1);
      } else if (title.contains(t)) {
        consider(2);
      } else if (_norm(n.id).contains(t)) {
        consider(3);
      } else if (category.contains(t)) {
        consider(4);
      } else if (source.contains(t)) {
        consider(5);
      } else if ((_keywords[n.id] ?? '').contains(t)) {
        consider(6);
      }
    }
    return best;
  }

  /// Every node that matches, best first, grouped-ready.
  static List<SearchHit> search(String query) {
    final terms = _terms(query);
    if (terms.isEmpty) return const [];

    final hits = <SearchHit>[];
    for (final n in ContentRegistry.allNodes) {
      if (n.builder == null) continue;
      final meta = ContentRegistry.metaFor(n.id);
      final r = _rank(n, meta, terms);
      if (r != null) {
        hits.add(SearchHit(n, meta?.category ?? 'Reference', r));
      }
    }

    hits.sort((a, b) {
      final c = a.score.compareTo(b.score);
      return c != 0 ? c : a.link.title.compareTo(b.link.title);
    });
    return hits;
  }

  /// Results grouped under their content category, preserving rank order.
  static Map<String, List<SearchHit>> grouped(String query) {
    final out = <String, List<SearchHit>>{};
    for (final h in search(query)) {
      out.putIfAbsent(h.category, () => []).add(h);
    }
    return out;
  }
}
