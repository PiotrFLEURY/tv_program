import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/models/xml_tv.dart';
import 'package:tv_program/providers/program_provider.dart';
import 'package:tv_program/providers/selected_program.dart';
import 'package:tv_program/services/service.dart';
import 'package:tv_program/views/widgets/safe_image.dart';

class CurrentlyPage extends ConsumerWidget {
  const CurrentlyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProgram = ref.watch(selectedProgramProvider);
    final program = ref.watch(programProvider);
    return Scaffold(
      body: program.when(
        data: (tvProgram) => ChannelList(tvProgram: tvProgram),
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text('Chargement, veuillez patienter...'),
            ],
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/Logo_TNT_HD.jpg',
              width: selectedProgram == TvService.tvTnt ? 48 : 24,
            ),
            label: 'TNT',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/FRANCE_FLAG.png',
              width: selectedProgram == TvService.tvFrance ? 48 : 24,
            ),
            label: 'France',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.public,
              size: selectedProgram == TvService.allChannels ? 48 : 24,
            ),
            label: 'Tout',
          ),
        ],
        currentIndex: _indexOf(selectedProgram),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        onTap: (index) {
          switch (index) {
            case 0:
              ref
                  .read(selectedProgramProvider.notifier)
                  .select(TvService.tvTnt);
              break;
            case 1:
              ref
                  .read(selectedProgramProvider.notifier)
                  .select(TvService.tvFrance);
              break;
            case 2:
              ref
                  .read(selectedProgramProvider.notifier)
                  .select(TvService.allChannels);
              break;
          }
        },
      ),
    );
  }

  _indexOf(String selectedProgram) {
    switch (selectedProgram) {
      case TvService.tvTnt:
        return 0;
      case TvService.tvFrance:
        return 1;
      case TvService.allChannels:
        return 2;
    }
    return 0;
  }
}

class ChannelList extends StatefulWidget {
  const ChannelList({
    super.key,
    required this.tvProgram,
  });

  final XmlTv tvProgram;

  @override
  State<ChannelList> createState() => _ChannelListState();
}

enum PreviewMode {
  currently,
  tonight,
}

class _ChannelListState extends State<ChannelList> {
  var _filteredChannels = <Channel>[];
  var _previewMode = PreviewMode.currently;

  void _togglePreviewMode(bool value) {
    setState(() {
      _previewMode = value ? PreviewMode.tonight : PreviewMode.currently;
    });
  }

  void _onFilterChanged(String filter) {
    setState(() {
      _filteredChannels = widget.tvProgram.channels
          .where(
            (channel) => channel.id!.toLowerCase().contains(
                  filter.toLowerCase(),
                ),
          )
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _filteredChannels = widget.tvProgram.channels;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: false,
          pinned: true,
          actions: [
            Switch(
              value: _previewMode == PreviewMode.tonight,
              onChanged: _togglePreviewMode,
            ),
          ],
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Filtre',
                hintText: 'Entrez le nom d' 'une chaîne',
              ),
              onChanged: _onFilterChanged,
            ),
          ),
          expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(
            expandedTitleScale: 1,
            collapseMode: CollapseMode.pin,
            title: Text(
              _previewMode == PreviewMode.currently
                  ? 'En ce moment'
                  : 'Ce soir',
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final channel = _filteredChannels[index];
              final preview = _previewMode == PreviewMode.currently
                  ? widget.tvProgram.currentlyOn(channel)
                  : widget.tvProgram.tonightOn(channel);
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/channel',
                    arguments: (channel, widget.tvProgram.todaysOn(channel)),
                  );
                },
                child: Column(
                  children: [
                    ListTile(
                      leading: SafeImage(url: channel.icon, size: 50),
                      title: Text(
                        channel.name ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Container(
                        height: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                    if (preview != null)
                      Container(
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: ListTile(
                            leading: SafeImage(
                              url: preview.icon,
                              size: 100,
                            ),
                            title: Text(preview.header),
                            subtitle: Text(
                              preview.description ?? '',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
            childCount: _filteredChannels.length,
          ),
        ),
      ],
    );
  }
}
