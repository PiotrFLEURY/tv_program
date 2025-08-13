import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/models/channel.dart';
import 'package:tv_program/providers/current_program_provider.dart';
import 'package:tv_program/providers/tonight_program_provider.dart';
import 'package:tv_program/views/colors.dart';
import 'package:tv_program/views/pages/v2/program_list.dart';
import 'package:tv_program/views/pages/v2/widgets/program_item.dart';
import 'package:tv_program/views/pages/v2/widgets/tonight_carrousel.dart';

class HomeList extends ConsumerStatefulWidget {
  const HomeList({super.key, required this.channels});

  final List<Channel> channels;

  @override
  ConsumerState<HomeList> createState() => _HomeListState();
}

class _HomeListState extends ConsumerState<HomeList> {
  bool tonight = false;

  Widget _buildBanner() {
    return Center(
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
    );
  }

  Widget _buildTonightSelector() {
    return Padding(
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
    );
  }

  Widget _buildProgramItem(BuildContext context, int index) {
    final channel = widget.channels[index];
    final programToShow = tonight
        ? ref.watch(tonightProgramProvider(channel.id!))
        : ref.watch(currentProgramProvider(channel.id!));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: programToShow.when(
        data: (program) {
          if (program == null) {
            return const SizedBox.shrink();
          }
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                ProgramList.routeName,
                arguments: channel,
              );
            },
            child: ProgramItem(
              channel: channel,
              program: program,
            ),
          );
        },
        loading: () => const SizedBox(
          // Need to set fixed height to avoid scrolling issues
          // when scrolling from bottom to top
          height: 96,
        ),
        error: (error, stack) => const SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 150.0),
      itemCount: widget.channels.length + 3,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return _buildBanner();
          case 1:
            return TonightCarrousel();
          case 2:
            return _buildTonightSelector();
        }
        return _buildProgramItem(context, index - 3);
      },
    );
  }
}
