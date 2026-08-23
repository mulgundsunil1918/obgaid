import 'package:shared_preferences/shared_preferences.dart';
import '../models/cme_entry.dart';

/// Local persistence for the CME log.
///
/// Deliberately on-device. When the shared backend arrives this becomes a
/// sync target rather than a rewrite.
class CmeStore {
  static const _key = 'obgaid_cme_log';

  static Future<List<CmeEntry>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];
    try {
      final list = CmeEntry.decode(raw);
      list.sort((a, b) => b.date.compareTo(a.date));
      return list;
    } catch (_) {
      // A corrupt store should not brick the screen.
      return [];
    }
  }

  static Future<void> save(List<CmeEntry> entries) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, CmeEntry.encode(entries));
  }

  static Future<List<CmeEntry>> add(CmeEntry entry) async {
    final entries = await load();
    entries.add(entry);
    entries.sort((a, b) => b.date.compareTo(a.date));
    await save(entries);
    return entries;
  }

  static Future<List<CmeEntry>> remove(String id) async {
    final entries = await load();
    entries.removeWhere((e) => e.id == id);
    await save(entries);
    return entries;
  }

  /// Credits earned within the last [years] years — the window most State
  /// Medical Councils assess at re-registration.
  static double creditsInWindow(List<CmeEntry> entries, int years) {
    final now = DateTime.now();
    final cutoff = DateTime(now.year - years, now.month, now.day);
    return entries
        .where((e) => e.date.isAfter(cutoff))
        .fold(0.0, (sum, e) => sum + e.credits);
  }
}
