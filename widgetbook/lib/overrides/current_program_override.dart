import 'package:tv_program/models/program.dart';

Future<Program> currentProgramOverride(dynamic ref, dynamic overrides) =>
    Future.value(
      Program(
        channelId: "mocked_channel_current",
        title: 'Mocked Current Program',
        description: 'This is a mocked current program for Widgetbook.',
        start: DateTime.now().subtract(const Duration(minutes: 30)),
        stop: DateTime.now().add(const Duration(minutes: 30)),
        icon: 'https://picsum.photos/200',
        categories: [],
        rating: null,
        credits: [],
        episodeNum: null,
      ),
    );
