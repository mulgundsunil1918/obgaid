import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

/// ObgAid is offline by decision. This is the test that keeps it that way —
/// a networked package can arrive as a transitive convenience long after
/// anyone remembers the decision was made.
void main() {
  group('the app stays offline', () {
    late final String pubspec;

    setUpAll(() => pubspec = File('pubspec.yaml').readAsStringSync());

    test('no networking or backend package is declared', () {
      const banned = [
        'http:',
        'dio:',
        'supabase',
        'firebase',
        'cloud_firestore',
        'googleapis',
        'graphql',
        'web_socket_channel',
        'postgres',
        'powersync',
        'amplify',
        'appwrite',
      ];
      final found = banned
          .where((b) => pubspec.contains(RegExp('^\\s+$b', multiLine: true)))
          .toList();
      expect(found, isEmpty,
          reason: 'ObgAid does not talk to a server. Remove: '
              '${found.join(", ")}');
    });

    test('no source file opens a connection', () {
      final offenders = <String>[];
      final pattern = RegExp(
          r'HttpClient|package:http/|Supabase\.|FirebaseFirestore|'
          r'WebSocket\(|\.connect\(');
      for (final f in Directory('lib')
          .listSync(recursive: true)
          .whereType<File>()
          .where((f) => f.path.endsWith('.dart'))) {
        if (pattern.hasMatch(f.readAsStringSync())) {
          offenders.add(f.path);
        }
      }
      expect(offenders, isEmpty,
          reason: 'these files reach the network: ${offenders.join(", ")}');
    });

    test('the android manifest asks for no internet permission', () {
      final manifest =
          File('android/app/src/main/AndroidManifest.xml');
      if (!manifest.existsSync()) return;
      expect(manifest.readAsStringSync(), isNot(contains('INTERNET')),
          reason: 'the app requests INTERNET but has nothing to use it for; '
              'an offline app asking for network access is a review flag and '
              'a trust problem');
    });
  });
}
