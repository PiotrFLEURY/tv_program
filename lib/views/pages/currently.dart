import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/models/xml_tv.dart';
import 'package:tv_program/providers/program_provider.dart';
import 'package:tv_program/providers/selected_program.dart';
import 'package:tv_program/providers/selected_program_content.dart';
import 'package:tv_program/services/service.dart';
import 'package:tv_program/views/widgets/safe_image.dart';

class CurrentlyPage extends ConsumerWidget {
  const CurrentlyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProgram = ref.watch(selectedProgramProvider);
    final program = ref.watch(selectedProgramContentProvider);
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
      bottomNavigationBar: Builder(
        builder: (context) {
          final francePrograms = ref.watch(programProvider(TvService.tvFrance));
          final allPrograms = ref.watch(programProvider(TvService.allChannels));
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/Logo_TNT_HD.jpg',
                  width: selectedProgram == TvService.tvTnt ? 48 : 24,
                ),
                label: 'TNT',
              ),
              BottomNavigationBarItem(
                icon: francePrograms.when(
                  data: (_) => Image.asset(
                    'assets/images/FRANCE_FLAG.png',
                    width: selectedProgram == TvService.tvFrance ? 48 : 24,
                  ),
                  error: (error, stackTrace) => const Icon(Icons.error),
                  loading: () => const CircularProgressIndicator(),
                ),
                label: 'France',
              ),
              BottomNavigationBarItem(
                icon: allPrograms.when(
                  data: (_) => const Icon(Icons.tv),
                  error: (error, stackTrace) => const Icon(Icons.error),
                  loading: () => const CircularProgressIndicator(),
                ),
                label: 'Tout',
              ),
            ],
            currentIndex: _indexOf(selectedProgram),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            onTap: (index) {
              switch (index) {
                case 0:
                  ref
                      .read(selectedProgramProvider.notifier)
                      .select(TvService.tvTnt);
                  break;
                case 1:
                  if (francePrograms.isLoading) {
                    return;
                  }
                  ref
                      .read(selectedProgramProvider.notifier)
                      .select(TvService.tvFrance);
                  break;
                case 2:
                  if (allPrograms.isLoading) {
                    return;
                  }
                  ref
                      .read(selectedProgramProvider.notifier)
                      .select(TvService.allChannels);
                  break;
              }
            },
          );
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

class _ChannelListState extends State<ChannelList>
    with SingleTickerProviderStateMixin {
  var _filteredChannels = <Channel>[];

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
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Filtre',
                hintText: 'Entrez le nom d\'une chaîne',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _onFilterChanged,
            ),
          ),
        ),
        SliverFillRemaining(
          fillOverscroll: false,
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: const TabBar(
                tabs: [
                  Tab(text: 'En ce moment'),
                  Tab(text: 'Ce soir'),
                ],
              ),
              body: TabBarView(
                children: [
                  _buildChannelList(previewMode: PreviewMode.currently),
                  _buildChannelList(previewMode: PreviewMode.tonight),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChannelList({required PreviewMode previewMode}) {
    if (_filteredChannels.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.tv_off,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              'Aucun résultat',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: _filteredChannels.length,
      itemBuilder: (context, index) {
        final channel = _filteredChannels[index];
        final preview = previewMode == PreviewMode.currently
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
    );
  }
}
