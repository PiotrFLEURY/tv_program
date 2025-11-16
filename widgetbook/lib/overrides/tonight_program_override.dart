import 'package:tv_program/models/program.dart';

Future<Program> tonightProgramOverride(dynamic ref, dynamic overrides) =>
    Future.value(
      Program(
        channelId: "mocked_channel_tonight",
        title: 'Mocked Tonight Program',
        description: 'This is a mocked tonight program for Widgetbook.',
        start: DateTime.now().subtract(const Duration(minutes: 30)),
        stop: DateTime.now().add(const Duration(minutes: 30)),
        icon: 'https://picsum.photos/200',
        categories: [],
        rating: null,
        credits: [],
        episodeNum: null,
      ),
    );
