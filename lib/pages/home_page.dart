
import 'package:flutter/material.dart';
import 'package:futebol/pages/time_page.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controllers/home_controller.dart';
import '../controllers/theme_controller.dart';
import '../models/time.dart';
import '../repositories/time_repository.dart';
import '../widgets/brasao.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;
  var themeController = ThemeController.to;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Brasileirão'),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Obx(
                        () => themeController.isDark.value
                        ? const Icon(Icons.brightness_7)
                        : const Icon(Icons.brightness_2),
                  ),
                  title: Obx(
                        () => themeController.isDark.value
                        ? const Text('Light')
                        : const Text('Dark'),
                  ),
                  onTap: () => themeController.changeTheme(),
                ),
              ),
            ],
          ),
        ],
      ),
      body:
      // ignore: avoid_types_as_parameter_names
      Consumer<TimesRepository>(builder: (context, TimesRepository, child) {
        return ListView.separated(
          itemCount: TimesRepository.times.length,
          itemBuilder: (BuildContext contexto, int i) {
            final List<Time> tabela = TimesRepository.times;
            return ListTile(
              leading: Brasao(
                image: tabela[i].brasao,
                width: 40,
              ),
              title: Text(tabela[i].nome),
              subtitle: Text('Titulos: ${tabela[i].titulos.length}'),
              trailing: Text(
                tabela[i].pontos.toString(),
              ),
              onTap: () {
                Get.to(() => TimePage(
                  key: Key(tabela[i].nome),
                  time: tabela[i],
                ));

                // Navigator.push(
                //     contexto,
                //     MaterialPageRoute(
                //       builder: (_) => TimePage(
                //         key: Key(tabela[i].nome),
                //         time: tabela[i],
                //       ),
                //     ));
              },
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          padding: const EdgeInsets.all(20),
        );
      }),
    );
  }
}
