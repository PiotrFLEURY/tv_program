import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/providers/current_program_provider.dart';
import 'package:tv_program/providers/random_tonight_program_provider.dart';
import 'package:tv_program/providers/tonight_program_provider.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/overrides/current_program_override.dart';
import 'package:widgetbook_workspace/overrides/random_tonight_program_override.dart';
import 'package:widgetbook_workspace/overrides/tonight_program_override.dart';

// This file does not exist yet,
// it will be generated in the next step
import 'main.directories.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr_FR', null);

  runApp(
    ProviderScope(
      // Never retry any provider
      retry: (retryCount, error) => null,
      overrides: [
        randomTonightProgramProvider.overrideWithBuild(
          randomTonightProgramOverride,
        ),
        currentProgramProvider.overrideWith(currentProgramOverride),
        tonightProgramProvider.overrideWith(tonightProgramOverride),
      ],
      child: const WidgetbookApp(),
    ),
  );
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        TextScaleAddon(),
        ViewportAddon([
          Viewports.none,
          IosViewports.iPhone13,
          AndroidViewports.samsungGalaxyNote20,
          MacosViewports.macbookPro,
          WindowsViewports.desktop,
          LinuxViewports.desktop,
        ]),
      ],
    );
  }
}
