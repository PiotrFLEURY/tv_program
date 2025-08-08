import 'package:flutter/material.dart';
import 'package:tv_program/views/colors.dart';

class TvProgSearchBar extends StatelessWidget {
  const TvProgSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      //controller: _filterController,
      decoration: InputDecoration(
        filled: true,
        fillColor: TvProgTheme.greyLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        hintText: 'Trouver un programme, une chaîne, une heure...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          tooltip: 'Effacer le filtre',
          onPressed: () {},
          icon: const Icon(
            Icons.clear,
          ),
        ),
      ),
      //onChanged: () {},
    );
  }
}
