import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/core/constants/routes_names.dart';
import 'package:url_shortener/core/constants/strings.dart';
import 'package:url_shortener/core/providers/features/main/home/url_form_provider.dart';
import 'package:url_shortener/core/providers/features/main/home/urls_list_provider.dart';
import 'package:url_shortener/core/routes/routes.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Using Change Notifier Providers for state management.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<URLsListProvider>(create: (_) => URLsListProvider()),
        ChangeNotifierProvider<URLFormProvider>(create: (_) => URLFormProvider()),
      ],
      builder: (context, child) {
        return const MaterialApp(
          title: AppStrings.appTitle,
          debugShowCheckedModeBanner: false,
          // Call to generateRoute method where routes are stored
          onGenerateRoute: router.generateRoute,

          // For development purposes you can change initial route to be your current working screen
          // Remember to set back to "homeRoute" when finished.
          initialRoute: homeRoute,
        );
      },
    );
  }
}
