import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/core/providers/features/main/home/url_form_provider.dart';
import 'package:url_shortener/core/providers/features/main/home/urls_list_provider.dart';
import 'package:url_shortener/main.dart';

void main() {
  group("URLs List Section", () {
    testWidgets('URLs List Section has ListView widget to display list', (WidgetTester tester) async {
      // Initialize required Widget tree
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
      final textFieldFinder = find.byType(ListView);

      // Search for the childWidget in the tree and verify it exists.
      expect(textFieldFinder, findsOneWidget);
    });
  });
}