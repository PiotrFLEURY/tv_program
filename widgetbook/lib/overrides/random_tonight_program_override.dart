import 'package:tv_program/models/program.dart';

Future<Program> randomTonightProgramOverride(dynamic ref, dynamic overrides) =>
    Future.value(
      Program(
        channelId: "mocked_channel",
        title: 'Mocked Program',
        description: 'This is a mocked program for Widgetbook.',
        start: DateTime.now(),
        stop: DateTime.now().add(const Duration(hours: 1)),
        icon: 'https://picsum.photos/200',
        categories: [],
        rating: null,
        credits: [],
        episodeNum: null,
      ),
    );
