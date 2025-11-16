import 'package:flutter/material.dart';
import 'package:tv_program/models/program.dart';
import 'package:tv_program/views/colors.dart';

class ProgramDetail extends StatelessWidget {
  const ProgramDetail({super.key, required this.program});

  static const routeName = '/program_detail';

  final Program program;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          label: const Text('Retour'),
        ),
      ),
      backgroundColor: TvProgTheme.backgroundColor,
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.network(
                program.icon ?? '',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      TvProgTheme.backgroundColor,
                    ],
                  ),
                ),
                child: Text(
                  program.title ?? 'No Title',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TvProgTheme.greyLight,
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${program.startTime} - ${program.endTime}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TvProgTheme.greyLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (program.rating?.value != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                      color: TvProgTheme.greyLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      program.rating!.value!,
                      style: TextStyle(
                        color: TvProgTheme.backgroundColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                Text(
                  'Description',
                  style: TextStyle(
                    color: TvProgTheme.greyLight,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  program.description ?? 'No Description',
                  style: TextStyle(
                    color: TvProgTheme.greyLight,
                    fontSize: 16,
                  ),
                ),
                // Credits
                if (program.credits != null && program.credits!.isNotEmpty)
                  Text(
                    'Credits: ${program.credits?.join(', ') ?? 'No Credits'}',
                    style: TextStyle(
                      color: TvProgTheme.greyLight,
                      fontSize: 16,
                    ),
                  ),
                if (program.episodeNum != null &&
                    program.episodeNum!.isNotEmpty)
                  Text(
                    'Episode: ${program.episodeNum}',
                    style: TextStyle(
                      color: TvProgTheme.greyLight,
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
