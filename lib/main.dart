import 'package:flutter/material.dart';
import 'package:state_management/bloc_pattern/pages/bloc_page.dart';
import 'package:state_management/get_it/pages/get_it_page.dart';
import 'package:state_management/getx/pages/getx_page.dart';
import 'package:state_management/mobx/pages/mobx_page.dart';
import 'package:state_management/provider/pages/provider_page.dart';

import 'riverpod/pages/riverpod_page.dart';

void main() => runApp(const MyApp());

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management',
      navigatorKey: navigatorKey,
      routes: {
        BlocPage.route: (_) => const BlocPage(),
        ProviderPage.route: (_) => const ProviderPage(),
        GetXPage.route: (_) => const GetXPage(),
        RiverpodPage.route: (_) => const RiverpodPage(),
        GetItPage.route: (_) => const GetItPage(),
        MobXPage.route: (_) => const MobXPage(),
      },
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('State Management'),
        ),
        body: ListView(
          children: [
            ListTile(
              trailing: const Icon(Icons.navigate_next),
              title: const Text('BLoC'),
              onTap: () => Navigator.pushNamed(context, BlocPage.route),
            ),
            ListTile(
              trailing: const Icon(Icons.navigate_next),
              title: const Text('Provider'),
              onTap: () => Navigator.pushNamed(context, ProviderPage.route),
            ),
            ListTile(
              trailing: const Icon(Icons.navigate_next),
              title: const Text('GetX'),
              onTap: () => Navigator.pushNamed(context, GetXPage.route),
            ),
            ListTile(
              trailing: const Icon(Icons.navigate_next),
              title: const Text('Riverpod'),
              onTap: () => Navigator.pushNamed(context, RiverpodPage.route),
            ),
            ListTile(
              trailing: const Icon(Icons.navigate_next),
              title: const Text('GetIt'),
              onTap: () => Navigator.pushNamed(context, GetItPage.route),
            ),
            ListTile(
              trailing: const Icon(Icons.navigate_next),
              title: const Text('MobX'),
              onTap: () => Navigator.pushNamed(context, MobXPage.route),
            ),
          ],
        ));
  }
}
