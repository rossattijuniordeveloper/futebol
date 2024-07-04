// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../models/time.dart';
import '../repositories/time_repository.dart';
import '../widgets/brasao.dart';
import 'add_titulo_page.dart';
import 'edit_titulo_page.dart';

class TimePage extends StatefulWidget {
  Time time;
  TimePage({Key? key, required this.time}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
/*
  addTitulo(Titulo titulo) {
    setState(() {
      widget.time.titulos.add(titulo);
    });
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Salvo com Sucesso !',
        ),
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
/*
    tituloPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AddTituloPage(
            key: Key(widget.time.nome),
            time: widget.time,
          ),
        ),
      );
    }
*/
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Text(widget.time.nome),
          actions: [
            IconButton(
//              onPressed: tituloPage(),
              onPressed: () {
                /*
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddTituloPage(
                      key: Key(widget.time.nome),
                      time: widget.time,
                    ),
                  ),
                );
                */
                Get.to(AddTituloPage(
                  key: Key(widget.time.nome),
                  time: widget.time,
                ));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_line_chart),
                text: 'Estatísticas',
              ),
              Tab(
                icon: Icon(Icons.emoji_events),
                text: 'Títulos',
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Brasao(
                    image: widget.time.brasao,
                    width: 250,
                  ),
                ),
                Center(
                  child: Text(
                    'Pontos: ${widget.time.pontos}',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                )
              ],
            ),
            titulos(),
          ],
        ),
      ),
    );
  }

  Widget titulos() {
    final time = Provider.of<TimesRepository>(context)
        .times
        .firstWhere((t) => t.nome == widget.time.nome);

    final quantidade = time.titulos.length;

    return quantidade == 0
        ? const Center(
      child: Text('Nenhum Titulo Ainda!'),
    )
        : ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.emoji_events),
            title: Text(time.titulos[index].campeonato),
            trailing: Text(time.titulos[index].ano),
            onTap: () {
              Get.to(
                EditTituloPage(
                    titulo: time.titulos[index], time: widget.time),
                fullscreenDialog: true,
              );
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: quantidade);
  }
}
