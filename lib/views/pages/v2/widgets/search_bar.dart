import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/providers/filter_provider.dart';
import 'package:tv_program/views/colors.dart';

class TvProgSearchBar extends ConsumerStatefulWidget {
  const TvProgSearchBar({super.key, required this.hint});

  final String hint;

  @override
  ConsumerState<TvProgSearchBar> createState() => _TvProgSearchBarState();
}

class _TvProgSearchBarState extends ConsumerState<TvProgSearchBar> {
  final TextEditingController controller = TextEditingController();

  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: TvProgTheme.greyLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        hintText: widget.hint,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          tooltip: 'Effacer le filtre',
          onPressed: () {
            controller.clear();
            ref.read(filterProvider.notifier).clearFilter();
            focusNode.unfocus();
          },
          icon: const Icon(
            Icons.clear,
          ),
        ),
      ),
      onChanged: (value) {
        ref.read(filterProvider.notifier).setFilter(value);
      },
    );
  }
}
