import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/models/selected_program.dart';
import 'package:tv_program/providers/selected_program.dart';

class SelectedProgramSelector extends ConsumerWidget {
  const SelectedProgramSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProgram = ref.watch(selectedProgramProvider);
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(200),
          borderRadius: BorderRadius.circular(48),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: SelectedProgramEnum.values.map(
            (program) {
              return GestureDetector(
                onTap: () {
                  ref.read(selectedProgramProvider.notifier).select(program);
                },
                child: SelectedProgramItem(
                  selected: selectedProgram == program,
                  label: program.name,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class SelectedProgramItem extends StatelessWidget {
  const SelectedProgramItem({
    super.key,
    required this.selected,
    required this.label,
  });

  final bool selected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 18,
            color: selected ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
