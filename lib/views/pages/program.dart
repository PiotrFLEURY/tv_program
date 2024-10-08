import 'package:flutter/material.dart';
import 'package:tv_program/models/xml_tv.dart';
import 'package:tv_program/views/widgets/safe_image.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({super.key, required this.program});

  final Program program;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(program.title ?? 'no title'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (program.icon != null)
              Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: '${program.startTime}${program.icon}',
                  child: SafeImage(
                    url: program.icon,
                  ),
                ),
              ),
            // Start and Stop time
            Text(
              '${program.startTime} - ${program.endTime}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(program.description ?? 'no description'),
            ),
            program.episodeNum != null && program.episodeNum!.isNotEmpty
                ? Text(
                    'Episode: ${program.episodeNum}',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  )
                : const SizedBox(),
            program.rating != null
                ? Text('Rating: ${program.rating!.value}')
                : const SizedBox(),
            program.credits != null && program.credits!.isNotEmpty
                ? Text(
                    'Credits: ${program.credits!.map((credit) => credit.actors).join(', ')}',
                  )
                : const SizedBox(),
            program.categories.isNotEmpty
                ? Text(
                    'Categories: ${program.categories.join(', ')}',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
