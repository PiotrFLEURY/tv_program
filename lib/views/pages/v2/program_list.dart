import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/models/channel.dart';
import 'package:tv_program/models/program.dart';
import 'package:tv_program/providers/channel_programs_provider.dart';
import 'package:tv_program/views/colors.dart';
import 'package:tv_program/views/pages/v2/program_detail.dart';
import 'package:tv_program/views/pages/v2/widgets/program_item.dart';
import 'package:tv_program/views/widgets/safe_image.dart';

class ProgramList extends ConsumerStatefulWidget {
  const ProgramList({super.key, required this.channel, this.target});

  static const routeName = '/program_list';

  final Channel channel;
  final DateTime? target;

  @override
  ConsumerState<ProgramList> createState() => _ProgramListState();
}

class _ProgramListState extends ConsumerState<ProgramList> {
  final ScrollController scrollController = ScrollController();

  void _scrollToTarget(List<Program> programs) {
    if (widget.target != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final index = programs.indexWhere(
          (program) => program.start!.isAtSameMomentAs(widget.target!),
        );
        if (index != -1) {
          final offset = index * 100.0; // Assuming each item is 100px tall
          final duration = const Duration(milliseconds: 300);
          final curve = Curves.easeInOut;
          scrollController.animateTo(
            offset,
            duration: duration,
            curve: curve,
          ); // Assuming each item is 100px tall
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final programs = ref.watch(channelProgramsProvider(widget.channel.id!));
    return Scaffold(
      backgroundColor: TvProgTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: TvProgTheme.backgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: TvProgTheme.greyLight,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Programmes de ${widget.channel.name}',
          style: TextStyle(
            color: TvProgTheme.greyLight,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SafeImage(url: widget.channel.icon ?? '', size: 48),
            ),
          ),
        ],
      ),
      body: programs.when(
        data: (programList) {
          // post-frame callback to scroll to target program
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollToTarget(programList);
          });
          final Map<String, List<Program>> daysPrograms =
              programList.fold<Map<String, List<Program>>>(
            {},
            (Map<String, List<Program>> acc, program) {
              final day = program.startDayAndMonth;
              if (!acc.containsKey(day)) {
                acc[day] = [];
              }
              acc[day]!.add(program);
              return acc;
            },
          );
          return DefaultTabController(
            length: daysPrograms.length,
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  tabs: daysPrograms.keys.map((day) {
                    return Tab(
                      child: Text(
                        day,
                        style: TextStyle(color: TvProgTheme.greyLight),
                      ),
                    );
                  }).toList(),
                ),
                Expanded(
                  child: TabBarView(
                    children: daysPrograms.values.map((programs) {
                      return ListView(
                        controller: scrollController,
                        children: [
                          const SizedBox(height: 16.0),
                          ...programs.map((program) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Builder(
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      showBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return ProgramDetail(
                                            program: program,
                                          );
                                        },
                                      );
                                      // Navigator.pushNamed(
                                      //   context,
                                      //   ProgramDetail.routeName,
                                      //   arguments: program,
                                      // );
                                    },
                                    child: ProgramItem(
                                      channel: widget.channel,
                                      program: program,
                                      big: false,
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                          const Text(
                            'Fin de la liste',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: TvProgTheme.greyLight,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
