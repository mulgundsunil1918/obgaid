import 'dart:convert';

enum CmeType { conference, workshop, webinar, journalClub, teaching, other }

extension CmeTypeInfo on CmeType {
  String get label => switch (this) {
        CmeType.conference => 'Conference',
        CmeType.workshop => 'Workshop / hands-on',
        CmeType.webinar => 'Webinar',
        CmeType.journalClub => 'Journal club',
        CmeType.teaching => 'Teaching delivered',
        CmeType.other => 'Other',
      };
}

/// One logged CME activity.
///
/// Stored on the device. Event listings are inherently a server feature —
/// they are time-sensitive and user-submitted — so this module does the part
/// that works offline: keeping the record a clinician actually needs at
/// re-registration.
class CmeEntry {
  const CmeEntry({
    required this.id,
    required this.title,
    required this.organiser,
    required this.date,
    required this.credits,
    required this.type,
    this.accreditingBody,
    this.notes,
    this.certificateHeld = false,
  });

  final String id;
  final String title;
  final String organiser;
  final DateTime date;
  final double credits;
  final CmeType type;
  final String? accreditingBody;
  final String? notes;
  final bool certificateHeld;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'organiser': organiser,
        'date': date.toIso8601String(),
        'credits': credits,
        'type': type.name,
        'accreditingBody': accreditingBody,
        'notes': notes,
        'certificateHeld': certificateHeld,
      };

  static CmeEntry fromJson(Map<String, dynamic> j) => CmeEntry(
        id: j['id'] as String,
        title: j['title'] as String,
        organiser: j['organiser'] as String? ?? '',
        date: DateTime.parse(j['date'] as String),
        credits: (j['credits'] as num).toDouble(),
        type: CmeType.values.firstWhere(
          (t) => t.name == j['type'],
          orElse: () => CmeType.other,
        ),
        accreditingBody: j['accreditingBody'] as String?,
        notes: j['notes'] as String?,
        certificateHeld: j['certificateHeld'] as bool? ?? false,
      );

  static String encode(List<CmeEntry> entries) =>
      jsonEncode(entries.map((e) => e.toJson()).toList());

  static List<CmeEntry> decode(String raw) {
    final list = jsonDecode(raw) as List<dynamic>;
    return list
        .map((e) => CmeEntry.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
