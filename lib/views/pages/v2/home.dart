import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/providers/channels_provider.dart';
import 'package:tv_program/views/colors.dart';
import 'package:tv_program/views/pages/v2/widgets/home_list.dart';
import 'package:tv_program/views/pages/v2/widgets/selected_program_selector.dart';
import 'package:tv_program/views/widgets/drawer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channels = ref.watch(channelsProvider);
    return Scaffold(
      backgroundColor: TvProgTheme.backgroundColor,
      drawer: const TvProgDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: TvProgTheme.greyLight),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'TV Prog',
          style: TextStyle(
            color: TvProgTheme.greyLight,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: TvProgTheme.greyLight,
                width: 1,
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Image.asset(
              'assets/icons/icon_android.png',
              height: 48,
              width: 48,
            ),
          ),
        ],
        backgroundColor: TvProgTheme.backgroundColor,
      ),
      body: Stack(
        children: [
          channels.when(
            data: (channelsData) => HomeList(channels: channelsData),
            loading: () => HomeList(channels: []),
            error: (error, stack) => HomeList(channels: []),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SelectedProgramSelector(),
            ),
          ),
        ],
      ),
    );
  }
}
