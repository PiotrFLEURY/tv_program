import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/providers/random_tonight_program_provider.dart';

class TonightCarrousel extends ConsumerWidget {
  const TonightCarrousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomTonightProgram = ref.watch(randomTonightProgramProvider);
    return randomTonightProgram.when(
      data: (program) {
        if (program == null) {
          return const Center(child: Text('No program available for tonight'));
        }
        return GestureDetector(
          onTap: () =>
              ref.read(randomTonightProgramProvider.notifier).randomize(),
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: 200,
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              image: program.icon != null && program.icon!.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(program.icon!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withAlpha(150),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${program.startTime} - ${program.title} sur ${program.channelId}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      loading: () => Container(
        height: 200,
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(200),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Semantics(
          label: 'Chargement...',
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => const SizedBox.shrink(),
    );
  }
}
