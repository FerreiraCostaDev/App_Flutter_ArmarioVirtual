import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_armario/main.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ArmarioVirtualApp());
  });
}
