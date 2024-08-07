import 'package:flutter/material.dart';
import 'package:tv_program/views/pages/channel.dart';
import 'package:tv_program/views/pages/currently.dart';
import 'package:tv_program/models/xml_tv.dart';
import 'package:tv_program/views/pages/loading.dart';
import 'package:tv_program/views/pages/program.dart';

class TvProgram extends StatelessWidget {
  const TvProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TV Program',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingPage(),
        '/currently': (context) => const CurrentlyPage(),
        '/channel': (context) {
          final (Channel, List<Program>) args = ModalRoute.of(context)!
              .settings
              .arguments as (Channel, List<Program>);
          return ChannelPage(channel: args.$1, programs: args.$2);
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
