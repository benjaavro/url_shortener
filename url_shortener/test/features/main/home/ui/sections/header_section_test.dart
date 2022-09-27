import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/core/common_widgets/buttons/simple_icon_button.dart';
import 'package:url_shortener/core/constants/strings.dart';
import 'package:url_shortener/core/providers/features/main/home/url_form_provider.dart';
import 'package:url_shortener/core/providers/features/main/home/urls_list_provider.dart';
import 'package:url_shortener/main.dart';

void main() {
  group("Header Section", () {
    testWidgets('Header Section has list title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<URLsListProvider>(create: (_) => URLsListProvider()),
            ChangeNotifierProvider<URLFormProvider>(create: (_) => URLFormProvider()),
          ],
          child: Builder(
            builder: (_) => const MyApp(),
          ),
        ),
      );

      // Create the Finders.
      final hintFinder = find.text(AppStrings.shortenedListSubtitle);

      // Verify widget exists.
      expect(hintFinder, findsOneWidget);
    });

    testWidgets('URL Shortener Tool Section has text field and button to request shortening', (WidgetTester tester) async {
      // Provide the childWidget to the Container.
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<URLsListProvider>(create: (_) => URLsListProvider()),
            ChangeNotifierProvider<URLFormProvider>(create: (_) => URLFormProvider()),
          ],
          child: Builder(
            builder: (_) => const MyApp(),
          ),
        ),
      );

      // Create the Finders.
      final textFieldFinder = find.byType(SimpleIconButton);

      // Search for the childWidget in the tree and verify it exists.
      expect(textFieldFinder, findsOneWidget);
    });
  });
}