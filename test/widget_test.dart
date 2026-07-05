import 'package:flutter_test/flutter_test.dart';
import 'package:likhin_portfolio/core/constants/app_strings.dart';
import 'package:likhin_portfolio/portfolio_app.dart';

void main() {
  testWidgets('portfolio renders real resume sections', (tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text(AppStrings.name), findsWidgets);
    await tester.scrollUntilVisible(find.text(AppStrings.sectionProjects), 500);
    expect(find.text(AppStrings.sectionProjects), findsOneWidget);
    expect(find.text('Chicking UAE'), findsOneWidget);
  });
}
