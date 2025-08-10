import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/models/channel.dart';
import 'package:tv_program/models/program.dart';
import 'package:tv_program/providers/channel_programs_provider.dart';
import 'package:tv_program/views/widgets/safe_image.dart';
import 'package:tv_program/models/day_of_week.dart' as day_of_week;

class ChannelPage extends ConsumerWidget {
  const ChannelPage({
    super.key,
    required this.channel,
  });

  static const routeName = '/channel';

  final Channel channel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channelPrograms = ref.watch(channelProgramsProvider(channel.id!));
    return channelPrograms.when(
      data: (programs) {
        return _content(programs);
      },
      error: (error, stack) => Scaffold(
        body: Center(
          child: Text('Error loading programs: $error'),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Scaffold _content(List<Program> channelPrograms) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: channel.icon!,
                child: SafeImage(
                  url: channel.icon,
                  size: 200,
                ),
              ),
              title: Text('Programmes sur ${channel.name}'),
              expandedTitleScale: 1,
            ),
          ),
          SliverList.separated(
            separatorBuilder: (context, index) {
              final program = channelPrograms.elementAt(index);
              final nextProgram = channelPrograms.elementAt(index + 1);
              final programDay = program.start?.day;
              final nextProgramDay = nextProgram.start?.day;
              if (nextProgramDay != null && programDay != nextProgramDay) {
                final today = DateTime.now().day;
                if (programDay == today) {
                  return Separator(
                    text: 'Demain',
                  );
                }
                return Separator(
                  text: formatDate(nextProgram, program),
                );
              }
              return SizedBox();
            },
            itemCount: channelPrograms.length,
            itemBuilder: (context, index) {
              final program = channelPrograms.elementAt(index);
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text(
                    '${program.startTime} ${program.title ?? 'no title'}',
                  ),
                  subtitle: Text(program.shortDescription ?? 'no description'),
                  leading: Hero(
                    tag: '${program.startTime}${program.icon}',
                    child: SafeImage(
                      url: program.icon,
                      size: 100,
                    ),
                  ),
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/program',
                    arguments: program,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String formatDate(Program nextProgram, Program program) =>
      '${day_of_week.from(nextProgram.start?.weekday ?? 0).name} ${nextProgram.start?.day}';
}

class Separator extends StatelessWidget {
  const Separator({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: Colors.grey[200],
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
