import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/providers/precache_notifier.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final precache = ref.watch(precacheProvider);
    ref.listen(precacheProvider, (int? previsous, int next) {
      if (next == 3) {
        Navigator.of(context).pushReplacementNamed('/currently');
      }
    });
    return Scaffold(
      backgroundColor: Colors.amber[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_upload,
              size: 96,
              color: Colors.white,
            ),
            const SizedBox(height: 24),
            const Stack(
              children: [
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                Center(child: Counter()),
              ],
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Téléchargement des données du jour...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LoadingProgram(loaded: precache > 0, label: 'TNT'),
                LoadingProgram(loaded: precache > 1, label: 'France'),
                LoadingProgram(loaded: precache == 3, label: 'Tout'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingProgram extends StatelessWidget {
  const LoadingProgram({
    super.key,
    required this.loaded,
    required this.label,
  });

  final String label;
  final bool loaded;

  @override
  Widget build(BuildContext context) {
    if (loaded) {
      return const Icon(
        Icons.check,
        color: Colors.white,
        size: 24,
      );
    }
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(width: 8),
        const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        ),
      ],
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _seconds = 0;

  _increment() {
    setState(() {
      _seconds++;
    });
  }

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _increment();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _seconds.toString(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
    );
  }
}
