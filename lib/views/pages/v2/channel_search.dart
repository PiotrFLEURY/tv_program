import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/providers/filtered_channels_provider.dart';
import 'package:tv_program/views/colors.dart';
import 'package:tv_program/views/pages/v2/program_list.dart';
import 'package:tv_program/views/pages/v2/widgets/search_bar.dart';
import 'package:tv_program/views/widgets/safe_image.dart';

class ChannelSearch extends ConsumerWidget {
  const ChannelSearch({super.key});

  static const routeName = '/channel_search';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channels = ref.watch(filteredChannelsProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: TvProgTheme.backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: TvProgTheme.greyLight),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          channels.when(
            data: (data) {
              return Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  children: List.generate(data.length, (index) {
                    final channel = data[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ProgramList.routeName,
                          arguments: channel,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: TvProgTheme.greyLight),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SafeImage(
                            url: channel.icon,
                            fallback: channel.name,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
            error: (error, stack) => SizedBox(),
            loading: () => SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TvProgSearchBar(hint: 'Trouver une chaîne'),
          ),
        ],
      ),
    );
  }
}
