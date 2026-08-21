import 'package:flutter_test/flutter_test.dart';
import 'package:obgaid_app/main.dart';

void main() {
  testWidgets('ObgAid boots to the home screen', (tester) async {
    await tester.pumpWidget(const ObgAidApp());
    await tester.pump();
    expect(find.text('ObgAid'), findsWidgets);
  });
}
