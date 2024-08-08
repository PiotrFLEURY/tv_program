import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/providers/program_provider.dart';
import 'package:tv_program/services/service.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(programProvider(TvService.tvTnt), (old, value) {
      if (value is AsyncData) {
        Navigator.of(context).pushReplacementNamed('/currently');
      }
    });
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 8),
            Text('Chargement, veuillez patienter...'),
          ],
        ),
      ),
    );
  }
}
