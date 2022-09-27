import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/core/common_widgets/buttons/filled_icon_button.dart';
import 'package:url_shortener/core/common_widgets/text_fields/full_width_text_field.dart';
import 'package:url_shortener/core/constants/strings.dart';
import 'package:url_shortener/core/providers/features/main/home/url_form_provider.dart';
import 'package:url_shortener/core/providers/features/main/home/urls_list_provider.dart';
import 'package:url_shortener/features/main/home/ui/sections/url_shortener_tool_section.dart';
import 'package:url_shortener/main.dart';

void main() {
  group("URL ShortenerTool Section", () {
    testWidgets('URL Shortener Tool Section has usage hint', (WidgetTester tester) async {
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
      final hintFinder = find.text(AppStrings.shortenHintSubtitle);

      // Verify widget exists.
      expect(hintFinder, findsOneWidget);
    });

    testWidgets('URL Shortener Tool Section has text field and button', (WidgetTester tester) async {
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
      final textFieldFinder = find.byType(FullWidthTextField);
      final sendButtonFinder = find.byType(FilledIconButton);

      // Search for the childWidget in the tree and verify it exists.
      expect(textFieldFinder, findsOneWidget);
      expect(sendButtonFinder, findsOneWidget);
    });
  });
}
