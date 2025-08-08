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

class TvProgram extends StatelessWidget {
  const TvProgram({super.key, required this.packageInfo});

  final PackageInfo packageInfo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      showSemanticsDebugger: false,
      title: 'TV Program',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/program_list': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as (
            Channel,
            DateTime?
          );
          final Channel channel = args.$1;
          final DateTime? target = args.$2;

          return ProgramList(channel: channel, target: target);
        },
        '/currently': (context) => const CurrentlyPage(),
        '/channel': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Channel;
          return ChannelPage(channel: args);
        },
        '/program': (context) {
          final Program program =
              ModalRoute.of(context)!.settings.arguments as Program;
          return ProgramPage(program: program);
        },
      },
    );
  }
}
