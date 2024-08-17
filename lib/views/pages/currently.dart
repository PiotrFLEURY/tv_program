import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_program/models/xml_tv.dart';
import 'package:tv_program/providers/program_provider.dart';
import 'package:tv_program/providers/selected_program.dart';
import 'package:tv_program/providers/selected_program_content.dart';
import 'package:tv_program/services/service.dart';
import 'package:tv_program/views/widgets/safe_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  static const _kFavoritesKey = 'favorites';
  static const _kShowFavoritesKey = 'showFavorites';

  var _filteredChannels = <Channel>[];
  var _favoriteChannelNames = <String>[];
  var _showFavorites = false;

  final _filterController = TextEditingController();

  void _onFilterChanged(String filter) {
    setState(() {
      if (filter.isEmpty && _showFavorites) {
        _filteredChannels = widget.tvProgram.channelsWithData
            .where(
              (channel) => _favoriteChannelNames.contains(channel.id),
            )
            .toList();
      } else {
        _filteredChannels = widget.tvProgram.channelsWithData
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
    _filteredChannels = widget.tvProgram.channels;
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
                leading: Hero(
                  tag: channel.icon!,
                  child: SafeImage(
                    url: channel.icon,
                    size: 50,
                  ),
                ),
                subtitle: Container(
                  height: 1,
                  color: Colors.grey[300],
                ),
                trailing: _showFavorites
                    ? null
                    : IconButton(
                        tooltip: _favoriteChannelNames.contains(channel.id)
                            ? 'Retirer ${channel.name} des favoris'
                            : 'Ajouter ${channel.name} aux favoris',
                        icon: Icon(
                          _favoriteChannelNames.contains(channel.id)
                              ? Icons.star
                              : Icons.star_border,
                          color: _favoriteChannelNames.contains(channel.id)
                              ? Colors.yellow[800]
                              : Colors.grey,
                        ),
                        onPressed: () => _toggleFavorite(channel),
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
