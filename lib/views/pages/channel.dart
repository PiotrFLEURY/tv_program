import 'package:flutter/material.dart';
import 'package:tv_program/models/xml_tv.dart';
import 'package:tv_program/views/widgets/safe_image.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    super.key,
    required this.channel,
    required this.programs,
  });

  final Channel channel;
  final List<Program> programs;

  @override
  Widget build(BuildContext context) {
    final channelPrograms =
        programs.where((program) => program.channelId == channel.id);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeImage(url: channel.icon, size: 200),
              title: Text('Aujourd' 'hui sur ${channel.name}'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: channelPrograms.length,
              (context, index) {
                final program = channelPrograms.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    title: Text(
                      '${program.startTime} ${program.title ?? 'no title'}',
                    ),
                    subtitle: Text(program.description ?? 'no description'),
                    leading: SafeImage(
                      url: program.icon,
                      size: 100,
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
          ),
        ],
      ),
    );
  }
}
