import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/models/channel.dart';
import 'package:tv_program/providers/current_program_provider.dart';
import 'package:tv_program/providers/tonight_program_provider.dart';
import 'package:tv_program/views/colors.dart';
import 'package:tv_program/views/pages/v2/widgets/program_item.dart';
import 'package:tv_program/views/pages/v2/widgets/search_bar.dart';
import 'package:tv_program/views/pages/v2/widgets/tonight_carrousel.dart';

class HomeList extends ConsumerStatefulWidget {
  const HomeList({super.key, required this.channels});

  final List<Channel> channels;

  @override
  ConsumerState<HomeList> createState() => _HomeListState();
}

class _HomeListState extends ConsumerState<HomeList> {
  bool tonight = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Votre programme TV sans publicités',
              style: TextStyle(
                color: TvProgTheme.greyLight,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        TonightCarrousel(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TvProgSearchBar(),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CupertinoSlidingSegmentedControl(
            backgroundColor: TvProgTheme.greyLight,
            thumbColor: Colors.blueGrey,
            children: {
              0: Text('En ce moment'),
              1: Text('Ce soir'),
            },
            groupValue: tonight ? 1 : 0,
            onValueChanged: (value) {
              setState(() {
                tonight = value == 1;
              });
            },
          ),
        ),
        ...widget.channels.map((channel) {
          final programToShow = tonight
              ? ref.watch(tonightProgramProvider(channel.id!))
              : ref.watch(currentProgramProvider(channel.id!));
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: programToShow.when(
              data: (program) {
                if (program == null) {
                  return const SizedBox.shrink();
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/program_list',
                      arguments: (channel, program.start),
                    );
                  },
                  child: ProgramItem(
                    channel: channel,
                    program: program,
                  ),
                );
              },
              loading: () => const SizedBox(),
              error: (error, stack) => const SizedBox.shrink(),
            ),
          );
        }),
        const Center(
          child: Text(
            'Fin de la liste',
            style: TextStyle(
              color: TvProgTheme.greyLight,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
