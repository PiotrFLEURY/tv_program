import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tv_program/views/pages/currently.dart';
import 'package:tv_program/views/pages/v2/home.dart';
import 'package:tv_program/views/tv_program.dart';
import 'package:url_launcher/url_launcher.dart';

class TvProgDrawer extends StatelessWidget {
  const TvProgDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image.asset('assets/icons/Presentation.png'),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('À propos'),
            onTap: () => _showAboutDialog(context),
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Me contacter'),
            subtitle: const Text('piotr.fleury@gmail.com'),
            onTap: () => launchUrl(Uri.parse('mailto:piotr.fleury@gmail.com')),
          ),
          ListTile(
            leading: const Icon(Icons.web),
            title: const Text('Mon site web'),
            subtitle: const Text('https://mobile-tools.dev'),
            onTap: () => launchUrl(Uri.parse('https://mobile-tools.dev')),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.color_lens_outlined),
            title: const Text('Nouvelle interface'),
            onTap: () {
              SharedPreferences.getInstance().then((prefs) {
                prefs.setString(
                  TvProgPreferences.uiPreferenceKey,
                  HomePage.routeName,
                );
              });
              Navigator.pushReplacementNamed(
                context,
                HomePage.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.color_lens_outlined),
            title: const Text('Ancienne interface'),
            onTap: () {
              SharedPreferences.getInstance().then((prefs) {
                prefs.setString(
                  TvProgPreferences.uiPreferenceKey,
                  CurrentlyPage.routeName,
                );
              });
              Navigator.pushReplacementNamed(
                context,
                CurrentlyPage.routeName,
              );
            },
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    final packageInfo =
        context.findAncestorWidgetOfExactType<TvProgram>()?.packageInfo;
    showAboutDialog(
      context: context,
      applicationName: 'TV Prog',
      applicationVersion: 'Version ${packageInfo!.version}',
      applicationIcon: Image.asset(
        'assets/icons/icon_android.png',
        width: 48,
      ),
      applicationLegalese: '© ${DateTime.now().year} Piotr Fleury',
      children: [
        const Text(
          'TV Prog est une application open source pour consulter les programmes TV sans aucune publicité.',
        ),
        const SizedBox(height: 16),
        Text(
          'Développée par Piotr Fleury, cette application utilise les données de l\'API xmltvfr.fr.',
        ),
      ],
    );
  }
}
