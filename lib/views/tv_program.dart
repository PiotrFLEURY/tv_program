import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tv_program/models/channel.dart';
import 'package:tv_program/models/program.dart';
import 'package:tv_program/views/pages/channel.dart';
import 'package:tv_program/views/pages/currently.dart';
import 'package:tv_program/views/pages/program.dart';
import 'package:tv_program/views/pages/v2/home.dart';
import 'package:tv_program/views/pages/v2/program_list.dart';
import 'package:tv_program/views/pages/v2/program_detail.dart';

class TvProgPreferences {
  static const uiPreferenceKey = 'ui_preference';
}

class TvProgram extends StatelessWidget {
  const TvProgram({
    super.key,
    required this.packageInfo,
    this.homePage = HomePage.routeName,
  });

  final PackageInfo packageInfo;
  final String homePage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      showSemanticsDebugger: false,
      title: 'TV Program',
      initialRoute: homePage,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ProgramList.routeName: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as (
            Channel,
            DateTime?
          );
          final Channel channel = args.$1;
          final DateTime? target = args.$2;

          return ProgramList(channel: channel, target: target);
        },
        ProgramDetail.routeName: (context) {
          final Program program =
              ModalRoute.of(context)!.settings.arguments as Program;
          return ProgramDetail(program: program);
        },
        CurrentlyPage.routeName: (context) => const CurrentlyPage(),
        ChannelPage.routeName: (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Channel;
          return ChannelPage(channel: args);
        },
        ProgramPage.routeName: (context) {
          final Program program =
              ModalRoute.of(context)!.settings.arguments as Program;
          return ProgramPage(program: program);
        },
      },
    );
  }
}
