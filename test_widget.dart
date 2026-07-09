import 'package:flutter_test/flutter_test.dart';
import 'package:likhin_portfolio/portfolio_app.dart';

void main() {
  testWidgets('pump app', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();
  });
}
