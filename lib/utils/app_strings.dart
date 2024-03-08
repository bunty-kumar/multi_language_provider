import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppString {
  static String getTitle(BuildContext context) {
    return AppLocalizations.of(context)!.title;
  }

  static String getDescription(BuildContext context) {
    return AppLocalizations.of(context)!.description;
  }

  static String getLoginTitle(BuildContext context) {
    return AppLocalizations.of(context)!.loginTitle;
  }

  static String getLoginDesc(BuildContext context) {
    return AppLocalizations.of(context)!.loginDesc;
  }

  static String getLoginEmailHint(BuildContext context) {
    return AppLocalizations.of(context)!.emailHint;
  }

  static String getLoginPasswordHint(BuildContext context) {
    return AppLocalizations.of(context)!.passwordHint;
  }

  static String getLoginBtn(BuildContext context) {
    return AppLocalizations.of(context)!.loginBtnTxt;
  }
}
