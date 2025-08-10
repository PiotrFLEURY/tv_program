import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/models/channel.dart';
import 'package:tv_program/models/selected_program.dart';
import 'package:tv_program/providers/channels_provider.dart';
import 'package:tv_program/providers/current_program_provider.dart';
import 'package:tv_program/providers/selected_program.dart';
import 'package:tv_program/providers/tonight_program_provider.dart';
import 'package:tv_program/views/widgets/drawer.dart';
import 'package:tv_program/views/widgets/safe_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentlyPage extends ConsumerWidget {
  const CurrentlyPage({super.key});

  static const routeName = '/currently';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProgram = ref.watch(selectedProgramProvider);
    final channels = ref.watch(channelsProvider);
    return Scaffold(
      drawer: const TvProgDrawer(),
      appBar: AppBar(
        title: const Text('Programmes TV'),
        centerTitle: true,
      ),
      body: channels.when(
        data: (channelList) => ChannelList(channels: channelList),
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
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/Logo_TNT_HD.jpg',
                  width: selectedProgram == SelectedProgramEnum.tnt ? 48 : 24,
                ),
                label: 'TNT',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/FRANCE_FLAG.png',
                  width: selectedProgram == SelectedProgramEnum.fr ? 48 : 24,
                ),
                label: 'France',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.tv),
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
                      .select(SelectedProgramEnum.tnt);
                  break;
                case 1:
                  ref
                      .read(selectedProgramProvider.notifier)
                      .select(SelectedProgramEnum.fr);
                  break;
                case 2:
                  ref
                      .read(selectedProgramProvider.notifier)
                      .select(SelectedProgramEnum.all);
                  break;
              }
            },
          );
        },
      ),
    );
  }

  int _indexOf(SelectedProgramEnum selectedProgram) {
    switch (selectedProgram) {
      case SelectedProgramEnum.tnt:
        return 0;
      case SelectedProgramEnum.fr:
        return 1;
      case SelectedProgramEnum.all:
        return 2;
    }
  }
}

class ChannelList extends ConsumerStatefulWidget {
  const ChannelList({
    super.key,
    required this.channels,
  });

  final List<Channel> channels;

  @override
  ConsumerState<ChannelList> createState() => _ChannelListState();
}

enum PreviewMode {
  currently,
  tonight,
}

class _ChannelListState extends ConsumerState<ChannelList>
    with SingleTickerProviderStateMixin {
  static const _kFavoritesKey = 'favorites';
  static const _kShowFavoritesKey = 'showFavorites';

  var _filteredChannels = <Channel>[];
  var _favoriteChannelNames = <String>[];
  var _showFavorites = false;

  final _filterController = TextEditingController();

  void _onFilterChanged(String filter) {
    setState(() {
      if (filter.isEmpty && _showFavorites) {
        _filteredChannels = widget.channels
            .where(
              (channel) => _favoriteChannelNames.contains(channel.id),
            )
            .toList();
      } else {
        _filteredChannels = widget.channels
            .where(
              (channel) =>
                  channel.id!.toLowerCase().contains(filter.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _filteredChannels = widget.channels;
    _initFavorites();
  }

  void _initFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteChannelNames = prefs.getStringList(_kFavoritesKey) ?? [];
      _showFavorites = prefs.getBool(_kShowFavoritesKey) ?? false;
    });
    _onFilterChanged('');
  }

  void _toggleFavorite(Channel channel) {
    setState(() {
      if (_favoriteChannelNames.contains(channel.id)) {
        _favoriteChannelNames.remove(channel.id);
      } else {
        _favoriteChannelNames.add(channel.id!);
      }
    });
    final prefs = SharedPreferences.getInstance();
    prefs.then((value) {
      value.setStringList(_kFavoritesKey, _favoriteChannelNames);
    });
    _onFilterChanged(_filterController.text);
  }

  void _toggleShowFavorites() {
    setState(() {
      _showFavorites = !_showFavorites;
    });
    SharedPreferences.getInstance().then((value) {
      value.setBool(_kShowFavoritesKey, _showFavorites);
    });
    _onFilterChanged(_filterController.text);
  }

  void _clearFilter() {
    _filterController.clear();
    _onFilterChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _filterController,
            decoration: InputDecoration(
              labelText: 'Filtre',
              hintText: 'Entrez le nom d\'une chaîne',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _filterController.text.isNotEmpty
                  ? IconButton(
                      tooltip: 'Effacer le filtre',
                      onPressed: _clearFilter,
                      icon: const Icon(
                        Icons.clear,
                      ),
                    )
                  : null,
            ),
            onChanged: _onFilterChanged,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _showFavorites ? Icons.star : Icons.star_border,
              color: _showFavorites ? Colors.yellow[800] : Colors.grey,
            ),
            onPressed: _toggleShowFavorites,
            tooltip:
                _showFavorites ? 'Masquer les favoris' : 'Afficher les favoris',
          ),
        ],
      ),
      body: DefaultTabController(
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
    );
  }

  Widget _buildChannelList({required PreviewMode previewMode}) {
    if (_filteredChannels.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _showFavorites ? Icons.star_half : Icons.search_rounded,
              size: 100,
              color: Colors.grey,
            ),
            const SizedBox(height: 48),
            Text(
              _showFavorites ? 'Aucune chaîne favorite' : 'Aucun résultat',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _showFavorites
                  ? 'Cliquez sur l\'étoile pour en ajouter'
                  : 'Essayez une autre recherche',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      color: Colors.grey[100],
      child: ListView.builder(
        itemCount: _filteredChannels.length,
        itemBuilder: (context, index) {
          final channel = _filteredChannels[index];
          final preview = previewMode == PreviewMode.currently
              ? ref.watch(currentProgramProvider(channel.id!))
              : ref.watch(tonightProgramProvider(channel.id!));
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/channel', arguments: channel);
                },
                child: Column(
                  children: [
                    ListTile(
                      leading: SizedBox(
                        width: 96,
                        child: Row(
                          spacing: 4.0,
                          children: [
                            acromTNTChannelOrdering[channel.id] != null
                                ? Text(
                                    '${acromTNTChannelOrdering[channel.id]!}.',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  )
                                : const SizedBox(
                                    width: 24,
                                  ), // Placeholder for alignment
                            Hero(
                              tag: channel.icon!,
                              child: SafeImage(
                                url: channel.icon,
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Container(
                        height: 1,
                        color: Colors.grey[300],
                      ),
                      trailing: _showFavorites
                          ? null
                          : IconButton(
                              tooltip:
                                  _favoriteChannelNames.contains(channel.id)
                                      ? 'Retirer ${channel.name} des favoris'
                                      : 'Ajouter ${channel.name} aux favoris',
                              icon: Icon(
                                _favoriteChannelNames.contains(channel.id)
                                    ? Icons.star
                                    : Icons.star_border,
                                color:
                                    _favoriteChannelNames.contains(channel.id)
                                        ? Colors.yellow[800]
                                        : Colors.grey,
                              ),
                              onPressed: () => _toggleFavorite(channel),
                            ),
                    ),
                    preview.when(
                      data: (program) {
                        if (program == null) {
                          return ListTile(
                            title: Text('Aucun programme disponible'),
                            subtitle: Text('Pour ${channel.name}'),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: ListTile(
                            leading: SafeImage(
                              url: program.icon,
                              size: 100,
                            ),
                            title: Text(program.header),
                            subtitle: Text(
                              program.description ?? '',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      },
                      loading: () => const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: SizedBox(),
                      ),
                      error: (error, stackTrace) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            'Oups, quelque chose a mal tourné 🦄',
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
