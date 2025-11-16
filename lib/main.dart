import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tv_program/views/tv_program.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String homePage =
      prefs.getString(TvProgPreferences.uiPreferenceKey) ?? '/home';
  initializeDateFormatting('fr_FR', null).then((_) {
    runApp(
      ProviderScope(
        // Never retry any provider
        retry: (retryCount, error) => null,
        child: TvProgram(
          packageInfo: packageInfo,
          homePage: homePage,
        ),
      ),
    );
  });
}
