import 'package:url_shortener/core/providers/features/main/home/url_form_provider.dart';

/// [urlInputDeletion] METHOD
/// Deletes stored data on Provider
///
/// 1. [urlFormProvider] --> Provider required to clear
void urlInputDeletion(URLFormProvider urlFormProvider) {
  urlFormProvider.clearUrlInput();
}