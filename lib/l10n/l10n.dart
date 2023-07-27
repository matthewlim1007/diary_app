import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// An extension that makes the localized text available on [BuildContext]
extension AppLocalizationsX on BuildContext {
  /// Returns the instance of the localized text
  AppLocalizations get l10n => AppLocalizations.of(this);
}
