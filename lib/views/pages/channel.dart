import 'package:flutter/material.dart';
import 'package:tv_program/models/xml_tv.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            if (channel.icon != null)
              Image.network(
                channel.icon!,
                width: 50,
                height: 50,
              ),
            const Spacer(),
            Text(channel.name ?? 'no name'),
            const Spacer(),
          ],
        ),
      ),
      body: ListView(
        children: programs
            .where((program) => program.channelId == channel.id)
            .map((program) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ListTile(
              title:
                  Text('${program.startTime} ${program.title ?? 'no title'}'),
              subtitle: Text(program.description ?? 'no description'),
              leading: program.icon != null
                  ? Image.network(
                      program.icon!,
                      width: 100,
                      height: 100,
                    )
                  : Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 48,
                      ),
                    ),
              onTap: () => Navigator.pushNamed(
                context,
                '/program',
                arguments: program,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
