import 'package:flutter/material.dart';
import 'package:tv_program/models/channel.dart';
import 'package:tv_program/models/program.dart';
import 'package:tv_program/views/colors.dart';
import 'package:tv_program/views/pages/v2/widgets/program_item.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ProgramItem)
Widget buildProgramItemUseCase(BuildContext context) {
  return Scaffold(
    backgroundColor: TvProgTheme.backgroundColor,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProgramItem(
          channel: Channel(
            id: '1',
            name: context.knobs.string(
              label: 'Channel Name',
              initialValue: 'Sample Channel',
            ),
            icon:
                'https://upload.wikimedia.org/wikipedia/commons/0/07/6ter.png',
          ),
          program: Program(
            channelId: '1',
            title: context.knobs.string(
              label: 'Program Title',
              initialValue: 'Sample Program',
            ),
            description: context.knobs.string(
              label: 'Program Description',
              initialValue: 'This is a sample program description.',
            ),
            start: DateTime.now(),
            stop: DateTime.now().add(const Duration(hours: 1)),
            icon: 'https://picsum.photos/200',
            categories: [],
            rating: null,
            credits: [],
            episodeNum: null,
          ),
          big: context.knobs.boolean(label: 'Big Layout', initialValue: false),
        ),
      ),
    ),
  );
}
