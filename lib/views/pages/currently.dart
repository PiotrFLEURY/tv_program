import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/models/xml_tv.dart';
import 'package:tv_program/providers/program_provider.dart';
import 'package:tv_program/providers/selected_program.dart';
import 'package:tv_program/services/service.dart';

class CurrentlyPage extends ConsumerWidget {
  const CurrentlyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProgram = ref.watch(selectedProgramProvider);
    final program = ref.watch(programProvider);
    return Scaffold(
      appBar: AppBar(
        title: Builder(
          builder: (context) {
            switch (selectedProgram) {
              case TvService.tvTnt:
                return const Text('En ce moment sur la TNT');
              case TvService.tvFrance:
                return const Text('En ce moment en France');
              case TvService.allChannels:
                return const Text('En ce moment partout dans le monde');
            }
            return const Text('En ce moment');
          },
        ),
      ),
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

class _ChannelListState extends State<ChannelList> {
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
    return ListView.builder(
      itemCount: _filteredChannels.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Filtre',
                hintText: 'Entrez le nom d' 'une chaîne',
              ),
              onChanged: _onFilterChanged,
            ),
          );
        }
        final channel = _filteredChannels[index - 1];
        final currently = widget.tvProgram.currentlyOn(channel);
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
                leading: channel.icon != null && channel.icon!.isNotEmpty
                    ? Image.network(
                        channel.icon!,
                        width: 50,
                        height: 50,
                      )
                    : null,
                title: Text(channel.name ?? ''),
              ),
              if (currently != null)
                Container(
                  color: Colors.grey[100],
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ListTile(
                      leading:
                          currently.icon != null && currently.icon!.isNotEmpty
                              ? Image.network(
                                  currently.icon!,
                                  width: 100,
                                  height: 100,
                                )
                              : const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 64,
                                ),
                      title: Text(currently.header),
                      subtitle: Text(
                        currently.description ?? '',
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
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
