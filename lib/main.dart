import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tv_program/views/tv_program.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  initializeDateFormatting('fr_FR', null).then((_) {
    runApp(
      ProviderScope(
        child: TvProgram(
          packageInfo: packageInfo,
        ),
      ),
    );
  });
}
