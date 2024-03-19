import 'package:barcodbek/src/core/local/app_local.dart';
import 'package:flutter/material.dart';

extension Mywords on Words {
  String tr(BuildContext context) => AppLocalization.of(context).tr(name);
}

enum Words {
  // auth
  setting,
  assistant,
  onboarding_text,
  getStarted,
  greetings,
  login,
  password,
  forgetPassword,
  reset_password,
  sms_code,
  create_new_password,
  pew_password,
  send,
  next,
  registration,
  create_an_account,
  your_name,
  confirm_password,
  vendor,
  owner,
  create,
  market_name,
  enter_market_name,
  stir,
  verification,
  verification_text,
  app_password,
  app_password_text,
//   bo'limlar
  categories,
  selling,
  search,
  calculation,
  debtors,
  lending,
  // qarz berish
  name_surname,
  phone_number,
  received_products,
  amount_of_debt,
  save,
  send_a_message,
  yes,
  no,
  is_it_paid,
  prices,
  edit_profile,
  settings,
  trade_history,
  terms_privacy_policy,
  logout,
  seller,
  profile,
}
